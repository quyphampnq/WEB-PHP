<?php
$products=$data['products'];
$paging=$data['paging'];
$brand=$data['brand'];
?>

<div class="row">
                        <div class="col alert alert-danger"><h4><center><?php echo $brand['brandName']?></center></h4></div>
</div>
                      <div class="row">
                        <?php foreach($products as $product){?>
                                  <div class="col-md-3">
                                    <div class="card">
                                        <img src="<?php echo BASE_URL; ?>public/upload/<?php echo $product['img']?>"  class="card-img-top" alt="LAPTOP GAMING MSI">
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