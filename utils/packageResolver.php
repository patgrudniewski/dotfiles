#! /usr/bin/php
<?php

$system = strtolower($argv[1]);
$package = $argv[2];

$mapping = array(
    'amazon' => array(
        'python3-pip' => 'python36-pip',
    ),
);

$distMapping = array_key_exists($system, $mapping) ? $mapping[$system] : array();

echo array_key_exists($package, $distMapping) ? $distMapping[$package] : $package;
