<?php
class Controller{
    public function home()
    {
        echo "đay là trang home controler";
    }
    protected function loadView($master, $viewname, $data){
        require_once PATH_TO_VIEW.strtolower($master).'.php';
    }
}
?>