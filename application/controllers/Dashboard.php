<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->library('session');
        $this->load->library('form_validation');
    }
    
    public function index() {
        // Memeriksa apakah pengguna sudah login
        if (!$this->session->userdata('user_id')) {
            redirect('dashboard/login'); // Jika belum login, redirect ke halaman login
        }
        
        // Mengambil data user dari database berdasarkan user_id di session
        $user_id = $this->session->userdata('user_id');
        $user = $this->user_model->get_user($user_id);
        
        // Menampilkan halaman dashboard dengan data user
        $data['user'] = $user;
        $this->load->view('dashboard', $data);
    }
    
    public function register() {
        // Memvalidasi input form registrasi
        $this->form_validation->set_rules('name', 'Name', 'required');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email|is_unique[users.email]');
        $this->form_validation->set_rules('password', 'Password', 'required|min_length[6]');
        
        if ($this->form_validation->run() == FALSE) {
            // Jika validasi gagal, tampilkan halaman registrasi dengan pesan error
            $this->load->view('register');
        } else {
            // Jika validasi sukses, simpan data pengguna ke database
            $data = array(
                'name' => $this->input->post('name'),
                'email' => $this->input->post('email'),
                'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
                'role' => 'pemodal' // Atur role pengguna sesuai kebutuhan
            );
            
            // Panggil model untuk menyimpan data pengguna ke database
            $this->user_model->register_user($data);
            
            // Set pesan sukses registrasi
            $this->session->set_flashdata('success', 'Registrasi berhasil. Silakan login.');
            
            // Redirect ke halaman login
            redirect('dashboard/login');
        }
    }
    
    public function login() {
        // Memvalidasi input form login
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email');
        $this->form_validation->set_rules('password', 'Password', 'required');
        
        if ($this->form_validation->run() == FALSE) {
            // Jika validasi gagal, tampilkan halaman login dengan pesan error
            $this->load->view('login');
        } else {
            // Jika validasi sukses, cek kecocokan email dan password di database
            $email = $this->input->post('email');
            $password = $this->input->post('password');
            
            $user = $this->user_model->get_user_by_email($email);
            
            if ($user && password_verify($password, $user['password'])) {
                // Jika email dan password cocok, simpan user_id ke dalam session
                $this->session->set_userdata('user_id', $user['id']);
                
                // Redirect ke halaman dashboard
                redirect('dashboard');
            } else {
                // Jika email atau password salah, tampilkan pesan error
                $data['error'] = 'Email atau password salah';
                $this->load->view('login', $data);
            }
        }
    }
    
}
