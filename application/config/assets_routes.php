<?php
defined('BASEPATH') OR exit('No direct script access allowed');


$obj =& get_instance();

$base_url = $obj->config->item('base_url');

$config['css'] = $base_url.'assets/css/';
$config['js'] = $base_url.'assets/js/';
$config['img'] = $base_url.'assets/img/';
$config['svg'] = $base_url.'assets/svg/';
$config['vendor-css'] = $base_url.'assets/vendor/css/';
$config['vendor-js'] = $base_url.'assets/vendor/js/';
$config['vendor-fonts'] = $base_url.'assets/vendor/fonts/';
$config['vendor-libs'] = $base_url.'assets/vendor/libs/';