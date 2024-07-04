<?php

class Wine {

    private $command;
    private $config;
    private $version;
    private $missingLibs;

    public function __construct(Config $config, Command $command)
    {
        $this->command = $command;
        $this->config  = $config;
    }

    public function boot()
    {
        $this->runCommand($this->config->wine('WINEBOOT'), ' && ', $this->config->wine('WINESERVER'), ' -w');
    }

    public function down()
    {
        $this->runCommand($this->config->wine('WINESERVER'), ' -k');
    }

    public function run($args)
    {
        $result = $this->runCommand($this->config->wine('WINE'), $args);

        if ($this->config->wine('WINEARCH') === 'win64') {
            $result .= $this->runCommand($this->config->wine('WINE64'), $args);
        }

        return $result;
    }

    public function fm($args)
    {
        $config = clone $this->config;
        $config->set('wine', 'WINEDEBUG', '');
        $logFile = $this->config->getLogsDir() . '/filemanager.log';

        return $this->createPatch($config, $this->config->wine('WINEFILE'), $args, $logFile);
    }

    public function cfg($args)
    {
        return $this->runCommand($this->config->wine('WINECFG'), $args);
    }

    public function reg($args)
    {
        $result = $this->runCommand($this->config->wine('REGEDIT'), $args);

        if ($this->config->wine('WINEARCH') === 'win64') {
            $result .= $this->runCommand($this->config->wine('REGEDIT64'), $args);
        }

        return $result;
    }

    public function regsvr32($args)
    {
        $this->run(['regsvr32', ...$args]);
    }

    public function winetricks($args, $output = false)
    {
        (new Update($this->config, $this->command))->downloadWinetricks();

        if ($args && file_exists($this->config->getRootDir() . '/winetricks')) {
            $config = clone $this->config;
            $config->set('wine', 'WINEDEBUG', '');
            $title = mb_strlen(implode('-', $args)) > 50 ? mb_substr(implode('-', $args), 0, 48) . '..' : implode('-', $args);
            $logFile = $this->config->getLogsDir() . "/winetricks-{$title}.log";

            return $this->createPatch($config, $this->config->getRootDir() . '/winetricks', $args, $logFile, $output);
        }

        return '';
    }

    public function checkSystemWine()
    {
        return $this->checkCommand('wine');
    }

    public function checkWine()
    {
        return $this->checkCommand($this->config->wine('WINE'));
    }

    public function version()
    {
        if (null === $this->version) {
            $this->version = trim($this->runCommand($this->config->wine('WINE'), '--version'));
        }

        return $this->version;
    }

    public function isUsedSystemWine()
    {
        return !file_exists($this->config->getRootDir() . '/wine/bin/wine')
            || version_compare((new System($this->config, $this->command))->getGlibcVersion(), '2.23', '<');
    }

    public function getMissingLibs()
    {
        if (null === $this->missingLibs) {
            $help = $this->runCommand($this->config->wine('WINE'), '--help');

            if (strpos($help, '--check-libs') === false) {
                $this->missingLibs = [];
                return $this->missingLibs;
            }

            $this->missingLibs = $this->runCommand($this->config->wine('WINE'), '--check-libs');
            $this->missingLibs = array_filter(
                array_map('trim', explode("\n", $this->missingLibs)),
                function ($line) {
                    if (!$line) {
                        return false;
                    }

                    list($left, $right) = array_map(
                        function ($s) {return trim($s, " \t\n\r\0\x0B.");},
                        explode(':', $line)
                    );

                    return strpos($right, '.') === false;
                }
            );
        }

        return $this->missingLibs;
    }

    private function runCommand($command, ...$args)
    {
        return $this->command->run(Text::quoteArgs($command) . ' ' . implode(' ', array_map('Text::quoteArgs', $args)));
    }

    private function checkCommand($command)
    {
        return (bool)trim($this->command->run('command -v ' . Text::quoteArgs($command)));
    }

    private function createPatch($config, $command, $args, $logFile, $output = false)
    {
        return app('start')->getPatch()->create(function () use ($config, $command, $args, $logFile, $output) {
            return (new Command($config))->run(Text::quoteArgs($command) . ' ' . Text::quoteArgs($args), $logFile, $output);
        });
    }
}
