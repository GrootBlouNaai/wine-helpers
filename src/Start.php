<?php

class Start
{
    private $config;
    private $command;
    private $system;
    private $winePrefix;
    private $gameInfo;
    private $log;
    private $update;
    private $monitor;
    private $buffer;
    private $mountes;
    private $icon;
    private $fs;
    private $symlink;
    private $build;
    private $wine;
    private $console;
    private $shapshot;
    private $patch;
    private $replaces;
    private $registry;
    private $event;
    private $plugins;
    private $driver;
    private $network;

    public function __construct()
    {
        $this->initializeTemporaryFiles();
        app($this);
        $this->initializeServices();
        $this->init();
    }

    private function initializeTemporaryFiles()
    {
        if (file_exists(__DIR__ . '/start-tmp')) {
            @unlink(__DIR__ . '/start-tmp');
        }
    }

    private function initializeServices()
    {
        $this->config     = new Config();
        $this->log        = new Logs();
        $this->command    = new Command($this->config);
        $this->system     = new System($this->config, $this->command);
        $this->console    = new Console($this->config, $this->command, $this->system, $this->log);
        $this->mountes    = [
            new Mount($this->config, $this->command, $this->console, $this->config->getDataDir()),
            new Mount($this->config, $this->command, $this->console, $this->config->getWineDir()),
        ];
        $this->event      = new Event($this->config, $this->command);
        $this->gameInfo   = new GameInfo($this->config, $this->command);
        $this->winePrefix = new WinePrefix($this->config, $this->command, $this->event);
        $this->fs         = new FileSystem($this->config, $this->command);
        $this->update     = new Update($this->config, $this->command);
        $this->monitor    = new Monitor($this->config, $this->command);
        $this->buffer     = new Buffer();
        $this->icon       = new Icon($this->config, $this->command, $this->system);
        $this->pack       = new Pack($this->config, $this->command, $this->fs);
        $this->symlink    = new Symlink($this->config, $this->command, $this->fs);
        $this->build      = new Build($this->config, $this->command, $this->system, $this->fs);
        $this->wine       = new Wine($this->config, $this->command);
        $this->replaces   = new Replaces($this->config, $this->command, $this->fs, $this->system, $this->monitor);
        $this->shapshot   = new Snapshot($this->config, $this->command, $this->fs, $this->wine, $this->replaces, $this->system);
        $this->patch      = new Patch($this->config, $this->command, $this->fs, $this->wine, $this->shapshot, $this->winePrefix);
        $this->registry   = new Registry($this->config, $this->command, $this->fs, $this->wine, $this->replaces);
        $this->plugins    = new Plugins($this->event, $this->config, $this->command, $this->fs, $this->system, $this->replaces, $this->monitor);
        $this->driver     = new Driver($this->config, $this->command, $this->system);
        $this->network    = new Network($this->config, $this->command);
    }

    private function init()
    {
        ini_set('memory_limit', '512M');

        if (getenv('TERM')) {
            putenv('TERM=xterm');
        }

        $this->console->lock();

        if ($this->update->updatePhp()) {
            $this->log->log('PHP interpreter updated, please restart the application.');
            $this->update->restart();
        }

        $this->gameInfo->create();
        $this->winePrefix->create();
        $this->update->init();

        if (!$this->system->checkPhp() || (!$this->gameInfo->isCreated() && !$this->winePrefix->isCreated())) {
            $this->console->init();
        }

        if (!$this->system->checkPhp() || !$this->console->isTerminal()) {
            return;
        }

        if ($this->gameInfo->isCreated() || $this->winePrefix->isCreated() || $this->console->isGui()) {
            app('gui');
            app($this)->start();
        }
    }

    // Getters and Setters
    public function getConfig() { return $this->config; }
    public function setConfig($config) { $this->config = $config; }
    public function getCommand() { return $this->command; }
    public function getSystem() { return $this->system; }
    public function getWinePrefix() { return $this->winePrefix; }
    public function getGameInfo() { return $this->gameInfo; }
    public function getLog() { return $this->log; }
    public function getUpdate() { return $this->update; }
    public function getMonitor() { return $this->monitor; }
    public function getBuffer() { return $this->buffer; }
    public function getIcon() { return $this->icon; }
    public function getFileSystem() { return $this->fs; }
    public function getMountes() { return $this->mountes; }
    public function getPack() { return $this->pack; }
    public function getSymlink() { return $this->symlink; }
    public function getBuild() { return $this->build; }
    public function getWine() { return $this->wine; }
    public function setWine($wine) { $this->wine = $wine; }
    public function getConsole() { return $this->console; }
    public function getShapshot() { return $this->shapshot; }
    public function getPatch() { return $this->patch; }
    public function getReplaces() { return $this->replaces; }
    public function getRegistry() { return $this->registry; }
    public function getEvent() { return $this->event; }
    public function getPlugins() { return $this->plugins; }
    public function getDriver() { return $this->driver; }
    public function getNetwork() { return $this->network; }
}

pcntl_signal(SIGINT, function ($signal) {
    switch($signal) {
        case SIGINT:
        case SIGKILL:
        case SIGQUIT:
        case SIGTERM:
        case SIGSTOP:
            if (app('start')->getSystem()->checkPhp() && app('start')->getConsole()->isTerminal()) {
                $scene = app()->getCurrentScene();
                $popup = $scene->addWidget(new PopupInfoWidget($scene->getWindow()));
                $popup
                    ->setTitle('Exit')
                    ->setText('Wait umount...')
                    ->setActive(true)
                    ->show();
            }

            exit(0);
    }
}, false);

new Start();
