<?php

if (!function_exists('app')) {
    /**
     * @param null|Start $type
     * @return ControllerGUI|Start
     */
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
        $file = is_string($config) ? $config : $config->getLogsDir() . '/debug.log';

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

            $trace = preg_replace('/^#0\s+' . __FUNCTION__ . "[^\n]*\n/", '', $trace, 1);
            $trace = preg_replace('/^#(\d+)/me', '\'#\' . ($1 - 1)', $trace);
            $trace = implode("\n", array_map(function ($n) {
                list($a) = explode('called at', $n);
                return trim($a);
            }, explode("\n", $trace)));
        } else {
            $trace = $text;
        }

        file_put_contents($file, "{$trace}\n\n", FILE_APPEND);
        return "{$trace}\n\n";
    }
}

if (!function_exists('startsWith')) {
    /**
     * @param string       $haystack
     * @param array|string $needle
     *
     * @return bool
     */
    function startsWith($haystack, $needle) {
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
    /**
     * @param string       $haystack
     * @param array|string $needle
     *
     * @return bool
     */
    function endsWith($haystack, $needle) {
        if (is_array($needle)) {
            foreach ($needle as $str) {
                if (substr($haystack, -strlen($str)) === $str) {
                    return true;
                }
            }
            return false;
        }
        return (string)$needle === "" || substr($haystack, -strlen($needle)) === $needle;
    }
}
