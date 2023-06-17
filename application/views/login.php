<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    
    <?php echo validation_errors(); ?>
    
    <?php echo form_open('dashboard/login'); ?>
    
    <label for="email">Email</label>
    <input type="email" name="email" id="email" value="<?php echo set_value('email'); ?>">
    
    <label for="password">Password</label>
    <input type="password" name="password" id="password">
    
    <button type="submit">Login</button>
    
    <?php echo form_close(); ?>
</body>
</html>
