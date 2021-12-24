<?php
use Monolog\Logger;
use Monolog\Handler\RotatingFileHandler;

class Log {

    private static $log = null;

    public static function getInterface() {

        if(is_null(self::$log)) {
            $log = new Logger('app');
            $log->pushHandler(new RotatingFileHandler(__DIR__.'/logs/access.log'));
            self::$log = $log;
        }
        return self::$log;
    }
}