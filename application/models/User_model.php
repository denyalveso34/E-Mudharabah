<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model {
    
    public function get_user($user_id) {
        // Mengambil data user dari database berdasarkan ID
        // Implementasikan logika query ke database di sini
        $this->db->select('*');
        $this->db->from('users');
        $this->db->where('id', $user_id);
        $query = $this->db->get();
        
        return $query->row_array();
    }
    
}
