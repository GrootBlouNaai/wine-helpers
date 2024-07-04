#!/bin/bash

# Change to the directory of the script
cd -P -- "$(dirname -- "$0")" || exit 1

# Define the path to the PHP executable
RUN_FROM="./php"

# Check if the PHP executable exists
if [ ! -f "$RUN_FROM" ]; then
    # Download the PHP executable
    wget --no-check-certificate -O php https://example.com/path/to/php || exit 1

    # Check if the download was successful
    if [ ! -f "$RUN_FROM" ]; then
        RUN_FROM="php"
    fi
fi

# Ensure the PHP executable has execute permissions
chmod +x "$RUN_FROM" || exit 1

# Remove the restart file if it exists
if [ -f "./restart" ]; then
    rm "./restart" || exit 1
fi

# Function to process and run the script
run_script() {
    # Extract the relevant part of the start script
    tail -n +48 ./start > "$(pwd -P)/start-tmp" 2> >(grep -v "no version information available" 1>&2) || exit 1

    # Execute the PHP script
    "$RUN_FROM" -f "$(pwd -P)/start-tmp" "$@" 2> >(grep -v "no version information available" 1>&2) || exit 1
}

# Run the script initially
run_script

# Monitor for the restart file and re-run the script if it exists
while [ -f "./restart" ]; do
    rm "./restart" || exit 1
    run_script
done

exit 0

<?php

namespace NcursesObjects
{
    class Colors
    {
        const COLOR_BLACK = NCURSES_COLOR_BLACK;
        const COLOR_WHITE = NCURSES_COLOR_WHITE;
        const COLOR_RED = NCURSES_COLOR_RED;
        const COLOR_GREEN = NCURSES_COLOR_GREEN;
        const COLOR_YELLOW = NCURSES_COLOR_YELLOW;
        const COLOR_BLUE = NCURSES_COLOR_BLUE;
        const COLOR_CYAN = NCURSES_COLOR_CYAN;
        const COLOR_MAGENTA = NCURSES_COLOR_MAGENTA;
    }
}

namespace NcursesObjects
{
    class Keys
    {
        const KEY_F1 = NCURSES_KEY_F1;
        const KEY_F2 = NCURSES_KEY_F2;
        const KEY_F3 = NCURSES_KEY_F3;
        const KEY_F4 = NCURSES_KEY_F4;
        const KEY_F5 = NCURSES_KEY_F5;
        const KEY_F6 = NCURSES_KEY_F6;
        const KEY_F7 = NCURSES_KEY_F7;
        const KEY_F8 = NCURSES_KEY_F8;
        const KEY_F9 = NCURSES_KEY_F9;
        const KEY_F10 = NCURSES_KEY_F10;
        const KEY_F11 = NCURSES_KEY_F11;
        const KEY_F12 = NCURSES_KEY_F12;
        const KEY_F13 = NCURSES_KEY_F13;
        const KEY_F14 = NCURSES_KEY_F14;
        const KEY_F15 = NCURSES_KEY_F15;
        const KEY_F16 = NCURSES_KEY_F16;
        const KEY_F17 = NCURSES_KEY_F17;
        const KEY_F18 = NCURSES_KEY_F18;
        const KEY_F19 = NCURSES_KEY_F19;
        const KEY_F20 = NCURSES_KEY_F20;
        const KEY_F21 = NCURSES_KEY_F21;
        const KEY_F22 = NCURSES_KEY_F22;
        const KEY_F23 = NCURSES_KEY_F23;
        const KEY_F24 = NCURSES_KEY_F24;
        const KEY_F25 = NCURSES_KEY_F25;
        const KEY_F26 = NCURSES_KEY_F26;
        const KEY_F27 = NCURSES_KEY_F27;
        const KEY_F28 = NCURSES_KEY_F28;
        const KEY_F29 = NCURSES_KEY_F29;
        const KEY_F30 = NCURSES_KEY_F30;
        const KEY_F31 = NCURSES_KEY_F31;
        const KEY_F32 = NCURSES_KEY_F32;
        const KEY_F33 = NCURSES_KEY_F33;
        const KEY_F34 = NCURSES_KEY_F34;
        const KEY_F35 = NCURSES_KEY_F35;
        const KEY_F36 = NCURSES_KEY_F36;
        const KEY_F37 = NCURSES_KEY_F37;
        const KEY_F38 = NCURSES_KEY_F38;
        const KEY_F39 = NCURSES_KEY_F39;
        const KEY_F40 = NCURSES_KEY_F40;
        const KEY_F41 = NCURSES_KEY_F41;
        const KEY_F42 = NCURSES_KEY_F42;
        const KEY_F43 = NCURSES_KEY_F43;
        const KEY_F44 = NCURSES_KEY_F44;
        const KEY_F45 = NCURSES_KEY_F45;
        const KEY_F46 = NCURSES_KEY_F46;
        const KEY_F47 = NCURSES_KEY_F47;
        const KEY_F48 = NCURSES_KEY_F48;
        const KEY_F49 = NCURSES_KEY_F49;
        const KEY_F50 = NCURSES_KEY_F50;
        const KEY_F51 = NCURSES_KEY_F51;
        const KEY_F52 = NCURSES_KEY_F52;
        const KEY_F53 = NCURSES_KEY_F53;
        const KEY_F54 = NCURSES_KEY_F54;
        const KEY_F55 = NCURSES_KEY_F55;
        const KEY_F56 = NCURSES_KEY_F56;
        const KEY_F57 = NCURSES_KEY_F57;
        const KEY_F58 = NCURSES_KEY_F58;
        const KEY_F59 = NCURSES_KEY_F59;
        const KEY_F60 = NCURSES_KEY_F60;
        const KEY_F61 = NCURSES_KEY_F61;
        const KEY_F62 = NCURSES_KEY_F62;
        const KEY_F63 = NCURSES_KEY_F63;
        const KEY_F64 = NCURSES_KEY_F64;
        const KEY_LEFT = NCURSES_KEY_LEFT;
        const KEY_RIGHT = NCURSES_KEY_RIGHT;
        const KEY_HOME = NCURSES_KEY_HOME;
        const KEY_BACKSPACE = NCURSES_KEY_BACKSPACE;
        const KEY_DL = NCURSES_KEY_DL;
        const KEY_IL = NCURSES_KEY_IL;
        const KEY_DC = NCURSES_KEY_DC;
        const KEY_IC = NCURSES_KEY_IC;
        const KEY_EIC = NCURSES_KEY_EIC;
        const KEY_CLEAR = NCURSES_KEY_CLEAR;
        const KEY_EOS = NCURSES_KEY_EOS;
        const KEY_EOL = NCURSES_KEY_EOL;
        const KEY_SF = NCURSES_KEY_SF;
        const KEY_SR = NCURSES_KEY_SR;
        const KEY_NPAGE = NCURSES_KEY_NPAGE;
        const KEY_PPAGE = NCURSES_KEY_PPAGE;
        const KEY_STAB = NCURSES_KEY_STAB;
        const KEY_CTAB = NCURSES_KEY_CTAB;
        const KEY_CATAB = NCURSES_KEY_CATAB;
        const KEY_SRESET = NCURSES_KEY_SRESET;
        const KEY_RESET = NCURSES_KEY_RESET;
        const KEY_PRINT = NCURSES_KEY_PRINT;
        const KEY_LL = NCURSES_KEY_LL;
        const KEY_A1 = NCURSES_KEY_A1;
        const KEY_A3 = NCURSES_KEY_A3;
        const KEY_B2 = NCURSES_KEY_B2;
        const KEY_C1 = NCURSES_KEY_C1;
        const KEY_C3 = NCURSES_KEY_C3;
        const KEY_BTAB = NCURSES_KEY_BTAB;
        const KEY_BEG = NCURSES_KEY_BEG;
        const KEY_CANCEL = NCURSES_KEY_CANCEL;
        const KEY_CLOSE = NCURSES_KEY_CLOSE;
        const KEY_COMMAND = NCURSES_KEY_COMMAND;
        const KEY_COPY = NCURSES_KEY_COPY;
        const KEY_CREATE = NCURSES_KEY_CREATE;
        const KEY_END = NCURSES_KEY_END;
        const KEY_EXIT = NCURSES_KEY_EXIT;
        const KEY_FIND = NCURSES_KEY_FIND;
        const KEY_HELP = NCURSES_KEY_HELP;
        const KEY_MARK = NCURSES_KEY_MARK;
        const KEY_MESSAGE = NCURSES_KEY_MESSAGE;
        const KEY_MOVE = NCURSES_KEY_MOVE;
        const KEY_NEXT = NCURSES_KEY_NEXT;
        const KEY_OPEN = NCURSES_KEY_OPEN;
        const KEY_OPTIONS = NCURSES_KEY_OPTIONS;
        const KEY_PREVIOUS = NCURSES_KEY_PREVIOUS;
        const KEY_REDO = NCURSES_KEY_REDO;
        const KEY_REFERENCE = NCURSES_KEY_REFERENCE;
        const KEY_REFRESH = NCURSES_KEY_REFRESH;
        const KEY_REPLACE = NCURSES_KEY_REPLACE;
        const KEY_RESTART = NCURSES_KEY_RESTART;
        const KEY_RESUME = NCURSES_KEY_RESUME;
        const KEY_SAVE = NCURSES_KEY_SAVE;
        const KEY_SBEG = NCURSES_KEY_SBEG;
        const KEY_SCANCEL = NCURSES_KEY_SCANCEL;
        const KEY_SCOMMAND = NCURSES_KEY_SCOMMAND;
        const KEY_SCOPY = NCURSES_KEY_SCOPY;
        const KEY_SCREATE = NCURSES_KEY_SCREATE;
        const KEY_SDC = NCURSES_KEY_SDC;
        const KEY_SDL = NCURSES_KEY_SDL;
        const KEY_SELECT = NCURSES_KEY_SELECT;
        const KEY_SEND = NCURSES_KEY_SEND;
        const KEY_SEOL = NCURSES_KEY_SEOL;
        const KEY_SEXIT = NCURSES_KEY_SEXIT;
        const KEY_SFIND = NCURSES_KEY_SFIND;
        const KEY_SHELP = NCURSES_KEY_SHELP;
        const KEY_SHOME = NCURSES_KEY_SHOME;
        const KEY_SIC = NCURSES_KEY_SIC;
        const KEY_SLEFT = NCURSES_KEY_SLEFT;
        const KEY_SMESSAGE = NCURSES_KEY_SMESSAGE;
        const KEY_SMOVE = NCURSES_KEY_SMOVE;
        const KEY_SNEXT = NCURSES_KEY_SNEXT;
        const KEY_SOPTIONS = NCURSES_KEY_SOPTIONS;
        const KEY_SPREVIOUS = NCURSES_KEY_SPREVIOUS;
        const KEY_SPRINT = NCURSES_KEY_SPRINT;
        const KEY_SREDO = NCURSES_KEY_SREDO;
        const KEY_SREPLACE = NCURSES_KEY_SREPLACE;
        const KEY_SRIGHT = NCURSES_KEY_SRIGHT;
        const KEY_SRSUME = NCURSES_KEY_SRSUME;
        const KEY_SSAVE = NCURSES_KEY_SSAVE;
        const KEY_SSUSPEND = NCURSES_KEY_SSUSPEND;
        const KEY_UNDO = NCURSES_KEY_UNDO;
        const KEY_MOUSE = NCURSES_KEY_MOUSE;
        const KEY_MAX = NCURSES_KEY_MAX;
        const KEY_UP = NCURSES_KEY_UP;
        const KEY_DOWN = NCURSES_KEY_DOWN;
        const KEY_ENTER = 10;
        const KEY_ESC = 27;
    }
}

namespace NcursesObjects
{
    class MouseEvents
    {

        const BUTTON1_RELEASED = NCURSES_BUTTON1_RELEASED;
        const BUTTON2_RELEASED = NCURSES_BUTTON2_RELEASED;
        const BUTTON3_RELEASED = NCURSES_BUTTON3_RELEASED;
        const BUTTON4_RELEASED = NCURSES_BUTTON4_RELEASED;

        const BUTTON1_PRESSED = NCURSES_BUTTON1_PRESSED;
        const BUTTON2_PRESSED = NCURSES_BUTTON2_PRESSED;
        const BUTTON3_PRESSED = NCURSES_BUTTON3_PRESSED;
        const BUTTON4_PRESSED = NCURSES_BUTTON4_PRESSED;

        const BUTTON1_CLICKED = NCURSES_BUTTON1_CLICKED;
        const BUTTON2_CLICKED = NCURSES_BUTTON2_CLICKED;
        const BUTTON3_CLICKED = NCURSES_BUTTON3_CLICKED;
        const BUTTON4_CLICKED = NCURSES_BUTTON4_CLICKED;

        const BUTTON1_DOUBLE_CLICKED = NCURSES_BUTTON1_DOUBLE_CLICKED;
        const BUTTON2_DOUBLE_CLICKED = NCURSES_BUTTON2_DOUBLE_CLICKED;
        const BUTTON3_DOUBLE_CLICKED = NCURSES_BUTTON3_DOUBLE_CLICKED;
        const BUTTON4_DOUBLE_CLICKED = NCURSES_BUTTON4_DOUBLE_CLICKED;

        const BUTTON1_TRIPLE_CLICKED = NCURSES_BUTTON1_TRIPLE_CLICKED;
        const BUTTON2_TRIPLE_CLICKED = NCURSES_BUTTON2_TRIPLE_CLICKED;
        const BUTTON3_TRIPLE_CLICKED = NCURSES_BUTTON3_TRIPLE_CLICKED;
        const BUTTON4_TRIPLE_CLICKED = NCURSES_BUTTON4_TRIPLE_CLICKED;

        const BUTTON_CTRL = NCURSES_BUTTON_CTRL;

        const BUTTON_SHIFT = NCURSES_BUTTON_SHIFT;

        const BUTTON_ALT = NCURSES_BUTTON_ALT;

        const ALL_MOUSE_EVENTS = NCURSES_ALL_MOUSE_EVENTS;

        const REPORT_MOUSE_POSITION = NCURSES_REPORT_MOUSE_POSITION;
    }
}

namespace NcursesObjects;

function ncurses_init()
{
    if (function_exists('\ncurses_init')) {
        return \ncurses_init();
    }
    throw new \RuntimeException("Library <ncurses> is not loaded.");
}

class Ncurses
{
    const KEY_LF  = 10;
    const KEY_CR  = 13;
    const KEY_ESC = 27;
    const KEY_TAB = 9;

    const CURSOR_INVISIBLE = 0;
    const CURSOR_NORMAL    = 1;
    const CURSOR_VISIBLE   = 2;

    private $terminal;

    public function __construct()
    {
        ncurses_init();
    }

    public function __destruct()
    {
        ncurses_end();
    }

    public function getTerminal()
    {
        if (is_null($this->terminal)) {
            $this->terminal = new Terminal;
        }
        return $this->terminal;
    }

    public function setEchoState($state)
    {
        $state ? ncurses_echo() : ncurses_noecho();
        return $this;
    }

    public function setNewLineTranslationState($state)
    {
        $state ? ncurses_nl() : ncurses_nonl();
        return $this;
    }

    public function setCursorState($state)
    {
        ncurses_curs_set($state);
        return $this;
    }

    public function moveOutput($y, $x)
    {
        ncurses_move($y, $x);
        return $this;
    }

    public function refresh()
    {
        ncurses_refresh();
        return $this;
    }

    public function beep()
    {
        ncurses_beep();
        return $this;
    }

    public function getCh()
    {
        return ncurses_getch();
    }

    public function unGetCh($ch)
    {
        return ncurses_ungetch($ch);
    }

    public function updatePanels()
    {
        ncurses_update_panels();
        ncurses_doupdate();
        return $this;
    }

    public function insertChar($char)
    {
        ncurses_insch($char);
        return $this;
    }

    public function insertDeleteLines($count)
    {
        ncurses_insdelln($count);
        return $this;
    }
}

namespace NcursesObjects
{

    class Panel {

        private $window;

        private $panelResource;

        public function __construct(Window $window) {
            $this->window = $window;
            $this->panelResource = ncurses_new_panel($window->getWindow());
        }

        public function show() {
            ncurses_show_panel($this->panelResource);
            return $this;
        }

        public function hide() {
            ncurses_hide_panel($this->panelResource);
            return $this;
        }

        public function putOnTop() {
            ncurses_top_panel($this->panelResource);
            return $this;
        }

        public function putOnBottom() {
            ncurses_bottom_panel($this->panelResource);
            return $this;
        }

        public function getWindow()
        {
            return $this->window;
        }

        public function getPanel()
        {
            return $this->panelResource;
        }
    }
}

namespace NcursesObjects
{
    class Terminal {

        public function hasKey($keycode) {
            return ncurses_has_key($keycode);
        }

        public function hasColors() {
            return ncurses_has_colors();
        }

        public function hasIC() {
            return ncurses_has_ic();
        }

        public function hasIL() {
            return ncurses_has_il();
        }

        public function allAtributes() {
            return ncurses_termattrs();
        }

        public function termName() {
            return ncurses_termname();
        }

        public function longName() {
            return ncurses_longname();
        }
    }
}

namespace NcursesObjects;

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

namespace NcursesObjects
{
    class WindowStyle {

        const BORDER_STYLE_SOLID = 'solid';
        const BORDER_STYLE_DOUBLE = 'double';
        const BORDER_STYLE_BLOCK = 'block';
        protected $borderWidth = 1;
        protected $borderStyle = 'solid';

        public function setBorderStyle($style) {
            $enum = array(self::BORDER_STYLE_SOLID, self::BORDER_STYLE_DOUBLE, self::BORDER_STYLE_BLOCK);
            if (in_array($style, $enum))
                $this->borderStyle = $style;
        }

        public function getBorderStyle() {
            return $this->borderStyle;
        }

        public function setBorderWidth($width) {
            $width = intval($width, 10);
            if ($width > 1) {
                $this->borderWidth = $width;
            }
        }

        public function getBorderWidth() {
            return $this->borderWidth;
        }
    }
}

namespace Rakit\Curl {
    class Curl {

        protected $curl;
        protected $url;
        protected $params = array();
        protected $cookies = array();
        protected $options = array();
        protected $files = array();
        protected $headers = array();
        protected $limit_redirect_count = 0;
        protected $redirect_urls = array();
        protected $cookie_jar = null;
        protected $closed = FALSE;
        protected $error_message = null;
        protected $errno = null;
        public $response = null;

        public function __construct($url, array $params = array())
        {

            if ( ! extension_loaded('curl')) {
                throw new \ErrorException('cURL library need PHP cURL extension');
            }

            $this->curl = curl_init();
            $this->url = $url;
            $this->params = $params;

            $this->timeout(10);
            $this->option(CURLOPT_RETURNTRANSFER, 1);
            $this->option(CURLOPT_HEADER, TRUE);
            $this->option(CURLOPT_SSL_VERIFYPEER, FALSE);
        }

        public function timeout($time)
        {
            $this->option(CURLOPT_CONNECTTIMEOUT, $time);

            return $this;
        }

        public function auth($username, $password, $type = 'basic')
        {
            $auth_type = constant('CURLAUTH_' . strtoupper($type));

            $this->option(CURLOPT_HTTPAUTH, $auth_type);
            $this->option(CURLOPT_USERPWD, $username . ':' . $password);

            return $this;
        }

        public function useragent($user_agent)
        {
            $this->option(CURLOPT_USERAGENT, $user_agent);

            return $this;
        }

        public function referer($referer)
        {
            $this->option(CURLOPT_REFERER, $referer);

            return $this;
        }

        public function option($option, $value)
        {
            $this->options[$option] = $value;

            return $this;
        }

        public function hasOption($option)
        {
            return array_key_exists($option, $this->options);
        }

        public function proxy($url, $port = 80)
        {
            $this->option(CURLOPT_HTTPPROXYTUNNEL, true);
            $this->option(CURLOPT_PROXY, $url . ':' . $port);
            return $this;
        }

        public function header($key, $value = null)
        {
            $this->headers[] = $value === null ? $key : $key.': '.$value;

            return $this;
        }

        public function getCurl()
        {
            return $this->curl;
        }

        public function param($key, $value)
        {
            $this->params[$key] = $value;
            return $this;
        }

        public function cookie($key, $value)
        {
            $this->cookies[$key] = $value;

            return $this;
        }

        public function addFile($key, $filepath, $mimetype='', $filename='')
        {
            $postfield = "@$filepath;filename="
                . ($filename ?: basename($filepath))
                . ($mimetype ? ";type=$mimetype" : '');

            $this->files[$key] = $postfield;

            return $this;
        }

        public function autoRedirect($count)
        {
            if(!is_int($count)) {
                throw new \InvalidArgumentException("Limit redirect must be integer");
            }

            $this->limit_redirect_count = $count;
        }

        public function storeSession($file)
        {
            $this->option(CURLOPT_COOKIEJAR, $file);
            $this->option(CURLOPT_COOKIEFILE, $file);
            $this->cookie_jar = $file;
        }

        public function ajax()
        {
            $this->header("X-Requested-With: XMLHttpRequest");
            return $this;
        }

        public function get(array $data = array())
        {
            $params = array_merge($this->params, $data);

            $params = !empty($params)? '?' . http_build_query($params) : '';
            $url = $this->url.$params;
            $this->option(CURLOPT_URL, $url);
            $this->option(CURLOPT_HTTPGET, TRUE);

            return $this->execute();
        }

        public function post(array $data = array())
        {
            $params = array_merge($this->params, $this->files, $data);

            $this->option(CURLOPT_URL, $this->url);
            $this->option(CURLOPT_POST, TRUE);
            $this->option(CURLOPT_POSTFIELDS, $params);

            return $this->execute();
        }

        public function postRaw($data)
        {
            $this->option(CURLOPT_URL, $this->url);
            $this->option(CURLOPT_POST, TRUE);
            $this->option(CURLOPT_POSTFIELDS, $data);

            return $this->execute();
        }

        public function put(array $data = array())
        {
            $params = array_merge($this->params, $data);

            $params = !empty($this->params)? '?' . http_build_query($this->params) : '';
            $url = $this->url.$params;
            $this->option(CURLOPT_URL, $url);
            $this->option(CURLOPT_CUSTOMREQUEST, 'PUT');

            return $this->execute();
        }

        public function patch(array $data = array())
        {
            $params = array_merge($this->params, $this->files, $data);

            $this->option(CURLOPT_URL, $this->url);
            $this->option(CURLOPT_CUSTOMREQUEST, 'PATCH');
            $this->option(CURLOPT_POSTFIELDS, $params);

            return $this->execute();
        }

        public function delete(array $data = array())
        {
            $params = array_merge($this->params, $data);
            $params = !empty($params)? '?' . http_build_query($params) : '';
            $url = $this->url.$params;
            $this->option(CURLOPT_URL, $url);
            $this->option(CURLOPT_CUSTOMREQUEST, 'DELETE');

            return $this->execute();
        }

        public function getRedirectUrls()
        {
            return $this->redirect_urls;
        }

        public function getFinalUrl()
        {
            if(count($this->redirect_urls) > 0) {
                return $this->redirect_urls[count($this->redirect_urls)-1];
            }

            return $this->url;
        }

        protected function execute()
        {
            if(TRUE === $this->closed) {
                throw new \Exception("Cannot execute curl session twice, create a new one!");
            }

            if(!empty($this->cookies)) {
                $this->option(CURLOPT_COOKIE, http_build_query($this->cookies, '', '; '));
            }

            $this->option(CURLOPT_HTTPHEADER, $this->headers);

            curl_setopt_array($this->curl, $this->options);

            $response = curl_exec($this->curl);
            $info = curl_getinfo($this->curl);
            $this->errno = $error = curl_errno($this->curl);
            $this->error_message = curl_error($this->curl);
            $this->response = new Response($info, $response, $this->errno, $this->error_message);

            $this->close();

            if($this->limit_redirect_count > 0) {
                $count_redirect = 0;
                while($this->response->isRedirect()) {
                    $this->redirect();
                    $count_redirect++;

                    if($count_redirect >= $this->limit_redirect_count) {
                        break;
                    }
                }
            }

            return $this->response;
        }

        protected function redirect()
        {
            $redirect_url = $this->response->getHeader("location");
            $curl = new static($redirect_url);
            if($this->cookie_jar) {
                $curl->storeSession($this->cookie_jar);
            }
            $this->response = $curl->get();
            $this->redirect_urls[] = $redirect_url;
        }

        public function getErrno()
        {
            return $this->errno;
        }

        public function getError()
        {
            return $this->getErrno();
        }

        public function getErrorMessage()
        {
            return $this->error_message;
        }

        protected function close()
        {
            curl_close($this->curl);
            $this->closed = TRUE;
        }

        public static function doGet($url, array $data = array())
        {
            return static::make($url, $data)->get();
        }

        public static function doPost($url, array $data = array())
        {
            return static::make($url, $data)->post();
        }

        public static function doPut($url, array $data = array())
        {
            return static::make($url, $data)->put();
        }

        public static function doPatch($url, array $data = array())
        {
            return static::make($url, $data)->patch();
        }

        public static function doDelete($url, array $data = array())
        {
            return static::make($url, $data)->delete();
        }

        public static function make($url, array $data = array())
        {
            return new static($url, $data);
        }

    }
}

namespace Rakit\Curl {
    class Response {

        protected $info;

        protected $body;

        protected $error;

        protected $error_message;

        protected $header_string;

        protected $parsed_headers = array();

        protected $cookie = array();

        public function __construct(array $info, $response, $errno, $error_message)
        {
            $this->errno = $errno;
            $this->error_message = $error_message;
            $this->body = substr($response, $info['header_size']);
            $this->header_string = substr($response, 0, $info['header_size']);
            $this->info = $info;

            $this->parsed_headers = $this->parseHeaderString($this->header_string);
        }

        public function isNotFound()
        {
            return $this->getStatus() == 404;
        }

        public function isRedirect()
        {
            $status = $this->getStatus();
            if(substr($status, 0, 1) == '3') return TRUE;
        }

        public function error()
        {
            return $this->errno != 0;
        }

        public function getErrno()
        {
            return $this->errno;
        }

        public function getError()
        {
            return $this->getErrno();
        }

        public function getErrorMessage()
        {
            return $this->error_message;
        }

        public function getHeader($key, $default = null)
        {
            $key = strtolower($key);
            return isset($this->parsed_headers[$key]) ? $this->parsed_headers[$key] : $default;
        }

        public function getHeaders()
        {
            return $this->parsed_headers;
        }

        public function getCookie()
        {
            return $this->cookie;
        }

        public function length()
        {
            return strlen($this->getbody()) + strlen($this->getHeaderString());
        }

        public function getStatus()
        {
            return $this->getInfo('http_code', 0);
        }

        public function getContentType()
        {
            return $this->getInfo('content_type', FALSE);
        }

        public function isHtml()
        {
            return $this->getContentType() === 'text/html';
        }

        public function getInfo($key, $default = null)
        {
            return isset($this->info[$key])? $this->info[$key] : $default;
        }

        public function getAllInfo()
        {
            return $this->info;
        }

        public function getBody()
        {
            return $this->body;
        }

        public function getHeaderString()
        {
            return $this->header_string;
        }

        public function toArray()
        {
            $data = array(
                'headers' => $this->getHeaders(),
                'cookie' => $this->getCookie(),
                'body' => $this->getBody()
            );

            return array_merge($this->info, $data);
        }

        public function __toString()
        {
            return (string) $this->getBody();
        }

        protected function parseHeaderString($header_string)
        {
            $exp = explode("\n", $header_string);

            $headers = array();

            foreach($exp as $header) {
                $header = trim($header);

                if(preg_match('/^HTTP\/(?<v>[^ ]+)/', $header, $match)) {
                    $headers['http_version'] = $match['v'];
                    $this->info['http_version'] = $match['v'];
                } elseif('' == $header) {
                    continue;
                } else {
                    list($key, $value) = explode(':', $header, 2);
                    $key = strtolower($key);
                    $headers[$key] = trim($value);

                    if($key === 'set-cookie') {
                        $this->parseCookie($value);
                    }
                }
            }

            return $headers;
        }

        protected function parseCookie($cookie_string)
        {
            $exp = explode(';', $cookie_string);

            $cookie['value'] = array_shift($exp);

            foreach($exp as $i => $data) {
                $_parse = explode('=', $data, 2);
                $key = $_parse[0];
                $value = isset($_parse[1])? $_parse[1] : "";

                $cookie[trim(strtolower($key))] = trim($value);
            }

            $this->cookie = $cookie;
        }

    }
}

namespace { 

class Text
{
    public static function isUtf16($text) {
        preg_match_all('/\x00/', $text, $count);

        if (count($count[0]) / strlen($text) > 0.4) {
            return true;
        }

        return false;
    }

    public static function normalize($text) {
        if (self::isUtf16($text)) {
            $text = mb_convert_encoding($text, 'UTF-8', 'UTF-16');
        } elseif (md5(@iconv('Windows-1251', 'Windows-1251', $text)) !== md5(@iconv('UTF-8', 'UTF-8', $text))) {
            $text = mb_convert_encoding($text, 'UTF-8', 'Windows-1251');
        }

        return $text;
    }

    public static function startsWith($haystack, $needle)
    {
        if (is_array($needle)) {
            foreach ($needle as $str) {
                if (strpos($haystack, $str) === 0) {
                    return true;
                }
            }
            return false;
        }

        return (string)$needle === "" || strpos($haystack, (string)$needle) === 0;
    }

    public static function endsWith($haystack, $needle)
    {
        if (is_array($needle)) {
            foreach ($needle as $str) {
                if (substr($haystack, -strlen($str)) === $str) {
                    return true;
                }
            }
            return false;
        }

        return (string)$needle === "" || substr($haystack, (string)-strlen($needle)) === $needle;
    }

    public static function quoteArgs($args)
    {
        return implode(' ', array_map(function ($a) {return "\"{$a}\"";}, (array)$args));
    }
}

if (!function_exists('app')) {

    function app($type = null) {
        static $gui;
        static $start;

        if (null === $gui && $type === 'gui') {
            $gui = new ControllerGUI();
        }

        if (null === $start && $type && $type instanceof Start) {
            $start = $type;
        }

        if ($type === 'start') {
            return $start;
        }

        return $gui;
    }
}

if (!function_exists('debug_string_backtrace')) {
    function debug_string_backtrace($text = null, $config = null) {

        $config = null === $config ? app('start')->getConfig() : $config;

        if (is_string($config)) {
            $file = $config;
        } else {
            $file = $config->getLogsDir() . '/debug.log';
        }

        static $init;

        if (null === $init) {
            $init = true;

            if (file_exists($file)) {
                @unlink($file);
            }
        }

        if (null === $text) {
            ob_start();

            static $time;

            if (null === $time) {
                $time = microtime(true);
                print "Time: 0\n\n";
            } else {
                print 'Time: ' . (microtime(true) - $time) . "\n\n";
            }

            debug_print_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS);
            $trace = ob_get_contents();
            ob_end_clean();

            $trace = preg_replace ('/^#0\s+' . __FUNCTION__ . "[^\n]*\n/", '', $trace, 1);

            $trace = preg_replace ('/^#(\d+)/me', '\'#\' . ($1 - 1)', $trace);

            $trace = implode("\n", array_map(function ($n) {list($a) = explode('called at', $n); return trim($a);}, explode("\n", $trace)));
        } else {
            $trace = $text;
        }

        file_put_contents($file, "{$trace}\n\n", FILE_APPEND);

        return "{$trace}\n\n";
    }
}

if (!function_exists('startsWith')) {

    function startsWith($haystack, $needle)
    {
        if (is_array($needle)) {
            foreach ($needle as $str) {
                if (strpos($haystack, $str) === 0) {
                    return true;
                }
            }
            return false;
        }

        return (string)$needle === "" || strpos($haystack, (string)$needle) === 0;
    }
}

if (!function_exists('endsWith')) {

    function endsWith($haystack, $needle)
    {
        if (is_array($needle)) {
            foreach ($needle as $str) {
                if (substr($haystack, -strlen($str)) === $str) {
                    return true;
                }
            }
            return false;
        }

        return (string)$needle === "" || substr($haystack, (string)-strlen($needle)) === $needle;
    }
}

class FileINI {

    private $file;

    public function __construct($path)
    {
        $this->file = $path;
    }

    public function get()
    {
        return file_exists($this->file) ? parse_ini_file($this->file, true) : [];
    }

    public function write($array = [])
    {
        $file = $this->file;
        if (!is_string($file)) { throw new \InvalidArgumentException('Function argument 1 must be a string.'); }
        if (!is_array($array)) { throw new \InvalidArgumentException('Function argument 2 must be an array.'); }
        $data = array();
        foreach ($array as $key => $val) {
            if (is_array($val)) {
                $data[] = "[$key]";
                foreach ($val as $skey => $sval) {
                    if (is_array($sval)) {
                        foreach ($sval as $_skey => $_sval) {
                            if (is_numeric($_skey)) { $data[] = $skey . '[] = ' . (is_numeric($_sval) ? $_sval : (ctype_upper($_sval) ? $_sval : '"' . $_sval . '"')); }
                            else { $data[] = $skey . '[' . $_skey . '] = ' . (is_numeric($_sval) ? $_sval : (ctype_upper($_sval) ? $_sval : '"' . $_sval . '"')); }
                        }
                    } else { $data[] = $skey . ' = ' . (is_numeric($sval) ? $sval : (ctype_upper($sval) ? $sval : '"' . $sval . '"')); }
                }
            } else { $data[] = $key . ' = ' . (is_numeric($val) ? $val : (ctype_upper($val) ? $val : '"' . $val . '"')); }
            $data[] = null;
        }
        $fp          = fopen($file, 'w');
        $retries     = 0;
        $max_retries = 100;
        if (!$fp) { return false; }
        do { if ($retries > 0) { usleep(rand(1, 5000)); } $retries += 1;
        } while (!flock($fp, LOCK_EX) && $retries <= $max_retries);
        if ($retries == $max_retries) { return false; }
        fwrite($fp, implode(PHP_EOL, $data) . PHP_EOL);
        flock($fp, LOCK_UN);
        fclose($fp);

        return true;
    }
}

