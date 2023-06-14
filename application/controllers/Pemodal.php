<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pemodal extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
        $this->load->model('pemodal_model');
        $this->load->library('session');
    }
    
    public function ajukan_pemodalan() {

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            
        } else {
            
            $this->load->view('pemodal/ajukan_pemodalan');
        }
    }
    
    public function status_pemodalan() {
        
        $data['status'] = $this->pemodal_model->getStatusPemodalan();
        $this->load->view('pemodal/status_pemodalan', $data);
    }
    
    public function riwayat_mutasi_pencairan() {
        
        $data['riwayat'] = $this->pemodal_model->getRiwayatMutasiPencairan();
        $this->load->view('pemodal/riwayat_mutasi_pencairan', $data);
    }
    
    public function mitra_umkm() {
        
        $data['riwayat'] = $this->pemodal_model->getRiwayatPenjualanMitra();
        $this->load->view('pemodal/mitra_umkm', $data);
    }
    
    public function akun_profile() {
        
        $data['profile'] = $this->pemodal_model->getProfilePemodal();
        $this->load->view('pemodal/akun_profile', $data);
    }
    
}
