<?php

class GameInfoScene extends AbstractScene
{
    private $updateTextCallable;
    /** @var PrintWidget */
    private $print;
    /** @var ProgressBarWidget */
    private $progressBar;

    public function __construct(PrintWidget $print, ProgressBarWidget $progressBar)
    {
        $this->print = $print;
        $this->progressBar = $progressBar;
    }

    public function show()
    {
        parent::show();

        $updateTextCallable = function ($text) {
            $this->print->update($text);
        };

        $this->updateTextCallable = $updateTextCallable;

        app('start')->getBuffer()->onChangeEvent($updateTextCallable);

        return $this;
    }

    public function hide()
    {
        parent::hide();

        app('start')->getBuffer()->offChangeEvent($this->updateTextCallable);

        return $this;
    }

    public function render()
    {
        $log = $this->getLogPath();

        $this->window
            ->border()
            ->title('Create "game_info" folder')
            ->status($log)
            ->refresh();

        $this->initializeWidgets($log);
    }

    private function initializeWidgets($log)
    {
        $this->progressBar
            ->offset(mb_strlen($log) + 2, 3)
            ->setProgress(0)
            ->show();

        $this->print
            ->dotMode()
            ->padding(1, 0, 1)
            ->show();
    }

    public function pressKey($key)
    {
        app()->showMain();
        return false;
    }

    public function setProgress($percent)
    {
        $this->progressBar->setProgress($percent)->render();
    }

    private function getLogPath()
    {
        return '~/game_info/logs/game_info.log';
    }
}
