<?php
$imagemodel=new ImageModel;
$images=$imagemodel->getAll(['status'=>1,'trash'=>0,'position'=>1]);
?>

<div class="container-fluid">
          <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">      

              <div class="carousel-item active" data-bs-interval="10000">
                    <img src="<?php echo BASE_URL.'public/img/'.$images[0]['image']?>" class="d-block w-100" width="915" height="420" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                    </div>
                  </div>

              <?php unset($images[0])?>
              <?php foreach($images as $image){?>
                <div class="carousel-item " data-bs-interval="10000">
                  <img src="<?php echo BASE_URL.'public/img/'.$image['image']?>" class="d-block w-100" width="915" height="420" alt="...">
                  <div class="carousel-caption d-none d-md-block">
                  </div>
                </div>
                <?php }?>

              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"  data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"  data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
</div>