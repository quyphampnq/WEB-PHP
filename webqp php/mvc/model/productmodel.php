<?php
class ProductModel extends BaseModel{
     protected $table=DB_PREFIX.'product';
    public function home($limit,$offset)
    {
        $sql=" select * from ".$this->table. " where trash='0' and status='1' and salePrice<>'' limit $offset, $limit";
        $data['products']=$this->queryAll($sql);
        //chuan bi du lieu phan trang
        $sql=" select * from ".$this->table. " where trash='0' and status='1' and salePrice<>'' ";
        $totalRecords=count($this->queryAll($sql));
        $data['paging']=new Paging('product/home/' , $totalRecords , $limit, $offset);
        
        return $data;

    }
    
    public function productByCat($catAlias, $limit, $offset){
        //nhom sp co catalias
        $catmodel=new CategoryModel;
        $cat=$catmodel->get(['alias'=>$catAlias]);
        $data['cat']=$cat;
        //lay sp thuoc nhom co catID
        $data['products']=$this->getAllLimit(['trash'=>0, 'status'=>1, 'catId'=>$cat['catId']], $limit, $offset);
        //chuan bi du lieu trag
        $totalRecords=count($this->getAll(['trash'=>0, 'status'=>1, 'catId'=>$cat['catId']]));
        $data['paging']=new Paging('product/productByCat/'.$catAlias.'/', $totalRecords , $limit, $offset);
        return $data;
    }           
    public function productByBrand($brandAlias, $limit, $offset){
        //nhom sp co brandalias
        $brandmodel=new BrandModel;
        $brand=$brandmodel->get(['alias'=>$brandAlias]);
        $data['brand']=$brand;
        //lay sp thuoc nhom co brandID
        $data['products']=$this->getAllLimit(['trash'=>0, 'status'=>1, 'brandId'=>$brand['brandId']], $limit, $offset);
        //chuan bi du lieu trag
        $totalRecords=count($this->getAll(['trash'=>0, 'status'=>1, 'brandId'=>$brand['brandId']]));
        $data['paging']=new Paging('product/productByBrand/'.$brandAlias.'/', $totalRecords , $limit, $offset);
        return $data;
    }         
    public function productDetail($productAlias)
    {
        //lay 1 sp alias nhu vay 
        $data['currentproduct']=$this->get(['alias'=>$productAlias]);
        //lay cac sp cung nhom
        $data['sameProducts']=$this->getAll(['trash'=>0, 'status'=>1, 'catid'=>$data['currentproduct']['catid']]);
        return $data;
    }
    public function productSearch($searchKey, $limit, $offset)
    {
        //lay sp thep yeu cau tim kiem
        $sql="select * from $this->table where trash='0' and status='1' and productName like '%$searchKey%' limit $offset,$limit";
        //thuc thi cau lenh
        $data['products']=$this->queryAll($sql);
        $sql="select * from $this->table where trash='0' and status='1' and productName like '%$searchKey%'";
        $totalRecords=count($this->queryAll($sql));
        $data['totalRecords']=$totalRecords;
        $data['paging']=new Paging('product/productSearch/', $totalRecords , $limit, $offset);
        return $data;
    }
}
?>