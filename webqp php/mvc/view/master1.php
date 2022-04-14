<?php require_once PATH_TO_MODUL.'header.php';?>
<?php require_once PATH_TO_MODUL.'slide.php';?>
        <div class="container mt-3">
            <div class="row">
              <div class="col-md-3">
                  <?php require_once PATH_TO_MODUL.'leftcategorymenu.php';?> 
                  <?php require_once PATH_TO_MODUL.'leftbrandmenu.php';?> 
                
              </div>
                <div class="card md-9" style="max-width: 850px;">
                  <?php include_once PATH_TO_VIEW.$viewname.'.php';?>
                </div>
             </div>
        </div>
        <footer class="container-fluid bg-warning">
            <div class="row">
            
                  <?php require_once PATH_TO_MODUL.'bottommenu1.php';?>
                  <?php require_once PATH_TO_MODUL.'bottommenu2.php';?> 

                <div class="col-md-2 p-5"><i class="fab fa-facebook-f text-white-50ss"> facebook</i>
                <i class="fab fa-youtube"> youtube</i></div>
            </div>
        </footer>

      <?php require_once PATH_TO_MODUL.'cart.php';?>

    </body>
</html>