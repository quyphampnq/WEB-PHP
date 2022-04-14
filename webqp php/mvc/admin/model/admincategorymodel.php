<?php
class AdminCategoryModel extends CategoryModel{
    protected $fileds=['catName','alias','parentId','trash','status'];
    protected $key='catId';
}
?>