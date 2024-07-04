<?php

namespace NcursesObjects;

/**
 * A window object that implements functionality for ncurses window resource
 * @author wapmorgan (wapmorgan@gmail.com)
 */
class Window {
    private $windowResource;
    private $panel;
    private $cursorX;
    private $cursorY;

    const BORDER_STYLE_SOLID = 1;
    const BORDER_STYLE_DOUBLE = 2;
    const BORDER_STYLE_BLOCK = 3;

    private $rows;
    private $columns;
    private $x;
    private $y;

    protected $style;
    private $title = '';
    private $status = '';
    private $frame;

    public function __construct($columns = 0, $rows = 0, $x = 0, $y = 0) {
        $this->x = $x;
        $this->y = $y;
        $this->windowResource = ncurses_newwin($rows, $columns, $y, $x);
        if ($rows == 0 || $columns == 0) {
            $this->getSize($columns, $rows);
        }
        $this->columns = $columns;
        $this->rows = $rows;
        $this->frame = [
            'draw' => [],
            'border' => null,
        ];
    }

    public function __destruct() {
        if ($this->panel !== null) {
            $this->panel = null;
        }
        ncurses_delwin($this->windowResource);
    }

    public function getWindow() {
        return $this->windowResource;
    }

    public function getSize(&$columns = null, &$rows = null) {
        ncurses_getmaxyx($this->windowResource, $rows, $columns);
        return ['columns' => $columns, 'rows' => $rows];
    }

    public function getWidth() {
        $this->getSize($width, $height);
        return $width;
    }

    public function getHeight() {
        $this->getSize($width, $height);
        return $height;
    }

    public function getCursorXY(&$x = null, &$y = null) {
        ncurses_getyx($this->windowResource, $y, $x);
        return ['x' => $x, 'y' => $y];
    }

    public function getX() {
        return $this->x;
    }

    public function getY() {
        return $this->y;
    }

    public function border($left = 0, $right = 0, $top = 0, $bottom = 0, $tl_corner = 0, $tr_corner = 0, $bl_corner = 0, $br_corner = 0) {
        ncurses_wborder($this->windowResource, $left, $right, $top, $bottom, $tl_corner, $tr_corner, $bl_corner, $br_corner);
        $this->frame['border'] = true;
        return $this;
    }

    public function borderStyle($style) {
        if ($style == self::BORDER_STYLE_SOLID) {
            $this->border();
        } elseif ($style == self::BORDER_STYLE_DOUBLE) {
            $this->border(226, 186, 205, 205, 201, 187, 200, 188);
        }
        return $this;
    }

    public function refresh() {
        ncurses_wrefresh($this->windowResource);
        return $this;
    }

    public function title($title) {
        $this->moveCursor(1, 0);
        $this->title = " {$title} ";
        $this->drawStringHere($this->title, NCURSES_A_REVERSE);
        return $this;
    }

    public function status($status) {
        $this->moveCursor(1, $this->rows - 1);
        $this->status = " {$status} ";
        $this->drawStringHere($this->status, NCURSES_A_REVERSE);
        return $this;
    }

    public function getTitle() {
        return $this->title;
    }

    public function getStatus() {
        return $this->status;
    }

    public function erase() {
        $this->frame = [
            'draw' => [],
            'border' => null,
        ];
        ncurses_werase($this->windowResource);
        return $this;
    }

    public function moveCursor($x, $y) {
        $this->cursorX = $x;
        $this->cursorY = $y;
        ncurses_wmove($this->windowResource, $y, $x);
        return $this;
    }

    public function drawStringHere($string, $attributes = 0) {
        ncurses_wattron($this->windowResource, $attributes);
        ncurses_waddstr($this->windowResource, $string);
        ncurses_wattroff($this->windowResource, $attributes);
        $this->frame['draw'][] = ['string' => $string, 'attributes' => $attributes, 'x' => $this->cursorX, 'y' => $this->cursorY];
        return $this;
    }

    public function makePanel() {
        $this->panel = new Panel($this);
        return $this;
    }

    public function getPanel() {
        return $this->panel;
    }

    public function reload() {
        $frame = $this->frame;
        $this->erase();
        if ($frame['border']) {
            $this->border();
        }
        foreach ($frame['draw'] as $item) {
            $this->moveCursor($item['x'], $item['y'])->drawStringHere($item['string'], $item['attributes']);
        }
        $this->refresh();
    }

    static public function createCenteredOf(Window $parentWindow, $columns, $rows) {
        $parentWindow->getSize($max_columns, $max_rows);
        return new Window($columns, $rows, ($max_columns / 2 - $columns / 2), ($max_rows / 2 - $rows / 2));
    }
}
