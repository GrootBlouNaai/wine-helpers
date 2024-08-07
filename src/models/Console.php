<?php

class Console
{
    private $config;
    private $command;
    private $system;
    private $arguments;
    private $log;
    private $gui = false;

    /**
     * Console constructor.
     * @param Config $config
     * @param Command $command
     * @param System $system
     * @param Logs $log
     */
    public function __construct(Config $config, Command $command, System $system, Logs $log)
    {
        $this->config  = $config;
        $this->command = $command;
        $this->system  = $system;
        $this->log     = $log;

        global $argv;
        $this->arguments = array_splice($argv, 1);
    }

    public function isTerminal()
    {
        return (bool)getenv('TERM');
    }

    public function isGui()
    {
        return trim(reset($this->arguments)) === 'gui' || $this->gui;
    }

    public function isHelp()
    {
        return in_array(trim(reset($this->arguments)), ['help', '-help', '--help', '-h']);
    }

    public function isWinetricks()
    {
        return trim(reset($this->arguments)) === 'winetricks';
    }

    public function isKill()
    {
        return trim(reset($this->arguments)) === 'kill';
    }

    public function isWine()
    {
        return trim(reset($this->arguments)) === 'wine' || $this->isWine64();
    }

    public function isWine64()
    {
        return 'wine64' === trim(reset($this->arguments));
    }

    public function wine($args, $wine = 'WINE')
    {
        $config = clone $this->config;
        $config->set('wine', 'WINEDEBUG', '');
        $cmd = Text::quoteArgs($args);
        (new Command($config))->run(Text::quoteArgs($config->wine($wine)) . " {$cmd}", null, true);
    }

    public function lock()
    {
        static $lock;

        if (null === $lock) {

            $mount = $this->system->lock();
            $force = ($this->isKill() || $this->isWinetricks() || $this->isHelp() || $this->isWine());

            $lock = $mount;

            if (!$mount && !$force) {
                $this->log->logStart();
                $this->log->log('Application is already running.');
                $this->log->logStop();

                exit(0);
            }
        }

        return $lock;
    }

    public function init()
    {
        if (!$this->arguments) {

            (new Monitor($this->config, $this->command))->resolutionsRestore();

            /** @var Config $config */
            $config = app('start')->getConfig();

            $configs = $config->findConfigsPath();

            $starts = [];

            foreach ($configs as $i => $path) {
                if ($config->getConfigFile() === $path && count($configs) === 1) {
                    $starts[] = ['name' => $config->getGameTitle(), 'config' => $config];
                } else {
                    $cfg = new Config($path);
                    $starts[] = ['name' => $cfg->getGameTitle(), 'config' => $cfg];
                }
            }

            $title = 'Run';

            if ($this->system->isCyrillic()) {
                $title = 'Запустить';
            }

            $item = null;

            if (count($starts) > 1) {
                $item = (new Dialog())
                    ->columns(['name' => $title])
                    ->items($starts)
                    ->size(400, 300)
                    ->get();
            } elseif ($starts) {
                $item = reset($starts);
            }

            if (!$item) {
                exit(0);
            }

            /** @var Config $config */
            $config = $item['config'];

            $task = new Task($config);
            $task
                ->logName($config->getGameTitle())
                ->game()
                ->run();
        }

        if ($this->isKill()) {
            (new Wine($this->config, $this->command))->down();
            exit(0);
        }

        if ($this->isWine()) {
            $this->wine(array_splice($this->arguments, 1), $this->isWine64() ? 'WINE64' : 'WINE');
            exit(0);
        }

        if ($this->isWinetricks()) {
            $args = array_splice($this->arguments, 1);
            $this->log->log('Processing...');
            $this->log->log('See logs: ' . './game_info/logs/winetricks-' . implode('-', $args) . '.log');
            (new Wine($this->config, $this->command))->winetricks($args);
            exit(0);
        }

        if (!$this->isGui() && ($this->isHelp() || $this->arguments)) {
            $help = [
                'Help:',
                './start             - Run game.',
                './start gui         - Graphical user interface.',
                './start kill        - Kill this instance Wine.',
                './start winetricks  - Winetricks install d3dx9 (./start winetricks d3dx9).',
                './start wine        - Get Wine Instance.',
                './start help',
            ];
            $this->log->log(implode("\n", $help));
            exit(0);
        }

        (new Monitor($this->config, $this->command))->resolutionsRestore();
    }
}