<?php
$products=$data['products'];
$paging=$data['paging'];
$totalRecords=$data['totalRecords'];
?>
<div class="container">
    <div class= "row">
    <?php echo "Tổng số sản phẩm tìm thấy: ". $totalRecords. " sản phẩm. ";?>
    </div>
<div class="row">

                <?php foreach ($products as $product){?>
                <div class="col-md-3 col-sm-6 text-center card">
                    <div class="card">
                        <img src="<?php echo BASE_URL; ?>public/upload/<?php echo $product['img'] ?>"  class="card-img-top" alt="LAPTOP GAMING MSI">
                        <div class="card-body text-center alert alert-warning">
                                        <p><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i></p>
                                          <h5 class="card-title"><a href="<?php echo BASE_URL.'product/productDetail/'.$product['alias']?>" class="text-decoration-none"><?php echo $product['productName'] ?></a></h5>
                                          <?php
                                          if ($product['saleprice']!='') {?>
                                          <p class="card-text"><span class="text-decoration-line-through"><?php echo number_format($product['price'],2)?>$</span class=text-danger> <span style="color: red;"><?php echo number_format($product['saleprice'],2)?> $</span></p>
                                          <?php }
                                          else{?>
                                            <span><?php echo number_format($product['price'],2)?> $</span>
                                            <?php }?>
                                          <a href="#" class="btn btn-primary">Add to cart</a>
                                        </div>

                      </div>
                  </div>
                <?php }?> 
                <div class="row">
                <?php $paging->createLinks();?>
                </div>

</div>       

