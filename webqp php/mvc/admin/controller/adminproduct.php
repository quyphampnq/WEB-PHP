<?php
class AdminProduct extends AdminController{
    public function productList($limit=LIMIT,$offset=0)
    {
    //yeu cau model thuc hien
    $adminproductmodel=new AdminProductModel;
    $data=$adminproductmodel->productList($limit,$offset);
    //gui di lieu cho view
    $this->loadAdminView('adminmaster1','adminproduct/productList', $data);
    }
    public function productListIntrash($limit=LIMIT,$offset=0)
    {
    //yeu cau model thuc hien
    $adminproductmodel=new AdminProductModel;
    $data=$adminproductmodel->productListIntrash($limit,$offset);
    //gui di lieu cho view
    $this->loadAdminView('adminmaster1','adminproduct/productListintrash', $data);
    }
    public function productToggleTrash($productid)
    {
        $adminproductmodel=new AdminProductModel;
        $data=$adminproductmodel->toggleTrash($productid);
    }
    public function productToggleStatus($productid)
    {
        $adminproductmodel=new AdminProductModel;
        $data=$adminproductmodel->toggleStatus($productid);
    }
    public function addproduct()
    {
        //xu ly du lieu nhan duoc
            if(isset($_POST['submit']))
            {
                $adminproductmodel=new AdminProductModel;
                $adminproductmodel->doAddProduct();
            }

        $catmodel=new AdminCategoryModel;
        $data['cats']=$catmodel->getAll(['trash'=>0, 'status'=>1]);
        $brandmodel=new AdminBrandModel;
        $data['brands']=$brandmodel->getAll(['trash'=>0, 'status'=>1]);
        $this->loadAdminView('adminmaster1','adminproduct/addproduct',$data);
    }
    public function UpdateProduct($productId)
    {
       //xu ly du lieu nhan duoc

        $adminproductmodel=new AdminproductModel;
            if(isset($_POST['submit']))
            {
                $adminproductmodel=new AdminProductModel;
                $adminproductmodel->doUpdateProduct($productId);
            }
            
        $catmodel=new AdminCategoryModel;
        $data['cats']=$catmodel->getAll(['trash'=>0, 'status'=>1]);
        $brandmodel=new AdminBrandModel;
        $data['brands']=$brandmodel->getAll(['trash'=>0, 'status'=>1]);
        $data['oldproduct']=$adminproductmodel->get(['productId'=>$productId]);
        $this->loadAdminView('adminmaster1','adminproduct/updateproduct',$data);
    }
}
?>