<?php
    include "TopSdk.php";
    date_default_timezone_set('Asia/Shanghai'); 

    $httpdns = new HttpdnsGetRequest;
    $client = new ClusterTopClient("24523079","e95e639fc56ac076a90cdda5fd2c4958");
    $client->gatewayUrl = "http://api.daily.taobao.net/router/rest";
    var_dump($client->execute($httpdns,"6100e23657fb0b2d0c78568e55a3031134be9a3a5d4b3a365753805"));

?>