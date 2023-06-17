<!DOCTYPE html>
<html>
<head>
    <title>Registrasi</title>
</head>
<body>
    <h1>Registrasi</h1>
    
    <?php echo validation_errors(); ?>
    
    <?php echo form_open('dashboard/register'); ?>
    
    <label for="name">Nama</label>
    <input type="text" name="name" id="name" value="<?php echo set_value('name'); ?>">
    
    <label for="email">Email</label>
    <input type="email" name="email" id="email" value="<?php echo set_value('email'); ?>">
    
    <label for="password">Password</label>
    <input type="password" name="password" id="password">
    
    <button type="submit">Daftar</button>
    
    <?php echo form_close(); ?>
</body>
</html>