class Logs {

    private $table  = false;
    private $length = 80;

    public function insertLogFile($text, $path)
    {
        @file_put_contents($path, "{$text}\n", FILE_APPEND);
    }

    public function log($text='', $symbols = [], $lenght = 0, $return = false)
    {
        if (!$symbols && $this->table === true) {
            $symbols = 'line';
            $lenght  = $this->length;
            $items   = explode("\n", $text);

            if (count($items) > 1) {
                foreach ($items as $item) {
                    $this->log($item);
                }
                return;
            }
        }

        if ($symbols === 'head') {
            $symbols = ['start' => '╔', 'space' => '═', 'end' => '╗'];
        } elseif ($symbols === 'line') {
            $symbols = ['start' => '║ ', 'space' => ' ', 'end' => ' ║'];
        } elseif ($symbols === 'footer') {
            $symbols = ['start' => '╚', 'space' => '═', 'end' => '╝'];
        } elseif ($symbols === 'hr') {
            $symbols = ['start' => '╟', 'space' => '─', 'end' => '╢'];
        }

        $symbols = [
            'start' => isset($symbols['start']) ? $symbols['start'] : '',
            'space' => isset($symbols['space']) ? $symbols['space'] : ' ',
            'end'   => isset($symbols['end'])   ? $symbols['end']   : '',
        ];

        if ($lenght > 0) {
            $text    = "{$symbols['start']}{$text}";
            $len     = mb_strlen($text);
            $compare = $lenght - $len;

            if ($compare > 0) {

                $len2 = $compare - (1 + mb_strlen($symbols['end']));

                if ($len2 > 0) {
                    $end = [];
                    foreach (range(1, $len2) as $i) {
                        $end[] = $symbols['space'];
                    }
                    $end[] = $symbols['end'];
                    $end   = implode('', $end);
                    $text = "{$text}{$end}";
                }
            } else {
                $text = "{$text}{$symbols['space']}{$symbols['end']}";
            }
        }

        if ($return) {
            return $text;
        }

        print "{$text}\n";
    }

    public function logStart()
    {
        if ($this->table === false) {
            $this->log('', 'head', $this->length);
        }

        $this->table = true;
    }

    public function logStop()
    {
        if ($this->table === true) {
            $this->log('', 'footer', $this->length);
        }

        $this->table = false;
    }
}

class Buffer {

    private $size = 150;
    private $buffer;
    private $changes;

    public function __construct()
    {
        $this->buffer  = [];
        $this->changes = [];
    }

    public function setSize($size)
    {
        $this->size = $size;
    }

    public function add($text)
    {
        if (count($this->buffer) <= $this->size) {
            $this->buffer[] = $text;
        } else {
            array_shift($this->buffer);
            $this->buffer[] = $text;
        }

        $this->doChange();
    }

    private function doChange() {
        foreach ($this->changes as $change) {
            if ($change) {
                $change($this->buffer);
            }
        }
    }

    public function onChangeEvent($callable)
    {
        $this->changes[] = $callable;
    }

    public function offChangeEvent($callable)
    {
        $this->changes = array_filter($this->changes, function ($item) use (&$callable) {return $item !== $callable;});
    }

    public function clear()
    {
        $this->buffer = [];
    }
}

class History
{
    private $history;

    public function __construct()
    {
        $this->history = [];
    }

    public function add(&$object)
    {
        $this->history[] = $object;
    }

    public function back()
    {
        array_pop($this->history);
        return $this->current();
    }

    public function current()
    {
        return end($this->history);
    }

    public function count()
    {
        return count($this->history);
    }
}

class FileSystem {

    private $command;
    private $config;

    public function __construct(Config $config, Command $command)
    {
        $this->command = $command;
        $this->config  = $config;
    }

    public static function getDirectorySize($path)
    {
        $bytes = 0;
        $path  = realpath($path);

        if ($path !== false && $path != '' && file_exists($path)) {
            foreach (new RecursiveIteratorIterator(new RecursiveDirectoryIterator($path, FilesystemIterator::SKIP_DOTS)) as $object) {
                $bytes += $object->getSize();
            }
        }

        return $bytes;
    }

    public function relativePath($absPath, $path = null)
    {
        return trim(str_replace($path === null ? $this->config->getRootDir() : $path, '', $absPath), " \t\n\r\0\x0B/");
    }

    public function rm($dir)
    {
        if (!file_exists($dir)) {
            return false;
        }

        if (!is_dir($dir)) {
            unlink($dir);
            return true;
        }

        foreach (scandir($dir, SCANDIR_SORT_NONE) as $object) {
            if ($object !== '.' && $object !== '..') {
                if (is_dir("{$dir}/{$object}") && !is_link("{$dir}/{$object}")) {
                    $this->rm("{$dir}/{$object}");
                } else {
                    unlink("{$dir}/{$object}");
                }
            }
        }

        if (file_exists($dir)) {
            rmdir($dir);
        }

        return true;
    }

    public function cp($in, $out, $overwrite = false)
    {
        if (file_exists($in) && !is_dir($in)) {
            copy($in, $out);
            return true;
        }

        if (!file_exists($in) || !is_dir($in)) {
            return false;
        }

        $mode = 0775;

        if (false === $overwrite || ($overwrite && !file_exists($out))) {
            if (!mkdir($out, $mode, true) && !is_dir($out)) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', $out));
            }
        }

        foreach (
            $iterator = new \RecursiveIteratorIterator(
                new \RecursiveDirectoryIterator($in, \RecursiveDirectoryIterator::SKIP_DOTS),
                \RecursiveIteratorIterator::SELF_FIRST) as $item
        ) {
            if ($item->isDir()) {
                $pathOut = $out . DIRECTORY_SEPARATOR . $iterator->getSubPathName();
                if ($overwrite && file_exists($pathOut)) {
                    continue;
                }
                if (!mkdir($concurrentDirectory = $pathOut, $mode) && !is_dir($concurrentDirectory)) {
                    throw new \RuntimeException(sprintf('Directory "%s" was not created', $concurrentDirectory));
                }
            } else {
                $pathOut  = $out . DIRECTORY_SEPARATOR . $iterator->getSubPathName();
                $fileName = basename((string)$item);
                if ($overwrite && file_exists("{$pathOut}/{$fileName}")) {
                    unlink("{$pathOut}/{$fileName}");
                }
                copy($item, $pathOut);
            }
        }

        return true;
    }

    public function mv($in, $out)
    {
        if (file_exists($in) && !is_dir($in)) {
            rename($in, $out);
            return true;
        }

        if (!is_dir($in) || file_exists($out)) {
            return false;
        }

        $mode = 0775;

        if (!mkdir($out, $mode, true) && !is_dir($out)) {
            throw new \RuntimeException(sprintf('Directory "%s" was not created', $out));
        }

        foreach (new DirectoryIterator($in) as $iterator) {
            if ($iterator->isFile() || $iterator->isLink()) {
                rename($iterator->isLink() ? $iterator->getPathName() : $iterator->getRealPath(), "{$out}/" . $iterator->getFilename());
            } else if (!$iterator->isDot() && $iterator->isDir()) {
                $this->mv($iterator->getRealPath(), "{$out}/{$iterator}");
                if (file_exists($iterator->getRealPath())) {
                    if (is_dir($iterator->getRealPath())) {
                        rmdir($in);
                    } else {
                        unlink($iterator->getRealPath());
                    }
                }
            }
        }

        if (file_exists($in)) {
            if (is_dir($in)) {
                rmdir($in);
            } else {
                unlink($in);
            }
        }

        return true;
    }

    public function mkdirs($dirs)
    {
        foreach ($dirs as $dir) {
            if (!file_exists($dir)) {
                if (!mkdir($dir, 0775, true) && !is_dir($dir)) {
                    throw new \RuntimeException(sprintf('Directory "%s" was not created', $dir));
                }
            }
        }
    }

    public function link($in, $out)
    {
        return $this->command->run("ln -sfr \"{$in}\" \"{$out}\"");
    }

    public function unpackXz($inFile, $outDir, $type = 'xf', $glob = '', $archiver = 'tar')
    {
        if (!app('start')->getSystem()->isXz()) {
            return false;
        }

        if (!file_exists($inFile) || is_dir($inFile)) {
            return false;
        }

        if (file_exists($outDir)) {
            $this->rm($outDir);
        }

        $dir = dirname($inFile);
        $rnd = mt_rand(10000, 99999);
        $tmpDir = "{$dir}/tmp_{$rnd}";
        $this->mkdirs([$tmpDir]);

        if (!file_exists($tmpDir)) {
            return false;
        }

        $fileName = basename($inFile);
        $mvFile   = "{$tmpDir}/{$fileName}";
        $this->mv($inFile, $mvFile);
        $this->command->run("cd \"{$tmpDir}\" && {$archiver} {$type} \"./{$fileName}\"");
        $this->rm($mvFile);

        $find = glob("{$tmpDir}/{$glob}*");

        $path = $tmpDir;

        if (count($find) === 1) {
            $path = reset($find);
        }

        $this->mv($path, $outDir);

        if (file_exists($tmpDir)) {
            $this->rm($tmpDir);
        }

        return true;
    }

    public function unpackGz($inFile, $outDir)
    {
        return $this->unpackXz($inFile, $outDir, '-xzf');
    }

    public function unpackPol($inFile, $outDir)
    {
        return $this->unpackXz($inFile, $outDir, '-xjf', 'wineversion/');
    }

    public function unpackRar($inFile, $outDir)
    {
        return $this->unpackXz($inFile, $outDir, 'x', '', 'unrar');
    }

    public function unpackZip($inFile, $outDir)
    {
        return $this->unpackXz($inFile, $outDir, '', '', 'unzip');
    }

    public function unpack($inFile, $outDir)
    {
        if (Text::endsWith($inFile, '.tar.xz')) {
            return $this->unpackXz($inFile, $outDir);
        }
        if (Text::endsWith($inFile, '.tar.gz')) {
            return $this->unpackGz($inFile, $outDir);
        }
        if (Text::endsWith($inFile, '.pol')) {
            return $this->unpackPol($inFile, $outDir);
        }
        if (Text::endsWith($inFile, ['.exe', '.rar'])) {
            return $this->unpackRar($inFile, $outDir);
        }
        if (Text::endsWith($inFile, '.zip')) {
            return $this->unpackZip($inFile, $outDir);
        }

        return false;
    }

    public function pack($folder)
    {
        $folder = rtrim($folder, '\\/');

        if (!file_exists($folder) || file_exists("{$folder}.tar.gz")) {
            return false;
        }

        $this->command->run("cd \"{$folder}\" && tar -zcf \"{$folder}.tar.gz\" -C \"{$folder}\" .");

        return file_exists("{$folder}.tar.gz");
    }

    public function download($url, $path)
    {
        try {
            ini_set('memory_limit', '-1');
            $request = new \Rakit\Curl\Curl($url);
            $request->autoRedirect(5);
            $response = $request->get();
        } catch (ErrorException $e) {
            return '';
        }

        $fileName = basename($url);
        $pathFile = "{$path}/{$fileName}";
        file_put_contents($pathFile, $response->getBody());
        unset($request, $response);

        return $pathFile;
    }
}

class Command
{
    private $config;

    public function __construct(Config $config)
    {
        $this->config = $config;
    }

    public function run($cmd, $saveLog = null, $outputConsole = false)
    {
        if (null !== $saveLog && file_exists($saveLog)) {
            @unlink($saveLog);
        }

        $cmd = $this->cast($cmd);

        if ($outputConsole) {

            system($cmd);

            return '';
        }

        $descriptorspec = array(
            0 => array('pipe', 'r'), 
            1 => array('pipe', 'w'), 
            2 => array('pipe', 'w') 
        );

        $pipes = array();
        $process = proc_open($cmd, $descriptorspec, $pipes);

        $output = "";

        if (!is_resource($process)) return false;

        #close child's input imidiately
        fclose($pipes[0]);

        stream_set_blocking($pipes[1], false);
        stream_set_blocking($pipes[2], false);

        $todo = array($pipes[1], $pipes[2]);

        while (true) {
            $read = array();
            if (!feof($pipes[1])) $read[] = $pipes[1];
            if (!feof($pipes[2])) $read[] = $pipes[2];

            if (!$read) break;

            $ready = @stream_select($read, $write = NULL, $ex = NULL, 2);

            if ($ready === false) {
                break; #should never happen - something died
            }

            foreach ($read as $r) {
                $s = fread($r, 1024);
                if ($saveLog) {
                    @file_put_contents($saveLog, $s, FILE_APPEND);
                }
                $output .= $s;
            }
        }

        fclose($pipes[1]);
        fclose($pipes[2]);

        #$code = proc_close($process);

        return $output;
    }

    public function cast($cmd)
    {
        $this->createLibsDirectory();
        $dir = $this->config->getRootDir();

        $additionalWineLibs = "{$dir}/libs/i386:{$dir}/libs/x86-64";

        $exported = [
            'export WINE'             => $this->config->wine('WINE'),
            'export WINE64'           => $this->config->wine('WINE64'),
            'export WINEPREFIX'       => $this->config->wine('WINEPREFIX'),
            'export WINESERVER'       => $this->config->wine('WINESERVER'),
            'export WINEARCH'         => $this->config->wine('WINEARCH'),
            'export WINEDEBUG'        => $this->config->wine('WINEDEBUG'),
            'export WINEDLLOVERRIDES' => $this->config->wine('WINEDLLOVERRIDES'),
            'export LD_LIBRARY_PATH'  => "\$LD_LIBRARY_PATH:{$additionalWineLibs}",
            'export DXVK_CONFIG_FILE' => $this->config->getDxvkConfigFile(),
            'export PROTON_LOG'       => $this->config->getLogsDir() . '/proton.log',
            'export XDG_CACHE_HOME'   => $this->config->getCacheDir(),
        ];

        if ($locale = $this->getLocale()) {
            $exported['export LC_ALL'] = $locale;
        }

        if (!$this->config->isEsync()) {
            $exported['export PROTON_NO_ESYNC'] = 'noesync';
        }

        if ($this->config->isDxvk() || $this->config->isD9vk()) {

            $cache = $this->config->getDxvkCacheDir();
            $logs  = $this->config->getDxvkLogsDir();

            $exported['export DXVK_STATE_CACHE_PATH'] = $cache;
            $exported['export DXVK_LOG_PATH']         = $logs;

            if (strpos($exported['export WINEDLLOVERRIDES'], 'nvapi') === false) {

                $overrides   = explode(';', $exported['export WINEDLLOVERRIDES']);
                $overrides[] = 'nvapi64,nvapi=';
                $overrides[] = 'd3d9=n';

                $exported['export WINEDLLOVERRIDES'] = implode(';', $overrides);
            }
        }

        if ($this->config->get('export')) {
            foreach ((array)$this->config->get('export') as $key => $value) {
                $exported["export {$key}"] = $value;
            }
        }

        $prefix = [];

        foreach ($exported as $key => $value) {
            $prefix[] = "{$key}=\"{$value}\";";
        }

        $prefix = implode(' ', $prefix);

        $cmd = "{$prefix} cd \"{$dir}\" && {$cmd}";

        return $cmd;
    }

    public function squashfuse($folder)
    {
        (new Update($this->config, $this))->downloadSquashfuse();

        $squashfuse = $this->config->getRootDir() . '/squashfuse';

        return $this->run(Text::quoteArgs($squashfuse) . ' ' . Text::quoteArgs("{$folder}.squashfs") . ' ' . Text::quoteArgs($folder));
    }

    public function zipfuse($folder)
    {
        (new Update($this->config, $this))->downloadFusezip();

        $zipfuse = $this->config->getRootDir() . '/fuse-zip';

        return $this->run(Text::quoteArgs($zipfuse) . ' ' . Text::quoteArgs("{$folder}.zip") . ' ' . Text::quoteArgs($folder));
    }

    public function umount($folder)
    {
        return $this->run('fusermount -u ' . Text::quoteArgs($folder));
    }

    public function getLocale()
    {
        static $locale;

        if (null === $locale) {
            $cmdValue = getenv('LC_ALL');

            if ($cmdValue) {
                $locale = $cmdValue;
            } else {
                exec('locale', $out, $return);
                $locales = is_array($out) ? $out : explode("\n", $out);
                $counts  = [];

                foreach ($locales as $loc) {
                    list($field, $value) = explode('=', $loc);
                    if (!$loc || !$value) {
                        continue;
                    }
                    $value = trim($value, " \t\n\r\0\x0B\"'");
                    if (!isset($counts[$value])) {
                        $counts[$value] = 0;
                    } else {
                        $counts[$value] += 1;
                    }
                }

                asort($counts);
                end($counts);
                $locale = key($counts);
            }
        }

        return $locale;
    }

    public function createLibsDirectory()
    {
        $libs = $this->config->getRootDir() . '/libs';

        if (!file_exists($libs)) {
            if (!mkdir($libs, 0775, true) && !is_dir($libs)) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', $libs));
            }

            if (!mkdir("{$libs}/i386", 0775, true) && !is_dir("{$libs}/i386")) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', "{$libs}/i386"));
            }

            if (!mkdir("{$libs}/x86-64", 0775, true) && !is_dir("{$libs}/x86-64")) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', "{$libs}/x86-64"));
            }

            file_put_contents("{$libs}/readme.txt",'В папки i386, x86-64 можно ложить специфичные библиотеки для wine.');
        }
    }
}

class Network {

    private static $isConnected;

    private $command;
    private $config;

    public function __construct(Config $config, Command $command)
    {
        $this->command = $command;
        $this->config  = $config;
    }

    public static function isConnected()
    {
        if (self::$isConnected !== null) {
            return self::$isConnected;
        }

        $connected = @fsockopen('8.8.8.8', 53, $errno,$errstr, 5);

        if ($connected) {
            self::$isConnected = true;
            fclose($connected);
        } else {
            self::$isConnected = false;
        }

        return self::$isConnected;
    }

    public function get($url)
    {
        return self::isConnected() ? file_get_contents($url, false, stream_context_create($this->config->getContextOptions())) : '';
    }

    public function getJSON($url)
    {
        if ($result = $this->get($url)) {
            return json_decode($result, true);
        }

        return [];
    }

    public function getRepo($url)
    {
        return $this->get($this->config->getRepositoryUrl() . $url);
    }
}

class System {

    private $command;
    private $config;

    public function __construct(Config $config, Command $command)
    {
        $this->command = $command;
        $this->config  = $config;
    }

    public function getUserName($reset = false)
    {
        static $userName = null;

        if (true === $reset) {
            $userName = null;
        }

        if ($userName === null) {

            $libwine = $this->config->getWineDir() . '/lib/libwine.so';
            $libwine = glob("{$libwine}*");
            $libwine = reset($libwine);

            if ($libwine && file_exists($libwine) && (bool)trim($this->command->run('grep -i "proton" ' . Text::quoteArgs($libwine)))) {
                $userName = 'steamuser';
                return $userName;
            }

            $userName = trim($this->command->run('id -u -n'));
        }

        return $userName;
    }

    public function getHostname()
    {
        static $hostname = null;

        if ($hostname === null) {
            $hostname = trim($this->command->run('hostname'));
        }

        return $hostname;
    }

    public function getDesktopPath()
    {
        $isXdg = (bool)trim($this->command->run('command -v xdg-user-dir'));

        if ($isXdg) {
            return trim($this->command->run('xdg-user-dir DESKTOP'));
        }

        return '';
    }

    public function getCPU()
    {
        static $result;

        if (null === $result) {
            $cpuinfo = explode("\n", trim($this->command->run('cat /proc/cpuinfo')));

            foreach ($cpuinfo as $line) {
                if (strpos($line, 'model name') !== false) {
                    $line = explode(':', $line);
                    $result = trim(end($line));
                    return $result;
                }
            }

            $result = '';
        }

        return $result;
    }

    public function getGPU()
    {
        static $result;

        if (null === $result) {
            $gpuinfo = explode("\n", trim($this->command->run('glxinfo')));

            foreach ($gpuinfo as $line) {
                if (strpos($line, 'Device') !== false) {
                    $line = explode(':', $line);
                    $result = trim(end($line));
                    break;
                }
            }

            if (!$result) {
                $result = trim($this->command->run('lspci | grep VGA | cut -d ":" -f3'));
            }
        }

        return $result;
    }

    public function getRAM()
    {
        static $result;

        if (null === $result) {
            $meminfo = explode("\n", trim($this->command->run('cat /proc/meminfo')));

            foreach ($meminfo as $line) {
                if (strpos($line, 'MemTotal') !== false) {
                    $line = explode(':', $line);
                    $line = array_filter(explode(' ', end($line)));
                    $line = trim(reset($line));
                    $line = round($line / 1024);

                    $result = $line;

                    return $result;
                }
            }

            $result = '';
        }

        return $result;
    }

    public function getFreeRAM()
    {
        $meminfo = explode("\n", trim($this->command->run('cat /proc/meminfo')));

        foreach ($meminfo as $line) {
            if (strpos($line, 'MemAvailable') !== false) {
                $line = explode(':', $line);
                $line = array_filter(explode(' ', end($line)));
                $line = trim(reset($line));
                $line = round($line / 1024);

                return $line;
            }
        }

        return '';
    }

    public function getLinuxVersion()
    {
        static $result;

        if (null === $result) {
            $result = trim($this->command->run('uname -mrs'));
        }

        return $result;
    }

