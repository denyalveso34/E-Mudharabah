<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Konsultan extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
        $this->load->model('konsultan_model');
        $this->load->library('session');
    }
    
    public function analisis_pengajuan_umkm() {

    }
    
    public function analisis_pengajuan_pemodalan() {

    }
    
    public function hasil_pengajuan() {

    }
    
}
