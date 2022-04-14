<?php
$currentproduct=$data['currentproduct'];
$sameProducts=$data['sameProducts'];
?>
<div class="row g-0">
                    <div class="col-md-4">
                      <img src="<?php echo BASE_URL; ?>public/upload/<?php echo $currentproduct['img'];?>" class="img-fluid" alt="LAPTOP GAMING MSI GL65">
                    </div>                    
                        <div class="col-md-8">
                          <div class="card-body">
                            <h5 class="card-title"><?php echo $currentproduct['productName']?></h5>
                            <p class="card-text">
                              <?php echo $currentproduct['detail']?>
                              <?php
                                          if ($currentproduct['saleprice']!='') {?>
                                          <p class="card-text"><span class="text-decoration-line-through"><?php echo number_format($currentproduct['price'],2)?>$</span class=text-danger> <span style="color: red;"><?php echo number_format($currentproduct['saleprice'],2)?> $</span></p>
                                          <?php }
                                          else{?>
                                            <span><?php echo number_format($currentproduct['price'],2)?> $</span>
                                            <?php }?>
                              <a href="#" class="btn btn-primary">Add to cart</a>
                          </div>
                        </div>
                  </div>
              <div class="row">
                <div class="col-md-12 alter alter-danger col alert alert-danger"><h4><center>Các Sản Phẩm Tương Tự</center></h4></div>
                <?php foreach($sameProducts as $sameProduct){?>
                                  <div class="col-md-3">
                                    <div class="card">
                                        <img src="<?php echo BASE_URL; ?>public/upload/<?php echo $sameProduct['img']?>"  class="card-img-top" alt="LAPTOP GAMING MSI">
                                        <div class="card-body text-center alert alert-warning">
                                        <p><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i><i class="fa fa-star-o" aria-hidden="true"></i></p>
                                          <h5 class="card-title"><a href="<?php echo BASE_URL.'product/productDetail/'.$sameProduct['alias']?>" class="text-decoration-none"><?php echo $sameProduct['productName'] ?></a></h5>
                                          <?php
                                          if ($sameProduct['saleprice']!='') {?>
                                          <p class="card-text"><span class="text-decoration-line-through"><?php echo number_format($sameProduct['price'],2)?>$</span class=text-danger> <span style="color: red;"><?php echo number_format($sameProduct['saleprice'],2)?> $</span></p>
                                          <?php }
                                          else{?>
                                            <span><?php echo number_format($sameProduct ['price'],2)?> $</span>
                                            <?php }?>
                                          <a href="#" class="btn btn-primary">Add to cart</a>
                                        </div>                    
                                      </div>
                                </div>
                            <?php }?>
              </div>
</div>