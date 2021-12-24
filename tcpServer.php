<?php

include 'vendor/autoload.php';
include 'Log.php';

$server = new Swoole\Server('0.0.0.0', 9501);

$server->on('Connect', function($server, $fd){
    echo "connect\n";
});


//监听数据接收事件
$server->on('Receive', function ($server, $fd, $reactor_id, $data) {
    Log::getInterface()->info($data);
    $server->send($fd, "success");		
    //$server->send($fd, "Server: {$data}");
});

//监听连接关闭事件
$server->on('Close', function ($server, $fd) {
    echo "Client: Close.\n";
});


//一键协程化
Co::set(['hook_flags' => SWOOLE_HOOK_ALL]);
//启动服务器
$server->start(); 
