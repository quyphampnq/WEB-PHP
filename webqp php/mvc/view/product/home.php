<?php
$products=$data['products'];
$paging=$data['paging'];
?>
<div class="container">
    <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <img src="<?php echo BASE_URL; ?>public/img/quy_sale1.jpg"  width="260" height="420" alt="">             
                    </div>
                </div>
                <?php foreach ($products as $product){?>
                <div class="col-md-3 col-sm-6 text-center card">
                    <div class="card">
                        <img src="<?php echo BASE_URL; ?>public/upload/<?php echo $product['img'] ?>"  class="card-img-top" alt="LAPTOP GAMING MSI">
                        <div class="alert alert-success">  
                          <p><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i></p>
                          <h5 class="card-title"> <a href="<?php echo BASE_URL.'product/productDetail/'.$product['alias']?>" class='text-decoration-none'> <?php echo $product['productName']?> </a> </h5>
                          <p class="card-text"><span class="text-decoration-line-through"><?php echo $product['price']?>$</span> <span style="color: red;"> <?php echo $product['saleprice']?>$</span></p>
                          <a href="<?php echo BASE_URL?>cart/add/<?php echo $product['productid']?>/<?php echo $product['productName']?>/<?php if($product['saleprice']<>0) echo $product['saleprice']; else echo $p['price'] ?>" class=" btn btn btn-primary">Add to cart</a>
                        </div>                                 
                      </div>
                  </div>
                
                <?php }?> 
                <div class="row">
                <?php $paging->createLinks();?>
                 </div>
    </div>
</div>       

