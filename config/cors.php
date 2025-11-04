<?php

return [
    'paths' => [
        'api/*',
        'storage/*',  // <== WAJIB agar Flutter bisa load file dari /storage
        'sanctum/csrf-cookie',
    ],

    'allowed_methods' => ['*'],

    'allowed_origins' => ['*'], // saat production, bisa dibatasi misalnya ['https://kanwilntb.go.id']
    'allowed_origins_patterns' => [],

    'allowed_headers' => ['*'],
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => true,
];
