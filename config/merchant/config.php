<?php
return [
    'default_module'         => 'merchant',
    'deny_module_list'       => ['common','index'],
    'cookie'                 => [
        // cookie 名称前缀
        'prefix'    => 'wwmerchant_',
        // cookie 保存时间
        'expire'    => 3600,
        // cookie 保存路径
        'path'      => '/',
        // cookie 有效域名
        'domain'    => '',
        //  cookie 启用安全传输
        'secure'    => false,
        // httponly设置
        'httponly'  => '',
        // 是否使用 setcookie
        'setcookie' => true,
    ],

];