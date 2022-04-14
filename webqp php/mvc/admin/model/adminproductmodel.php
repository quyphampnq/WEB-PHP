<?php
	class AdminProductModel extends AdminModel{
		protected $table=DB_PREFIX.'product';
		protected $field=['productName','alias','catId','brandId','img','trash','status','detail','price','salePrice'];
		protected $key='productId';
	//Cac funtion can thiet
	public function productList($limit,$offset){
		//lay ds sp
		$data['products']=$this->getAllLimit(['trash'=>0],$limit,$offset);
		//Tinh tong so san pham
		$totalRecords=count($this->getAll(['trash'=>0]));
		//chuan bi paging
		$data['paging']=new Paging('adminproduct/productList/',$totalRecords,$limit,$offset);
		return $data;
	}
	public function productListInTrash($limit,$offset){
		//lay ds sp
		$data['products']=$this->getAllLimit(['trash'=>1],$limit,$offset);
		//Tinh tong so san pham
		$totalRecords=count($this->getAll(['trash'=>1]));
		//chuan bi paging
		$data['paging']=new Paging('adminproduct/productListIntrash/',$totalRecords,$limit,$offset);
		return $data;
	}
	public function toggleTrash($productid)
	{
		if($this->toggle('trash', $productid))
		$_SESSION['msg']="Thuc hien thanh cong";
		else
		$_SESSION['msg']="Thuc hien that bai";
		header("location:".BASE_URL."adminproduct/productList/".LIMIT."/0");
	}

	public function toggleStatus($productid)
	{
		if($this->toggle('status', $productid))
		$_SESSION['msg']="Thuc hien thanh cong";
		else
		$_SESSION['msg']="Thuc hien that bai";
		header("location:".BASE_URL."adminproduct/productList/".LIMIT."/0");
	}
	public function doAddProduct()
	//lay du lieu sp moi
	{
	
	$newpro['productName']=$_POST['inputProductName'];
	$newpro['alias']=$_POST['inputAlias'];
	$newpro['catid']=$_POST['inputCatid'];
	$newpro['brandid']=$_POST['inputBrandid'];
	$newpro['img']=basename($_FILES['inputFileUpload']['name']);
	$newpro['trash']=0;
	$newpro['status']=$_POST['inputStatus'];
	$newpro['detail']=$_POST['inputDetail'];
	$newpro['price']=$_POST['inputPrice'];
	$newpro['salePrice']=$_POST['inputSalePrice'];

	//tao chuoi alias
		$helper=new Helper;
		if($newpro['alias']=='')$newpro['alias']=$helper->to_alias($newpro['productName']);
		//kiem loi
		$_SESSION['msg']='';

		if($newpro['price']<$newpro['salePrice'])
		$_SESSION['msg'].='Giá sale phải nhỏ hơn giá bán';
		else
		{
			$uploadSuccess=$helper->doUpload('inputFileUpload');
			if($uploadSuccess)
			{
				if($this->insert($newpro)) $_SESSION['msg'].='Thêm sản phẩm thành công';
				else $_SESSION['msg'].='Thêm sản phẩm thất bại';
			}
		}
	}
		public function doUpdateProduct($productId)
		//lay du lieu sp moi
		{
		
		$newpro['productName']=$_POST['inputProductName'];
		$newpro['alias']=$_POST['inputAlias'];
		$newpro['catid']=$_POST['inputCatid'];
		$newpro['brandid']=$_POST['inputBrandid'];

		$newpro['trash']=$_POST['inputTrash'];
		$newpro['status']=$_POST['inputStatus'];
		$newpro['detail']=$_POST['inputDetail'];
		$newpro['price']=$_POST['inputPrice'];
		$newpro['salePrice']=$_POST['inputSalePrice'];
	
		//tao chuoi alias
			$helper=new Helper;
			if($newpro['alias']=='')$newpro['alias']=$helper->to_alias($newpro['productName']);
			//kiem loi
			$_SESSION['msg']='';
	
			if($newpro['price']<$newpro['salePrice'])
			$_SESSION['msg'].='Giá sale phải nhỏ hơn giá bán';
			else
				if($_FILES['inputFileUpload']['name']!='')
			{	
				$_SESSION['msg'].="file up lên:".$_FILES['inputFileUpload']['name'];
				$uploadSuccess=$helper->doUpload('inputFileUpload');
				if($uploadSuccess)
				{
					$newpro['image']=$_FILES['inputFileUpload']['name'];
					if($this->update($newpro,$productId)) $_SESSION['msg'].='Cập Nhập sản phẩm thành công';
					else $_SESSION['msg'].='Cập Nhập sản phẩm thất bại';
					header("Location:".BASE_URL."adminProduct/productList");
					exit;
				}
			}	 
			else
			{
				if($this->update($newpro,$productId))
				$_SESSION['msg'].="Cập Nhập Sản Phẩm Thành Công";
				else 
				$_SESSION['msg'].="Cập Nhập Sản Phẩm Thất Bại";
				header("Location:".BASE_URL."adminProduct/productList");
				exit;
			}
		}
	

}

?>
