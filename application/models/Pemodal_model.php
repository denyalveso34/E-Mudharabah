<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pemodal_model extends CI_Model {
    
    public function getStatusPemodalan() {

        $this->db->where('pemodal_id', $this->session->userdata('user_id'));
        return $this->db->get('pemodalan')->result_array();
    }
    
    public function getRiwayatMutasiPencairan() {

        $this->db->where('pemodal_id', $this->session->userdata('user_id'));
        return $this->db->get('pemodalan')->result_array();
    }
    
    public function getRiwayatPenjualanMitra() {

        $this->db->where('pemodal_id', $this->session->userdata('user_id'));
        return $this->db->get('penjualan_mitra')->result_array();
    }
    
    public function getProfilePemodal() {

        $this->db->where('id', $this->session->userdata('user_id'));
        return $this->db->get('pemodal')->row_array();
    }
    
}
