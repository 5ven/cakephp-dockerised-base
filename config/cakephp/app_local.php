<?php

return [
    'debug' => env('DEBUG'),
    'Security' => [
        'salt' => env('SECURITY_SALT', '32490ikop9we048239jfmksg345453te45erghyde'),
    ],
    'Datasources' => [
        'default' => [
            'host' => env('MYSQL_HOST'),
            'username' => env('MYSQL_USER'),
            'password' => env('MYSQL_PASSWORD'),
            'database' => env('MYSQL_DATABASE'),
            'url' => env('DATABASE_URL', null),
        ],
    ],
    'EmailTransport' => [
        'default' => [
            'host' => 'localhost',
            'port' => 25,
            'username' => null,
            'password' => null,
            'client' => null,
            'url' => env('EMAIL_TRANSPORT_DEFAULT_URL', null),
        ],
    ],
];