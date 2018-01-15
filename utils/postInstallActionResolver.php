#! /usr/bin/php
<?php

$package = $argv[1];

$mapping = array(
    'python3-pip' => "which pip3 &> /dev/null; if [ $? != '0' ]; then sudo ln -s /usr/bin/pip /usr/bin/pip3; fi",
);

echo @$mapping[$package];
