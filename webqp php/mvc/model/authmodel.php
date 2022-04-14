<?php
class AuthModel extends BaseModel{
protected $table=DB_PREFIX.'admin';
public function adminLogin()
{
    //
    $username=$_POST['inputUsername'];
    $password=md5(md5($_POST['inputPassword']));
    //lay user tu admin
    $u=$this->get(['username'=>$username,'trash'=>0]);
    //

    if(isset($u)&&($u['pass']==$password))
    {
        $_SESSION['username']=$username;
        $_SESSION['level']=$u['level'];
        header('Location:'.BASE_URL.'dashboard/home');
    }
    else
    {
        $_SESSION['msg']='Dang Nhap That Bai';
        header('location:'.BASE_URL.'auth/adminLogin');
        exit;
    }
}

}
?>