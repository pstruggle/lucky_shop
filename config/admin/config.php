<?php
return [
    'default_module'         => 'admin',
    'deny_module_list'       => ['common','index'],
    'cookie'                 => [
        //管理员的cookie 名称前缀
        'mprefix'    => 'wwmerchant_',
        // cookie 名称前缀
        'prefix'    => 'wwadmin_',
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