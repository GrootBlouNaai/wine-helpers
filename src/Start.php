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

    public function __construct()
    {
        if (file_exists(__DIR__ . '/start-tmp')) {
            @unlink(__DIR__ . '/start-tmp');
        }

        $this->config     = new Config();
        $this->command    = new Command($this->config);
        $this->gameInfo   = new GameInfo($this->config, $this->command);
        $this->winePrefix = new WinePrefix($this->config, $this->command);
        $this->system     = new System($this->config, $this->command);
        $this->update     = new Update($this->config, $this->command);
        $this->monitor    = new Monitor($this->config, $this->command);
        $this->log        = new Logs();

        $this->init();
    }

    private function init()
    {
        if (!$this->system->lock()) {
            $this->log->logStart();
            $this->log->log('Application is already running.');
            $this->log->logStop();

            exit(0);
        }

        $this->gameInfo->create();
        $this->winePrefix->create();
        $this->update->init();

        app($this)->start();
    }

    /**
     * @return Config
     */
    public function getConfig()
    {
        return $this->config;
    }

    public function setConfig($config)
    {
        $this->config = $config;
    }

    /**
     * @return Command
     */
    public function getCommand()
    {
        return $this->command;
    }

    /**
     * @return System
     */
    public function getSystem()
    {
        return $this->system;
    }

    /**
     * @return WinePrefix
     */
    public function getWinePrefix()
    {
        return $this->winePrefix;
    }

    /**
     * @return GameInfo
     */
    public function getGameInfo()
    {
        return $this->gameInfo;
    }

    /**
     * @return Logs
     */
    public function getLog()
    {
        return $this->log;
    }

    /**
     * @return Update
     */
    public function getUpdate()
    {
        return $this->update;
    }

    /**
     * @return Monitor
     */
    public function getMonitor()
    {
        return $this->monitor;
    }
}

new Start();