    public function getDistrName()
    {
        static $result;

        if (null === $result) {
            $release = explode("\n", trim($this->command->run('cat /etc
    public function __construct(Config $config, Command $command, Console $console, $folder)
    {
        $this->config  = $config;
        $this->command = $command;
        $this->folder  = $folder;
        $this->console = $console;

        $this->mount();

        if ($this->getFolder() === $config->getWineDir()) {
            $config->updateWine();
        }

        if ($this->isMounted()) {
            register_shutdown_function(function () { if ($this->isMounted()) $this->umount(); });
        }
    }

    public function isMounted()
    {
        return $this->mounted;
    }

    public function getFolder()
    {
        return $this->folder;
    }

    public function getExtension()
    {
        return $this->extension;
    }

    public function mount()
    {
        if (!$this->console->lock()) {
            return false;
        }

        $folder = $this->folder;

        $this->umount();

        if ($this->mounted === false && file_exists("{$folder}.squashfs") && !file_exists($folder)) {
            if (!mkdir($folder, 0775) && !is_dir($folder)) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', $folder));
            }
            $this->extension = 'squashfs';
            $this->mounted = true;
            $this->command->squashfuse($folder);
        }

        if ($this->mounted === false && file_exists("{$folder}.zip") && !file_exists($folder)) {
            if (!mkdir($folder, 0775) && !is_dir($folder)) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', $folder));
            }
            $this->extension = 'zip';
            $this->mounted = true;
            $this->command->zipfuse($folder);
        }

        return $this->mounted;
    }

    public function umount()
    {
        if (!$this->console->lock()) {
            return false;
        }

        foreach (range(0, 5) as $i) {
            if (!file_exists($this->folder)) {
                $this->mounted = false;
                $this->extension = null;
                break;
            }

            $this->command->umount($this->folder);

            if (file_exists($this->folder) && (file_exists("{$this->folder}.squashfs") || file_exists("{$this->folder}.zip"))) {
                @rmdir($this->folder);
            }

            if (file_exists($this->folder) && (file_exists("{$this->folder}.squashfs") || file_exists("{$this->folder}.zip"))) {
                sleep(1);
            } else {
                $this->extension = null;
                $this->mounted = false;
            }
        }

        return $this->mounted;
    }
}

class Event
{
    const EVENT_BEFORE_START_GAME   = 'before-start';
    const EVENT_AFTER_START_GAME    = 'after-start';
    const EVENT_AFTER_CREATE_PREFIX = 'after-create-prefix';

    private $command;
    private $config;

    protected $events;

    public function __construct(Config $config, Command $command)
    {
        $this->command = $command;
        $this->config  = $config;

        if (null === $this->events) {
            $this->events = [];
        }
    }

    public function on($event, $callbackOrNamespaceStaticFunc)
    {
        if (!isset($this->events[$event])) {
            $this->events[$event] = [];
        }

        $this->events[$event][] = $callbackOrNamespaceStaticFunc;
    }

    public function fireEvent($event)
    {
        if (empty($this->events[$event])) {
            return;
        }

        foreach ($this->events[$event] as $item) {
            $item();
        }
    }

    public function createPrefix($type = 'after_create_prefix')
    {
        if (!file_exists($this->config->wine('WINEPREFIX'))) {
            return [];
        }

        if (file_exists($this->config->getHooksDir())) {
            $result = [];

            if ($this->config->get('hooks', $type)) {
                foreach ((array)$this->config->get('hooks', $type) as $hookCmd) {
                    $hookCmd = trim($hookCmd);
                    if (!$hookCmd) {
                        continue;
                    }

                    $trimHook = trim($hookCmd, '&');

                    if (file_exists($this->config->getHooksDir() . "/{$trimHook}")) {
                        $result[] = "Run {$trimHook}";
                        $result[] = $this->command->run('cd "' . $this->config->getHooksDir() . '"; chmod +x ' . $trimHook . "; ./{$hookCmd}");
                    }
                }
            }
        }

        if ('after_create_prefix' === $type) {
            $this->fireEvent(self::EVENT_AFTER_CREATE_PREFIX);
        } elseif ('before_run_game' === $type) {
            $this->fireEvent(self::EVENT_BEFORE_START_GAME);
        } elseif ('after_exit_game' === $type) {
            $this->fireEvent(self::EVENT_AFTER_START_GAME);
        }

        return $result;
    }

    public function beforeRun()
    {
        $this->createPrefix('before_run_game');
    }

    public function afterExit()
    {
        $this->createPrefix('after_exit_game');
    }

    public function gpu()
    {
        $gpu = (new System($this->config, $this->command))->getTypeGPU();

        if (!file_exists($this->config->wine('WINEPREFIX')) || !file_exists($this->config->getHooksGpuDir()) || !$gpu) {
            return [];
        }

        $result = [];

        if ($this->config->get('hooks', "gpu_{$gpu}")) {
            $hooks = (array)$this->config->get('hooks', "gpu_{$gpu}");

            foreach ($hooks as $hook) {
                $hookCmd = trim($hook);
                if (!$hookCmd) {
                    continue;
                }

                $trimHook = trim($hookCmd, '&');

                if (file_exists($this->config->getHooksDir() . "/{$trimHook}")) {
                    $result[] = "Run {$trimHook}";
                    $result[] = $this->command->run('cd "' . $this->config->getHooksDir() . '"; chmod +x ' . Text::quoteArgs($trimHook) . "; ./{$hookCmd}", true);
                }
            }
        }

        return $result;
    }
}

class Config {

    private $repo;
    private $context;
    private $gameInfoDir;
    private $rootDir;
    private $dataDir;
    private $dataFile;
    private $additionalDir;
    private $dllsDir;
    private $dlls64Dir;
    private $hooksDir;
    private $regsDir;
    private $cacheDir;
    private $logsDir;
    private $libsDir;
    private $libs64Dir;
    private $configPath;
    private $config;
    private $wine;
    private $dxvkConfFile;
    private $hooksGpuDir;
    private $symlinksDir;
    private $dataSymlinksDir;
    private $patchApplyDir;
    private $patchAutoDir;

    public function __construct($path = null)
    {
        $this->repo            = 'https:
        $this->context         = [
            'ssl'  => ['verify_peer' => false, 'verify_peer_name' => false],
            'http' => ['header' => ['User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)']],
        ];
        $this->rootDir         = __DIR__;
        $this->gameInfoDir     = "{$this->rootDir}/game_info";
        $this->dataDir         = "{$this->rootDir}/game_info/data";
        $this->dataSymlinksDir = "{$this->rootDir}/game_info/data/_symlinks";
        $this->dataFile        = "{$this->rootDir}/game_info/data.squashfs";
        $this->additionalDir   = "{$this->rootDir}/game_info/additional";
        $this->symlinksDir     = "{$this->rootDir}/game_info/additional/symlinks";
        $this->dllsDir         = "{$this->rootDir}/game_info/dlls";
        $this->dlls64Dir       = "{$this->rootDir}/game_info/dlls64";
        $this->hooksDir        = "{$this->rootDir}/game_info/hooks";
        $this->hooksGpuDir     = "{$this->rootDir}/game_info/hooks/gpu";
        $this->regsDir         = "{$this->rootDir}/game_info/regs";
        $this->cacheDir        = "{$this->rootDir}/game_info/cache";
        $this->logsDir         = "{$this->rootDir}/game_info/logs";
        $this->patchApplyDir   = "{$this->rootDir}/game_info/patches/apply";
        $this->patchAutoDir    = "{$this->rootDir}/game_info/patches/auto";
        $this->dxvkConfFile    = "{$this->rootDir}/game_info/dxvk.conf";
        $this->libsDir         = "{$this->rootDir}/libs/i386";
        $this->libs64Dir       = "{$this->rootDir}/libs/x86-64";
        $this->wineDir         = "{$this->rootDir}/wine";
        $this->wineFile        = "{$this->rootDir}/wine.squashfs";

        if (null !== $path) {
            $this->load($path);
        }

        $this->wine = [
            'WINEDEBUG'        => '-all',
            'WINEARCH'         => 'win32',
            'WINEDLLOVERRIDES' => '', 
            'WINEPREFIX'       => "{$this->rootDir}/prefix",
            'DRIVE_C'          => "{$this->rootDir}/prefix/drive_c",
            'WINE'             => "{$this->rootDir}/wine/bin/wine",
            'WINE64'           => "{$this->rootDir}/wine/bin/wine64",
            'REGEDIT'          => "{$this->rootDir}/wine/bin/wine\" \"regedit",
            'REGEDIT64'        => "{$this->rootDir}/wine/bin/wine64\" \"regedit",
            'WINEBOOT'         => "{$this->rootDir}/wine/bin/wine\" \"wineboot",
            'WINEFILE'         => "{$this->rootDir}/wine/bin/wine\" \"winefile",
            'WINECFG'          => "{$this->rootDir}/wine/bin/wine\" \"winecfg",
            'WINETASKMGR'      => "{$this->rootDir}/wine/bin/wine\" \"taskmgr",
            'WINEUNINSTALLER'  => "{$this->rootDir}/wine/bin/wine\" \"uninstaller",
            'WINEPROGRAM'      => "{$this->rootDir}/wine/bin/wine\" \"progman",
            'WINESERVER'       => "{$this->rootDir}/wine/bin/wineserver",
        ];
    }

    public function updateWine()
    {
        if ((new Wine($this, new Command($this)))->isUsedSystemWine()) {
            $this->wine['WINE']            = 'wine';
            $this->wine['WINE64']          = 'wine64';
            $this->wine['REGEDIT']         = 'wine" "regedit';
            $this->wine['REGEDIT64']       = 'wine64" "regedit';
            $this->wine['WINETASKMGR']     = 'wine" "taskmgr';
            $this->wine['WINEUNINSTALLER'] = 'wine" "uninstaller';
            $this->wine['WINEPROGRAM']     = 'wine" "progman';
            $this->wine['WINEBOOT']        = 'wineboot';
            $this->wine['WINEFILE']        = 'winefile';
            $this->wine['WINECFG']         = 'winecfg';
            $this->wine['WINESERVER']      = 'wineserver';
        } else {
            $this->wine['WINE']            = "{$this->rootDir}/wine/bin/wine";
            $this->wine['WINE64']          = "{$this->rootDir}/wine/bin/wine64";
            $this->wine['REGEDIT']         = "{$this->rootDir}/wine/bin/wine\" \"regedit";
            $this->wine['REGEDIT64']       = "{$this->rootDir}/wine/bin/wine64\" \"regedit";
            $this->wine['WINETASKMGR']     = "{$this->rootDir}/wine/bin/wine\" \"taskmgr";
            $this->wine['WINEUNINSTALLER'] = "{$this->rootDir}/wine/bin/wine\" \"uninstaller";
            $this->wine['WINEPROGRAM']     = "{$this->rootDir}/wine/bin/wine\" \"progman";
            $this->wine['WINEBOOT']        = "{$this->rootDir}/wine/bin/wine\" \"wineboot";
            $this->wine['WINEFILE']        = "{$this->rootDir}/wine/bin/wine\" \"winefile";
            $this->wine['WINECFG']         = "{$this->rootDir}/wine/bin/wine\" \"winecfg";
            $this->wine['WINESERVER']      = "{$this->rootDir}/wine/bin/wineserver";
        }
    }

    public function wine($field)
    {
        $value = $this->get('wine', $field);

        if ($value === null) {
            $value = $this->wine[$field] ?: null;
        }

        return $value;
    }

    public function get($section, $field = null)
    {
        $this->load();

        if ($field !== null && empty($this->config[$section])) {
            return null;
        }

        return null === $field ? $this->config[$section] : $this->config[$section][$field];
    }

    public function getConfig()
    {
        $this->load();

        return $this->config;
    }

    public function save()
    {
        $update = new Update($this, new Command($this));

        return $update->updateConfig($this);
    }

    public function set($section, $field, $value)
    {
        $this->load();
        $this->config[$section][$field] = $value;
    }

    public function getBool($section, $field)
    {
        return (bool)$this->get($section, $field);
    }

    public function getInt($section, $field)
    {
        $result = $this->get($section, $field);

        if (is_array($result)) {
            return array_map('intval', $result);
        }

        return (int)$result;
    }

    public function getFloat($section, $field)
    {
        $result = $this->get($section, $field);

        if (is_array($result)) {
            return array_map('floatval', $result);
        }

        return (float)$result;
    }

    public function getGamePath()
    {
        return str_replace('\\', '/', trim($this->get('game', 'path'), '\\/'));
    }

    public function getPrefixGameFolder()
    {
        return $this->wine('DRIVE_C') . '/' . $this->getGamePath();
    }

    public function getPrefixFolder()
    {
        return $this->wine('WINEPREFIX');
    }

    public function isWineArch64()
    {
        return $this->wine('WINEARCH') === 'win64';
    }

    public function isWineArch32()
    {
        return !$this->isWineArch64();
    }

    public function getWineSystem32Folder()
    {
        if ($this->isWineArch64()) {
            return $this->wine('DRIVE_C') . '/windows/syswow64';
        }

        return $this->wine('DRIVE_C') . '/windows/system32';
    }

    public function getWineSyswow64Folder()
    {
        if ($this->isWineArch64()) {
            return $this->wine('DRIVE_C') . '/windows/system32';
        }

        return $this->wine('DRIVE_C') . '/windows/syswow64';
    }

    public function getGameAdditionalPath()
    {
        return str_replace('\\', '/', trim($this->get('game', 'additional_path'), '\\/'));
    }

    public function getGameExe()
    {
        return $this->get('game', 'exe');
    }

    public function getGameArgs()
    {
        return $this->get('game', 'cmd');
    }

    public function getGameTitle()
    {
        return $this->get('game', 'name');
    }

    public function getGameVersion()
    {
        return $this->get('game', 'version');
    }

    private function load($path = null)
    {
        if (null === $this->config) {
            if (!$path) {
                $path = $this->getConfigFile();
            } else {
                $this->configPath = $path;
            }

            if (file_exists($this->configPath)) {
                $this->config = (new FileINI($path))->get();
            } else {
                $this->config = parse_ini_string($this->getDefaultConfig(), true);
                @file_put_contents($path, $this->getDefaultConfig());
            }
        }
    }

    public function reload()
    {
        if (file_exists($this->configPath)) {
            $this->config = (new FileINI($this->configPath))->get();
        }
    }

    public function getPrefixDosdeviceDir()
    {
        return $this->getPrefixFolder() . '/dosdevices';
    }

    public function getPrefixDriveC()
    {
        return $this->wine('DRIVE_C');
    }

    public function getConfigFile()
    {
        if (null === $this->configPath) {
            $configs = $this->findConfigsPath();

            if ($configs) {
                $this->configPath = reset($configs);
            } else {
                $this->configPath = $this->getGameInfoDir() . '/game_info.ini';
            }
        }

        return $this->configPath;
    }

    public function findConfigsPath()
    {
        $configs = glob("{$this->gameInfoDir}
    public function __construct(Config $config, Command $command)
    {
        $this->command = $command;
        $this->config  = $config;
    }

    public function boot()
    {
        $this->command->run(Text::quoteArgs($this->config->wine('WINEBOOT')) . ' && ' . Text::quoteArgs($this->config->wine('WINESERVER')) . ' -w');
    }

    public function down()
    {
        $this->command->run(Text::quoteArgs($this->config->wine('WINESERVER')) . ' -k');
    }

    public function run($args)
    {
        $cmd = Text::quoteArgs($args);

        $result = $this->command->run(Text::quoteArgs($this->config->wine('WINE')) . " {$cmd}");

        if ($this->config->wine('WINEARCH') === 'win64') {
            $result .= $this->command->run(Text::quoteArgs($this->config->wine('WINE64')) . " {$cmd}");
        }

        return $result;
    }

    public function fm($args)
    {
        $config = clone $this->config;
        $config->set('wine', 'WINEDEBUG', '');
        $cmd = Text::quoteArgs($args);
        $logFile = $this->config->getLogsDir() . '/filemanager.log';

        return app('start')->getPatch()->create(function () use ($config, $cmd, $logFile) {
            return (new Command($config))->run(Text::quoteArgs($this->config->wine('WINEFILE')) . " {$cmd}", $logFile);
        });
    }

    public function cfg($args)
    {
        $cmd = Text::quoteArgs($args);

        return $this->command->run(Text::quoteArgs($this->config->wine('WINECFG')) . " {$cmd}");
    }

    public function reg($args)
    {
        $cmd = Text::quoteArgs($args);
        $result = $this->command->run(Text::quoteArgs($this->config->wine('REGEDIT')) . " {$cmd}");

        if ($this->config->wine('WINEARCH') === 'win64') {
            $result .= $this->command->run(Text::quoteArgs($this->config->wine('REGEDIT64')) . " {$cmd}");
        }

        return $result;
    }

    public function regsvr32($args)
    {
        $this->run(array_merge(['regsvr32'], $args));
    }

    public function winetricks($args, $output = false)
    {
        (new Update($this->config, $this->command))->downloadWinetricks();

        if ($args && file_exists($this->config->getRootDir() . '/winetricks')) {

            $config = clone $this->config;
            $config->set('wine', 'WINEDEBUG', '');
            $cmd = Text::quoteArgs($args);
            $title = implode('-', $args);
            $title = mb_strlen($title) > 50 ? mb_substr($title, 0, 48) . '..' : $title;
            $logFile = $this->config->getLogsDir() . "/winetricks-{$title}.log";
            return app('start')->getPatch()->create(function () use (&$config, $cmd, $logFile, $output) {
                return (new Command($config))->run(Text::quoteArgs($this->config->getRootDir() . '/winetricks') . " {$cmd}", $logFile, $output);
            });
        }

        return '';
    }

    public function checkSystemWine()
    {
        return (bool)trim($this->command->run('command -v "wine"'));
    }

    public function checkWine()
    {
        return (bool)trim($this->command->run('command -v ' . Text::quoteArgs($this->config->wine('WINE'))));
    }

    public function version()
    {
        if (null === $this->version) {
            $this->version = trim($this->command->run(Text::quoteArgs($this->config->wine('WINE')) . ' --version'));
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
            $help = $this->command->run(Text::quoteArgs($this->config->wine('WINE')) . ' --help');

            if (strpos($help, '--check-libs') === false) {
                $this->missingLibs = [];
                return $this->missingLibs;
            }

            $this->missingLibs = $this->command->run(Text::quoteArgs($this->config->wine('WINE')) . ' --check-libs');
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
}

class Update
{
    private $version = '0.85';
    private $command;
    private $config;
    private $network;
    private $system;

    public function __construct(Config $config, Command $command)
    {
        $this->command = $command;
        $this->config  = $config;
        $this->network = new Network($config, $command);
        $this->system  = new System($config, $command);
    }

    public function version()
    {
        return $this->version;
    }

    public function getUrl()
    {
        return 'https:
    }

    public function init()
    {

        if ($this->autoupdate()) {
            $this->restart();
        }

        (new DXVK($this->config, $this->command, $this->network))->update();

        (new D9VK($this->config, $this->command, $this->network, app('start')->getFileSystem(), app('start')->getWine()))->update();

        $this->updateReadme();

        $restart = $this->config->getRootDir() . '/restart';

        if (file_exists($restart)) {
            unlink($restart);
        }
    }

    public function updateReadme($create = false, $update = false)
    {
        if ($create === false) {

            if (!file_exists($this->config->getRootDir() . '/README.md')) {
                return false;
            }

            $path = $this->config->wine('DRIVE_C') . '/readme';

            if (!file_exists($path)) {
                if ($update === true) {
                    file_put_contents($path, ' ');
                    return false;
                }
                if ($update === false) {
                    return false;
                }
            }

            if ($update === true) {
                return false;
            }

            if (file_exists($path)) {
                unlink($path);
            } else {
                return false;
            }

        }

        if (Network::isConnected()) {
            if (file_exists($this->config->wine('DRIVE_C'))) {
                $readme = $this->network->get($this->config->getRepositoryUrl() . '/README.md');

                if ($readme) {

                    file_put_contents($this->config->getRootDir() . '/README.md', $readme);

                    return true;
                }
            }
        }

        return false;
    }

    public function updateConfig($config = null)
    {
        if (null === $config) {
            $config = $this->config;
        }

        if (!file_exists($config->getConfigFile())) {
            return false;
        }

        $result = [];

        $current          = $config->getConfig();
        $currentText      = file_get_contents($config->getConfigFile());
        $defaultText      = $config->getDefaultConfig();
        $defaultTextArray = explode("\n", $defaultText);

        $section = null;
        $space = null;
        foreach ($defaultTextArray as $line) {
            $line = trim($line);

            if (!$line) {
                $result[] = '';
                continue;
            }
            if (Text::startsWith($line, '[') && Text::endsWith($line, ']')) {

                if ($section !== null) {
                    if ($space === null) {
                        $space = true;
                        $result[] = '';
                    }

                    if ($current[$section]) {
                        foreach ($current[$section]?:[] as $key => $value) {
                            if (is_array($value)) {
                                foreach ($value?:[] as $k => $v) {
                                    $v = is_numeric($v) && $v !== null && $v !== '' ? $v : "\"{$v}\"";
                                    if (is_numeric($k)) {
                                        $result[] = "{$key}[] = {$v}";
                                    } else {
                                        $result[] = "{$key}[{$k}] = {$v}";
                                    }
                                }
                            } else {
                                $value = is_numeric($value) && $value !== null && $value !== '' ? $value : "\"{$value}\"";
                                $result[] = "{$key} = {$value}";
                            }
                        }

                        $result[] = '';
                    }
                }

                $space = null;
                $result[] = $line;
                $section  = trim(str_replace(['[',']'], '', $line));
                continue;
            }
            if (Text::startsWith($line, ';')) {
                $result[] = $line;
                continue;
            }

            if ($section !== null) {

                list($key, $value) = array_map(function ($n) { return trim($n, " \t\n\r\0\x0B\"'");}, explode('=', $line));

                if (Text::endsWith($key, ']')) {

                } else {
                    if (!isset($current[$section][$key])) {
                        $result[] = $line;
                    } else {
                        $value = $current[$section][$key];
                        $value = is_numeric($value) && $value !== null && $value !== '' ? $value : "\"{$value}\"";
                        $result[] = "{$key} = {$value}";
                        unset($current[$section][$key]);
                    }
                }
            }
        }

        if ($section !== null) {
            $result[] = '';

            foreach ($current[$section]?:[] as $key => $value) {
                if (is_array($value)) {
                    foreach ($value?:[] as $k => $v) {
                        $v = is_numeric($v) && $v !== null && $v !== '' ? $v : "\"{$v}\"";
                        if (is_numeric($k)) {
                            $result[] = "{$key}[] = {$v}";
                        } else {
                            $result[] = "{$key}[{$k}] = {$v}";
                        }
                    }
                } else {
                    $value = is_numeric($value) && $value !== null && $value !== '' ? $value : "\"{$value}\"";
                    $result[] = "{$key} = {$value}";
                }
            }

            $result[] = '';
        }

        $newConfig = implode("\n", $result);

        if (md5($currentText) !== md5($newConfig)) {
            file_put_contents($config->getConfigFile(), $newConfig);
            app('start')->getConfig()->reload();
            return true;
        }

        return false;
    }

    public function versionRemote()
    {
        static $version;

        if (null === $version) {
            $version = trim($this->network->get($this->config->getRepositoryUrl() . '/RELEASE'));
        }

        return $version;
    }

    public function autoupdate()
    {
        if ($this->config->isScriptAutoupdate() && Network::isConnected()) {
            if ($this->versionRemote() !== $this->version()) {
                return $this->update();
            }
        }

        return false;
    }

    public function update()
    {
        $newStart = $this->network->get($this->config->getRepositoryUrl() . '/start');

        if ($newStart) {
            file_put_contents($this->config->getRootDir() . '/start', $newStart);
            $this->command->run('chmod +x ' . Text::quoteArgs($this->config->getRootDir() . '/start'));

            $this->updateReadme(false, true);

            return true;
        }

        return false;
    }

    public function downloadWinetricks()
    {
        $filePath = $this->config->getRootDir() . '/winetricks';
        $isDelete = false;

        if (file_exists($filePath)) {
            $createAt  = filectime($filePath);
            $currentAt = time();

            if (($currentAt - $createAt) > 86400) {
                $isDelete = true;
            }
        }

        if ($isDelete || !file_exists($filePath)) {
            $winetricks = $this->network
                ->get('https:

            if ($winetricks) {
                file_put_contents($filePath, $winetricks);
                $this->command->run("chmod +x \"{$filePath}\"");

                return true;
            }
        }

        return false;
    }

    public function downloadSquashfuse()
    {
        $filePath = $this->config->getRootDir() . '/squashfuse';

        if (!file_exists($filePath)) {

            $squashfuse = $this->network->getRepo('/squashfuse');

            if ($squashfuse) {
                file_put_contents($filePath, $squashfuse);
                $this->command->run("chmod +x \"{$filePath}\"");

                return true;
            }
        }

        return false;
    }

    public function downloadFusezip()
    {
        $filePath = $this->config->getRootDir() . '/fuse-zip';

        if (!file_exists($filePath)) {

            $fusezip = $this->network->getRepo('/fuse-zip');

            if ($fusezip) {
                file_put_contents($filePath, $fusezip);
                $this->command->run("chmod +x \"{$filePath}\"");

                return true;
            }
        }

        return false;
    }

    public function downloadHwprobe()
    {
        $filePath = $this->config->getRootDir() . '/hw-probe';

        if (!file_exists($filePath)) {

            $hwprobe = $this->network->getRepo('/hw-probe');

            if ($hwprobe) {
                file_put_contents($filePath, $hwprobe);
                $this->command->run("chmod +x \"{$filePath}\"");

                return true;
            }
        }

        return false;
    }

    public function downloadOsd()
    {
        $filePath = $this->config->getRootDir() . '/osd';

        if (!file_exists($filePath)) {

            $osd = $this->network->getRepo('/osd');

            if ($osd) {
                file_put_contents($filePath, $osd);
                $this->command->run("chmod +x \"{$filePath}\"");

                return true;
            }
        }

        return false;
    }

    public function updatePhp()
    {
        if ($this->system->checkPhp()) {
            return false;
        }

        $filePath = $this->config->getRootDir() . '/php';

        $php = $this->network->getRepo('/php');

        if ($php) {
            if (file_exists($filePath)) {
                @unlink($filePath);
            }
            file_put_contents($filePath, $php);
            $this->command->run("chmod +x \"{$filePath}\"");

            return true;
        }

        return false;
    }

    public function restart()
    {
        $restart = $this->config->getRootDir() . '/restart';

        if (!file_exists($restart)) {
            file_put_contents($restart, ' ');
            exit(0);
        }
    }
}

class Monitor {

    private $config;
    private $command;
    private $xrandr;
    private $monitors;
    private $jsonPath;

    public function __construct(Config $config, Command $command)
    {
        $this->command  = $command;
        $this->config   = $config;
        $this->jsonPath = $this->config->getRootDir() . '/resolutions.json';
    }

    public function isXrandr()
    {
        if (null === $this->xrandr) {
            $this->xrandr = (bool)trim($this->command->run("command -v xrandr"));
        }

        return $this->xrandr;
    }

    public function resolutions($reload = false)
    {
        if (!$this->isXrandr()) {
            return [];
        }

        if (false === $reload && null !== $this->monitors) {
            return $this->monitors;
        }

        $head = '/^(.*) connected( | primary )([0-9]{3,4}x[0-9]{3,4}).*\n*/m';
        $dump = $this->command->run('xrandr --verbose');
        $array = explode("\n", $dump);
        $monitors = [];

        preg_match_all($head, $dump, $matches);

        foreach ($matches[0] as $i => $_line) {
            $monitors[$matches[1][$i]] = [
                'output' => $matches[1][$i],
                'resolution' => $matches[3][$i],
            ];

            $inner = false;
            foreach ($array as $line) {
                if (!$line || !$_line) {
                    continue;
                }
                if ($inner === false && strpos($_line, $line) !== false) {
                    $inner = true;
                    $monitors[$matches[1][$i]]['default'] = strpos($line, 'primary') !== false;
                } elseif ($inner) {
                    if (strpos($line, 'connected') !== false || strpos($line, 'disconnected') !== false) {
                        $inner = false;
                    } else {
                        if (isset($monitors[$matches[1][$i]]['brightness'], $monitors[$matches[1][$i]]['gamma'])) {
                            $inner = false;
                            break;
                        }
                        if (strpos($line, 'Brightness:') !== false) {
                            $value = trim(str_replace('Brightness:', '', $line));
                            $monitors[$matches[1][$i]]['brightness'] = $value;
                        }
                        if (strpos($line, 'Gamma:') !== false) {
                            $value = trim(str_replace('Gamma:', '', $line));
                            $monitors[$matches[1][$i]]['gamma'] = $value;
                        }
                    }
                }
            }
        }

        $this->monitors = $monitors;

        return $this->monitors;
    }

    public function getDefaultMonitor()
    {
        $monitors = $this->resolutions();

        foreach ($monitors as $monitor) {
            if ($monitor['default']) {
                return $monitor;
            }
        }

        return [];
    }

    public function resolutionsSave()
    {
        file_put_contents($this->jsonPath, json_encode($this->resolutions(true), JSON_PRETTY_PRINT));
    }

    public function resolutionLoad()
    {
        if (file_exists($this->jsonPath)) {
            return json_decode(file_get_contents($this->jsonPath), true);
        }

        return null;
    }

    public function resolutionsRestore()
    {
        if (!$this->isXrandr()) {
            return [];
        }

        $result   = [];
        $monitors = $this->resolutions(true);

        foreach ($this->resolutionLoad()?:[] as $output => $params) {
            if ($monitors[$output]) {
                if ($params['gamma'] !== $monitors[$output]['gamma']) {
                    $this->command->run(Text::quoteArgs($this->config->wine('WINESERVER')) . " -w && xrandr --output {$output} --gamma {$params['gamma']}");
                    $result[] = "Revert gamma, output {$output}, gamma {$monitors[$output]['gamma']} > {$params['gamma']}.";
                }
                if ($params['brightness'] !== $monitors[$output]['brightness']) {
                    $this->command->run(Text::quoteArgs($this->config->wine('WINESERVER')) . " -w && xrandr --output {$output} --brightness {$params['brightness']}");
                    $result[] = "Revert brightness, output {$output}, brightness {$monitors[$output]['brightness']} > {$params['brightness']}.";
                }
                if ($params['resolution'] !== $monitors[$output]['resolution']) {
                    $this->command->run(Text::quoteArgs($this->config->wine('WINESERVER')) . " -w && xrandr --output {$output} --mode {$params['resolution']}");
                    $result[] = "Revert resolution, output {$output}, resolution {$monitors[$output]['resolution']} > {$params['resolution']}.";
                }
            }
        }

        if (file_exists($this->jsonPath)) {
            @unlink($this->jsonPath);
        }

        return $result;
    }
}

class WinePrefix {

    private $command;
    private $config;
    private $wine;
    private $monitor;
    private $system;
    private $fs;
    private $update;
    private $event;
    private $replaces;
    private $network;
    private $log;
    private $buffer;
    private $created = false;

    public function __construct(Config $config, Command $command, Event $event)
    {
        $this->command  = $command;
        $this->config   = $config;
        $this->event    = $event;
        $this->wine     = new Wine($this->config, $this->command);
        $this->monitor  = new Monitor($this->config, $this->command);
        $this->system   = new System($this->config, $this->command);
        $this->fs       = new FileSystem($this->config, $this->command);
        $this->update   = new Update($this->config, $this->command);
        $this->replaces = new Replaces($this->config, $this->command, $this->fs, $this->system, $this->monitor);
        $this->network  = new Network($this->config, $this->command);
    }

    public function log($text)
    {
        $logPath = $this->config->getLogsDir() . '/prefix.log';

        if (null === $this->log) {
            $this->log = app('start')->getLog();
        }

        if (null === $this->buffer) {
            $this->buffer = app('start')->getBuffer();
            $this->buffer->clear();
            if (file_exists($logPath)) {
                @unlink($logPath);
            }
        }

        $this->log->insertLogFile($text, $logPath);
        $this->buffer->add($text);
    }

    public function create()
    {
        if (file_exists($this->config->getRootDir() . '/wine/bin')) {
            $this->command->run('chmod +x -R ' . Text::quoteArgs($this->config->getRootDir() . '/wine/bin/'));
        }

        if (!file_exists($this->config->wine('WINEPREFIX'))) {

            app('gui');
            $this->created = true;

            (new CheckDependencies($this->config, $this->command, $this->system))->check();

            app()->showPrefix();

            $this->log('Create folder "' . $this->config->wine('WINEPREFIX') . '"');
            app()->getCurrentScene()->setProgress(10);

            $this->log('Initialize ' . $this->wine->version() . ' prefix.');
            $this->wine->boot();
            @file_put_contents($this->config->wine('WINEPREFIX') . '/version', $this->wine->version());
            app()->getCurrentScene()->setProgress(20);

            foreach ($this->updateReplaces() as $replace) {
                $this->log($replace);
            }
            app()->getCurrentScene()->setProgress(25);

            if ($this->updateSandbox(true)) {
                $this->log('Set sandbox.');
            }
            app()->getCurrentScene()->setProgress(30);

            $this->createGameDirectory();
            app()->getCurrentScene()->setProgress(33);

            $regs = array_merge(
                app('start')->getPatch()->getRegistryFiles(),
                $this->config->getRegistryFiles()
            );
            app('start')->getRegistry()->apply($regs, function ($text) {$this->log($text);});
            app()->getCurrentScene()->setProgress(35);

            if (app('start')->getPatch()->apply()) {
                $this->log('Apply patches');
            }
            app()->getCurrentScene()->setProgress(37);

            if ($this->config->getBool('script', 'dumbxinputemu')) {
                app('start')->getPatch()->create(function () {
                    (new Dumbxinputemu($this->config, $this->command, $this->fs, $this->wine))->update(function ($text) {$this->log($text);});
                });
            }
            app()->getCurrentScene()->setProgress(40);

            if ($this->config->getBool('script', 'faudio')) {
                app('start')->getPatch()->create(function () {
                    (new FAudio($this->config, $this->command, $this->fs, $this->wine))->update(function ($text) {$this->log($text);});
                });
            }
            app()->getCurrentScene()->setProgress(45);

            (new Fixes($this->config, $this->command, $this->fs, $this->wine))->update(function ($text) {$this->log($text);});
            app()->getCurrentScene()->setProgress(50);

            if ($winetricksInstall = $this->config->get('script', 'winetricks_to_install')) {
                $this->log("Winetricks install \"{$winetricksInstall}\".");
                $this->wine->winetricks(array_filter(explode(' ', $winetricksInstall)));
            }

            $this->updateDlls();
            app()->getCurrentScene()->setProgress(55);

            $this->updateCsmt();
            app()->getCurrentScene()->setProgress(70);

            $this->updatePulse();
            app()->getCurrentScene()->setProgress(75);

            $this->updateWinVersion();
            app()->getCurrentScene()->setProgress(85);

            if ($this->config->isDxvk()) {
                app('start')->getPatch()->create(function () {
                    (new DXVK($this->config, $this->command, $this->network))->update(function ($text) {$this->log($text);});
                });
            }
            app()->getCurrentScene()->setProgress(87);

            if ($this->config->isD9vk()) {
                app('start')->getPatch()->create(function () {
                    (new D9VK($this->config, $this->command, $this->network, app('start')->getFileSystem(), app('start')->getWine()))
                        ->update(function ($text) {$this->log($text);});
                });
            }
            app()->getCurrentScene()->setProgress(90);

            $this->event->createPrefix();
            app()->getCurrentScene()->setProgress(95);
            $this->event->gpu();
            app()->getCurrentScene()->setProgress(100);

            $this->log('Success!');
        }

        $this->init();
    }

    public function init()
    {
        if (!$this->wine->checkWine()) {
            (new Logs())->log('There is no Wine available in your system!');
            exit(0);
        }

        $this->update->updateConfig();
        (new DXVK($this->config, $this->command, $this->network))->updateDxvkConfig();

        $this->createGameDirectory();

        $this->updateCsmt();

        (new Dumbxinputemu($this->config, $this->command, $this->fs, $this->wine))->update(function ($text) {$this->log($text);});

        (new FAudio($this->config, $this->command, $this->fs, $this->wine))->update(function ($text) {$this->log($text);});

        (new Fixes($this->config, $this->command, $this->fs, $this->wine))->update(function ($text) {$this->log($text);});

        $this->updateDlls();

        $this->updatePulse();

        $this->updateWinVersion();
    }

    public function updateReplaces()
    {
        if (!file_exists($this->config->wine('WINEPREFIX'))) {
            return [];
        }

        if (!$this->config->get('replaces', 'file')) {
            return [];
        }

        $result   = [];
        $userName = $this->replaces->getUserName();
        $width    = $this->replaces->getWidth();
        $height   = $this->replaces->getHeight();

        foreach ((array)$this->config->get('replaces', 'file') as $file) {

            $file = trim($file, " \t\n\r\0\x0B/");

            if (file_exists($this->config->getRootDir() . "/{$file}")) {
                $this->replaces->replaceByFile($this->config->getRootDir() . "/{$file}", true);
                $result[] = "Replace {WIDTH}x{HEIGHT} -> {$width}x{$height}, {USER} -> \"{$userName}\" ... from file \"{$file}\"";
            }
        }

        return $result;
    }

    public function updateDlls()
    {
        if (!file_exists($this->config->wine('WINEPREFIX'))) {
            return [];
        }

        $dlls     = [];
        $isDll32  = file_exists($this->config->getDllsDir()) && file_exists($this->config->getWineSystem32Folder());
        $isDll64  = file_exists($this->config->getDlls64Dir()) && file_exists($this->config->getWineSyswow64Folder());
        $isChange = false;
        $result   = [];

        if ($isDll32) {

            $files = glob($this->config->getDllsDir(). '
        if (file_exists($this->config->getAdditionalDir()) && file_exists($this->config->getAdditionalDir() . '/path.txt')) {

            $folders = array_filter(array_map('trim', explode("\n", file_get_contents($this->config->getAdditionalDir() . '/path.txt'))));

            if ($folders) {
                $adds = glob($this->config->getAdditionalDir() . '/dir_*/');
                $isCyrillic = $this->system->isCyrillic();

                $folderCount = count($folders);
                if (count($adds) >= $folderCount) {
                    foreach ($adds as $i => $path) {
                        if ($i >= $folderCount) {
                            break;
                        }

                        $add = str_replace('--REPLACE_WITH_USERNAME--', $this->system->getUserName(), trim($folders[$i], " \t\n\r\0\x0B/"));

                        if (!$isCyrillic) {
                            $add = str_replace('Мои документы', 'My Documents', $add);
                        }

                        $gameInfoAddDir = Text::quoteArgs($this->fs->relativePath($path));
                        $dirAdd = Text::quoteArgs($this->config->wine('DRIVE_C') . "/{$add}");
                        $this->command->run("mkdir -p {$dirAdd} && rm -r {$dirAdd} && ln -sfr {$gameInfoAddDir} {$dirAdd}");

                        if ($print) {
                            $this->log('Create symlink ' . $gameInfoAddDir . ' > ' . Text::quoteArgs($this->fs->relativePath($this->config->wine('DRIVE_C') . "/{$add}")));
                        }
                    }
                }
            }
        }

        return $update;
    }

    public function createGameDirectory()
    {

        if (!file_exists($this->config->getPrefixGameFolder()) && file_exists($this->config->wine('WINEPREFIX'))) {

            $data = $this->fs->relativePath($this->config->getDataDir());
            $game = $this->config->getPrefixGameFolder();
            $this->command->run("mkdir -p \"{$game}\" && rm -r \"{$game}\" && ln -sfr \"{$data}\" \"{$game}\"");

            $gameFolder = trim(str_replace($this->config->wine('DRIVE_C'), '', $this->config->getPrefixGameFolder()), " \t\n\r\0\x0B/");
            $this->log("Create game folder \"{$data}\" > " . Text::quoteArgs($this->fs->relativePath($this->config->getPrefixGameFolder())) . '.');

            return $gameFolder;
        }

        return '';
    }

    public function isCreated()
    {
        return $this->created;
    }

    public function setWine($wine)
    {
        $this->wine = $wine;
    }
}

class GameInfo {

    private $command;
    private $config;
    private $log;
    private $buffer;
    private $created = false;

    public function __construct(Config $config, Command $command)
    {
        if (posix_geteuid() === 0) {
            (new Logs)->log('Do not run this script as root!');
            exit(0);
        }

        $this->command = $command;
        $this->config  = $config;
    }

    public function log($text)
    {
        $logPath = $this->config->getLogsDir() . '/game_info.log';

        if (null === $this->log) {
            $this->log = app('start')->getLog();
        }

        if (null === $this->buffer) {
            $this->buffer = app('start')->getBuffer();
            $this->buffer->clear();
            if (file_exists($logPath)) {
                @unlink($logPath);
            }
        }

        $this->log->insertLogFile($text, $logPath);
        $this->buffer->add($text);
    }

    public function create()
    {
        if ($this->isEmptyGameFolder()) {

            app('gui');
            $this->created = true;

            app()->showGameInfo();

            $folders = [
                $this->config->getLogsDir(),
                $this->config->getCacheDir(),
                $this->config->getGameInfoDir(),
                $this->config->getAdditionalDir(),
                $this->config->getDataDir(),
                $this->config->getDllsDir(),
                $this->config->getDlls64Dir(),
                $this->config->getHooksDir(),
                $this->config->getHooksGpuDir(),
                $this->config->getRegistryDir(),
                $this->config->getPatchApplyDir(),
            ];

            foreach ($folders as $path) {
                if (!file_exists($path) && !mkdir($path, 0775, true) && !is_dir($path)) {
                    throw new \RuntimeException(sprintf('Directory "%s" was not created', $path));
                }

                $this->log("Create folder \"{$path}\"");
            }

            $readme = 'readme.txt';

            file_put_contents(
                $this->config->getGameInfoDir() . "/{$readme}",
                "Эта директория необходима для работы скрипта.

Описание директорий/файлов:

game_info.ini - информация об игре (обязательный файл)
data - каталог с игрой (обязательная директория)
dlls - дополнительные dll файлы (необязательная директория)
dlls64 - дополнительные dll файлы (необязательная директория)
additional - специфичные для игры настройки (необязательная директория)
hooks - скрипты которые выполняются в зависимости от каких либо событий (необязательная директория)
regs - файлы реестра windows (необязательная директория)"
            );
            $this->log('Create file   "' . $this->config->getGameInfoDir() . "/{$readme}" . '"');

            file_put_contents($this->config->getConfigFile(), $this->config->getDefaultConfig());
            $this->log('Create file   "' . $this->config->getConfigFile() . '"');

            file_put_contents(
                $this->config->getDataDir() . "/{$readme}",
                "Здесь должна находиться игра."
            );
            $this->log('Create file   "' . $this->config->getDataDir() . "/{$readme}" . '"');

            file_put_contents(
                $this->config->getDllsDir() . "/{$readme}",
                "В эту директорию нужно класть необходимые игре DLL файлы. Если таких нет
директорию можно удалить."
            );
            $this->log('Create file   "' . $this->config->getDllsDir() . "/{$readme}" . '"');

            file_put_contents(
                $this->config->getDlls64Dir() . "/{$readme}",
                "В эту директорию нужно класть необходимые игре DLL файлы. Если таких нет
директорию можно удалить."
            );
            $this->log('Create file   "' . $this->config->getDlls64Dir() . "/{$readme}" . '"');

            file_put_contents(
                $this->config->getRegistryDir() . "/{$readme}",
                "Здесь должны находиться .reg файлы."
            );
            $this->log('Create file   "' . $this->config->getRegistryDir() . "/{$readme}" . '"');

            file_put_contents(
                $this->config->getAdditionalDir() . "/{$readme}",
                "Специфичные для игры настройки. Класть в директории dir_1, dir_2, dir_3
и т.д. Путь для копирования (относительно drive_c) нужно указывать
в файле path.txt. Первая строчка для dir_1, вторая - для dir_2 и т.д.
Всю директорию additional можно удалить, если к игре не нужно заранее
применять настройки.

--REPLACE_WITH_USERNAME-- в файле path.txt заменяется на имя пользователя
автоматически."
            );
            $this->log('Create file   "' . $this->config->getAdditionalDir() . "/{$readme}" . '"');

            file_put_contents(
                $this->config->getAdditionalDir() . '/path.txt',
                "users/--REPLACE_WITH_USERNAME--/Мои документы
users/--REPLACE_WITH_USERNAME--/Documents"
            );
            $this->log('Create file   "' . $this->config->getAdditionalDir() . '/path.txt' . '"');

            if (!mkdir($this->config->getAdditionalDir() . '/dir_1', 0775, true) && !is_dir($path)) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', $path));
            }
            if (!mkdir($this->config->getAdditionalDir() . '/dir_2', 0775, true) && !is_dir($path)) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', $path));
            }
            $this->log('Create folder "' . $this->config->getAdditionalDir() . '/dir_1' . '"');
            $this->log('Create folder "' . $this->config->getAdditionalDir() . '/dir_2' . '"');

            file_put_contents(
                $this->config->getAdditionalDir() . "/dir_1/{$readme}",
                "Здесь должно находиться содержимое директории dir_1."
            );
            $this->log('Create file   "' . $this->config->getAdditionalDir() . "/dir_1/{$readme}" . '"');

            app()->getCurrentScene()->setProgress(5);

            if ((new Update($this->config, $this->command))->updateReadme(true)) {
                $this->log('Create file   "' . $this->config->getRootDir() . '/README.md' . '"');
            }

            file_put_contents(
                $this->config->getHooksDir() . '/after.sh',
                '#' ."!/bin/sh\necho \"After!\""
            );
            $this->log('Create file   "' . $this->config->getHooksDir() . '/after.sh' . '"');

            file_put_contents(
                $this->config->getHooksDir() . '/before.sh',
                '#' ."!/bin/sh\necho \"Before!\""
            );
            $this->log('Create file   "' . $this->config->getHooksDir() . '/before.sh' . '"');

            file_put_contents(
                $this->config->getHooksDir() . '/create.sh',
                '#' ."!/bin/sh\necho \"Create prefix!\"\ncd ../../\n./start unlock\n./start winetricks wmp9"
            );
            $this->log('Create file   "' . $this->config->getHooksDir() . '/create.sh' . '"');

            if (!file_exists($this->config->getHooksGpuDir())) {
                if (!mkdir($this->config->getHooksGpuDir(), 0775, true) && !is_dir($this->config->getHooksGpuDir())) {
                    throw new \RuntimeException(sprintf('Directory "%s" was not created', $this->config->getHooksGpuDir()));
                }
            }
            $this->log('Create folder "' . $this->config->getHooksGpuDir() . '"');

            file_put_contents(
                $this->config->getHooksGpuDir() . '/amd.sh',
                '#' ."!/bin/sh\necho \"AMD GPU hook!\""
            );
            $this->log('Create file   "' . $this->config->getHooksGpuDir() . '/amd.sh' . '"');

            file_put_contents(
                $this->config->getHooksGpuDir() . '/nvidia.sh',
                '#' ."!/bin/sh\necho \"NVIDIA GPU hook!\""
            );
            $this->log('Create file   "' . $this->config->getHooksGpuDir() . '/nvidia.sh' . '"');

            file_put_contents(
                $this->config->getHooksGpuDir() . '/intel.sh',
                '#' ."!/bin/sh\necho \"Intel GPU hook!\""
            );
            $this->log('Create file   "' . $this->config->getHooksGpuDir() . '/intel.sh' . '"');

            app()->getCurrentScene()->setProgress(10);

            $wineDownloader = new WineDownloader($this->config, $this->command, app('start')->getFileSystem(), app('start')->getPack());

            if ($wineDownloader->isWineEmpty()) {
                $wineDownloader->wizard();
            }
        }
    }

    private function isEmptyGameFolder()
    {
        if (!file_exists($this->config->getGameInfoDir())) {
            return true;
        }

        $skip = [$this->config->getLogsDir(), $this->config->getCacheDir(), $this->config->getConfigFile()];

        foreach (glob($this->config->getGameInfoDir() . '
    public function __construct(Config $config, Command $command, System $system)
    {
        $this->command = $command;
        $this->config  = $config;
        $this->system  = $system;
    }

    public function log($text)
    {
        $logPath = $this->config->getLogsDir() . '/dependencies.log';

        if (null === $this->log) {
            $this->log = app('start')->getLog();
        }

        if (null === $this->buffer) {
            $this->buffer = app('start')->getBuffer();
            $this->buffer->clear();
            if (file_exists($logPath)) {
                @unlink($logPath);
            }
        }

        $this->log->insertLogFile($text, $logPath);
        $this->buffer->add($text);
    }

    private function formattedItem($item, $value)
    {
        $length     = 25;
        $lengthItem = mb_strlen($item);
        $lenDot     = $length - $lengthItem;
        return  '- ' . $item . ' ' . str_repeat('.', $lenDot > 0 ?  $lenDot : 0) . ' ' . $value;
    }

    public function check()
    {
        app()->showCheckDependencies();

        $system = app('start')->getSystem();
        $update = app('start')->getUpdate();
        $driver = app('start')->getDriver()->getVersion();

        $items = [
            'Script version:   ' . $update->version(),
            'RAM:              ' . $system->getRAM() . ' Mb',
            'CPU:              ' . $system->getCPU(),
            'GPU:              ' . $system->getGPU(),
            'Distr:            ' . $system->getDistrName(),
            'Arch:             ' . $system->getArch(),
            'Linux:            ' . $system->getLinuxVersion(),
            'GPU Driver:       ' . implode(', ', array_filter($driver)),
            'Glibc:            ' . $system->getGlibcVersion(),
            'X.Org version:    ' . $system->getXorgVersion(),
            'vm.max_map_count: ' . $system->getVmMaxMapCount(),
            'ulimit soft:      ' . $system->getUlimitSoft(),
            'ulimit hard:      ' . $system->getUlimitHard(),
        ];

        $this->log('System info.');
        $this->log('');

        foreach ($items as $item) {
            $this->log($item);
        }

        $this->log('');
        $this->log('');
        $this->log('Check dependencies.');
        $this->log('');

        $isOk = true;
        $install = [];

        $apps = [
            'wine'       => false,
            'zenity'     => false,
            'xrandr'     => false,
            'pulseaudio' => false,
            'glxinfo'    => false,
            'grep'       => false,
            'tar'        => false,
            'wget'       => false,
            'ldconfig'   => false,
            'mksquashfs' => false,
            'ldd'        => false,
            'ps'         => false,
            'lspci'      => false,
            'fusermount' => false,
            'mount'      => false,
            'tee'        => false,
            'sed'        => false,
            'xlsfonts'   => false,
            'id'         => false,
            'cabextract' => false,
            'p7zip'      => false,
            'unrar'      => false,
            'unzip'      => false,
            'zip'        => false,
            'binutils'   => false,
            'ffmpeg'     => false,
            'xz'         => false,
            'diff'       => false,
            'patch'      => false,
            'hostname'   => false,
            'locale'     => false,
            'modinfo'    => false,
            'lsmod'      => false,
            'winbindd'   => false,
            'fc-list'    => false,
        ];

        $appsPackage = [
            'wine'       => 'wine',
            'zenity'     => 'zenity',
            'xrandr'     => 'x11-xserver-utils',
            'pulseaudio' => 'pulseaudio',
            'glxinfo'    => 'mesa-utils',
            'grep'       => 'grep',
            'tar'        => 'tar',
            'wget'       => 'wget',
            'ldconfig'   => 'libc-bin',
            'mksquashfs' => 'squashfs-tools',
            'ldd'        => 'libc-bin',
            'ps'         => 'procps',
            'lspci'      => 'pciutils',
            'fusermount' => 'fuse',
            'mount'      => 'mount',
            'tee'        => 'coreutils',
            'sed'        => 'sed',
            'xlsfonts'   => 'x11-utils',
            'id'         => 'coreutils',
            'cabextract' => 'cabextract',
            'p7zip'      => 'p7zip',
            'unrar'      => 'unrar',
            'unzip'      => 'unzip',
            'zip'        => 'zip',
            'binutils'   => 'binutils',
            'ffmpeg'     => 'ffmpeg',
            'xz'         => 'xz-utils',
            'diff'       => 'diffutils',
            'patch'      => 'patch',
            'hostname'   => 'hostname',
            'locale'     => 'libc-bin',
            'modinfo'    => 'kmod',
            'lsmod'      => 'kmod',
            'winbindd'   => 'winbind',
            'fc-list'    => 'fontconfig',
        ];

        $libs = [
            'libvulkan1'        => [
                'name'   => 'libvulkan1',
                'status' => true,
                'find'   => 'libvulkan.so.1',
            ],
            'libfuse2'          => [
                'name'   => 'libfuse2',
                'status' => true,
                'find'   => 'libfuse.so.2',
            ],
            'libopenal1'        => [
                'name'   => 'libopenal',
                'status' => true,
                'find'   => 'libopenal.so.1',
            ],
            'libxinerama1'      => [
                'name'   => 'libxinerama1',
                'status' => true,
                'find'   => 'libXinerama.so.1',
            ],
            'libsdl2-2.0-0'     => [
                'name'   => 'libsdl2-2.0-0',
                'status' => true,
                'find'   => 'libSDL2-2.0.so.0',
            ],
            'libudev1'     => [
                'name'   => 'libudev1',
                'status' => true,
                'find'   => 'libudev.so.1',
            ],
            'libasound2'        => [
                'name'   => 'libasound2',
                'status' => true,
                'find'   => 'libasound.so.2',
            ],
            'libsm6'            => [
                'name'   => 'libsm6',
                'status' => true,
                'find'   => 'libSM.so.6',
            ],
            'libgl1'            => [
                'name'   => 'libgl1',
                'status' => true,
                'find'   => 'libGL.so.1',
            ],
            'libgif7'           => [
                'name'   => 'libgif7',
                'status' => true,
                'find'   => 'libgif.so.7',
            ],
            'libncurses5'       => [
                'name'   => 'libncurses5',
                'status' => true,
                'find'   => 'libncurses.so.5',
            ],
            'libncursesw5'      => [
                'name'   => 'libncursesw5',
                'status' => true,
                'find'   => 'libncursesw.so.5',
            ],
            'libncurses6'       => [
                'name'   => 'libncurses6',
                'status' => true,
                'find'   => 'libncurses.so.6',
            ],
            'libncursesw6'      => [
                'name'   => 'libncursesw6',
                'status' => true,
                'find'   => 'libncursesw.so.6',
            ],
            'libfreetype6'      => [
                'name'   => 'libfreetype',
                'status' => true,
                'find'   => 'libfreetype.so.6',
            ],
            'libfontconfig1'    => [
                'name'   => 'libfontconfig1',
                'status' => true,
                'find'   => 'libfontconfig.so.1',
            ],
            'libmpg123-0'       => [
                'name'   => 'libmpg123-0',
                'status' => true,
                'find'   => 'libmpg123.so.0',
            ],
            'libxcomposite1'    => [
                'name'   => 'libxcomposite1',
                'status' => true,
                'find'   => 'libXcomposite.so.1',
            ],
            'libgnutls30'       => [
                'name'   => 'libgnutls30',
                'status' => true,
                'find'   => 'libgnutls.so.30',
            ],
            'libgnutls-deb0-28' => [
                'name'   => 'libgnutls-deb0-28',
                'status' => true,
                'find'   => 'libgnutls-deb0.so.28',
            ],
            'libjpeg62'         => [
                'name'   => 'libjpeg62',
                'status' => true,
                'find'   => 'libjpeg.so.62',
            ],
            'libjpeg8'          => [
                'name'   => 'libjpeg8',
                'status' => true,
                'find'   => 'libjpeg.so.8',
            ],
            'libxslt1.1'        => [
                'name'   => 'libxslt1.1',
                'status' => true,
                'find'   => 'libxslt.so.1',
            ],
            'libxrandr2'        => [
                'name'   => 'libxrandr2',
                'status' => true,
                'find'   => 'libXrandr.so.2',
            ],
            'libpng16-16'       => [
                'name'   => 'libpng16-16',
                'status' => true,
                'find'   => 'libpng16.so.16',
            ],
            'libpng12-0'        => [
                'name'   => 'libpng12-0',
                'status' => true,
                'find'   => 'libpng12.so',
            ],
            'libtiff5'          => [
                'name'   => 'libtiff5',
                'status' => true,
                'find'   => 'libtiff.so.5',
            ],
            'libxcb1'           => [
                'name'   => 'libxcb1',
                'status' => true,
                'find'   => 'libxcb.so.1',
            ],
            'libtheora0'        => [
                'name'   => 'libtheora0',
                'status' => true,
                'find'   => 'libtheora.so.0',
            ],
            'libvorbis0a'       => [
                'name'   => 'libvorbis0a',
                'status' => true,
                'find'   => 'libvorbis.so.0',
            ],
            'zlib1g'            => [
                'name'   => 'zlib1g',
                'status' => true,
                'find'   => 'libz.so.1',
            ],
            'samba-libs'        => [
                'name'   => 'samba-libs',
                'status' => true,
                'find'   => 'libnetapi.so.0',
            ],
            'libsane1'          => [
                'name'   => 'libsane1',
                'status' => true,
                'find'   => 'libsane.so.1',
            ],
            'libcapi20-3'       => [
                'name'   => 'libcapi20-3',
                'status' => true,
                'find'   => 'libcapi20.so.3',
            ],
            'libcups2'          => [
                'name'   => 'libcups2',
                'status' => true,
                'find'   => 'libcups.so.2',
            ],
            'libgsm1'           => [
                'name'   => 'libgsm1',
                'status' => true,
                'find'   => 'libgsm.so.1',
            ],
            'libodbc1'          => [
                'name'   => 'libodbc1',
                'status' => true,
                'find'   => 'libodbc.so.2',
            ],
            'libosmesa6'        => [
                'name'   => 'libosmesa6',
                'status' => true,
                'find'   => 'libOSMesa.so.8',
            ],
            'libpcap0.8'        => [
                'name'   => 'libpcap0.8',
                'status' => true,
                'find'   => 'libpcap.so.0.8',
            ],
            'libv4l-0'          => [
                'name'   => 'libv4l-0',
                'status' => true,
                'find'   => 'libv4l1.so.0',
            ],
            'libdbus-1-3'       => [
                'name'   => 'libdbus-1-3',
                'status' => true,
                'find'   => 'libdbus-1.so.3',
            ],
            'libglib2.0-0'      => [
                'name'   => 'libglib2.0-0',
                'status' => true,
                'find'   => 'libgobject-2.0.so.0',
            ],
            'libgtk-3-0'        => [
                'name'   => 'libgtk-3-0',
                'status' => true,
                'find'   => 'libgtk-3.so.0',
            ],
            'libgstreamer1.0-0' => [
                'name'   => [
                    'gstreamer1.0-plugins-base',
                    'gstreamer1.0-plugins-good',
                    'libgstreamer1.0-0'
                ],
                'status' => true,
                'find'   => 'libgstreamer-1.0.so.0',
            ],
        ];

        $fonts = [
            'fonts-unfonts-extra' => [
                'name'   => 'fonts-unfonts-extra',
                'status' => true,
                'find'   => 'UnJamoBatang.ttf',
            ],
            'fonts-unfonts-core' => [
                'name'   => 'fonts-unfonts-core',
                'status' => true,
                'find'   => 'UnBatang.ttf',
            ],
            'fonts-wqy-microhei' => [
                'name'   => [ 'fonts-wqy-microhei', 'ttf-wqy-microhei' ],
                'status' => true,
                'find'   => 'wqy-microhei.ttc',
            ],
            'fonts-horai-umefont' => [
                'name'   => 'fonts-horai-umefont',
                'status' => true,
                'find'   => 'horai-umefont',
            ],
            'ttf-mscorefonts-installer' => [
                'name'   => 'ttf-mscorefonts-installer',
                'status' => true,
                'find'   => 'Georgia.ttf',
            ],
        ];

        ksort($apps);

        $percent  = 100 / (count($apps) + count($libs));
        $progress = 0;

        foreach ($apps as $app => $_) {
            if ($app === 'binutils') {
                $app = 'ld';
            } else if ($app === 'p7zip') {
                $app = '7z';
            }

            $is = trim($this->command->run("command -v {$app}"));

            if ($app === 'ld') {
                $app = 'binutils';
            } else if ($app === '7z') {
                $app = 'p7zip';
            }

            if ($is) {
                $apps[$app] = true;
                $this->log($this->formattedItem($app, 'ok'));
            } else {
                $apps[$app] = false;
                $this->log($this->formattedItem($app, 'fail'));

                if (!in_array($appsPackage[$app], $install, true)) {
                    $install[] = $appsPackage[$app];
                }
            }

            $progress += $percent;
            app()->getCurrentScene()->setProgress($progress);
        }

        if (trim($this->command->run('command -v fc-list'))) {
            foreach ($fonts as $key => $font) {
                $findFont = (bool)trim($this->command->run("fc-list | grep '{$font['find']}'"));

                if (!$findFont) {
                    $fonts[$key]['status'] = false;
                    foreach ((array)$font['name'] as $pkg) {
                        $install[] = $pkg;
                    }
                }

                $this->log('');
                $this->log('');
                $findLibs = implode(', ', (array)$font['name']);
                $this->log($this->formattedItem("Find font \"{$findLibs}\"", $fonts[$key]['status'] ? 'ok' : 'fail'));
            }
        }

        if ($apps['ldconfig']) {

            foreach ($libs as $key => $lib) {
                $result = [
                    'x86-64' => null,
                    'i386'   => null,
                ];
                $finds = array_filter(array_map('trim', explode("\n", trim($this->command->run("ldconfig -p | grep '{$lib['find']}'")))));

                foreach (glob($this->config->getLibsDir() . "/{$lib['find']}*") as $_lib) {
                    $_name = basename($_lib);
                    $finds[] = "{$_name} (libc6) => {$_lib}";
                }
                foreach (glob($this->config->getLibs64Dir() . "/{$lib['find']}*") as $_lib) {
                    $_name = basename($_lib);
                    $finds[] = "{$_name} (libc6,x86-64) => {$_lib}";
                }

                foreach ($finds as $find) {
                    list($_fullName, $_path) = array_map('trim', explode('=>', $find));
                    list($_name, $_arch) = array_map(function ($n) {return trim($n, " \t\n\r\0\x0B()");}, explode(' (', $find));
                    $_arch = stripos($_arch,'x86-64') !== false ? 'x86-64' : 'i386';

                    if (null === $result[$_arch]) {
                        $result[$_arch] = [
                            'name' => $_name,
                            'path' => $_path,
                        ];
                    } elseif (strlen($_name) > strlen($result[$_arch]['name']) || (strlen($_name) === strlen($result[$_arch]['name']) && strlen($_path) > strlen($result[$_arch]['path']))) {
                        $result[$_arch] = [
                            'name' => $_name,
                            'path' => $_path,
                        ];
                    }
                }

                if ($this->system->getArch() === 64) {
                    $libs[$key]['status'] = (bool)($result['x86-64'] && $result['i386']);
                } else {
                    $libs[$key]['status'] = (bool)$result['i386'];
                }

                if (false === $libs[$key]['status']) {
                    foreach ((array)$lib['name'] as $findLib) {
                        if (!$result['i386']) {
                            $install[] = "{$findLib}:i386";
                        }

                        if ($this->system->getArch() === 64) {
                            if (!$result['x86-64']) {
                                $install[] = $findLib;
                            }
                        }
                    }
                }

                $this->log('');
                $this->log('');
                $findLibs = implode(', ', (array)$lib['name']);
                $this->log($this->formattedItem("Find lib \"{$findLibs}\"", $libs[$key]['status'] ? 'ok' : 'fail'));
                $this->log('');

                if ($this->system->getArch() === 64) {
                    $this->log("(x86-64) \"{$result['x86-64']['path']}\"");
                }

                $this->log("(i386)   \"{$result['i386']['path']}\"");

                $progress += $percent;
                app()->getCurrentScene()->setProgress($progress);
            }

        } else {
            $message = 'Failed to check due to missing ldconfig';
            $this->log('');
            $this->log("libvulkan, libfuse, libopenal, libXinerama, SDL2, libasound2\n{$message}.");
            $progress += ($percent * count($libs));
            app()->getCurrentScene()->setProgress($progress);
        }

        if ($install) {
            $this->log('');
            $this->log('');
            $this->log('[Recommended] install (not all required):');
            $this->log('sudo dpkg --add-architecture i386 && sudo apt-get update');
            $this->log('sudo apt-get install ' . implode(' ', $install));
        }

        if (false === $apps['wine']) {
            $isOk = false;

            $this->log('');
            $this->log('Require install wine.');

            $this->log('');
            $this->log("Ubuntu:
sudo dpkg --add-architecture i386
wget -nc --no-check-certificate https:
sudo apt-key add Release.key
sudo apt-add-repository https:
sudo apt-get update
sudo apt-get install binutils cabextract p7zip-full unrar unzip wget wine zenity

Debian:
dpkg --add-architecture i386 && apt-get update
apt-get install wine32 wine binutils unzip cabextract p7zip-full unrar-free wget zenity");
        }

        if (false === $apps['zenity']) {
            if (count($this->config->findConfigsPath()) > 1) {
                $isOk = false;
            }

            $this->log('');
            $this->log('Require install zenity.');
            $this->log("sudo apt-get install zenity");
        }

        if (false === $apps['xrandr']) {
            $isOk = false;
            $this->log('');
            $this->log('Require install xrandr.');
            $this->log("sudo apt-get install x11-xserver-utils");
        }

        if ($apps['ldconfig'] && !$libs['libvulkan1']['status'] && ($this->config->isDxvk() || $this->config->isD9vk())) {
            $isOk = false;
            $this->log('');
            $this->log('Require install libvulkan1.');
            $this->log('https:
        }

        if ($apps['ldconfig'] && !$libs['libfuse2']['status']) {
            if (file_exists($this->config->getRootDir() . '/wine.squashfs')
                || file_exists($this->config->getRootDir() . '/game_info/data.squashfs')) {
                $isOk = false;
            }
            $this->log('');
            $this->log('Require install libfuse2.');
            $this->log('sudo dpkg --add-architecture i386');
            $this->log("sudo apt-get install libfuse2 libfuse2:i386");
        }

        if ($this->config->isDxvk() || $this->config->isD9vk()) {

            $driver = app('start')->getDriver()->getVersion();

            list($mesa) = isset($driver['mesa']) ? explode('-', $driver['mesa']) : '';

            if ($mesa) {
                $mesa = version_compare($mesa, '18.3', '<');
            }

            if ('nvidia' === $driver['vendor']) {

                $text = "\nPlease install NVIDIA driver 415.22 or newer.";

                if ('nvidia' !== $driver['driver']) {
                    $this->log($text);
                } elseif ('nvidia' === $driver['driver'] && version_compare($driver['version'], '415.22', '<')) {
                    $this->log($text);
                }

            } elseif ('amd' === $driver['vendor']) {

                $text = 'Please install AMD driver: ';

                if ('amdgpu-pro' === $driver['driver'] && version_compare($driver['version'], '18.50', '<')) {
                    $this->log("\n{$text} AMDGPU PRO 18.50 or newer.");
                } elseif ('amdgpu' === $driver['driver'] && $mesa) {
                    $this->log("\n{$text} RADV, Mesa 18.3 or newer (recommended).");
                }

            } elseif ('intel' === $driver['vendor'] && $mesa) {
                $this->log("\nPlease install Mesa 18.3 or newer.");
            }
        }

        if ($this->config->isEsync() || $this->config->isDxvk() || $this->config->isD9vk()) {
            $currentUlimit     = $this->system->getUlimitSoft();
            $recommendedUlimit = 200000;

            if ($recommendedUlimit > $currentUlimit) {
                $this->log('');
                $this->log("Error. Current ulimit: {$currentUlimit}, Required min ulimit: {$recommendedUlimit}");
                $this->log('');
                $this->log('Add to "/etc/security/limits.conf" file and reboot system:');
                $this->log("* soft nofile {$recommendedUlimit}");
                $this->log("* hard nofile {$recommendedUlimit}");
            }
        }

        if ($this->system->getVmMaxMapCount() < 200000) {
            $this->log('');
            $this->log('Please set vm.max_map_count=262144');
            $this->log('Current: ' . $this->system->getVmMaxMapCount());
            $this->log('Run as root:');
            $this->log('sudo sh -c "echo \'vm.max_map_count=262144\' >> /etc/sysctl.conf"');
        }

        if ($this->config->isGenerationPatchesMode()) {
            if (!$apps['diff']) {
                $isOk = false;
                $this->log('');
                $this->log('Install "diff" or disable "generation_patches_mode = 0" in config.');
            }
            if (!$apps['patch']) {
                $isOk = false;
                $this->log('');
                $this->log('Install "patch" or disable "generation_patches_mode = 0" in config.');
            }
        }

        if (false === $isOk) {
            $this->log('');
            $this->log("Press any key to exit.");
            ncurses_getch();
            exit(0);
        }
    }
}

class Icon
{
    private $config;
    private $command;
    private $system;
    private $user;
    private $home;
    private $folders;
    private $local;
    private $title;

    public function __construct(Config $config, Command $command, System $system)
    {
        $this->command = $command;
        $this->config  = $config;
        $this->system  = $system;

        $this->user    = $this->system->getUserName();
        $this->home    = getenv("HOME") ?: "/home/{$this->user}";
        $this->folders = [
            "{$this->home}/Рабочий стол/Games",
            "{$this->home}/Рабочий стол/games",
            "{$this->home}/Рабочий стол/Игры",
            "{$this->home}/Рабочий стол/игры",
            "{$this->home}/Рабочий стол",
            "{$this->home}/Desktop/Игры",
            "{$this->home}/Desktop/игры",
            "{$this->home}/Desktop/Games",
            "{$this->home}/Desktop/games",
            "{$this->home}/Desktop",
        ];

        $desktop = $this->system->getDesktopPath();

        if ($desktop) {
            $this->folders = array_unique(array_merge(
                [
                    "{$desktop}/Games",
                    "{$desktop}/games",
                    "{$desktop}/Игры",
                    "{$desktop}/игры",
                    $desktop,
                ],
                $this->folders
            ));
        }

        $this->local = "{$this->home}/.local/share/applications";
        $this->title = $this->config->getGameTitle();

        if (!file_exists($this->local) && file_exists($this->home)) {
            if (!mkdir($this->local, 0775, true) && !is_dir($this->local)) {
                throw new \RuntimeException(sprintf('Directory "%s" was not created', $this->local));
            }
        }
    }

    public function create($png, $isAddMenu = true)
    {
        $icon = $this->getTemplate($png);
        $result = [];

        if ($isAddMenu) {
            file_put_contents("{$this->local}/{$this->title}.desktop", $icon);
            $result[] = "{$this->local}/{$this->title}.desktop";
        }

        if ($desktop = $this->findDir()) {
            $fileName = "{$desktop}/{$this->title}";
            if (file_exists($fileName)) {
                file_put_contents($fileName, $icon);
                $result[] = $fileName;
            } else {
                file_put_contents("{$fileName}.desktop", $icon);
                $result[] = "{$fileName}.desktop";
            }
        }

        return $result;
    }

    public function remove()
    {
        $icons = $this->findExistIcons();

        if (!$icons) {
            return [];
        }

        foreach ($icons as $icon) {
            @unlink($icon);
        }

        return $icons;
    }

    public function findExistIcons()
    {
        $result = [];

        foreach (array_merge([$this->local], $this->folders) as $item) {
            $v1 = "{$item}/{$this->title}";
            $v2 = "{$v1}.desktop";

            if (file_exists($v1) && !is_dir($v1)) {
                $result[] = $v1;
            } elseif (file_exists($v2) && !is_dir($v2)) {
                $result[] = $v2;
            }
        }

        return $result;
    }

    public function findDir()
    {
        foreach ($this->folders as $folder) {
            if (file_exists($folder) && is_dir($folder)) {
                return $folder;
            }
        }

        return '';
    }

    public function findPng()
    {
        $rootDir = $this->config->getRootDir();

        $icons   = [];
        $icons[] = glob("{$rootDir}
    public function getTemplate($png)
    {
        $rootDir = $this->config->getRootDir();

        return "[Desktop Entry]
Version=1.0
Exec={$rootDir}/start
Path={$rootDir}
Icon={$png}
Name={$this->title}
Terminal=false
TerminalOptions=
Type=Application
Categories=Game";
    }
}

class Pack
{
    private $command;
    private $config;
    private $fs;

    public function __construct(Config $config, Command $command, FileSystem $fs)
    {
        $this->config  = $config;
        $this->command = $command;
        $this->fs      = $fs;
    }

    public function pack($folder)
    {
        $mount = $this->getMount($folder);

        if (false === $mount || $mount->isMounted() || !file_exists($folder)) {
            return false;
        }

        if ($this->isMksquashfs()) {

            if (file_exists("{$folder}.squashfs")) {
                @unlink("{$folder}.squashfs");
            }

            if ($folder === $this->config->getWineDir() && file_exists("{$folder}/bin")) {
                $this->command->run('chmod +x -R ' . Text::quoteArgs("{$folder}/bin"));
            }

            $folderName = basename($folder);

            $cmd = "mksquashfs \"{$folder}\" \"{$folder}.squashfs\" -b 1048576 -comp gzip -Xcompression-level 9";

            if ('wine' === $folderName) {
                $cmd = "mksquashfs \"{$folder}\" \"{$folder}.squashfs\" -b 1048576 -comp xz -Xdict-size 100%";
            }

            $this->command->run($cmd);

            return true;
        }

        return false;
    }

    public function unpack($folder)
    {
        $mount = $this->getMount($folder);

        if (false === $mount || !$mount->isMounted() || !file_exists($folder)) {
            return false;
        }

        if (file_exists("{$folder}_tmp")) {
            $this->fs->rm("{$folder}_tmp");
        }

        $this->fs->cp($folder, "{$folder}_tmp");
        $mount->umount();

        if ($mount->isMounted() || file_exists($folder)) {
            register_shutdown_function(function () use ($folder) {
                if (!file_exists($folder) && file_exists(file_exists("{$folder}_tmp"))) {
                    $this->fs->mv("{$folder}_tmp", $folder);
                }
            });
        } else {
            $this->fs->mv("{$folder}_tmp", $folder);
        }

        return true;
    }

    public function isMksquashfs()
    {
        static $result;

        if (null === $result) {
            $result = (bool)trim($this->command->run('command -v mksquashfs'));
        }

        return $result;
    }

    public function getMount($folder)
    {
        $mountes = app('start')->getMountes();
        $findMount = null;

        foreach ($mountes as $mount) {

            if ($mount->getFolder() === $folder) {
                $findMount = $mount;
                break;
            }
        }

        if (!$findMount) {
            return false;
        }

        return $findMount;
    }

    public function getMountes()
    {
        $result  = [];
        $mountes = app('start')->getMountes();

        foreach ($mountes as $mount) {

            if ($mount->isMounted()) {
                $result[] = $mount->getFolder() . '.' .$mount->getExtension();
            }
        }

        return $result;
    }
}

class Symlink
{
    private $command;
    private $config;
    private $fs;
    private $extensions;

    public function __construct(Config $config, Command $command, FileSystem $fs)
    {
        $this->config     = $config;
        $this->command    = $command;
        $this->fs         = $fs;
        $this->extensions = ['cfg', 'conf', 'ini', 'inf', 'log', 'sav', 'save', 'config', 'con', 'profile', 'ltx'];
    }

    public function getExtensions()
    {
        return $this->extensions;
    }

    public function replace($path)
    {
        $path = trim($path, " \t\n\r\0\x0B/\\");

        if (!$path || !file_exists($this->config->getDataDir() . "/{$path}")) {
            return false;
        }

        $symlinks  = $this->config->getSymlinksDir();
        $_symlinks = $this->config->getDataSymlinksDir();
        $data      = $this->config->getDataDir();

        $this->fs->mkdirs([$symlinks, $_symlinks]);
        $this->fs->mv("{$data}/{$path}","{$_symlinks}/{$path}");
        $this->cloneDir($this->fs->relativePath("{$_symlinks}/{$path}", $data));
        $this->fs->link("{$symlinks}/{$path}", "{$data}/{$path}");

        return true;
    }

    public function cloneDir($path)
    {
        $path = trim($path, " \t\n\r\0\x0B/\\");

        if (!$path || !file_exists($this->config->getDataDir() . "/{$path}")) {
            return false;
        }

        $symlinks  = $this->config->getSymlinksDir();
        $_symlinks = $this->config->getDataSymlinksDir();
        $data      = $this->config->getDataDir();

        $in  = "{$data}/{$path}";
        $out = "{$symlinks}/" . $this->fs->relativePath($in, $_symlinks);
        $this->fs->mkdirs([$out]);

        foreach (glob("{$in}
    public function __construct(Config $config, Command $command, System $system, FileSystem $fs)
    {
        $this->config     = $config;
        $this->command    = $command;
        $this->system     = $system;
        $this->fs         = $fs;
    }

    public function checkSupportReset()
    {
        $root = $this->config->getRootDir();

        return !(!file_exists($this->config->getDataFile())
            || !file_exists("{$root}/static.tar.gz")
            || !file_exists("{$root}/extract.sh"));
    }

    public function reset()
    {
        if (!$this->checkSupportReset()) {
            return false;
        }

        foreach (app('start')->getMountes() as $mount) {

            $mount->umount();
        }

        $root     = $this->config->getRootDir();
        $gameInfo = $this->config->getGameInfoDir();

        foreach (glob("{$gameInfo}
        file_put_contents("{$root}/build/{$gameDir}/extract.sh",
            "#!/bin/sh

cd -P -- \"$(dirname -- \"$0\")\"

tar -xvf ./static.tar.gz

chmod +x ./start"
        );

        $this->command->run("chmod +x \"{$root}/build/{$gameDir}/extract.sh\"");
    }
}

class Task
{
    private $command;
    private $config;
    private $logfile;
    private $cmd;
    private $monitor;
    private $event;
    private $fs;
    private $fps;
    private $fpsCmd;
    private $system;
    private $update;

    public function __construct(Config $config)
    {
        $this->config  = clone $config;
        $this->command = new Command($this->config);
        $this->wine    = new Wine($this->config, $this->command);
        $this->monitor = new Monitor($this->config, $this->command);
        $this->event   = app('start')->getEvent();
        $this->fs      = new FileSystem($this->config, $this->command);
        $this->system  = new System($this->config, $this->command);
        $this->update  = new Update($this->config, $this->command);
    }

    public function logName($prefix)
    {
        $this->logfile = "{$prefix}.log";
        return $this;
    }

    public function debug()
    {
        $this->config->set('wine', 'WINEDEBUG', '');
        return $this;
    }

    public function fps()
    {
        $this->fps = true;

        $root = $this->config->getRootDir();

        if (!($this->config->isDxvk() || $this->config->isD9vk()) || $this->config->getBool('script', 'dxvk_d3d10')) {
            $mesa = $this->system->getMesaVersion();

            if ($mesa) {
                $this->config->set('export', 'GALLIUM_HUD', 'simple,fps');
            } else {
                $this->update->downloadOsd();
                $font = $this->system->getFont();
                $font = $font ? "--font=\"{$font}\"" : '';
                $add = [
                    ' 2>&1',
                    'tee /dev/stderr',
                    'sed -u -n -e \'/trace/ s/.*approx 
                    "\"{$root}/osd\" --lines=1 {$font} --color=yellow",
                ];
                $this->fpsCmd = implode(' | ', $add);
                $this->config->set('export', 'WINEDEBUG', '-all,fps');
            }
        } elseif (!$this->config->get('export', 'DXVK_HUD')) {
            $this->config->set('export', 'DXVK_HUD', 'fps,devinfo,memory');
        }

        return $this;
    }

    public function cmd($cmd)
    {
        $this->cmd = $cmd;
        return $this;
    }

    private function desktop()
    {
        if ($this->config->getBool('window', 'enable')) {
            $resolution = $this->config->get('window', 'resolution');

            if ($resolution === 'auto') {
                if ($monitor = $this->monitor->getDefaultMonitor()) {
                    $resolution = $monitor['resolution'];
                }
            }

            $title = str_replace([' ', ','], ['_', ''], $this->config->getGameTitle());

            return "explorer \"/desktop={$title},{$resolution}\"";
        }

        return '';
    }

    public function game()
    {
        $driveC     = $this->config->wine('DRIVE_C');
        $gamePath   = $this->config->getGamePath();
        $additional = $this->config->getGameAdditionalPath();

        $fullPath   = implode('/', array_filter([$driveC, $gamePath, $additional]));
        $wine       = $this->config->wine('WINE');
        $desktop    = $this->desktop();
        $fileName   = $this->config->getGameExe();
        $arguments  = str_replace("'", '"', $this->config->getGameArgs());

        $this->cmd = "cd \"{$fullPath}\" && \"{$wine}\" {$desktop} \"{$fileName}\" {$arguments}";

        return $this;
    }

    public function run($callback = null)
    {
        app('start')->getPlugins()->setConfig($this->config);

        $this->beforeRun();

        if ($callback) {
            $callback();
        } else {
            $logging = null;

            if ($this->logfile) {
                $logging = $this->config->getLogsDir() . "/{$this->logfile}";
            }

            if ($this->cmd) {
                $this->command->run("{$this->cmd} {$this->fpsCmd}", $logging);
            }
        }

        $this->afterExit();
    }

    private function beforeRun()
    {
        if ($this->system->checkPhp() && app('start')->getConsole()->isTerminal()) {

            app('gui');

            $scene = app()->getCurrentScene();
            $popup = $scene->addWidget(new PopupInfoWidget($scene->getWindow()));
            $popup
                ->setTitle('Running')
                ->setText([
                    'Application is running...',
                    $this->fpsCmd ? '' : 'See log ./' . $this->fs->relativePath($this->config->getLogsDir() . "/{$this->logfile}"),
                ])
                ->setActive(true)
                ->show();

        }

        $this->monitor->resolutionsSave();
        $this->event->beforeRun();
    }

    private function afterExit()
    {
        $this->event->afterExit();
        $this->monitor->resolutionsRestore();

        if ($this->system->checkPhp()) {
            app()->close();
        } else {
            exit(0);
        }
    }
}

class Console
{
    private $config;
    private $command;
    private $system;
    private $arguments;
    private $log;
    private $gui = false;

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

class Dialog
{
    private $type;
    private $title;
    private $width;
    private $height;
    private $items;
    private $text;
    private $columns;

    public function __construct()
    {
        $this->type    = '--info';
        $this->width   = '--width=400';
        $this->height  = '';
        $this->title   = '--title=""';
        $this->items   = [];
    }

    public function typeInfo()
    {
        $this->type = '--info';
        return $this;
    }

    public function typeWarning()
    {
        $this->type = '--warning';
        return $this;
    }

    public function typeList()
    {
        $this->type = '--list';
        return $this;
    }
    public function typeQuestion()
    {
        $this->type = '--question';
        return $this;
    }

    public function title($title)
    {
        $this->title = "--title=\"{$title}\"";;
        return $this;
    }

    public function text($text)
    {
        $this->text = "--text=\"{$text}\"";
        return $this;
    }

    public function size($width = null, $height = null)
    {
        $this->width  = $width ? "--width={$width}" : '';
        $this->height = $height ? "--height={$height}" : '';

        return $this;
    }

    public function columns($columns)
    {
        $this->columns = $columns;
        return $this;
    }

    private function getColumns()
    {
        if ($this->columns) {
            $result = [];
            foreach ($this->columns as $id => $name) {
                $result[] = "--column=\"{$name}\"";
            }

            return '--hide-column=1 --column="" ' . implode(' ', $result);
        }

        return '';
    }

    public function items($items)
    {
        $this->typeList();
        $this->items = $items;
        return $this;
    }

    private function getItems()
    {
        if ($this->items) {
            $result = [];
            foreach ($this->items as $i => $item) {
                $result[] = "\"{$i}\"";
                foreach ($this->columns as $id => $column) {
                    $result[] = "\"{$item[$id]}\"";
                }
            }

            return implode(' ', $result);
        }

        return '';
    }

    public function get()
    {
        $zenity  = 'LD_LIBRARY_PATH="" zenity';
        $columns = $this->getColumns();
        $items   = $this->getItems();

        $cmd = "{$zenity} {$this->type} {$this->title} {$this->text} {$this->width} {$this->height} {$columns} {$items}";

        $returnVar = null;
        $output    = null;

        $result = trim(exec("{$cmd} 2> /dev/null", $returnVar, $output));

        if ('--question' === $this->type) {
            return (bool)$returnVar;
        }

        if ($result === '') {
            return null;
        }

        if ($result === '') {
            return null;
        }

        if ('--list' === $this->type && $this->items) {
            return $this->items[(int)$result];
        }

        return $result;
    }
}

class YandexDisk
{
    private $url;
    private $data;
    private $cookie;
    private $headers;
    private $userAgent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/71.0.3578.80 Chrome/71.0.3578.80 Safari/537.36';
    private $parent;
    private $currentPath;

    public function __construct($url, $parent = null)
    {
        $this->url = $url;
        $this->parent = $parent;

        try {
            $request  = new \Rakit\Curl\Curl($this->url);
            $request->header('User-Agent', $this->userAgent);
            $response = $request->get();
        } catch (ErrorException $e) {
            try {
                sleep(1);
                $response = $request->get();
            } catch (ErrorException $e) {
                try {
                    sleep(3);
                    $response = $request->get();
                } catch (ErrorException $e) {
                    return;
                }
            }
        }

        if ($request && !$response->error()) {

            $html = $response->getBody();

            $this->cookie  = $response->getCookie();
            $this->headers = $response->getHeaders();

            preg_match_all('/(\<script type="application\/json".+?>)(.+?)(<\/script>)/m', $html, $matches, PREG_SET_ORDER, 0);

            if ($matches[0][2]) {
                $json       = json_decode($matches[0][2], true);
                $this->data = $json;

                if ($this->data['resources']) {
                    $this->data['original'] = $this->data['resources'];

                    $result = array_filter($this->data['resources'], function ($item) {return 'dir' === $item['type'];});

                    uasort($this->data['resources'], function ($a, $b) {
                        if ($a['type'] === 'dir' || $b['type'] === 'dir') {
                            return 0;
                        }
                        if ($a['modified'] === $b['modified']) {
                            return 0;
                        }

                        return (int)$a['modified'] > (int)$b['modified'] ? 1 : -1;
                    });

                    foreach ($this->data['resources'] as $id => $resource) {
                        if ('dir' !== $resource['type']) {
                            $result[$id] = $resource;
                        }
                    }

                    $this->data['resources'] = $result;

                    unset($result);

                    $allKeys = array_keys($this->data['resources']);

                    foreach ($this->data['resources'] as $id => $resource) {
                        $this->data['resources'][$id]['children'] = array_diff($allKeys, array_diff($allKeys, $resource['children']));
                    }
                }
            }
        }
    }

    public function getParent()
    {
        return $this->parent;
    }

    public function getList()
    {
        $itemList = [];
        $data = $this->getData();

        foreach ($this->data['original']?:[] as $resource) {
            if (!$this->currentPath && isset($resource['path'])) {
                list($hash, $_path) = explode(':', $resource['path']);
                $this->currentPath = $resource['path'];
                break;
            }
        }

        foreach ($data ?: [] as $id => $resource) {
            foreach ($resource['children'] as $childId) {
                $dir  = $data[$childId]['type'] === 'dir' ? '/' : '';
                $path = "{$resource['name']}/{$data[$childId]['name']}{$dir}";

                if (endsWith($path, ['/', '.xz'])) {
                    $itemList[$childId] = $path;
                }
            }
        }

        return $this->getParent() ? $itemList : array_splice($itemList, 1);
    }

    public function getFileData($id)
    {
        $result = [];
        $data   = $this->getData();

        if ($data && $data[$id]) {
            return $data[$id];
        }

        return $result;
    }

    public function getData()
    {
        return $this->data['resources'];
    }

    public function getRequest()
    {
        return $this->data;
    }

    private function getPostData($id)
    {
        $file = $this->getFileData($id);
        return ['hash' => $file['path'], 'sk' => $this->getEnv('sk')];
    }

    private function getEnv($field = null)
    {
        return $field ? $this->data['environment'][$field] : $this->data['environment'];
    }

    private function getFileLink($id)
    {
        try {
            $request  = new \Rakit\Curl\Curl('https:

            $request->header('Content-Type', 'text/plain');
            $request->header('Host', 'yadi.sk');
            $request->header('Origin', 'https:
            $request->header('User-Agent', $this->userAgent);

            $request->cookie('yandexuid', $this->getEnv('yandexuid'));
            $request->cookie('lang', $this->getEnv('currentLang'));
            $request->cookie('tld', $this->getEnv('currentLang'));

            $raw = json_encode($this->getPostData($id));

            $response = $request->postRaw($raw);
        } catch (ErrorException $e) {
            return '';
        }

        if ($request && !$response->error()) {

            $json = $response->getBody();

            if ($json) {
                $json = json_decode($json, true);

                if ($json && !$json['error']) {
                    return $json['data']['url'];
                }
            }
        }

        return '';
    }

    public function download($id, $path)
    {
        try {
            ini_set('memory_limit', '-1');
            $request = new \Rakit\Curl\Curl($this->getFileLink($id));
            $request->autoRedirect(5);
            $response = $request->get();
            $fileName = $this->getFileData($id);
            $pathFile = "{$path}/{$fileName['name']}";
            file_put_contents($pathFile, $response->getBody());
            unset($request, $response);

            return $pathFile;
        } catch (ErrorException $e) {}

        return '';
    }

    public function getFolder($id)
    {
        $file = $this->getFileData($id);

        if ($file['type'] === 'dir') {
            return new self($file['meta']['short_url'], $this);
        }

        return null;
    }

    public function isDir($id)
    {
        $file = $this->getFileData($id);
        return $file['type'] === 'dir';
    }

    public function getCurrentPath()
    {
        return $this->currentPath;
    }
}

class Lutris
{
    private $url;
    private $data;

    public function __construct()
    {
        $this->url = 'https:
        $this->data = [];

        try {
            $request  = new \Rakit\Curl\Curl($this->url);
            $response = $request->get();
        } catch (ErrorException $e) {
            try {
                sleep(1);
                $response = $request->get();
            } catch (ErrorException $e) {
                try {
                    sleep(3);
                    $response = $request->get();
                } catch (ErrorException $e) {
                    return;
                }
            }
        }

        if ($request && !$response->error()) {

            $result = json_decode($response->getBody(), true);
            $result = reset($result['results']);

            foreach ($result['versions'] ?: [] as $item) {
                if (!isset($this->data[$item['architecture']])) {
                    $this->data[$item['architecture']] = [];
                }

                $this->data[$item['architecture']][] = $item['url'];
            }

            foreach ($this->data?:[] as $key => $value) {
                natsort($this->data[$key]);
                $this->data[$key] = array_reverse($this->data[$key]);
            }
        }
    }

    public function getList($type = null)
    {
        return null === $type ? array_keys($this->data) : $this->data[$type];
    }

    public function download($url, $path)
    {
        try {
            ini_set('memory_limit', '-1');
            $request = new \Rakit\Curl\Curl($url);
            $request->autoRedirect(5);
            $response = $request->get();
            $fileName = basename($url);
            $pathFile = "{$path}/{$fileName}";
            file_put_contents($pathFile, $response->getBody());
            unset($request, $response);

            return $pathFile;
        } catch (ErrorException $e) {}

        return '';
    }
}

class PlayOnLinux
{
    private $data;

    public function __construct()
    {
        $this->data = [];
    }

    public function getList($item = null)
    {
        if (null !== $item) {
            return $this->getFileList($item);
        }

        return [
            [
                'id'     => 'stable-x86',
                'name'   => 'stable-x86',
                'url'    => 'https:
                'prefix' => 'https:
            ],
            [
                'id'     => 'stable-x86_64',
                'name'   => 'stable-x86_64',
                'url'    => 'https:
                'prefix' => 'https:
            ],
            [
                'id'     => 'staging-x86',
                'name'   => 'staging-x86',
                'url'    => 'https:
            ],
            [
                'id'     => 'staging-x86_64',
                'name'   => 'staging-x86_64',
                'url'    => 'https:
            ],
            [
                'id'     => 'upstream-x86',
                'name'   => 'upstream-x86',
                'url'    => 'https:
            ],
            [
                'id'     => 'upstream-x86_64',
                'name'   => 'upstream-x86_64',
                'url'    => 'https:
            ],
        ];
    }

    public function getFileList($item)
    {
        if ($this->data[$item['id']]) {
            return $this->data[$item['id']];
        }

        $result = '';
        $this->data[$item['id']]  = [];

        try {
            $request  = new \Rakit\Curl\Curl($item['url']);
            $response = $request->get();
        } catch (ErrorException $e) {
            try {
                sleep(1);
                $response = $request->get();
            } catch (ErrorException $e) {
                try {
                    sleep(3);
                    $response = $request->get();
                } catch (ErrorException $e) {
                    return $this->data[$item['id']];
                }
            }
        }

        if ($request && !$response->error()) {
            $result = $response->getBody();
        }

        if ($item['prefix']) {
            foreach (explode("\n", $result) as $line) {
                list($file, $version, $hash) = explode(';', $line);
                if (Text::endsWith($file, '.pol')) {
                    $this->data[$item['id']][] = "{$item['prefix']}{$file}";
                }
            }
        } else {
            preg_match_all('/<a href=["\'](.*?)["\']/s', $result, $matches);
            foreach ($matches[1] as $link) {
                if (Text::startsWith($link, 'PlayOnLinux') && Text::endsWith($link, ['.tar.gz', '.pol'])) {
                    $this->data[$item['id']][] = "{$item['url']}{$link}";
                }
            }
        }

        $this->data[$item['id']] = array_unique($this->data[$item['id']]);
        natsort($this->data[$item['id']]);

        $this->data[$item['id']] = array_reverse($this->data[$item['id']]);

        $this->data[$item['id']] = array_map(
            function ($item) {

                $fileName = basename($item);

                return [
                    'name' => str_replace(['PlayOnLinux-wine-', '-linux-x86.tar.gz', '-linux-amd64.tar.gz', '-linux-x86.pol', '-linux-amd64.pol'], '', $fileName),
                    'id'   => $item,
                ];
            },
            $this->data[$item['id']]
        );

        return $this->data[$item['id']];
    }

    public function download($url, $path)
    {
        try {
            ini_set('memory_limit', '-1');
            $request = new \Rakit\Curl\Curl($url);
            $request->autoRedirect(5);
            $response = $request->get();
            $fileName = basename($url);
            $pathFile = "{$path}/{$fileName}";
            file_put_contents($pathFile, $response->getBody());

            return $pathFile;
        } catch (ErrorException $e) {}

        return '';
    }
}

class WineDownloader
{
    private $command;
    private $config;
    private $fs;
    private $pack;
    private $isPress;
    private $result = '';

    private $scene;

    public function __construct(Config $config, Command $command, FileSystem $fs, Pack $pack)
    {
        $this->command = $command;
        $this->config  = $config;
        $this->fs      = $fs;
        $this->pack    = $pack;
    }

    public function isWineEmpty()
    {
        $wine       = $this->config->getWineDir();
        $wineSquash = $this->config->getWineFile();

        if (file_exists($wineSquash) || file_exists($wine)) {
            return false;
        }

        return true;
    }

    public function wizard()
    {
        if (!app('start')->getSystem()->isXz()) {
            return false;
        }

        $this->isPress = app()->isPress();
        $this->scene = app()->getCurrentScene();

        $popup = $this->scene->addWidget(new PopupYesNoWidget($this->scene->getWindow()));
        $popup
            ->setTitle('Wine download Wizard')
            ->setText([
                'Download wine?',
            ])
            ->setActive(true)
            ->show();
        $popup->onEscEvent(function () use (&$popup) { $this->scene->removeWidget($popup->hide()); });
        $popup->onEnterEvent(function ($flag) use (&$popup) {
            $this->scene->removeWidget($popup->hide());

            if ($flag) {
                $select = $this->scene->addWidget(new PopupSelectWidget($this->scene->getWindow()));
                $select
                    ->setItems([
                        ['id' => 'kron4ek', 'name' => 'Kron4ek'],
                        ['id' => 'lutris',  'name' => 'Lutris'],
                        ['id' => 'pol',     'name' => 'PlayOnLinux'],
                    ])
                    ->setTitle('Repository')
                    ->border()
                    ->setFullMode()
                    ->backAccess()
                    ->maxSize(null, 4)
                    ->setActive(true)
                    ->show();
                $select->onEscEvent(function () use (&$select) { $this->scene->removeWidget($select->hide()); });
                $select->onEnterEvent(function ($repo) use (&$select) {
                    $this->scene->removeWidget($select->hide());

                    if ('kron4ek' === $repo['id']) {
                        $this->downloadYandexDisk('https:
                    }
                    if ('lutris' === $repo['id']) {
                        $this->downloadLutris();
                    }
                    if ('pol' === $repo['id']) {
                        $this->downloadPol();
                    }
                });
            }
        });

        if (!$this->isPress) {
            app()->press();
        }

        return true;
    }

    private function onSuccessDownload()
    {
        if ($this->result) {
            $this->clear();
            $this->extract($this->result);
        }

        app('start')->getSystem()->getUserName(true);
    }

    public function clear()
    {
        $mount = $this->pack->getMount($this->config->getWineDir());

        if ($mount && $mount->isMounted()) {
            $mount->umount();
        }

        if (file_exists($this->config->getWineFile())) {
            $this->fs->rm($this->config->getWineFile());
        }

        if (file_exists($this->config->getWineDir() . '.zip')) {
            $this->fs->rm($this->config->getWineDir() . '.zip');
        }

        if (file_exists($this->config->getWineDir())) {
            $this->fs->rm($this->config->getWineDir());
        }
    }

    public function extract($pathFile)
    {
        if (file_exists($pathFile)) {
            $popup = $this->scene->addWidget(new PopupInfoWidget($this->scene->getWindow()));
            $popup
                ->setTitle('Extract wine')
                ->setText('Wait ...')
                ->setActive(true)
                ->show();

            $result = $this->fs->unpack($pathFile, $this->config->getWineDir());

            $wine = new Wine($this->config, $this->command);
            app('start')->setWine($wine);
            app('start')->getWinePrefix()->setWine($wine);
            $this->config->updateWine();

            $this->scene->removeWidget($popup->hide());

            return $result;
        }

        return false;
    }

    public function downloadPol($_pol = null)
    {
        $popup = $this->scene->addWidget(new PopupInfoWidget($this->scene->getWindow()));
        $popup
            ->setTitle('Request')
            ->setText('Wait ...')
            ->setActive(true)
            ->show();

        $pol = (null === $_pol ? new PlayOnLinux() : $_pol);

        $items = $pol->getList();

        $this->scene->removeWidget($popup->hide());

        $this->result = '';

        $select = $this->scene->addWidget(new PopupSelectWidget($this->scene->getWindow()));
        $select
            ->setItems($items)
            ->setTitle('Select arch')
            ->border()
            ->setFullMode()
            ->backAccess()
            ->maxSize(null, 4)
            ->setActive(true)
            ->show();

        $select->onEscEvent(function () use (&$select) { $this->scene->removeWidget($select->hide()); });
        $select->onEnterEvent(function ($arch) use (&$select, &$pol) {
            $this->scene->removeWidget($select->hide());

            $popup = $this->scene->addWidget(new PopupInfoWidget($this->scene->getWindow()));
            $popup
                ->setTitle('Request')
                ->setText('Wait ...')
                ->setActive(true)
                ->show();
            $items = $pol->getList($arch);
            $this->scene->removeWidget($popup->hide());

            $select = $this->scene->addWidget(new PopupSelectWidget($this->scene->getWindow()));
            $select
                ->setItems(array_merge([['id' => '..', 'name' => '..']], $items))
                ->setTitle($arch['name'])
                ->border()
                ->setFullMode()
                ->backAccess()
                ->maxSize(null, 6)
                ->setActive(true)
                ->show();
            $select->onEscEvent(function () use (&$select) { $this->scene->removeWidget($select->hide()); });
            $select->onEnterEvent(function ($item) use (&$select, &$pol) {
                $this->scene->removeWidget($select->hide());

                if ('..' === $item['id']) {
                    $this->downloadPol($pol);
                } else {
                    if (!$this->isPress) {
                        app()->press(false);
                    }

                    $popup = $this->scene->addWidget(new PopupInfoWidget($this->scene->getWindow()));
                    $popup
                        ->setTitle('Download wine')
                        ->setText('Wait ...')
                        ->setActive(true)
                        ->show();

                    $this->result = $pol->download($item['id'], $this->config->getRootDir());

                    $this->scene->removeWidget($popup->hide());

                    $this->onSuccessDownload();
                }
            });
        });

        return $this->result;
    }

    public function downloadLutris($_lutris = null)
    {
        $popup = $this->scene->addWidget(new PopupInfoWidget($this->scene->getWindow()));
        $popup
            ->setTitle('Request')
            ->setText('Wait ...')
            ->setActive(true)
            ->show();

        $lutris = (null === $_lutris ? new Lutris() : $_lutris);

        $this->scene->removeWidget($popup->hide());

        $this->result = '';

        $select = $this->scene->addWidget(new PopupSelectWidget($this->scene->getWindow()));
        $select
            ->setItems(array_map(function ($item) { return ['id' => $item, 'name' => $item]; }, $lutris->getList()))
            ->setTitle('Select arch')
            ->border()
            ->setFullMode()
            ->backAccess()
            ->maxSize(null, 4)
            ->setActive(true)
            ->show();
        $select->onEscEvent(function () use (&$select) { $this->scene->removeWidget($select->hide()); });
        $select->onEnterEvent(function ($arch) use (&$select, &$lutris) {
            $this->scene->removeWidget($select->hide());

            $select = $this->scene->addWidget(new PopupSelectWidget($this->scene->getWindow()));
            $select
                ->setItems(
                    array_merge(
                        [['id' => '..', 'name' => '..']],
                        array_map(function ($item) { return ['id' => $item, 'name' => basename($item)]; },
                            $lutris->getList($arch['id']))
                    )
                )
                ->setTitle($arch['name'])
                ->border()
                ->setFullMode()
                ->backAccess()
                ->maxSize(null, 6)
                ->setActive(true)
                ->show();
            $select->onEscEvent(function () use (&$select) { $this->scene->removeWidget($select->hide()); });
            $select->onEnterEvent(function ($item) use (&$select, &$lutris) {
                $this->scene->removeWidget($select->hide());

                if ('..' === $item['id']) {
                    $this->downloadLutris($lutris);
                } else {
                    if (!$this->isPress) {
                        app()->press(false);
                    }

                    $popup = $this->scene->addWidget(new PopupInfoWidget($this->scene->getWindow()));
                    $popup
                        ->setTitle('Download wine')
                        ->setText('Wait ...')
                        ->setActive(true)
                        ->show();

                    $this->result = $lutris->download($item['id'], $this->config->getRootDir());

                    $this->scene->removeWidget($popup->hide());

                    $this->onSuccessDownload();
                }
            });
        });

        return $this->result;
    }

    public function downloadYandexDisk($urlOrYa, $id = null, $name = null)
    {
        $popup = $this->scene->addWidget(new PopupInfoWidget($this->scene->getWindow()));
        $popup
            ->setTitle('Request')
            ->setText('Wait ...')
            ->setActive(true)
            ->show();

        $ya = null;

        if ($urlOrYa instanceof YandexDisk) {
            if (null !== $id) {
                $ya = $urlOrYa->getFolder($id);
            } else {
                $ya = $urlOrYa;
            }
        } else {
            $ya = new YandexDisk($urlOrYa);
        }

        $this->result = '';

        $folders = [];
        $items   = [];

        if ($ya->getParent()) {
            $folders[] = ['id' => '..', 'name' => '..'];
        }

        foreach ($ya->getList() as $key => $value) {
            if (endsWith($value, '/')) {
                $folders[] = ['id' => $key, 'name' => $value];
            } else {
                $items[] = ['id' => $key, 'name' => $value];
            }
        }

        uasort($items, function ($a, $b) {
            return strcasecmp($b['name'], $a['name']);
        });

        $items = array_merge($folders, $items);

        $this->scene->removeWidget($popup->hide());

        $select = $this->scene->addWidget(new PopupSelectWidget($this->scene->getWindow()));
        $select
            ->setTitle($name ?: 'Select Wine')
            ->setItems($items)
            ->border()
            ->setFullMode()
            ->maxSize(null, 6)
            ->setActive(true)
            ->backAccess()
            ->show();
        $select->onEscEvent(function () use (&$select) { $this->scene->removeWidget($select->hide()); });
        $select->onEnterEvent(function ($item) use (&$select, &$ya) {
            $this->scene->removeWidget($select->hide());

            if ($ya->isDir($item['id'])) {
                $this->downloadYandexDisk($ya, $item['id'], $item['name']);
            } elseif ($item['id'] === '..') {
                $this->downloadYandexDisk($ya->getParent());
            } else {
                if (!$this->isPress) {
                    app()->press(false);
                }

                $popup = $this->scene->addWidget(new PopupInfoWidget($this->scene->getWindow()));
                $popup
                    ->setTitle('Download wine')
                    ->setText('Wait ...')
                    ->setActive(true)
                    ->show();

                $this->result = $ya->download($item['id'], $this->config->getRootDir());

                $this->scene->removeWidget($popup->hide());

                $this->onSuccessDownload();
            }
        });

        return $this->result;
    }
}

class Dumbxinputemu
{
    private $config;
    private $command;
    private $fs;
    private $wine;
    private $userAgent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/71.0.3578.80 Chrome/71.0.3578.80 Safari/537.36';
    private $url;
    private $data;
    private $init;

    public function __construct(Config $config, Command $command, FileSystem $fs, Wine $wine)
    {
        $this->command = $command;
        $this->config  = $config;
        $this->fs      = $fs;
        $this->wine    = $wine;
    }

    public function init()
    {
        if (null === $this->init) {
            $this->init = true;

            $this->url  = 'https:
            $this->data = [];

            try {
                $request  = new \Rakit\Curl\Curl($this->url);
                $request->header('User-Agent', $this->userAgent);
                $response = $request->get();
            } catch (ErrorException $e) {
                try {
                    sleep(1);
                    $response = $request->get();
                } catch (ErrorException $e) {
                    try {
                        sleep(3);
                        $response = $request->get();
                    } catch (ErrorException $e) {
                        return;
                    }
                }
            }

            if ($request && !$response->error()) {
                $result = json_decode($response->getBody(), true);

                if ($result) {
                    $this->data = $result;
                }
            }
        }
    }

    public function version()
    {
        $version = $this->config->wine('DRIVE_C') . '/dumbxinputemu';

        if (file_exists($version)) {
            return trim(file_get_contents($version));
        }

        return '';
    }

    public function versionRemote()
    {
        $this->init();
        return $this->data ? $this->data['tag_name'] : '';
    }

    private function getLatestUrlFile()
    {
        $this->init();

        if (!$this->data || !$this->data['assets']) {
            return null;
        }

        $asset = reset($this->data['assets']);

        if ($asset) {
            return $asset['browser_download_url'];
        }

        return null;
    }

    public function getData()
    {
        $this->init();
        return $this->data;
    }

    public function download($path)
    {
        $this->init();

        $url = $this->getLatestUrlFile();

        if (!$url) {
            return '';
        }

        try {
            ini_set('memory_limit', '-1');
            $request = new \Rakit\Curl\Curl($url);
            $request->header('User-Agent', $this->userAgent);
            $request->autoRedirect(5);
            $response = $request->get();
            $fileName = basename($url);
            $pathFile = "{$path}/{$fileName}";
            file_put_contents($pathFile, $response->getBody());
            unset($request, $response);

            return $pathFile;
        } catch (ErrorException $e) {}

        return '';
    }

    public function update($logCallback = null)
    {
        if (!$this->config->getBool('script', 'dumbxinputemu') || !file_exists($this->config->getPrefixFolder())) {
            return false;
        }

        $this->init();

        if (!$this->data) {
            return false;
        }

        if ($this->version() && !$this->config->getBool('script', 'dumbxinputemu_autoupdate')) {
            return false;
        }

        $this->init();

        if ($this->version() !== $this->versionRemote()) {
            if ($filePath = $this->download($this->config->getCacheDir())) {
                $dir = $this->config->getCacheDir() . '/dumbxinputemu';

                if ($logCallback) {
                    $logCallback('Update dumbxinputemu.');
                }

                $this->fs->unpack($filePath, $dir);

                $dlls = [];

                if (file_exists($this->config->getWineSystem32Folder())) {
                    foreach (glob("{$dir}/32
    public function __construct(Config $config, Command $command, FileSystem $fs, Wine $wine)
    {
        $this->command = $command;
        $this->config  = $config;
        $this->fs      = $fs;
        $this->wine    = $wine;
    }

    private function init()
    {
        if (null === $this->disk) {
            $this->disk = new YandexDisk('https:
            $this->data = $this->disk->getList();
            natsort($this->data);
        }
    }

    private function getFileLatest()
    {
        $this->init();

        $value = end($this->data);
        $key   = key($this->data);

        return ['id' => $key, 'path' => $value];
    }

    public function version()
    {
        $version = $this->config->wine('DRIVE_C') . '/faudio';

        if (file_exists($version)) {
            return trim(file_get_contents($version));
        }

        return '';
    }

    public function versionRemote()
    {
        $file = $this->getFileLatest();
        $fileName = array_filter(explode('.', basename($file['path'])),
            function ($t) { return !in_array($t, ['xz', 'bz', 'bz2', 'zip', 'tar', 'gz'], true); });
        $fileName = implode('.', $fileName);

        return $fileName;
    }

    public function update($logCallback = null)
    {
        if (!$this->config->getBool('script', 'faudio') || !file_exists($this->config->getPrefixFolder())) {
            return false;
        }

        $this->init();

        if (!$this->data) {
            return false;
        }

        if ($this->version() && !$this->config->getBool('script', 'faudio_autoupdate')) {
            return false;
        }

        if ($this->version() !== $this->versionRemote()) {
            $file = $this->getFileLatest();
            if ($filePath = $this->disk->download($file['id'], $this->config->getCacheDir())) {
                $dir = $this->config->getCacheDir() . '/faudio';

                if ($logCallback) {
                    $logCallback('Update FAudio.');
                }

                $this->fs->unpack($filePath, $dir);

                $dlls = [];

                if (file_exists($this->config->getWineSystem32Folder())) {
                    foreach (glob("{$dir}/x32
    public function __construct(Config $config, Command $command, FileSystem $fs, Wine $wine)
    {
        $this->command = $command;
        $this->config  = $config;
        $this->fs      = $fs;
        $this->wine    = $wine;

        $this->version = $this->config->wine('DRIVE_C') . '/fixes';
    }

    public function update($logCallback = null)
    {
        if (!file_exists($this->config->getPrefixFolder())) {
            return false;
        }

        $isUpdated = false;

        $fixes = [

            'focus',
            'nocrashdialog',
            'cfc',
            'ddr',
            'glsl',
            'orm',
        ];

        foreach ($fixes as $fix) {
            $versionPath = $this->config->wine('DRIVE_C') . '/.' . $fix;

            $valueConfigFix = $this->config->get('fixes', $fix);
            $valueLocalFix  = file_exists($versionPath) ? trim(file_get_contents($versionPath)) : null;

            $isNotEmpty = false;

            if (in_array($fix, ['glsl'], true)) {
                $isNotEmpty = !$this->config->getBool('fixes', $fix);
            } else {
                $isNotEmpty = $this->config->getBool('fixes', $fix);
            }

            if ($isNotEmpty) {
                if (null === $valueLocalFix || $valueLocalFix !== $valueConfigFix) {
                    $isUpdated = true;

                    if ($logCallback) {
                        $logCallback("Apply fix {$fix}");
                    }

                    if (method_exists($this, "{$fix}Up")) {
                        app('start')->getPatch()->create(function () use ($fix, $logCallback, $versionPath) {
                            file_put_contents($versionPath, $this->config->get('fixes', $fix));
                            $this->{"{$fix}Up"}($logCallback);
                        });
                    }
                }
            } else {
                if (file_exists($versionPath)) {
                    $isUpdated = true;

                    unlink($versionPath);

                    if (method_exists($this, "{$fix}Down")) {
                        $this->{"{$fix}Down"}($logCallback);

                        if ($logCallback) {
                            $logCallback("Rollback fix {$fix}");
                        }
                    }
                }
            }
        }

        return $isUpdated;
    }

    public function ddrawUp($logCallback = null)
    {
        $this->register('dciman32', 'native', $logCallback);
        $this->register('ddrawex', 'native,builtin', $logCallback);
        $this->register('devenum', 'native', $logCallback);

        if (!file_exists($this->config->getDllsDir() . '/ddraw.dll')) {
            if ($path = $this->fs->download('http:
                $this->fs->unpack($path, $this->config->getCacheDir() . '/ddraw');
                $this->fs->cp($this->config->getCacheDir() . '/ddraw/ddraw.dll', $this->config->getWineSystem32Folder() . '/ddraw.dll');
                $this->fs->rm($this->config->getCacheDir() . '/ddraw');

                if ($logCallback) {
                    $logCallback("Add system32 ddraw.dll");
                }
            }
        }
        $this->register('ddraw', 'native,builtin', $logCallback);

        if ($logCallback) {
            $logCallback("Install devenum");
        }
        $this->wine->winetricks(['devenum']);
    }

    public function ddrawDown($logCallback = null)
    {
        $this->unregister('dciman32', $logCallback);
        $this->unregister('ddraw', $logCallback);
        $this->unregister('ddrawex', $logCallback);
        $this->unregister('devenum', $logCallback);
        $this->fs->rm($this->config->getDllsDir() . '/ddraw.dll');
    }

    public function installersUp($logCallback = null)
    {
        if ($logCallback) {
            $logCallback("Install gdiplus, mfc42");
        }
        $this->wine->winetricks(['gdiplus', 'mfc42']);
    }

    public function d3dx9Up($logCallback = null)
    {
        if ($logCallback) {
            $logCallback("Install d3dx9, d3dcompiler_43");
        }
        $this->wine->winetricks(['d3dx9', 'd3dcompiler_43']);
    }

    public function internetUp($logCallback = null)
    {
        if ($logCallback) {
            $logCallback("Install winhttp, wininet, directplay");
        }
        $this->wine->winetricks(['winhttp', 'wininet', 'directplay']);
    }

    public function introUp($logCallback = null)
    {
        $items = [
            'qasf',
            'qdvd',
            'quartz',
            'amstream',
            'avifil32',
            'dirac',
            'l3codecx',
            'ffdshow',
            'cinepak',
            'xvid',
            'binkw32',
            'ogg',
            'windowscodecs',
            'wmp9',
            'quicktime76',
            'icodecs'
        ];

        if ($logCallback) {
            $logCallback("Install " . implode(', ', $items));
        }
        $this->wine->winetricks($items);
    }

    public function xactUp($logCallback = null)
    {
        $this->wine->winetricks(['xact']);
    }

    public function physxUp($logCallback = null)
    {
        $this->wine->winetricks(['physx']);
    }

    public function fontUp($logCallback = null)
    {
        $this->wine->winetricks(['allfonts']);
    }

    public function focusUp($logCallback = null)
    {
        $this->wine->run(['reg', 'add', 'HKEY_CURRENT_USER\\Software\\Wine\\X11 Driver', '/v', 'GrabFullscreen', '/d', 'Y', '/f']);
        $this->wine->run(['reg', 'add', 'HKEY_CURRENT_USER\\Software\\Wine\\X11 Driver', '/v', 'UseTakeFocus', '/d', 'N', '/f']);
    }

    public function focusDown($logCallback = null)
    {
        $this->wine->run(['reg', 'delete', 'HKEY_CURRENT_USER\\Software\\Wine\\X11 Driver', '/v', 'GrabFullscreen', '/f']);
        $this->wine->run(['reg', 'delete', 'HKEY_CURRENT_USER\\Software\\Wine\\X11 Driver', '/v', 'UseTakeFocus', '/f']);
    }

    public function nocrashdialogUp($logCallback = null)
    {
        $this->wine->run(['reg', 'add', 'HKEY_CURRENT_USER\\Software\\Wine\\WineDbg', '/v', 'ShowCrashDialog', '/t', 'REG_DWORD', '/d', '00000000', '/f']);
    }

    public function nocrashdialogDown($logCallback = null)
    {
        $this->wine->run(['reg', 'delete', 'HKEY_CURRENT_USER\\Software\\Wine\\WineDbg', '/v', 'ShowCrashDialog', '/f']);
    }

    public function cfcUp($logCallback = null)
    {
        $this->wine->run(['reg', 'add', 'HKEY_CURRENT_USER\\Software\\Wine\\Direct3D', '/v', 'CheckFloatConstants', '/d', 'enabled', '/f']);
    }

    public function cfcDown($logCallback = null)
    {
        $this->wine->run(['reg', 'delete', 'HKEY_CURRENT_USER\\Software\\Wine\\Direct3D', '/v', 'CheckFloatConstants', '/f']);
    }

    public function ddrUp($logCallback = null)
    {
        $this->wine->run(['reg', 'add', 'HKEY_CURRENT_USER\\Software\\Wine\\Direct3D', '/v', 'DirectDrawRenderer', '/d', $this->config->get('fixes', 'ddr'), '/f']);
    }

    public function ddrDown($logCallback = null)
    {
        $this->wine->run(['reg', 'delete', 'HKEY_CURRENT_USER\\Software\\Wine\\Direct3D', '/v', 'DirectDrawRenderer', '/f']);
    }

    public function glslUp($logCallback = null)
    {
        $this->wine->run(['reg', 'add', 'HKEY_CURRENT_USER\\Software\\Wine\\Direct3D', '/v', 'UseGLSL', '/d', 'disabled', '/f']);
    }

    public function glslDown($logCallback = null)
    {
        $this->wine->run(['reg', 'delete', 'HKEY_CURRENT_USER\\Software\\Wine\\Direct3D', '/v', 'UseGLSL', '/f']);
    }

    public function ormUp($logCallback = null)
    {
        $this->wine->run(['reg', 'add', 'HKEY_CURRENT_USER\\Software\\Wine\\Direct3D', '/v', 'OffscreenRenderingMode', '/d', $this->config->get('fixes', 'orm'), '/f']);
    }

    public function ormDown($logCallback = null)
    {
        $this->wine->run(['reg', 'delete', 'HKEY_CURRENT_USER\\Software\\Wine\\Direct3D', '/v', 'OffscreenRenderingMode', '/f']);
    }

    public function register($file, $type = 'native', $logCallback = null)
    {
        $this->wine->run(['reg', 'add', 'HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides', '/v', $file, '/d', $type, '/f']);

        if ($logCallback) {
            $logCallback("Register {$file}={$type}");
        }
    }

    public function unregister($file, $logCallback = null)
    {
        $this->wine->run(['reg', 'delete', 'HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides', '/v', $file, '/f']);

        if ($logCallback) {
            $logCallback("Unregister {$file}");
        }
    }
}

class Snapshot
{
    private $config;
    private $command;
    private $fs;
    private $wine;
    private $replaces;
    private $system;
    private $folders;
    private $shapshotFile;
    private $driveC;
    private $shapshotDir;
    private $shapshotBeforeDir;
    private $patchDir;

    public function __construct(Config $config, Command $command, FileSystem $fs, Wine $wine, Replaces $replaces, System $system)
    {
        $this->command  = $command;
        $this->config   = $config;
        $this->fs       = $fs;
        $this->wine     = $wine;
        $this->replaces = $replaces;
        $this->system   = $system;

        $this->folders = [
            'Program Files',
            'Program Files (x86)',
            'ProgramData',
            'users',
            'windows',
        ];
        $this->shapshotFile      = $this->config->getCacheDir() . '/filelist.shapshot';
        $this->shapshotDir       = $this->config->getCacheDir() . '/shapshot';
        $this->shapshotBeforeDir = $this->config->getCacheDir() . '/before';
        $this->patchDir          = $this->config->getCacheDir() . '/patch';
        $this->driveC            = $this->config->wine('DRIVE_C');
    }

    private function create()
    {
        $this->fs->rm($this->shapshotFile);
        $this->fs->rm($this->shapshotDir);

        foreach ($this->folders as $folder) {
            $this->read("{$this->driveC}/{$folder}");
        }
        foreach (glob("{$this->driveC}
    private function getRegeditDeleted($diff, &$compare)
    {
        $sections = array_filter($diff->getFile1Data(), function ($line) { return Text::startsWith($line[0], '['); });
        $deleted  = array_filter($compare[Diff::DELETED], function ($line) { return !Text::startsWith($line, '[') && !Text::startsWith($line, '  '); });

        $result      = [];
        $new         = null;
        $old         = null;
        $prevChange  = null;
        $findSection = null;

        foreach ($deleted as $lineNumber => $line) {
            if (!$prevChange || ($prevChange + 1) !== $lineNumber) {
                $prevChange = $lineNumber;
                $findSection = array_filter($sections, function ($key) use ($lineNumber) {return $lineNumber > $key;}, ARRAY_FILTER_USE_KEY);
                $findSection = end($findSection);
            }

            if (!isset($result[$findSection])) {
                $result[$findSection] = [];
            }

            list($field) = explode('=', $line);

            if ($field) {
                $result[$findSection][] = "{$field}=-";
            }
        }

        $deletedSections = array_filter($compare[Diff::DELETED], function ($line) use (&$result) {
            return Text::startsWith($line, '[') && empty($result[$line]);
        });

        foreach ($deletedSections as $section) {
            $result[str_replace('[', '[-', $section)] = [];
        }

        if (!$result) {
            return '';
        }

        $text = "Windows Registry Editor Version 5.00\n";

        foreach ($result as $section => $lines) {
            $text .= "\n{$section}\n" . implode("\n", $lines) . "\n";
        }

        return $this->replaces->replaceToTemplateByString($text);
    }

    private function getRegeditInserted($diff, &$compare)
    {
        $sections = array_filter($diff->getFile2Data(), function ($line) { return Text::startsWith($line[0], '['); });
        $inserted = array_filter($compare[Diff::INSERTED], function ($line) { return !Text::startsWith($line, '['); });

        $result      = [];
        $new         = null;
        $old         = null;
        $prevChange  = null;
        $findSection = null;

        foreach ($inserted as $lineNumber => $line) {
            if (!$prevChange || ($prevChange + 1) !== $lineNumber) {
                $prevChange = $lineNumber;
                $findSection = array_filter($sections, function ($key) use ($lineNumber) {return $lineNumber > $key;}, ARRAY_FILTER_USE_KEY);
                $findSection = end($findSection);
            }

            if (!isset($result[$findSection])) {
                $result[$findSection] = [];
            }

            $result[$findSection][] = $line;
        }

        if (!$result) {
            return '';
        }

        $text = "Windows Registry Editor Version 5.00\n";

        foreach ($result as $section => $lines) {
            $text .= "\n{$section}\n" . implode("\n", $lines) . "\n";
        }

        return $this->replaces->replaceToTemplateByString($text);
    }

    public function getFilesChanges($file1, $file2)
    {
        $diff    = new Diff($this->config, $this->command);
        $compare = $diff->compareFiles($file1, $file2);
        unset($diff);

        $inserted = [];
        foreach ($compare[Diff::INSERTED] as $line) {
            list($path, $type, $size) = explode(';', $line);
            if ($type === 'file') {
                $inserted[] = $path;
            }
        }

        $deleted = [];
        foreach ($compare[Diff::DELETED] as $line) {
            list($path, $type, $size) = explode(';', $line);
            if ($type === 'file' && !in_array($path, $inserted, true)) {
                $deleted[] = $path;
            }
        }

        return [
            Diff::INSERTED => $inserted,
            Diff::DELETED  => $deleted,
        ];
    }
}

class Patch
{
    private $config;
    private $command;
    private $fs;
    private $wine;
    private $snapshot;
    private $prefix;
    private $index = 0;
    private $runnable = false;

    public function __construct(Config $config, Command $command, FileSystem $fs, Wine $wine, Snapshot $snapshot, WinePrefix $prefix)
    {
        $this->command  = $command;
        $this->config   = $config;
        $this->fs       = $fs;
        $this->wine     = $wine;
        $this->snapshot = $snapshot;
        $this->prefix   = $prefix;

        $this->fs->rm($this->config->getPatchAutoDir());
    }

    public function isEnabled()
    {
        return false === $this->runnable && $this->config->isGenerationPatchesMode();
    }

    public function create($callback)
    {
        gc_collect_cycles();

        if (!$callback) {
            return null;
        }

        if ($this->isEnabled()) {
            $this->runnable = true;
            if (!file_exists($this->config->getPatchAutoDir())) {
                $this->fs->mkdirs([$this->config->getPatchAutoDir()]);
            }
            if (!file_exists($this->config->getPatchApplyDir())) {
                $this->fs->mkdirs([$this->config->getPatchApplyDir()]);
            }

            $this->prefix->updateSandbox();
            $this->snapshot->createBefore();
            $result = $callback();
            $this->prefix->updateSandbox();
            $this->snapshot->createAfter();
            $this->movePatch($this->snapshot->getPatchDir());

            $this->runnable = false;
            gc_collect_cycles();

            return $result;
        }

        $result = $callback();
        $this->prefix->updateSandbox();

        return $result;
    }

    private function movePatch($path)
    {
        if (!file_exists($path)) {
            return false;
        }

        $auto   = $this->config->getPatchAutoDir();
        $result = $this->fs->mv($path, "{$auto}/{$this->index}");
        $this->index++;

        return $result;
    }

    public function apply()
    {
        if ($this->config->isGenerationPatchesMode() || !file_exists($this->config->getPrefixFolder()) || !file_exists($this->config->getPatchApplyDir())) {
            return false;
        }

        $dirs = glob($this->config->getPatchApplyDir() . '
    public function __construct(Config $config, Command $command)
    {
        $this->command  = $command;
        $this->config   = $config;
    }

    public function compareFiles($file1, $file2, $encoding = 'UTF-8')
    {
        $this->file1Path = $file1;
        $this->file2Path = $file2;

        $this->file1Data = $encoding === 'UTF-8' ? file_get_contents($file1) : iconv($encoding, 'UTF-8', file_get_contents($file1));
        $this->file1Data = preg_split('/\n|\r\n?/', $this->file1Data);

        $this->file2Data = $encoding === 'UTF-8' ? file_get_contents($file2) : iconv($encoding, 'UTF-8', file_get_contents($file2));
        $this->file2Data = preg_split('/\n|\r\n?/', $this->file2Data);

        return $this->diff($this->file1Path, $this->file2Path);
    }

    public function getFile1Data()
    {
        return $this->file1Data;
    }

    public function getFile2Data()
    {
        return $this->file2Data;
    }

    private function parse($diff)
    {
        $result = [
            self::DELETED  => [],
            self::INSERTED => [],
        ];

        $from = 0;
        $to   = 0;

        $sectionType = self::DELETED;

        foreach (explode("\n", $diff) as $line) {
            if (mb_strpos($line, '*** ') !== false && mb_strpos($line, ' ****') === false) {
                continue;
            }
            if (mb_strpos($line, '--- ') !== false && mb_strpos($line, ' ----') === false) {
                continue;
            }
            if (mb_strpos($line, '***************') !== false) {
                $sectionType = self::DELETED;
                continue;
            }
            if (mb_strpos($line, '--- ') !== false && mb_strpos($line, ' ----') !== false) {
                $sectionType = self::INSERTED;
                list($from, $to) = explode(',', trim($line, "-* \t\n\r\0\x0B"));
                continue;
            }
            if (mb_strpos($line, '*** ') !== false && mb_strpos($line, ' ****') !== false) {
                $sectionType = self::DELETED;
                list($from, $to) = explode(',', trim($line, "-* \t\n\r\0\x0B"));
                continue;
            }

            if (Text::startsWith($line, ['!', '+', '-'])) {
                if (self::DELETED === $sectionType) {
                    $result[self::DELETED][(int)$from - 1] = $this->file1Data[(int)$from - 1];
                } elseif (self::INSERTED === $sectionType) {
                    $result[self::INSERTED][(int)$from - 1] = $this->file2Data[(int)$from - 1];
                }
            }

            $from = (int)$from + 1;
        }

        return $result;
    }

    private function diff($file1, $file2)
    {
        $diff = $this->command->run("diff --text -c \"{$file1}\" \"{$file2}\"");
        return $this->parse($diff);
    }

    private function patch($file, $path, $result)
    {
        return $this->command->run("patch \"{$file}\" -i \"{$path}\" -o \"{$result}\" -t");
    }
}

class Replaces
{
    private $config;
    private $command;
    private $fs;
    private $system;
    private $monitor;
    private $finds;
    private $replaces;
    private $width;
    private $height;
    private $userName;
    private $hostname;

    public function __construct(Config $config, Command $command, FileSystem $fs, System $system, Monitor $monitor)
    {
        $this->command  = $command;
        $this->config   = $config;
        $this->fs       = $fs;
        $this->system   = $system;
        $this->monitor  = $monitor;
        $this->finds    = [
            '{WIDTH}',
            '{HEIGHT}',
            '{USER}',
            '{DOSDEVICES}',
            '{PREFIX}',
            '{DRIVE_C}',
            '{ROOT_DIR}',
            '{HOSTNAME}',
        ];
    }

    private function init()
    {
        if (null === $this->replaces) {

            $this->userName = $this->system->getUserName();
            $this->hostname = $this->system->getHostname();

            $this->width  = '';
            $this->height = '';

            foreach ($this->monitor->resolutions() as $output => $monitor) {
                if (!$this->width || !$this->height) {
                    list($w, $h) = explode('x', $monitor['resolution']);
                    $this->width  = $w;
                    $this->height = $h;
                }
                if ($monitor['default']) {
                    list($w, $h) = explode('x', $monitor['resolution']);
                    $this->width  = $w;
                    $this->height = $h;
                }
            }

            $this->replaces = [
                $this->width,
                $this->height,
                $this->userName,
                $this->config->getPrefixDosdeviceDir(),
                $this->config->getPrefixFolder(),
                $this->config->getPrefixDriveC(),
                $this->config->getRootDir(),
                $this->hostname,
            ];
        }
    }

    public function replaceByFile($path, $backup = false)
    {
        $this->init();

        if ($backup) {
            if (!file_exists("{$path}.backup")) {
                $this->fs->cp($path, "{$path}.backup");
            }
            if (file_exists("{$path}.backup")) {
                $file = file_get_contents("{$path}.backup");
                $file = $this->replaceByString($file);
                file_put_contents($path, $file);

                return true;
            }
        } else if (file_exists($path)) {
            $file = file_get_contents($path);
            $file = $this->replaceByString($file);
            file_put_contents($path, $file);

            return true;
        }

        return false;
    }

    public function replaceByString($text)
    {
        $this->init();
        return str_replace($this->finds, $this->replaces, $text);
    }

    public function replaceToTemplateByString($text)
    {
        $this->init();

        return str_replace(
            [
                $this->config->getRootDir(),
                "'{$this->userName}'",
                "\"{$this->userName}\"",
                "/{$this->userName}/",
                "\\{$this->userName}\\",
                "'{$this->hostname}'",
                "\"{$this->hostname}\"",
                "/{$this->hostname}/",
                "\\{$this->hostname}\\",
            ],
            [
                '{ROOT_DIR}',
                "'{USER}'",
                '"{USER}"',
                '/{USER}/',
                "\\{USER}\\",
                "'{HOSTNAME}'",
                '"{HOSTNAME}"',
                '/{HOSTNAME}/',
                "\\{HOSTNAME}\\",
            ],
            $text
        );
    }

    public function getHeight()
    {
        $this->init();
        return $this->height;
    }

    public function getWidth()
    {
        $this->init();
        return $this->width;
    }

    public function getUserName()
    {
        $this->init();
        return $this->userName;
    }
}

class Registry
{
    private $config;
    private $command;
    private $fs;
    private $wine;
    private $replaces;

    public function __construct(Config $config, Command $command, FileSystem $fs, Wine $wine, Replaces $replaces)
    {
        $this->command  = $command;
        $this->config   = $config;
        $this->fs       = $fs;
        $this->wine     = $wine;
        $this->replaces = $replaces;
    }

    public function apply($files, $callbackLog = null)
    {
        $regs  = ['Windows Registry Editor Version 5.00', ''];

        if ($callbackLog) {
            foreach ($files as $path) {
                $callbackLog('Apply reg file "' . $this->fs->relativePath($path) . '"');
            }
        }

        $files = array_map('file_get_contents', $files);

        foreach ($files as $file) {
            $file = Text::normalize($file);
            $file = $this->replaces->replaceByString(trim($file));
            $file = explode("\n", $file);
            if (in_array(trim(reset($file)), ['Windows Registry Editor Version 5.00', 'REGEDIT4'], true)) {
                unset($file[0]);
            }
            foreach ($file as $line) {
                if ($line !== null) {
                    $regs[] = $line;
                }
            }
        }

        if (count($regs) > 2) {
            file_put_contents($this->config->getPrefixDriveC() . '/tmp.reg', iconv('UTF-8', 'UTF-16', implode("\n", $regs)));
            $this->wine->reg([$this->config->getPrefixDriveC() . '/tmp.reg']);
            unset($regs);

            return true;
        }

        return false;
    }
}

class Plugins
{

    private $config;

    private $command;

    private $event;

    private $fs;

    private $replaces;

    private $system;

    private $monitor;

    protected $plugins;

    public function __construct(Event $event, Config $config, Command $command, FileSystem $fs, System $system, Replaces $replaces, Monitor $monitor)
    {
        $this->command  = $command;
        $this->config   = $config;
        $this->event    = $event;
        $this->fs       = $fs;
        $this->replaces = $replaces;
        $this->system   = $system;
        $this->monitor  = $monitor;

        if (null === $this->plugins) {
            $this->plugins = [];
        }

        foreach (glob($this->config->getGameInfoDir() . '/plugins
    public function getClassFullNameFromFile($filePathName)
    {
        return $this->getClassNamespaceFromFile($filePathName) . '\\' . $this->getClassNameFromFile($filePathName);
    }

    public function getClassObjectFromFile($filePathName)
    {
        $classString = $this->getClassFullNameFromFile($filePathName);

        if (!$classString) {
            return null;
        }

        if (!class_exists($classString)) {
            include ($filePathName);
        }

        if (!class_exists($classString)) {
            return null;
        }

        $object = new $classString($this->event, $this->config, $this->command, $this->fs, $this->system, $this->replaces, $this->monitor);

        return $object;
    }

    protected function getClassNamespaceFromFile($filePathName)
    {
        $src          = file_get_contents($filePathName);
        $tokens       = token_get_all($src);
        $count        = count($tokens);
        $i            = 0;
        $namespace    = '';
        $namespace_ok = false;

        while ($i < $count) {
            $token = $tokens[$i];
            if (is_array($token) && $token[0] === T_NAMESPACE) {

                while (++$i < $count) {
                    if ($tokens[$i] === ';') {
                        $namespace_ok = true;
                        $namespace    = trim($namespace);
                        break;
                    }
                    $namespace .= is_array($tokens[$i]) ? $tokens[$i][1] : $tokens[$i];
                }
                break;
            }
            $i++;
        }
        if (!$namespace_ok) {
            return null;
        } else {
            return $namespace;
        }
    }

    protected function getClassNameFromFile($filePathName)
    {
        $php_code = file_get_contents($filePathName);
        $classes  = array();
        $tokens   = token_get_all($php_code);
        $count    = count($tokens);
        for ($i = 2; $i < $count; $i++) {
            if ($tokens[$i - 2][0] == T_CLASS && $tokens[$i - 1][0] == T_WHITESPACE && $tokens[$i][0] == T_STRING) {
                $class_name = $tokens[$i][1];
                $classes[]  = $class_name;
            }
        }

        return $classes[0];
    }
}

class Driver
{
    private $config;
    private $command;
    private $system;

    public function __construct(Config $config, Command $command, System $system)
    {
        $this->config  = $config;
        $this->command = $command;
        $this->system  = $system;
    }

    public function getNvidia()
    {
        static $result;

        if (null !== $result) {
            return $result;
        }

        $proc = '/proc/driver/nvidia/version';

        if (file_exists($proc)) {
            $text = file_get_contents($proc);
            if ($text) {
                $text = array_map('trim', explode('Module', $text));
                if (!empty($text[1])) {
                    $version = array_map('trim', explode(' ', trim($text[1])));
                    $version = reset($version);
                    $result  = ['vendor' => 'nvidia', 'driver' => 'nvidia', 'version' => $version];

                    return $result;
                }
            }
        }

        if (trim($this->command->run('command -v nvidia-smi'))) {
            $text = trim($this->command->run('nvidia-smi --query-gpu=driver_version --format=csv,noheader'));

            if (!empty($text) && mb_strlen($text) < 10) {
                $result = ['vendor' => 'nvidia', 'driver' => 'nvidia', 'version' => $text];
                return $result;
            }
        }

        $text = trim($this->command->run('modinfo nvidia | grep -E "^version:"'));

        if ($text && stripos($text, 'modinfo') === false) {
            $text = array_map('trim', explode('ersion:', $text));

            if (!empty($text[1])) {
                $version = array_map('trim', explode(' ', trim($text[1])));
                $version = reset($version);
                $result  = ['vendor' => 'nvidia', 'driver' => 'nvidia', 'version' => $version];

                return $result;
            }
        }

        if (trim($this->command->run('lsmod | grep nouveau'))) {
            $result = ['vendor' => 'nvidia', 'driver' => 'nouveau', 'version' => ''];
            return $result;
        }

        if (null === $result) {
            $result = [];
        }

        return $result;
    }

    public function getAmd()
    {
        static $result;

        if (null !== $result) {
            return $result;
        }

        if (trim($this->command->run('lsmod | grep radeon'))) {
            $result = ['vendor' => 'amd', 'driver' => 'radeon', 'version' => '', 'mesa' => $this->system->getMesaVersion()];
            return $result;
        }

        $text = trim($this->command->run('modinfo amdgpu | grep -E "^version:"'));

        if ($text && stripos($text, 'modinfo') === false) {
            $text = array_map('trim', explode('ersion:', $text));

            if (!empty($text[1])) {
                $version = array_map('trim', explode(' ', trim($text[1])));
                $version = reset($version);
                $result  = ['vendor' => 'amd', 'driver' => 'amdgpu-pro', 'version' => $version];

                return $result;
            }
        }

        if (trim($this->command->run('lsmod | grep amdgpu'))) {
            $result = ['vendor' => 'amd', 'driver' => 'amdgpu', 'version' => '', 'mesa' => $this->system->getMesaVersion()];
            return $result;
        }

        return $result;
    }

    public function getIntel()
    {
        static $result;

        if (null !== $result) {
            return $result;
        }

        if ((bool)trim($this->command->run('glxinfo | grep "Intel"'))) {
            $result = ['vendor' => 'intel', 'driver' => 'intel', 'version' => '', 'mesa' => $this->system->getMesaVersion()];
            return $result;
        }

        return $result;
    }

    public function getVersion()
    {
        $driver = $this->getNvidia();

        if ($driver) {
            return $driver;
        }

        $driver = $this->getAmd();

        if ($driver) {
            return $driver;
        }

        $driver = $this->getIntel();

        if ($driver) {
            return $driver;
        }

        return $driver;
    }

    public function isGalliumNineSupport()
    {
        return $this->getAmd() || $this->getIntel();
    }
}

class DXVK
{
    private $config;
    private $command;
    private $network;

    public function __construct(Config $config, Command $command, Network $network)
    {
        $this->command = $command;
        $this->config  = $config;
        $this->network = $network;
    }

    public function version()
    {
        $dxvk = $this->config->wine('DRIVE_C') . '/dxvk';

        if (file_exists($dxvk)) {
            return trim(file_get_contents($dxvk));
        }

        return '';
    }

    public function versionRemote()
    {
        if ($this->config->get('script', 'dxvk_version')) {
            return $this->config->get('script', 'dxvk_version');
        }

        static $version;

        if (null === $version) {
            $version = trim($this->network->get('https:
        }

        return $version;
    }

    public function update($logCallback = null)
    {
        if (!Network::isConnected() || !$this->config->isDxvk() || !file_exists($this->config->wine('WINEPREFIX'))) {
            return false;
        }

        $oldVersion = $this->version();

        if ('' !== $oldVersion && false === $this->config->isDxvkAutoupdate()) {
            return false;
        }

        $newVersion = $this->versionRemote();

        $this->updateDxvkConfig();

        $dxvk = $this->config->wine('DRIVE_C') . '/dxvk';
        $log  = $this->config->wine('WINEPREFIX') . '/winetricks.log';

        if (file_exists($log)) {
            $winetricks = array_filter(array_map('trim', explode("\n", file_get_contents($log))),
                function ($n) {return !$n && $n !== 'dxvk';});
            file_put_contents($log, implode("\n", $winetricks));
        }

        if ($newVersion !== $oldVersion) {
            (new Wine($this->config, $this->command))->winetricks([$this->config->get('script', 'dxvk_version')?:'dxvk']);
            file_put_contents($dxvk, $newVersion);

            if ($logCallback) {
                $logCallback("DXVK updated to {$newVersion}.");
            }

            return true;
        }

        return false;
    }

    public function updateDxvkConfig()
    {
        if (!($this->config->isDxvk() || $this->config->isD9vk())) {
            return false;
        }

        if (!file_exists($this->config->getDxvkConfFile())) {
            file_put_contents($this->config->getDxvkConfFile(), $this->config->getDefaultDxvkConfig());
        }

        if (!file_exists($this->config->getDxvkConfFile())) {
            return false;
        }

        $currentConfig = trim(file_get_contents($this->config->getDxvkConfFile()));
        $defaultConfig = explode("\n", $this->config->getDefaultDxvkConfig());
        $newConfig     = [];
        $params        = [];

        foreach (explode("\n", $currentConfig) as $line) {
            $line = trim($line);
            if (!Text::startsWith($line, '#')) {
                $item = explode('=', $line);
                $name = trim(reset($item));
                $params[$name] = $line;
            }
        }

        foreach ($defaultConfig as $line) {
            $newConfig[] = $line;

            if (count($params) > 0) {
                $line = trim($line, " \t\n\r\0\x0B#");
                $item = explode('=', $line);
                $name = trim(reset($item));

                if (isset($params[$name]) && $params[$name] !== null) {
                    $newConfig[] = '';
                    $newConfig[] = $params[$name];
                    unset($params[$name]);
                }
            }
        }

        if (count($params) > 0) {
            $newConfig[] = '';
            $newConfig[] = '';
            $newConfig[] = '# Deprecated values.';
            $newConfig[] = '';
            foreach ($params as $line) {
                $newConfig[] = $line;
            }
        }

        $config = trim(implode("\n", $newConfig));

        if (md5($config) !== md5($currentConfig)) {
            file_put_contents($this->config->getDxvkConfFile(), $config);
            return true;
        }

        return false;
    }
}

class D9VK
{
    private $config;
    private $command;
    private $network;
    private $fs;
    private $wine;

    public function __construct(Config $config, Command $command, Network $network, FileSystem $fs, Wine $wine)
    {
        $this->command = $command;
        $this->config  = $config;
        $this->network = $network;
        $this->fs      = $fs;
        $this->wine    = $wine;
    }

    public function version()
    {
        $d9vk = $this->config->wine('DRIVE_C') . '/d9vk';

        if (file_exists($d9vk)) {
            return trim(file_get_contents($d9vk));
        }

        return '';
    }

    public function versionRemote()
    {
        if ($this->config->get('script', 'd9vk_version')) {
            return $this->config->get('script', 'd9vk_version');
        }

        static $version;

        if (null === $version && ($latest = $this->getLatest())) {
            $version = $latest['version'];
        }

        return $version;
    }

    public function getRepoData()
    {
        static $data;

        if (null === $data) {
            $data = $this->network->getJSON('https:
        }

        return $data;
    }

    public function update($logCallback = null)
    {
        if (!Network::isConnected() || !$this->config->isD9vk() || !file_exists($this->config->wine('WINEPREFIX'))) {
            return false;
        }

        $branch = $this->config->get('script', 'd9vk_version')?:'';
        $oldVersion = $this->version();

        if ('' !== $oldVersion && false === $this->config->isD9vkAutoupdate()) {
            return false;
        }

        $newVersion = $this->versionRemote();

        (new DXVK($this->config, $this->command, $this->network))->updateDxvkConfig();

        $d9vk = $this->config->wine('DRIVE_C') . '/d9vk';
        $log  = $this->config->wine('WINEPREFIX') . '/winetricks.log';

        if (file_exists($log)) {
            $winetricks = array_filter(array_map('trim', explode("\n", file_get_contents($log))),
                function ($n) {return !$n && $n !== 'd9vk';});
            file_put_contents($log, implode("\n", $winetricks));
        }

        if ($newVersion !== $oldVersion && $newVersion) {
            if ($this->install($branch, $logCallback)) {
                file_put_contents($d9vk, $newVersion);
                $this->wine->winetricks(['d3dcompiler_43', 'd3dx9']);

                if ($logCallback) {
                    $logCallback("D9VK updated to {$newVersion}.");
                }
            }

            return true;
        }

        return false;
    }

    public function install($version = null, $logCallback = null)
    {
        $releases = $this->getList();
        $release  = $version && isset($releases[$version]) ? $releases[$version] : $this->getLatest();

        if (!$release) {
            return false;
        }

        $pathFile = $this->fs->download($release['url'], $this->config->getCacheDir());
        $dir      = $this->config->getCacheDir() . '/d9vk';

        $this->fs->unpack($pathFile, $dir);

        $dlls = [];

        if (file_exists($this->config->getWineSystem32Folder())) {
            foreach (glob("{$dir}/x32
    public function getList()
    {
        $releases = [];

        foreach ($this->getRepoData() as $release) {
            $item = [
                'version' => $release['tag_name'],
            ];

            foreach ($release['assets'] as $asset) {
                $item['url'] = $asset['browser_download_url'];
                break;
            }

            $releases[$item['version']] = $item;
        }

        return $releases;
    }

    public function getLatest()
    {
        $releases = $this->getList();

        return $releases ? reset($releases) : null;
    }

    public function register($fileName)
    {
        $this->wine->regsvr32([$fileName]);
        $this->wine->run(['reg', 'add', 'HKEY_CURRENT_USER\\Software\\Wine\\DllOverrides', '/v', $fileName, '/d', 'native', '/f']);
    }
}

abstract class AbstractPlugin
{

    protected $event;

    protected $config;

    protected $command;

    protected $fs;

    protected $system;

    protected $replaces;

    protected $monitor;

    public $title = '';

    public $description = '';

    public function __construct(Event $event, Config $config, Command $command, FileSystem $fs, System $system, Replaces $replaces, Monitor $monitor)
    {
        $this->event    = $event;
        $this->config   = $config;
        $this->command  = $command;
        $this->fs       = $fs;
        $this->system   = $system;
        $this->replaces = $replaces;
        $this->monitor  = $monitor;

        $this->init();
    }

    abstract public function init();

    public function setConfig(Config $config)
    {
        $this->config = $config;
    }
}

class ControllerGUI {

    private $ncurses;
    private $scenes;
    private $initPress = false;

    public function  __construct()
    {
        $this->ncurses = new NcursesObjects\Ncurses;
        $this->init();

        $this->scenes             = [];
        $this->scenes['main']     = new MainScene();
        $this->scenes['prefix']   = new PrefixScene();
        $this->scenes['gameInfo'] = new GameInfoScene();
        $this->scenes['check']    = new CheckDependenciesScene();
        $this->scenes['tools']    = new ToolsScene();
        $this->scenes['wine']     = new WineScene();
        $this->scenes['tweaks']   = new TweaksScene();
        $this->scenes['config']   = new ConfigScene();
    }

    public function init()
    {
        $this->ncurses
            ->setEchoState(false)
            ->setNewLineTranslationState(true)
            ->setCursorState(NcursesObjects\Ncurses::CURSOR_INVISIBLE)
            ->refresh();

        if (ncurses_has_colors()) {
            ncurses_start_color();
            ncurses_assume_default_colors(NCURSES_COLOR_WHITE, NCURSES_COLOR_BLUE);
        }
    }

    public function end()
    {
        ncurses_end();
    }

    public function getNcurses()
    {
        return $this->ncurses;
    }

    public function getScenes($scene = null)
    {
        return null === $scene ? $this->scenes : $this->scenes[$scene];
    }

    public function hideAll()
    {
        foreach ($this->getScenes() as $scene) {
            foreach ($scene->getWidgets() as $widget) {

                $widget->hide();
                $widget->destruct();

            }
            $scene->hide();
            $scene->destruct();
        }
    }

    public function start()
    {
        $this->showMain();
        app('start')->getBuffer()->setSize(
            $this->getMainScene()->getWindow()->getHeight()
        );
        $this->press();
    }

    public function press($flag = true)
    {
        if (false === $flag) {
            $this->initPress = false;
            return;
        }

        if ($this->initPress === false) {
            $this->initPress = true;
            while ($this->initPress) {
                $this->pressKey(ncurses_getch());
            }
        }
    }

    public function isPress()
    {
        return $this->initPress;
    }

    public function pressKey($key)
    {
        pcntl_signal_dispatch();

        foreach ($this->getScenes() as $name => $scene) {
            if (!$scene->isActive()) {
                continue;
            }

            $pressToScene = true;
            foreach ($scene->getWidgets() as $widget) {

                if ($widget->isActive()) {
                    if ($widget->pressKey($key) === false) {
                        return;
                    }
                    $pressToScene = false;
                }
            }

            if ($pressToScene) {
                if ($scene->pressKey($key) === false) {
                    return;
                }
            }
        }
    }

    public function getMainScene()
    {
        return $this->getScenes('main');
    }

    public function getPrefixScene()
    {
        return $this->getScenes('prefix');
    }

    public function getGameInfoScene()
    {
        return $this->getScenes('gameInfo');
    }

    public function getCheckDependenciesScene()
    {
        return $this->getScenes('check');
    }

    public function getToolsScene()
    {
        return $this->getScenes('tools');
    }

    public function getWineScene()
    {
        return $this->getScenes('wine');
    }

    public function getTweaksScene()
    {
        return $this->getScenes('tweaks');
    }

    public function getConfigScene()
    {
        return $this->getScenes('config');
    }

    public function getCurrentScene()
    {
        foreach ($this->getScenes() as $scene) {
            if ($scene->isVisible()) {
                return $scene;
            }
        }

        return $this->getMainScene();
    }

    public function showMain()
    {
        $this->hideAll();
        $this->getMainScene()->show();
    }

    public function showPrefix()
    {
        $this->hideAll();
        $this->getPrefixScene()->show();
    }

    public function showGameInfo()
    {
        $this->hideAll();
        $this->getGameInfoScene()->show();
    }

    public function showCheckDependencies()
    {
        $this->hideAll();
        $this->getCheckDependenciesScene()->show();
    }

    public function showTools()
    {
        $this->hideAll();
        $this->getToolsScene()->show();
    }

    public function showWine()
    {
        $this->hideAll();
        $this->getWineScene()->show();
    }

    public function showTweaks()
    {
        $this->hideAll();
        $this->getTweaksScene()->show();
    }

    public function showConfig()
    {
        $this->hideAll();
        $this->getConfigScene()->show();
    }

    public function close()
    {
        posix_kill(posix_getpid(), SIGINT);
        pcntl_signal_dispatch();
    }
}

abstract class AbstractScene {

    protected $window;
    protected $active = false;
    protected $visible = false;
    protected $widgets;
    protected $history;

    private $changeWidgetActive;

    public function __construct()
    {
        $this->window  = new NcursesObjects\Window;
        $this->history = new History();
        $this->widgets = [];

        $onChangeWidgetActive = function ($status, $widget) {
            if ($status) {
                $this->history->add($widget);
            } else {
                $this->history->back();
            }

            $this->updateActiveWidget();
        };

        $this->changeWidgetActive = $onChangeWidgetActive;
    }

    public function show()
    {
        app()->hideAll();
        $this->visible = true;
        $this->setActive(true);
        $this->render();

        return $this;
    }

    public function hide()
    {
        if ($this->visible) {
            $this->visible = false;
            $this->window->erase()->refresh();
        }

        return $this;
    }

    public function getWindow()
    {
        return $this->window;
    }

    public function addWidget($widget)
    {

        $this->widgets[] = $widget;
        $widget->onChangeActiveEvent($this->changeWidgetActive);

        return $widget;
    }

    public function removeWidget($widget)
    {

        $widget->offChangeActiveEvent($this->changeWidgetActive);
        $this->widgets = array_filter($this->widgets, function ($item) use (&$widget) {return $item !== $widget;});
    }

    public function getWidgets()
    {
        return $this->widgets;
    }

    public function isActive()
    {
        if (!$this->isVisible()) {
            $this->setActive(false);
        }

        return $this->active;
    }

    public function setActive($flag = true)
    {
        $this->active = $flag;
        return $this;
    }

    public function isVisible()
    {
        return $this->visible;
    }

    public function setVisible($flag = true)
    {
        $this->visible = $flag;
        return $this;
    }

    private function updateActiveWidget()
    {
        $current = $this->history->current();

        foreach ($this->widgets as $widget) {

            $widget->offChangeActiveEvent($this->changeWidgetActive);
        }

        foreach ($this->getWidgets() as $widget) {

            if ($widget === $current) {
                $widget->setActive(true);
            } else {
                $widget->setActive(false);
            }
        }

        foreach ($this->widgets as $widget) {

            $widget->onChangeActiveEvent($this->changeWidgetActive);
        }
    }

    abstract public function render();

    abstract public function pressKey($key);

    public function destruct() {
        $this->widgets = [];
        $this->setActive(false);
        $this->setVisible(false);
    }
}

class MainScene extends AbstractScene
{
    private $selectIndex = 0;

    public function render()
    {

        $config = app('start')->getConfig();

        $update = app('start')->getUpdate();

        $this->window
            ->border()
            ->title('version: ' . $update->version())
            ->status($update->getUrl())
            ->refresh();

        $menu = $this->renderMenu();

        $info = $this->addWidget(new InfoWidget($this->window));
        $info
            ->setData($menu)
            ->show();

        if ($menu->selectAt($this->selectIndex)) {
            $menu->render();
        }
        $menu->onChangeEvent(function () use (&$menu) {
            $this->selectIndex = $menu->index();
        });
    }

    public function renderMenu()
    {

        $config = app('start')->getConfig();

        $configs = $config->findConfigsPath();

        $starts = [];

        foreach ($configs as $i => $path) {
            if ($config->getConfigFile() === $path && count($configs) === 1) {
                $starts[] = ['id' => 'start', 'config' => $config, 'name' => 'Start'];
            } else {
                $cfg = new Config($path);
                $title = 'Start → ' . $cfg->getGameTitle() .'';
                $starts[] = ['id' => 'start', 'config' => $cfg, 'name' => $title];
            }
        }

        $items = array_merge(
            $starts,
            [
                ['id' => 'tools',    'name' => 'Tools'],
                ['id' => 'wine',     'name' => 'Wine'],
                ['id' => 'config',   'name' => 'Config'],
                ['id' => 'tweaks',   'name' => 'Tweaks'],
                ['id' => 'exit',     'name' => 'Exit'],
            ]
        );

        $select = $this->addWidget(new PopupSelectWidget($this->window));
        $select
            ->setItems($items)
            ->border()
            ->setFullMode()
            ->maxSize(null, 16)
            ->offset(2, 1)
            ->setActive(true)
            ->show();

        $select->onEnterEvent(function ($item, $xy) use (&$config) {
            if ('wine' === $item['id']) {
                app()->showWine();
            }
            if ('tools' === $item['id']) {
                app()->showTools();
            }
            if ('tweaks' === $item['id']) {
                app()->showTweaks();
            }
            if ('config' === $item['id']) {

                $configPaths = $config->findConfigsPath();

                if (count($configPaths) > 1) {

                    $select = $this->addWidget(new PopupSelectWidget($this->window));
                    $select
                        ->setItems(
                            array_map(
                                function ($path) {
                                    return [
                                        'id'   => $path,
                                        'name' => (new Config($path))->getGameTitle() . ' | ' . basename($path)
                                    ];
                                },
                                $configPaths
                            )
                        )
                        ->border()
                        ->setFullMode()
                        ->backAccess()
                        ->maxSize(null, 4)
                        ->offset($xy['x'], $xy['y'])
                        ->setActive(true)
                        ->show();
                    $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                    $select->onEnterEvent(function ($item) use (&$select) {
                        $this->removeWidget($select->hide());
                        app()->getConfigScene()->setConfig(new Config($item['id']));
                        app()->showConfig();
                    });
                } else {
                    app()->showConfig();
                }
            }
            if ('exit' === $item['id']) {
                app()->close();
            }
            if ('start' === $item['id']) {
                $select = $this->addWidget(new PopupSelectWidget($this->window));
                $select
                    ->setItems([
                        ['id' => 'start', 'name' => 'Start'],
                        ['id' => 'debug', 'name' => 'Debug'],
                        ['id' => 'fps',   'name' => 'FPS'],
                    ])
                    ->border()
                    ->setFullMode()
                    ->backAccess()
                    ->maxSize(null, 4)
                    ->offset($xy['x'], $xy['y'])
                    ->setActive(true)
                    ->show();
                $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                $select->onEnterEvent(function ($type) use (&$select, &$item) {
                    $this->removeWidget($select->hide());

                    $config = $item['config'];

                    $task = new Task($config);
                    $task->logName($config->getGameTitle());

                    if ('debug' === $type['id']) {
                        $task->debug();
                    }
                    if ('fps' === $type['id']) {
                        $task->fps();
                    }

                    $task->game()->run();
                });
            }
        });

        return $select;
    }

    public function pressKey($key) {}
}

class PrefixScene extends AbstractScene
{
    private $updateTextCallable;

    private $print;

    private $progressBar;

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
        $log = '~/game_info/logs/prefix.log';

        $this->window
            ->border()
            ->title('Create prefix')
            ->status($log)
            ->refresh();

        $this->progressBar = $this->addWidget(new ProgressBarWidget($this->window));
        $this->progressBar
            ->offset(mb_strlen($log) + 2, 3)
            ->setProgress(0)
            ->show();

        $this->print = $this->addWidget(new PrintWidget($this->window));
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
}

class GameInfoScene extends AbstractScene
{
    private $updateTextCallable;

    private $print;

    private $progressBar;

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
        $log = '~/game_info/logs/game_info.log';

        $this->window
            ->border()
            ->title('Create "game_info" folder')
            ->status($log)
            ->refresh();

        $this->progressBar = $this->addWidget(new ProgressBarWidget($this->window));
        $this->progressBar
            ->offset(mb_strlen($log) + 2, 3)
            ->setProgress(0)
            ->show();

        $this->print = $this->addWidget(new PrintWidget($this->window));
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
}

class CheckDependenciesScene extends AbstractScene
{
    private $updateTextCallable;

    private $print;

    private $progressBar;

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
        $log = '~/game_info/logs/dependencies.log';

        $this->window
            ->border()
            ->title('Check dependencies')
            ->status($log)
            ->refresh();

        $this->progressBar = $this->addWidget(new ProgressBarWidget($this->window));
        $this->progressBar
            ->offset(mb_strlen($log) + 2, 3)
            ->setProgress(0)
            ->show();

        $this->print = $this->addWidget(new PrintWidget($this->window));
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
}

class ToolsScene extends AbstractScene {
    public function render()
    {

        $config = app('start')->getConfig();

        $update = app('start')->getUpdate();

        $this->window
            ->border()
            ->title('Tools')
            ->status($update->getUrl())
            ->refresh();

        $menu = $this->renderMenu();

        $info = $this->addWidget(new InfoWidget($this->window));
        $info
            ->setData($menu)
            ->show();
    }

    public function renderMenu()
    {

        $fs = app('start')->getFileSystem();

        $items = [];
        $items[] = ['id' => 'back',   'name' => 'Back'];

        $pngs = array_map(
            function ($n) use (&$fs) {
                return ['name' => './' . $fs->relativePath($n), 'path' => $n];
            },
            app('start')->getIcon()->findPng()
        );

        if ($pngs) {
            $items[] = ['id' => 'icon',   'name' => 'Icon'];
        }

        $items[] = ['id' => 'pack',    'name' => 'Pack'];
        $items[] = ['id' => 'symlink', 'name' => 'Symlink'];
        $items[] = ['id' => 'build',   'name' => 'Build'];
        $items[] = ['id' => 'reset',   'name' => 'Reset'];

        $select = $this->addWidget(new PopupSelectWidget($this->window));
        $select
            ->setItems($items)
            ->border()
            ->setFullMode()
            ->maxSize(null, 16)
            ->offset(2, 1)
            ->setActive(true)
            ->show();

        $select->onEnterEvent(function ($item, $xy) use (&$pngs) {
            if ('back' === $item['id']) {
                app()->showMain();
            }
            if ('icon' === $item['id']) {
                $select = $this->addWidget(new PopupSelectWidget($this->window));
                $select
                    ->setItems([
                        ['id' => 'create', 'name' => 'Create'],
                        ['id' => 'remove', 'name' => 'Remove'],
                    ])
                    ->border()
                    ->setFullMode()
                    ->backAccess()
                    ->maxSize(null, 4)
                    ->offset($xy['x'], $xy['y'])
                    ->setActive(true)
                    ->show();
                $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                $select->onEnterEvent(function ($type) use (&$select, &$pngs) {
                    $this->removeWidget($select->hide());

                    if ('create' === $type['id']) {
                        $create = function ($icon) {
                            $addMenu = $this->addWidget(new PopupYesNoWidget($this->window));
                            $addMenu
                                ->setTitle('Icon Wizard')
                                ->setText('Add icon also to system menu?')
                                ->setActive(true)
                                ->show();
                            $addMenu->onEscEvent(function () use (&$addMenu) { $this->removeWidget($addMenu->hide()); });
                            $addMenu->onEnterEvent(function ($flag) use ($icon, &$addMenu) {
                                $addMenu->hide();
                                $this->removeWidget($addMenu);

                                $icons = app('start')->getIcon()->create($icon['path'], $flag);

                                $width = 60;

                                foreach ($icons as $icon) {
                                    if ($width < mb_strlen($icon)) {
                                        $width = mb_strlen($icon);
                                    }
                                }

                                $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                $popup
                                    ->setTitle('Success')
                                    ->setText(array_merge(['Add or update icons:'], $icons))
                                    ->size($width + 2, 9)
                                    ->setButton()
                                    ->setActive(true)
                                    ->show();
                                $popup->onEnterEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                            });
                        };

                        if (count($pngs) > 1) {
                            $select = $this->addWidget(new PopupSelectWidget($this->window));
                            $select
                                ->setItems($pngs)
                                ->setTitle('Select PNG file')
                                ->setEndMode()
                                ->backAccess()
                                ->maxSize(40, 10)
                                ->setActive(true)
                                ->show();
                            $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                            $select->onEnterEvent(function ($item) use (&$create, &$select) {
                                $this->removeWidget($select->hide());
                                $create($item);
                            });
                        } elseif (count($pngs) > 0) {
                            $create(reset($pngs));
                        }
                    }

                    if ('remove' === $type['id']) {
                        $icons = app('start')->getIcon()->findExistIcons();

                        if ($icons) {
                            $width = 60;

                            foreach ($icons as $icon) {
                                if ($width < mb_strlen($icon)) {
                                    $width = mb_strlen($icon);
                                }
                            }

                            $popup = $this->addWidget(new PopupYesNoWidget($this->getWindow()));
                            $popup
                                ->setTitle('Remove?')
                                ->setText(array_merge(['Found icons:'], $icons))
                                ->size($width + 2, 9)
                                ->backAccess()
                                ->setActive(true)
                                ->show();
                            $popup->onEscEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                            $popup->onEnterEvent(function ($flag) use (&$popup) {
                                $this->removeWidget($popup->hide());

                                if ($flag) {
                                    app('start')->getIcon()->remove();

                                    $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                    $popup
                                        ->setTitle('Success')
                                        ->setText('Icons removed')
                                        ->setButton()
                                        ->setActive(true)
                                        ->show();

                                    $popup->onEnterEvent(function () use (&$popup) {
                                        $this->removeWidget($popup->hide());
                                    });
                                }
                            });
                        } else {
                            $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                            $popup
                                ->setTitle('Error')
                                ->setText('Icons not found')
                                ->setButton()
                                ->backAccess()
                                ->setActive(true)
                                ->show();
                            $popup->onEscEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                            $popup->onEnterEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                        }
                    }
                });
            }
            if ('pack' === $item['id']) {
                $select = $this->addWidget(new PopupSelectWidget($this->window));
                $select
                    ->setItems([
                        ['id' => 'pack',   'name' => 'Pack'],
                        ['id' => 'unpack', 'name' => 'UnPack'],
                    ])
                    ->border()
                    ->setFullMode()
                    ->backAccess()
                    ->maxSize(null, 4)
                    ->offset($xy['x'], $xy['y'])
                    ->setActive(true)
                    ->show();
                $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                $select->onEnterEvent(function ($type) use (&$select, &$xy) {
                    $this->removeWidget($select->hide());

                    $select = $this->addWidget(new PopupSelectWidget($this->window));
                    $select
                        ->setItems([
                            ['id' => 'wine', 'name' => 'Wine'],
                            ['id' => 'data', 'name' => 'Data'],
                        ])
                        ->setTitle($type['name'])
                        ->border()
                        ->setFullMode()
                        ->backAccess()
                        ->maxSize(null, 4)
                        ->offset($xy['x'], $xy['y'])
                        ->setActive(true)
                        ->show();
                    $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                    $select->onEnterEvent(function ($folder) use (&$select, &$type) {
                        $this->removeWidget($select->hide());

                        $config = app('start')->getConfig();
                        $path   = '';

                        if ('wine' === $folder['id']) {
                            $path = $config->getWineDir();
                        }
                        if ('data' === $folder['id']) {
                            $path = $config->getDataDir();
                        }

                        if ($path) {

                            $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                            $popup
                                ->setTitle($type['name'] . 'ing ' . $folder['id'])
                                ->setText('Wait...')
                                ->setActive(true)
                                ->show();

                            $status = false;

                            if ('pack' === $type['id']) {
                                $status = app('start')->getPack()->pack($path);
                            }
                            if ('unpack' === $type['id']) {
                                $status = app('start')->getPack()->unpack($path);
                            }

                            $this->removeWidget($popup->hide());

                            if ($status) {
                                $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                $popup
                                    ->setTitle('Success')
                                    ->setText('Success ' . $type['id'] . ' "' . $folder['id'] . '" folder')
                                    ->setButton()
                                    ->setActive(true)
                                    ->show();
                                $popup->onEnterEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                            } else {
                                $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                $popup
                                    ->setTitle('Error')
                                    ->setText('Error ' . $type['id'] . ' "' . $folder['id'] . '"')
                                    ->setButton()
                                    ->setActive(true)
                                    ->show();
                                $popup->onEnterEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                            }
                        }
                    });
                });
            }
            if ('symlink' === $item['id']) {

                $folders = app('start')->getSymlink()->getDirs();

                if (!$folders) {
                    $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                    $popup
                        ->setTitle('Error')
                        ->setText('Not found directories in the "data" folder.')
                        ->setButton()
                        ->setActive(true)
                        ->show();
                    $popup->onEnterEvent(function () use (&$popup) {
                        $this->removeWidget($popup->hide());
                    });
                } else {
                    $select = $this->addWidget(new PopupSelectWidget($this->window));
                    $select
                        ->setItems(array_map(function ($n) {return ['name' => $n];}, $folders))
                        ->border()
                        ->setTitle('Directory')
                        ->setFullMode()
                        ->backAccess()
                        ->maxSize(null, 4)
                        ->offset($xy['x'], $xy['y'])
                        ->setActive(true)
                        ->show();
                    $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                    $select->onEnterEvent(function ($type) use (&$select) {
                        $this->removeWidget($select->hide());

                        $fs   = app('start')->getFileSystem();
                        $data = $fs->relativePath(app('start')->getConfig()->getDataDir());

                        $popup = $this->addWidget(new PopupYesNoWidget($this->window));
                        $popup
                            ->setTitle('Symlink Wizard')
                            ->setText("Replace \"./{$data}/{$type['name']}\" folder to symlink?")
                            ->setActive(true)
                            ->show();
                        $popup->onEscEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                        $popup->onEnterEvent(function ($flag) use (&$popup, &$type) {
                            $this->removeWidget($popup->hide());

                            if ($flag) {
                                $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                $popup
                                    ->setTitle('Create symlinks')
                                    ->setText('Wait...')
                                    ->setActive(true)
                                    ->show();

                                $result = app('start')->getSymlink()->replace($type['name']);

                                $this->removeWidget($popup->hide());

                                $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                $popup
                                    ->setTitle($result ? 'Success' : 'Error')
                                    ->setText($result ? 'Moved data' : 'Error moving')
                                    ->setButton()
                                    ->setActive(true)
                                    ->show();
                                $popup->onEnterEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                            }
                        });
                    });
                }
            }
            if ('build' === $item['id']) {

                $select = $this->addWidget(new PopupSelectWidget($this->window));
                $select
                    ->setItems([
                        ['id' => 'standard', 'name' => 'Standard'],
                        ['id' => 'prefix',   'name' => 'With "prefix" folder'],
                    ])
                    ->border()
                    ->setTitle('Build')
                    ->setFullMode()
                    ->backAccess()
                    ->maxSize(null, 4)
                    ->offset($xy['x'], $xy['y'])
                    ->setActive(true)
                    ->show();
                $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                $select->onEnterEvent(function ($type) use (&$select) {
                    $this->removeWidget($select->hide());

                    $popup = $this->addWidget(new PopupYesNoWidget($this->window));
                    $popup
                        ->setTitle('Build Wizard')
                        ->setText([
                            'Create a distribution of the game?',
                            'In to "./build" folder.'
                        ])
                        ->setActive(true)
                        ->show();
                    $popup->onEscEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                    $popup->onEnterEvent(function ($flag) use (&$popup, &$type) {
                        $this->removeWidget($popup->hide());

                        if ($flag) {
                            $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                            $popup
                                ->setTitle('Build')
                                ->setText('Wait...')
                                ->setActive(true)
                                ->show();

                            app('start')->getBuild()->build($type['id'] === 'prefix');

                            $this->removeWidget($popup->hide());

                            $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                            $popup
                                ->setTitle('Success')
                                ->setText('Build completed!')
                                ->setButton()
                                ->setActive(true)
                                ->show();
                            $popup->onEnterEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                        }
                    });
                });
            }
            if ('reset' === $item['id']) {
                if (!app('start')->getBuild()->checkSupportReset()) {
                    $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                    $popup
                        ->setTitle('Error')
                        ->setText('This game not supported reset functionality.')
                        ->setButton()
                        ->setActive(true)
                        ->show();
                    $popup->onEnterEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                } else {
                    $popup = $this->addWidget(new PopupYesNoWidget($this->window));
                    $popup
                        ->setTitle('Reset Wizard')
                        ->setText([
                            'Reset files the game?',
                            'Deleted files can not be returned.',
                        ])
                        ->setActive(true)
                        ->show();
                    $popup->onEscEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                    $popup->onEnterEvent(function ($flag) use (&$popup, &$type) {
                        $this->removeWidget($popup->hide());

                        if ($flag) {
                            $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                            $popup
                                ->setTitle('Build')
                                ->setText('Wait...')
                                ->setActive(true)
                                ->show();

                            app('start')->getBuild()->reset();

                            $this->removeWidget($popup->hide());

                            $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                            $popup
                                ->setTitle('Success')
                                ->setText('Reset completed!')
                                ->setButton()
                                ->setActive(true)
                                ->show();
                            $popup->onEnterEvent(function ()  use (&$popup) {
                                $this->removeWidget($popup->hide());
                                app()->close();
                            });
                        }
                    });
                }
            }
        });

        return $select;
    }

    public function pressKey($key) {}
}

class WineScene extends AbstractScene {
    public function render()
    {

        $config = app('start')->getConfig();

        $update = app('start')->getUpdate();

        $wine = app('start')->getWine();

        $this->window
            ->border()
            ->title($wine->version())
            ->status($update->getUrl())
            ->refresh();

        $menu = $this->renderMenu();

        $info = $this->addWidget(new InfoWidget($this->window));
        $info
            ->setData($menu)
            ->show();
    }

    public function renderMenu()
    {
        $items = [];
        $items[] = ['id' => 'back',            'name' => 'Back'];
        $items[] = ['id' => 'winecfg',         'name' => 'Config',          'wine' => 'WINECFG'];
        $items[] = ['id' => 'filemanager',     'name' => 'File Manager',    'wine' => 'WINEFILE'];
        $items[] = ['id' => 'regedit',         'name' => 'Regedit',         'wine' => 'REGEDIT'];

        if (app('start')->getDriver()->isGalliumNineSupport()) {
            $items[] =  ['id' => 'galliumnine', 'name' => 'Gallium Nine' ];
        }

        $items[] = ['id' => 'change',          'name' => 'Change Wine version' ];
        $items[] = ['id' => 'recreate_prefix', 'name' => 'Recreate prefix' ];

        $select = $this->addWidget(new PopupSelectWidget($this->window));
        $select
            ->setItems($items)
            ->border()
            ->setFullMode()
            ->maxSize(null, 16)
            ->offset(2, 1)
            ->setActive(true)
            ->show();

        $select->onEnterEvent(function ($item) {
            $config = app('start')->getConfig();

            if ('back' === $item['id']) {
                app()->showMain();
            }
            if (in_array($item['id'], ['winecfg', 'filemanager', 'regedit', 'taskmgr', 'uninstaller', 'progman'])) {
                $task   = new Task($config);
                $task
                    ->debug()
                    ->logName($item['id'])
                    ->cmd(Text::quoteArgs($config->wine($item['wine'])));

                if ('filemanager' === $item['id']) {
                    $task->run(function () {
                        (new Wine(app('start')->getConfig(), app('start')->getCommand()))->fm([]);
                    });
                } else {
                    $task->run();
                }
            }
            if ('change' === $item['id']) {
                $wineDownloader = new WineDownloader(app('start')->getConfig(), app('start')->getCommand(), app('start')->getFileSystem(), app('start')->getPack());
                $wineDownloader->wizard();
            }
            if ('recreate_prefix' === $item['id']) {
                $popup = $this->addWidget(new PopupYesNoWidget($this->getWindow()));
                $popup
                    ->setTitle('Recreate prefix')
                    ->setText([
                        'Recreate Wine prefix folder?',
                    ])
                    ->setActive(true)
                    ->show();
                $popup->onEscEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                $popup->onEnterEvent(function ($flag) use (&$popup, &$config) {
                    $this->removeWidget($popup->hide());

                    if (!$flag) {
                        return;
                    }

                    if (file_exists($config->getPrefixFolder())) {
                        app('start')->getFileSystem()->rm($config->getPrefixFolder());
                        app('start')->getUpdate()->restart();
                    }
                });
            }
            if ('galliumnine' === $item['id']) {
                if ($this->isGalliumNineInstalled()) {
                    $task = new Task($config);
                    $task
                        ->debug()
                        ->logName($item['id'])
                        ->cmd(Text::quoteArgs($config->wine('WINE')) . ' ninewinecfg.exe')
                        ->run();
                } else {
                    $popup = $this->addWidget(new PopupYesNoWidget($this->getWindow()));
                    $popup
                        ->setTitle('Gallium Nine')
                        ->setText([
                            'Install Gallium Nine?',
                        ])
                        ->setActive(true)
                        ->show();
                    $popup->onEscEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                    $popup->onEnterEvent(function ($flag) use (&$popup, &$config) {
                        $this->removeWidget($popup->hide());

                        if (!$flag) {
                            return;
                        }

                        $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                        $popup
                            ->setTitle('Installing Gallium Nine')
                            ->setText('Wait ...')
                            ->setActive(true)
                            ->show();

                        (new Wine($config, app('start')->getCommand()))->winetricks(['galliumnine']);

                        $this->removeWidget($popup->hide());
                    });
                }
            }
        });

        return $select;
    }

    public function pressKey($key) {}

    public function isGalliumNineInstalled()
    {

        $config = app('start')->getConfig();

        return file_exists($config->getWineSystem32Folder() . '/ninewinecfg.exe');
    }
}

class TweaksScene extends AbstractScene
{
    private $selectIndex = 0;

    public function render()
    {

        $config = app('start')->getConfig();

        $update = app('start')->getUpdate();

        $wine = app('start')->getWine();

        $this->window
            ->border()
            ->title('Tweaks')
            ->status($update->getUrl())
            ->refresh();

        $menu = $this->renderMenu();

        $info = $this->addWidget(new InfoWidget($this->window));
        $info
            ->setData($menu)
            ->show();

        if ($menu->selectAt($this->selectIndex)) {
            $menu->render();
        }
        $menu->onChangeEvent(function () use (&$menu) {
            $this->selectIndex = $menu->index();
        });
    }

    public function renderMenu()
    {
        $items = [
            ['id' => 'back',         'name' => 'Back'],
            ['id' => 'cpu_mode',     'name' => 'CPU mode'],
            ['id' => 'dependencies', 'name' => 'Check dependencies'],
            ['id' => 'hw_info',      'name' => 'Hardware info'],
            ['id' => 'sys_info',     'name' => 'System info'],
        ];

        if (Network::isConnected()) {
            $items[] = ['id' => 'update',   'name' => 'Update'];
        }

        $select = $this->addWidget(new PopupSelectWidget($this->window));
        $select
            ->setItems($items)
            ->border()
            ->setFullMode()
            ->maxSize(null, 16)
            ->offset(2, 1)
            ->setActive(true)
            ->show();

        $select->onEnterEvent(function ($item, $xy) {
            if ('back' === $item['id']) {
                app()->showMain();
            }
            if ('dependencies' === $item['id']) {

                $config = app('start')->getConfig();

                $command = app('start')->getCommand();

                $system = app('start')->getSystem();

                (new CheckDependencies($config, $command, $system))->check();

                app()->showTweaks();
            }
            if ('cpu_mode' === $item['id']) {
                $select = $this->addWidget(new PopupSelectWidget($this->window));
                $select
                    ->setTitle('Set mode')
                    ->setItems([
                        ['id' => 'performance',  'name' => 'performance'],
                        ['id' => 'ondemand',     'name' => 'ondemand (default)'],
                        ['id' => 'conservative', 'name' => 'conservative'],
                        ['id' => 'powersave',    'name' => 'powersave'],
                    ])
                    ->border()
                    ->setFullMode()
                    ->backAccess()
                    ->maxSize(null, 4)
                    ->offset($xy['x'], $xy['y'])
                    ->setActive(true)
                    ->show();
                $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                $select->onEnterEvent(function ($type) use (&$select, &$item) {
                    $this->removeWidget($select->hide());

                    $gui = app('gui');
                    $gui->end();
                    exec("sudo sh -c '$(for CPUFREQ in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do [ -f \$CPUFREQ ] || continue; echo -n {$type['id']} > \$CPUFREQ; done)'");
                    $gui->init();
                    app()->showTweaks();
                });
            }
            if ('update' === $item['id']) {

                $select = $this->addWidget(new PopupSelectWidget($this->window));
                $select
                    ->setItems([
                        ['id' => 'script', 'name' => 'Script'],
                        ['id' => 'dxvk',   'name' => 'DXVK'],
                    ])
                    ->border()
                    ->setFullMode()
                    ->backAccess()
                    ->maxSize(null, 4)
                    ->offset($xy['x'], $xy['y'])
                    ->setActive(true)
                    ->show();
                $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                $select->onEnterEvent(function ($type) use (&$select, &$xy) {
                    $this->removeWidget($select->hide());

                    if ('script' === $type['id']) {
                        $current = app('start')->getUpdate()->version();
                        $remote  = app('start')->getUpdate()->versionRemote();

                        if ($current === $remote) {
                            $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                            $popup
                                ->setTitle('Success')
                                ->setText('Your script version is up to date.')
                                ->setButton()
                                ->setActive(true)
                                ->show();
                            $popup->onEnterEvent(function ()  use (&$popup) { $this->removeWidget($popup->hide()); });
                        } else {
                            $popup = $this->addWidget(new PopupYesNoWidget($this->window));
                            $popup
                                ->setTitle('Update Wizard')
                                ->setText([
                                    'Download the new version of the script?',
                                ])
                                ->setActive(true)
                                ->show();
                            $popup->onEscEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                            $popup->onEnterEvent(function ($flag) use (&$popup) {
                                $this->removeWidget($popup->hide());

                                if ($flag) {
                                    $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                    $popup
                                        ->setTitle('Download')
                                        ->setText('Wait...')
                                        ->setActive(true)
                                        ->show();

                                    $result = app('start')->getUpdate()->update();

                                    $this->removeWidget($popup->hide());

                                    if ($result) {
                                        $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                        $popup
                                            ->setTitle('Success')
                                            ->setText('Script updated, restart script to apply.')
                                            ->setButton()
                                            ->setActive(true)
                                            ->show();
                                        $popup->onEnterEvent(function ()  use (&$popup) { $this->removeWidget($popup->hide()); });
                                    } else {
                                        $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                        $popup
                                            ->setTitle('Error')
                                            ->setText('Script update failed.')
                                            ->setButton()
                                            ->setActive(true)
                                            ->show();
                                        $popup->onEnterEvent(function ()  use (&$popup) { $this->removeWidget($popup->hide()); });
                                    }
                                }
                            });
                        }
                    }
                    if ('dxvk' === $type['id']) {
                        $dxvk    = new DXVK(app('start')->getConfig(), app('start')->getCommand(), app('start')->getNetwork());
                        $current = $dxvk->version();
                        $remote  = $dxvk->versionRemote();

                        if ($current === $remote) {
                            $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                            $popup
                                ->setTitle('Success')
                                ->setText('Your DXVK version is up to date.')
                                ->setButton()
                                ->setActive(true)
                                ->show();
                            $popup->onEnterEvent(function ()  use (&$popup) { $this->removeWidget($popup->hide()); });
                        } else {
                            $popup = $this->addWidget(new PopupYesNoWidget($this->window));
                            $popup
                                ->setTitle('Update Wizard')
                                ->setText([
                                    'Download the new version of the DXVK?',
                                ])
                                ->setActive(true)
                                ->show();
                            $popup->onEscEvent(function () use (&$popup) { $this->removeWidget($popup->hide()); });
                            $popup->onEnterEvent(function ($flag) use (&$popup, &$dxvk) {
                                $this->removeWidget($popup->hide());

                                if ($flag) {
                                    $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                    $popup
                                        ->setTitle('Download')
                                        ->setText('Wait...')
                                        ->setActive(true)
                                        ->show();

                                    $result = $dxvk->update();

                                    $this->removeWidget($popup->hide());

                                    if ($result) {
                                        $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                        $popup
                                            ->setTitle('Success')
                                            ->setText('DXVK updated.')
                                            ->setButton()
                                            ->setActive(true)
                                            ->show();
                                        $popup->onEnterEvent(function ()  use (&$popup) { $this->removeWidget($popup->hide()); });
                                    } else {
                                        $popup = $this->addWidget(new PopupInfoWidget($this->getWindow()));
                                        $popup
                                            ->setTitle('Error')
                                            ->setText('DXVK update failed.')
                                            ->setButton()
                                            ->setActive(true)
                                            ->show();
                                        $popup->onEnterEvent(function ()  use (&$popup) { $this->removeWidget($popup->hide()); });
                                    }
                                }
                            });
                        }
                    }
                });
            }

        });

        return $select;
    }

    public function pressKey($key) {}
}

class ConfigScene extends AbstractScene
{
    private $selectIndex = 0;

    private $config;

    public function setConfig($config)
    {
        $this->config = $config;
    }

    public function getConfig()
    {
        return null === $this->config ? app('start')->getConfig() : $this->config;
    }

    public function render()
    {

        $update = app('start')->getUpdate();

        $this->window
            ->border()
            ->title('Config ~/' . basename($this->getConfig()->getConfigFile()))
            ->status($update->getUrl())
            ->refresh();

        $menu = $this->renderMenu();

        $info = $this->addWidget(new InfoWidget($this->window));
        $info
            ->setData($menu)
            ->show();

        if ($menu->selectAt($this->selectIndex)) {
            $menu->render();
        }
        $menu->onChangeEvent(function () use (&$menu) {
            $this->selectIndex = $menu->index();
        });
    }

    public function renderMenu()
    {

        $config = $this->getConfig();

        $items = [
            ['id' => 'back',                            'name' => 'Back'],
            ['id' => 'config_wine_arch',                'name' => '(' . ($config->get('wine', 'WINEARCH')) . ')' . ' Wine arch'],
            ['id' => 'config_winver',                   'name' => '(' . ($config->get('script', 'winver')) . ')' . ' Windows version'],
            ['id' => 'config_patches',                  'name' => '[' . ($config->isGenerationPatchesMode() ? 'ON] ' : 'OFF]') . ' Create patches'],
            ['id' => 'config_dxvk',                     'name' => '[' . ($config->isDxvk() ? 'ON] ' : 'OFF]') . ' DXVK enable'],
            ['id' => 'config_dxvk_version',             'name' => '(' . ($config->get('script', 'dxvk_version') ?: 'latest') . ')' . ' DXVK version'],
            ['id' => 'config_d9vk',                     'name' => '[' . ($config->isD9vk() ? 'ON] ' : 'OFF]') . ' D9VK enable'],
            ['id' => 'config_d9vk_version',             'name' => '(' . ($config->get('script', 'd9vk_version') ?: 'latest') . ')' . ' D9VK version'],
            ['id' => 'config_esync',                    'name' => '[' . ($config->isEsync() ? 'ON] ' : 'OFF]') . ' ESYNC enable'],
            ['id' => 'config_csmt',                     'name' => '[' . ($config->getBool('script', 'csmt') ? 'ON] ' : 'OFF]') . ' CSMT enable'],
            ['id' => 'config_pulse',                    'name' => '[' . ($config->getBool('script', 'pulse') ? 'ON] ' : 'OFF]') . ' Pulse enable'],
            ['id' => 'config_sandbox',                  'name' => '[' . ($config->getBool('script', 'sandbox') ? 'ON] ' : 'OFF]') . ' Sandbox'],
            ['id' => 'config_fixres',                   'name' => '[' . ($config->getBool('script', 'fixres') ? 'ON] ' : 'OFF]') . ' Auto fixed resolution'],
            ['id' => 'config_pba',                      'name' => '[' . ($config->isPBA() ? 'ON] ' : 'OFF]') . ' PBA enable'],
            ['id' => 'config_window_enable',            'name' => '[' . ($config->getBool('window', 'enable') ? 'ON] ' : 'OFF]') . ' Window mode'],
            ['id' => 'config_faudio',                   'name' => '[' . ($config->getBool('script', 'faudio') ? 'ON] ' : 'OFF]') . ' FAudio'],
            ['id' => 'config_dumbxinputemu',            'name' => '[' . ($config->getBool('script', 'dumbxinputemu') ? 'ON] ' : 'OFF]') . ' Dumbxinputemu'],
            ['id' => 'config_dxvk_d3d10',               'name' => '[' . ($config->getBool('script', 'dxvk_d3d10') ? 'ON] ' : 'OFF]') . ' DXVK D3D10'],
            ['id' => 'config_autoupdate',               'name' => '[' . ($config->isScriptAutoupdate() ? 'ON] ' : 'OFF]') . ' SCRIPT autoupdate'],
            ['id' => 'config_dxvk_autoupdate',          'name' => '[' . ($config->isDxvkAutoupdate() ? 'ON] ' : 'OFF]') . ' DXVK autoupdate'],
            ['id' => 'config_d9vk_autoupdate',          'name' => '[' . ($config->isD9vkAutoupdate() ? 'ON] ' : 'OFF]') . ' D9VK autoupdate'],
            ['id' => 'config_faudio_autoupdate',        'name' => '[' . ($config->getBool('script', 'faudio_autoupdate') ? 'ON] ' : 'OFF]') . ' FAudio autoupdate'],
            ['id' => 'config_dumbxinputemu_autoupdate', 'name' => '[' . ($config->getBool('script', 'dumbxinputemu_autoupdate') ? 'ON] ' : 'OFF]') . ' Dumbxinputemu autoupdate'],

            ['id' => 'config_fix_nocrashdialog',        'name' => '[' . (!$config->getBool('fixes', 'nocrashdialog') ? 'ON] ' : 'OFF]') . ' Show crash dialog'],
            ['id' => 'config_fix_focus',                'name' => '[' . ($config->getBool('fixes', 'focus') ? 'ON] ' : 'OFF]') . ' Fix focus'],
            ['id' => 'config_fix_cfc',                  'name' => '[' . ($config->getBool('fixes', 'cfc') ? 'ON] ' : 'OFF]') . ' CheckFloatConstants'],
            ['id' => 'config_fix_glsl',                 'name' => '[' . ($config->getBool('fixes', 'glsl') ? 'ON] ' : 'OFF]') . ' Use GLSL shaders'],
            ['id' => 'config_fix_ddr',                  'name' => '(' . ($config->get('fixes', 'ddr') ?: 'default') . ')' . ' DirectDrawRenderer'],
            ['id' => 'config_fix_orm',                  'name' => '(' . ($config->get('fixes', 'orm') ?: 'default') . ')' . ' OffscreenRenderingMode'],
        ];

        $select = $this->addWidget(new PopupSelectWidget($this->window));
        $select
            ->setItems($items)
            ->border()
            ->setFullMode()
            ->maxSize(null, 16)
            ->offset(2, 1)
            ->setActive(true)
            ->show();

        $select->onEnterEvent(function ($item, $xy) use (&$config) {
            if ('back' === $item['id']) {
                app()->showMain();
            }

            if ('config_wine_arch' === $item['id']) {
                $select = $this->addWidget(new PopupSelectWidget($this->window));
                $select
                    ->setItems([
                        ['id' => 'win32', 'name' => 'win32'],
                        ['id' => 'win64', 'name' => 'win64'],
                    ])
                    ->border()
                    ->setFullMode()
                    ->backAccess()
                    ->maxSize(null, 4)
                    ->offset($xy['x'], $xy['y'])
                    ->setActive(true)
                    ->show();
                $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                $select->onEnterEvent(function ($type) use (&$select, &$config) {
                    $this->removeWidget($select->hide());
                    $config->set('wine', 'WINEARCH', $type['id']);
                    $config->save();
                    app()->showConfig();
                });
            }

            if ('config_winver' === $item['id']) {
                $select = $this->addWidget(new PopupSelectWidget($this->window));
                $select
                    ->setItems([
                        ['id' => 'win2k', 'name' => 'Windows 2000'],
                        ['id' => 'winxp', 'name' => 'Windows XP'],
                        ['id' => 'win7',  'name' => 'Windows 7'],
                        ['id' => 'win10', 'name' => 'Windows 10'],
                    ])
                    ->border()
                    ->setFullMode()
                    ->backAccess()
                    ->maxSize(null, 4)
                    ->offset($xy['x'], $xy['y'])
                    ->setActive(true)
                    ->show();
                $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                $select->onEnterEvent(function ($type) use (&$select, &$config) {
                    $this->removeWidget($select->hide());
                    $config->set('script', 'winver', $type['id']);
                    $config->save();
                    app()->showConfig();
                });
            }

            if ('config_patches' === $item['id']) {
                $config->set('script', 'generation_patches_mode', $config->isGenerationPatchesMode() ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_esync' === $item['id']) {
                $config->set('export', 'WINEESYNC', $config->isEsync() ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_pba' === $item['id']) {
                $config->set('export', 'PBA_DISABLE', $config->isPBA() ? 1 : 0);
                $config->save();
                app()->showConfig();
            }

            if ('config_dxvk' === $item['id']) {
                $config->set('script', 'dxvk', $config->isDxvk() ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_d9vk' === $item['id']) {
                $config->set('script', 'd9vk', $config->isD9vk() ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_csmt' === $item['id']) {
                $config->set('script', 'csmt', $config->getBool('script', 'csmt') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_pulse' === $item['id']) {
                $config->set('script', 'pulse', $config->getBool('script', 'pulse') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_window_enable' === $item['id']) {
                $config->set('window', 'enable', $config->getBool('window', 'enable') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_dxvk_d3d10' === $item['id']) {
                $config->set('script', 'dxvk_d3d10', $config->getBool('script', 'dxvk_d3d10') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_faudio' === $item['id']) {
                $config->set('script', 'faudio', $config->getBool('script', 'faudio') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_dumbxinputemu' === $item['id']) {
                $config->set('script', 'dumbxinputemu', $config->getBool('script', 'dumbxinputemu') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_sandbox' === $item['id']) {
                $config->set('script', 'sandbox', $config->getBool('script', 'sandbox') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_fixres' === $item['id']) {
                $config->set('script', 'fixres', $config->getBool('script', 'fixres') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_autoupdate' === $item['id']) {
                $config->set('script', 'autoupdate', $config->isScriptAutoupdate() ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_dxvk_autoupdate' === $item['id']) {
                $config->set('script', 'dxvk_autoupdate', $config->isDxvkAutoupdate() ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_d9vk_autoupdate' === $item['id']) {
                $config->set('script', 'd9vk_autoupdate', $config->isD9vkAutoupdate() ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_faudio_autoupdate' === $item['id']) {
                $config->set('script', 'faudio_autoupdate', $config->getBool('script', 'faudio_autoupdate') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_dumbxinputemu_autoupdate' === $item['id']) {
                $config->set('script', 'dumbxinputemu_autoupdate', $config->getBool('script', 'dumbxinputemu_autoupdate') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_dxvk_version' === $item['id']) {

                app('start')->getUpdate()->downloadWinetricks();
                $winetricks = $config->getRootDir() . '/winetricks';

                if (file_exists($winetricks)) {

                    $versions = explode("\n", file_get_contents($winetricks));
                    $versions = array_filter($versions, function ($line) { return strpos($line, 'load_dxvk') !== false && strpos($line, 'load_dxvk()') === false; });
                    $versions = array_map(function ($line) { return str_replace('load_', '', trim($line, " \t\n\r\0\x0B(){}[].:")); }, $versions);
                    natsort($versions);
                    $versions = array_reverse($versions);
                    $versions = array_map(function ($row) { return ['id' => $row, 'name' => $row]; }, $versions);
                    $versions = array_merge([['id' => '', 'name' => 'latest']], $versions);

                    $select = $this->addWidget(new PopupSelectWidget($this->window));
                    $select
                        ->setItems($versions)
                        ->border()
                        ->setFullMode()
                        ->backAccess()
                        ->maxSize(null, 4)
                        ->offset($xy['x'], $xy['y'])
                        ->setActive(true)
                        ->show();
                    $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                    $select->onEnterEvent(function ($type) use (&$select, &$config) {
                        $this->removeWidget($select->hide());
                        $config->set('script', 'dxvk_version', $type['id']);
                        $config->save();
                        app()->showConfig();
                    });
                }
            }

            if ('config_d9vk_version' === $item['id']) {

                app('start')->getUpdate()->downloadWinetricks();
                $winetricks = $config->getRootDir() . '/winetricks';

                if (file_exists($winetricks)) {

                    $versions = explode("\n", file_get_contents($winetricks));
                    $versions = array_filter($versions, function ($line) { return strpos($line, 'load_d9vk') !== false && strpos($line, 'load_d9vk()') === false; });
                    $versions = array_map(function ($line) { return str_replace('load_', '', trim($line, " \t\n\r\0\x0B(){}[].:")); }, $versions);
                    natsort($versions);
                    $versions = array_reverse($versions);
                    $versions = array_map(function ($row) { return ['id' => $row, 'name' => $row]; }, $versions);
                    $versions = array_merge([['id' => '', 'name' => 'latest']], $versions);

                    $select = $this->addWidget(new PopupSelectWidget($this->window));
                    $select
                        ->setItems($versions)
                        ->border()
                        ->setFullMode()
                        ->backAccess()
                        ->maxSize(null, 4)
                        ->offset($xy['x'], $xy['y'])
                        ->setActive(true)
                        ->show();
                    $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                    $select->onEnterEvent(function ($type) use (&$select, &$config) {
                        $this->removeWidget($select->hide());
                        $config->set('script', 'd9vk_version', $type['id']);
                        $config->save();
                        app()->showConfig();
                    });
                }
            }

            if ('config_fix_focus' === $item['id']) {
                $config->set('fixes', 'focus', $config->getBool('fixes', 'focus') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_fix_nocrashdialog' === $item['id']) {
                $config->set('fixes', 'nocrashdialog', !$config->getBool('fixes', 'nocrashdialog') ? 1 : 0);
                $config->save();
                app()->showConfig();
            }

            if ('config_fix_cfc' === $item['id']) {
                $config->set('fixes', 'cfc', $config->getBool('fixes', 'cfc') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_fix_glsl' === $item['id']) {
                $config->set('fixes', 'glsl', $config->getBool('fixes', 'glsl') ? 0 : 1);
                $config->save();
                app()->showConfig();
            }

            if ('config_fix_ddr' === $item['id']) {
                $select = $this->addWidget(new PopupSelectWidget($this->window));
                $select
                    ->setItems([
                        ['id' => '',       'name' => 'default'],
                        ['id' => 'gdi',    'name' => 'gdi'],
                        ['id' => 'opengl', 'name' => 'opengl'],
                    ])
                    ->border()
                    ->setFullMode()
                    ->backAccess()
                    ->maxSize(null, 4)
                    ->offset($xy['x'], $xy['y'])
                    ->setActive(true)
                    ->show();
                $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                $select->onEnterEvent(function ($type) use (&$select, &$config) {
                    $this->removeWidget($select->hide());
                    $config->set('fixes', 'ddr', $type['id']);
                    $config->save();
                    app()->showConfig();
                });
            }

            if ('config_fix_orm' === $item['id']) {
                $select = $this->addWidget(new PopupSelectWidget($this->window));
                $select
                    ->setItems([
                        ['id' => '',           'name' => 'default'],
                        ['id' => 'fbo',        'name' => 'fbo'],
                        ['id' => 'backbuffer', 'name' => 'backbuffer'],
                    ])
                    ->border()
                    ->setFullMode()
                    ->backAccess()
                    ->maxSize(null, 4)
                    ->offset($xy['x'], $xy['y'])
                    ->setActive(true)
                    ->show();
                $select->onEscEvent(function () use (&$select) { $this->removeWidget($select->hide()); });
                $select->onEnterEvent(function ($type) use (&$select, &$config) {
                    $this->removeWidget($select->hide());
                    $config->set('fixes', 'orm', $type['id']);
                    $config->save();
                    app()->showConfig();
                });
            }

            app('start')->getConfig()->reload();
        });

        return $select;
    }

    public function pressKey($key) {}
}

abstract class AbstractWidget {

    protected $parentWindow;

    protected $window;
    protected $active = false;
    protected $visible = false;
    protected $change;
    protected $changeActive;
    protected $enter;
    protected $esc;
    protected $back = false;

    public function __construct($window)
    {
        $this->parentWindow = $window;
        $this->change       = [];
        $this->changeActive = [];
        $this->enter        = [];
        $this->esc          = [];
    }

    public function getWindow()
    {
        return $this->window;
    }

    public function getParentWindow()
    {
        return $this->parentWindow;
    }

    public function isActive()
    {
        if (!$this->isVisible()) {
            $this->active = false;
        }

        return $this->active;
    }

    public function setActive($flag = true)
    {
        $this->active = $flag;
        $this->doChangeActiveEvent($this->active, $this);

        return $this;
    }

    public function isVisible()
    {
        return $this->visible;
    }

    public function setVisible($flag = true)
    {
        $this->visible = $flag;
        return $this;
    }

    public function backAccess($flag = true)
    {
        $this->back = $flag;
        return $this;
    }

    public function refresh()
    {
        $this->getWindow()->reload();
        return $this;
    }

    public function show()
    {
        $this->visible = true;
        $this->render();

        return $this;
    }

    public function hide()
    {
        if ($this->visible) {
            $this->setVisible(false);
            $this->setActive(false);
            $this->getParentWindow()->reload();
            foreach (app()->getCurrentScene()->getWidgets() as $widget) {

                if ($widget->isVisible()) {
                    $widget->refresh();
                }
            }
        }

        return $this;
    }

    public function onChangeEvent($callback)
    {
        $this->change[] = $callback;
    }

    public function offChangeEvent($callback)
    {
        $this->change = array_filter($this->change, function ($item) use (&$callback) {return $item !== $callback;});
    }

    protected function doChangeEvent($v1, $v2 = null, $v3 = null)
    {
        foreach ($this->change as $change) {
            $change($v1, $v2, $v3);
        }
    }

    public function onEnterEvent($callback)
    {
        $this->enter[] = $callback;
    }

    public function offEnterEvent($callback)
    {
        $this->enter = array_filter($this->enter, function ($item) use (&$callback) {return $item !== $callback;});
    }

    protected function doEnterEvent($v1 = null, $v2 = null, $v3 = null)
    {
        foreach ($this->enter as $enter) {
            $enter($v1, $v2, $v3);
        }
    }

    public function onEscEvent($callback)
    {
        $this->esc[] = $callback;
    }

    public function offEscEvent($callback)
    {
        $this->esc = array_filter($this->esc, function ($item) use (&$callback) {return $item !== $callback;});
    }

    protected function doEscEvent($v1 = null, $v2 = null, $v3 = null)
    {
        foreach ($this->esc as $esc) {
            $esc($v1, $v2, $v3);
        }
    }

    public function onChangeActiveEvent($callback)
    {
        $this->changeActive[] = $callback;
    }

    public function offChangeActiveEvent($callback)
    {
        $this->changeActive = array_filter($this->changeActive, function ($item) use (&$callback) {return $item !== $callback;});
    }

    protected function doChangeActiveEvent($v1, $v2 = null, $v3 = null)
    {
        foreach ($this->changeActive as $event) {
            $event($v1, $v2, $v3);
        }
    }

    abstract public function pressKey($key);

    abstract public function render();

    public function destruct() {
        $this->change = [];
        $this->enter = [];
        $this->setActive(false);
        $this->setVisible(false);
    }
}

class SelectWidget extends AbstractWidget
{
    private $windowBorder = false;
    private $index = 0;
    private $items;
    private $width;
    private $height;
    private $x = 2;
    private $y = 1;

    public function init()
    {
        if (null === $this->window) {

            $width = 0;

            foreach ($this->items as $item) {
                if ($width < ($len = mb_strlen($item['name']))) {
                    $width = $len;
                }
            }

            $width += 5;
            $width = ($width > 20 ? $width : 20);

            $this->window = new \NcursesObjects\Window($width, count($this->items) + 2, $this->x, $this->y);
        }

        if ($this->windowBorder) {
            $this->window->border();
        }
    }

    public function border($flag = true)
    {
        $this->windowBorder = $flag;

        return $this;
    }

    public function size($width, $height)
    {
        $this->width  = $width;
        $this->height = $height;

        return $this;
    }

    public function getWidth()
    {
        $this->window->getSize($width, $height);
        return $this->windowBorder ? $width + 2 : $width;
    }

    public function getHeight()
    {
        $this->window->getSize($width, $height);
        return $this->windowBorder ? $height + 2 : $height;
    }

    public function offset($x, $y)
    {
        $this->x = $x;
        $this->y = $y;

        return $this;
    }

    public function setItems($items)
    {
        $this->items = $items;
        return $this;
    }

    public function render()
    {
        $this->init();

        foreach ($this->items as $i => $item) {
            if ($this->index === $i) {
                $this->window->moveCursor(2, 1 + $i)->drawStringHere($item['name'], NCURSES_A_REVERSE);
            } else {
                $this->window->moveCursor(2, 1 + $i)->drawStringHere($item['name']);
            }
        }

        $this->window->refresh();
    }

    public function selectAt($index)
    {
        if (count($this->items) <= $index || 0 > $index) {
            return false;
        }

        $this->index = $index;

        $this->doChangeEvent($this->getItem());

        return true;
    }

    public function itemAt($index)
    {
        if (count($this->items) <= $index || 0 > $index) {
            return reset($this->items);
        }

        return $this->items[$this->index];
    }

    public function getItem()
    {
        return $this->itemAt($this->index);
    }

    public function selectNext()
    {
        if ($this->selectAt($this->index + 1)) {
            $this->render();
            return false;
        }

        return false;
    }

    public function selectPrev()
    {
        if ($this->selectAt($this->index - 1)) {
            $this->render();
            return false;
        }

        return false;
    }

    public function pressKey($key)
    {
        if (\NcursesObjects\Keys::KEY_DOWN === $key) {
            $this->selectNext();
        }

        if (\NcursesObjects\Keys::KEY_UP === $key) {
            $this->selectPrev();
        }

        if (\NcursesObjects\Keys::KEY_ENTER === $key) {
            $this->doEnterEvent($this->getItem());
            return false;
        }
    }
}

class InfoWidget extends AbstractWidget {

    private $data;

    private $windowPrint;

    private $callback;

    public function init()
    {
        if (null === $this->window) {
            $windowWidth  = $this->getParentWindow()->getWidth();
            $windowHeight = $this->getParentWindow()->getHeight();

            $menuWidth  = $this->data->getWidth();
            $menuHeight = $this->data->getHeight();

            $this->window = new \NcursesObjects\Window($windowWidth - $menuWidth - 3, $windowHeight - 2, $menuWidth + 1, 1);
        }

        if (null === $this->windowPrint) {
            $this->windowPrint = new PrintWidget($this->window);
        }
    }

    public function setData($data)
    {
        $this->data = $data;
        return $this;
    }

    public function getData()
    {
        return $this->data;
    }

    public function refresh()
    {
        parent::refresh();
        $this->windowPrint->refresh();
    }

    public function render()
    {
        $this->init();

        $window = $this->window;

        $callback = function ($item) use (&$window) {
            if ('start' === $item['id']) {

                $config  = $item['config'];
                $update  = app('start')->getUpdate();
                $command = app('start')->getCommand();
                $network = app('start')->getNetwork();

                if (!$config) {
                    return;
                }

                $window->erase()->border()->title($config->getGameTitle());

                $fullPath = implode('/', array_filter([$config->getGamePath(), $config->getGameAdditionalPath(), $config->getGameExe()]));

                $dxvk = new DXVK($config, $command, $network);
                $d9vk = new D9VK($config, $command, $network, app('start')->getFileSystem(), app('start')->getWine());

                $items = [
                    'File:    ' . basename($config->getConfigFile()),
                    "Path:    \"C:/{$fullPath}\" ". $config->getGameArgs(),
                    'Version: ' . $config->getGameVersion(),
                    'Windows: ' . $config->getWindowsVersion(),
                    'Sandbox: ' . ($config->isSandbox() ? 'on' : 'off'),
                    'Sound:   ' . ($config->isPulse() ? 'pulse' : 'alsa'),
                    'CSMT:    ' . ($config->isCsmt() ? 'on' : 'off'),
                    'DXVK:    ' . ($config->isDxvk() ? 'on ' . (($version = $dxvk->version()) ? "({$version})" : '') : 'off'),
                    'D9VK:    ' . ($config->isD9vk() ? 'on ' . (($version = $d9vk->version()) ? "({$version})" : '') : 'off'),
                    'PBA:     ' . ($config->isPBA() ? 'on' : 'off'),
                    'Esync:   ' . ($config->isEsync() ? 'on' : 'off'),
                ];

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('wine' === $item['id']) {
                $window->erase()->border()->title($item['name']);

                $config  = app('start')->getConfig();
                $monitor = app('start')->getMonitor();
                $wine    = new Wine($config, app('start')->getCommand());

                $items = [
                    'Utilities: Config, File Manager, Regedit.',
                    '',
                ];

                $sysWine = $wine->isUsedSystemWine() ? 'Used system wine!' : null;

                $versinPrefix = $config->versionPrefix();

                if ($versinPrefix && $versinPrefix !== $wine->version()) {
                    $items = array_merge(
                        $items,
                        [
                            '!!! Warning !!!',
                            "This prefix ({$versinPrefix}) is incompatible with the current used wine!",
                            '',
                        ]
                    );
                }

                if ($sysWine) {
                    $items = array_merge($items, [$sysWine, '']);
                }

                $items = array_merge(
                    $items,
                    [
                        'Version:   ' . $wine->version(),
                        'Arch:      ' . $config->getWineArch(),
                    ]
                );

                if ($output = $monitor->getDefaultMonitor()) {
                    $items = array_merge($items, ["Monitor:   {$output['output']} ({$output['resolution']}) primary"]);
                }

                if ($miss = $wine->getMissingLibs()) {
                    $items = array_merge($items, ['', 'Missing libs:'], $miss);
                }

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('tools' === $item['id']) {

                $window->erase()->border()->title($item['name']);

                $items = [
                    'Utilities:',
                    '',
                    ' - Create\Remove Icon',
                    ' - Pack\Unpack "wine" or "data" folder',
                    ' - Replace "data" folder to symlinks',
                    ' - Build',
                    ' - Reset game files',
                ];

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('config' === $item['id']) {

                $window->erase()->border()->title($item['name']);

                $items = [
                    'Configuration',
                ];

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('tweaks' === $item['id']) {

                $window->erase()->border()->title($item['name']);

                $items = [
                    '- Hardware info',
                    '- System info',
                    '- Performance tweaks',
                ];

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('sys_info' === $item['id']) {

                $window->erase()->border()->title($item['name']);

                $system = app('start')->getSystem();
                $driver = app('start')->getDriver()->getVersion();

                $items = [
                    'Distr:            ' . $system->getDistrName(),
                    'Arch:             ' . $system->getArch(),
                    'Linux:            ' . $system->getLinuxVersion(),
                    'GPU Driver:       ' . implode(', ', array_filter($driver)),
                    'Glibc:            ' . $system->getGlibcVersion(),
                    'X.Org version:    ' . $system->getXorgVersion(),
                    'vm.max_map_count: ' . $system->getVmMaxMapCount(),
                    'ulimit soft:      ' . $system->getUlimitSoft(),
                    'ulimit hard:      ' . $system->getUlimitHard(),
                ];

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('hw_info' === $item['id']) {

                $window->erase()->border()->title($item['name']);

                $system = app('start')->getSystem();

                $items = [
                    'RAM:      ' . $system->getRAM() . ' Mb',
                    'Free RAM: ' . $system->getFreeRAM() . ' Mb',
                    'CPU:      ' . $system->getCPU(),
                    'GPU:      ' . $system->getGPU(),
                ];

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('cpu_mode' === $item['id']) {

                $window->erase()->border()->title($item['name']);

                $system = app('start')->getSystem();

                $items = [];
                $title = false;
                $performance = false;
                foreach ($system->getCpuFreq() as $cpu) {
                    if ($title === false) {
                        $title = true;
                        $items[] = $cpu['name'];
                        $items[] = '';
                    }

                    if ($performance === false && $cpu['mode'] === 'performance') {
                        $performance = true;
                    }

                    $items[] = "CPU {$cpu['id']}: {$cpu['freq']} ({$cpu['mode']})";
                }

                if (!$performance) {
                    $items[] = '';
                    $items[] = 'Recommended change CPU mode to "performance".';
                }

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('dependencies' === $item['id']) {

                $window->erase()->border()->title($item['name']);

                $items = [
                    'See file "~/game_info/logs/dependencies.log"',
                ];

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('exit' === $item['id']) {

                $window->erase()->border()->title($item['name']);

                $items = [
                    'Close this application.',
                ];

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('back' === $item['id']) {

                $window->erase()->border()->title($item['name']);

                $items = [
                    'Return to main menu.',
                ];

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('icon' === $item['id']) {

                $window->erase()->border()->title($item['name']);

                $items = [
                    'Create or remove icon file.',
                    '',
                    'Found icons dir:',
                    app('start')->getIcon()->findDir(),
                ];

                $icons = app('start')->getIcon()->findExistIcons();

                if ($icons) {
                    $items = array_merge(
                        $items,
                        ['', 'Found icons:'],
                        $icons
                    );
                }

                $icons = app('start')->getIcon()->findPng();

                if ($icons) {
                    $items = array_merge(
                        $items,
                        ['', 'Found png:'],
                        $icons
                    );
                }

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('pack' === $item['id']) {

                $window->erase()->border()->title($item['name']);

                $items = [
                    'Compressed "data" and "wine" folders.',
                ];

                if ($mountes = app('start')->getPack()->getMountes()) {
                    $items = array_merge(
                        $items,
                        ['', 'Mounted:'],
                        $mountes
                    );
                }

                $window->refresh();

                $this->windowPrint->padding(1, 1)->dotMode(false)->update($items);

            } elseif ('symlink' === $item['id']) {

                $window->erase()->border()->title($item['name']);
                $config = app('start')->getConfig();
                $fs     = app('start')->getFileSystem();

                $items = [
                    'Replace with a symbolic link from dir RW mode',
                    '',
                    './' . $fs->relativePath($config->getDataDir()) . '
    public function getConfig()
    {
        return $this->config;
    }

    public function setConfig($config)
    {
        $this->config = $config;
    }

    public function getCommand()
    {
        return $this->command;
    }

    public function getSystem()
    {
        return $this->system;
    }

    public function getWinePrefix()
    {
        return $this->winePrefix;
    }

    public function getGameInfo()
    {
        return $this->gameInfo;
    }

    public function getLog()
    {
        return $this->log;
    }

    public function getUpdate()
    {
        return $this->update;
    }

    public function getMonitor()
    {
        return $this->monitor;
    }

    public function getBuffer()
    {
        return $this->buffer;
    }

    public function getIcon()
    {
        return $this->icon;
    }

    public function getFileSystem()
    {
        return $this->fs;
    }

    public function getMountes()
    {
        return $this->mountes;
    }

    public function getPack()
    {
        return $this->pack;
    }

    public function getSymlink()
    {
        return $this->symlink;
    }

    public function getBuild()
    {
        return $this->build;
    }

    public function getWine()
    {
        return $this->wine;
    }

    public function setWine($wine)
    {
        $this->wine = $wine;
    }

    public function getConsole()
    {
        return $this->console;
    }

    public function getShapshot()
    {
        return $this->shapshot;
    }

    public function getPatch()
    {
        return $this->patch;
    }

    public function getReplaces()
    {
        return $this->replaces;
    }

    public function getRegistry()
    {
        return $this->registry;
    }

    public function getEvent()
    {
        return $this->event;
    }

    public function getPlugins()
    {
        return $this->plugins;
    }

    public function getDriver()
    {
        return $this->driver;
    }

    public function getNetwork()
    {
        return $this->network;
    }
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
}
