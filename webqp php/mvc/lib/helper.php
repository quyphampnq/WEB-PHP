<?php 
class Helper{

    public function to_alias($str) {
        $str = trim(mb_strtolower($str));
        $str = preg_replace('/(à|á|ạ|ả|â|ầ|ấ|ậ|ẩ|ẫ|ã|ằ|ắ|ặ|ẳ|ẵ)/', 'a', $str);
        $str = preg_replace('/(è|é|ẹ|ẽ|ê|ề|ế|ệ|ể|ễ)/', 'e', $str);
        $str = preg_replace('/(ì|í|ị|ỉ|ĩ)/', 'i', $str);
        $str = preg_replace('/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/', 'o', $str);
        $str = preg_replace('/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/', 'u', $str);
        $str = preg_replace('/(ỳ|ý|ỵ|ỷ|ỹ)/', 'y', $str);
        $str = preg_replace('/(đ)/', 'd', $str);
        $str = preg_replace('/[^a-z0-9-\s]/', '', $str);
        $str = preg_replace('/([\s]+)/', '-', $str);
        return $str;
    }

    public function doUpload($inputFileUpload)
    {
        //kiem tra
        $_SESSION['msg']='';
        if ($_FILES[$inputFileUpload]['error'] !=0)
        $_SESSION['msg'].= "Dữ liệu không đúng cấu trúc, Dữ liệu upload bị lỗi hoặc chưa chọn file upload";
        else{
            //đã có dữ liệu upload, thực hiện xử lý file upload
            //thư mục bạn sẽ lưu file upload
            $target_dir     = "public/upload/";
            //vi tri file luu trong sever
            $target_file     = $target_dir . basename($_FILES[$inputFileUpload]["name"]);
            $allowUpload    = true;
            //lay phan mo rong file
            $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
            //co lon nhat dc upload
            $maxfilesize    = 800000;
            //nhung file dc phep upload
            $allowtypes     = array('jpg', 'png', 'jpeg', 'gif');
            if(isset($_POST["submit"])) {
                //kt anh
                $check = getimagesize($_FILES[$inputFileUpload]["tmp_name"]);
            if($check !== false){
                $_SESSION['msg'].="Đây là file ảnh - " . $check["mime"] . ".<br>";
                $allowUpload = true;
            }
            else {
                $_SESSION['msg'].="Không phải file ảnh .<br>";
                $allowUpload = false;
            }
            }
            //kt neu file ton tai thi k cho phep ghi de
            // ban co the phat trien code de luu thanh mot file khac
            if (file_exists($target_file))
            {
                $_SESSION['msg'].="Tên file đã tồn tại trên sever, không được ghi đè<br>";
                $allowUpload =false;
            }
            //kt kich thuoc file upload
            if ($_FILES[$inputFileUpload]["size"] > $maxfilesize)
            {
                $_SESSION['msg'].="Không được upload ảnh lớn hơn $maxfilesize (bytes).<br>";
                $allowUpload = false;
            }
            //kt kieu file
            if (!in_array($imageFileType,$allowtypes ))
            {
                $_SESSION['msg'].="Chỉ được upload các dạng JPG, PNG, JPEG, GIF<br>";
                $allowUpload = false;
            }
            if ($allowUpload)
            {
                //xu ly di chuyen file tam ra thu muc can luu tru
                if (move_uploaded_file($_FILES["inputFileUpload"]["tmp_name"], $target_file))
                {
                    $_SESSION['msg'].="/public/upload/". basename( $_FILES["inputFileUpload"]["name"])." Đã upload thành công.<br>";
                    $_SESSION['msg'].= "file lưu tại " . $target_file.'<br>';
                    return true;
                }
                else
                {
                    $_SESSION['msg'].="Có lỗi xảy ra khi upload file.<br>";
                    return false;
                }
            }
            else{
                $_SESSION['msg'].="Không upload được file, có thể do file lớn, kiểu file không đúng...";
                return false;
            }
        }
    }
}
?>