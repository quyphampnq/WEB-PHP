<div class='row button btn-warning'>
<?php
if(!empty($_SESSION['mgs'])){
  echo $_SESSION['msg'];
  unset($_SESSION['msg']);
}
?>
</div>
<div class='row button btn-warning'>
<?php
if(!empty($data['msg'])) echo $data['msg'];
?>
<?php
$products=$data['products'];
$paging=$data['paging'];
?>

<a class="btn btn-primary" href="#" role="button">Link</a>
<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">STT</th>
      <th scope="col">productId</th>
      <th scope="col">productName</th>
      <th scope="col">Status</th>
      <th scope="col">Price</th>
      <th scope="col">Trash</th>
      <th scope="col">Action</th> 
    </tr>
  </thead>
  <tbody>
  <?php
  $i=1;
  foreach($products as $product){?>
    <tr>
      <th scope="row"><?php echo $i++ ?></th>
      <td><?php echo $product['productid'] ?></td>
      <td><?php echo $product['productName'] ?></td>
      <td><a href='<?php echo BASE_URL?>adminproduct/productToggleStatus/<?php echo $product['productid']?>'><?php if( $product['status']==1) echo '<i class="fas fa-check text-primary"></i>'; else echo '<i class="fas fa-times text-danger"></i>' ?></a></td>
      <td><?php echo $product['price'] ?></td>
      <td><?php echo $product['trash'] ?></td>
      <td><a href='<?php echo BASE_URL?>adminproduct/productToggleTrash/<?php echo $product["productid"]?>' onclick='return confirm("Ban Co Chac Chan Xoa SP Nay ?")'>Xoa</a>|<a href='<?php echo BASE_URL?>adminproduct/updateproduct/<?php echo $product['productid']?>'>Sua</a></td>
    </tr>
    <?php }?>
  </tbody>
</table>
<?php $paging->createLinks();?>