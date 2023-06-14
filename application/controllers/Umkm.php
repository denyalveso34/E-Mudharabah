<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Umkm extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
        $this->load->model('umkm_model');
        $this->load->library('session');
    }
    
    public function ajukan_bisnis_umkm() {

    }
    
    public function status_pemodalan() {

    }
    
    public function riwayat_mutasi_penerimaan_dana() {

    }
    
    public function kemajuan_usaha_umkm() {

    }
    
    public function akun_profile() {

    }
    
}
