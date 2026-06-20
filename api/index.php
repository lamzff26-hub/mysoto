<?php

// Set the base path for Laravel
define('LARAVEL_START', microtime(true));

// Change to the public directory when running on Vercel
chdir(__DIR__ . '/../public');

// Load the Laravel application
require __DIR__ . '/../public/index.php';
