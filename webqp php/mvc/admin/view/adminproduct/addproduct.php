
<?php
$cats=$data['cats'];
$brands=$data['brands'];
?>

<div class='col-md-9'>
<h2> ADD PRODUCT</h2>
<div class="row btn-success">
<?php if(isset($_SESSION['msg'])) {echo $_SESSION['msg']; unset($_SESSION['msg']);}?>
</div>

<div class=row>
<form method=post action='' enctype='multipart/form-data'>

<table>
<tr>
<td class='col-md-3'> <label>Product Name</label></td>
<td><input type='text' name=inputProductName required></td>
</tr>

<tr>
<td class='col-md-3'> <label>Alias</label></td>
<td><input type='text' name='inputAlias'></td>
</tr>

<tr>
<td class='col-md-3'> <label>Category Name</label></td>
<td>
<select name=inputCatid>
<?php foreach($cats as $cat){?>
<option value="<?php echo $cat['catId'] ?>">
<?php echo $cat['catName']?>
</option>
<?php }?>
</select>
</td>
</tr>

<tr>
<td class='col-md-3'> <label>Brand Name</label></td>
<td>
<select name=inputBrandid>
<?php foreach($brands as $brand){?>
<option value="<?php echo $brand['brandId']?>">
<?php echo $brand['brandName']?>
</option>
<?php }?>
</select>
</td>
</tr>

<tr>
<td class='col-md-3'> <label>Chi Tiet SP</label></td>
<td><textarea name=inputDetail required cols=50 rows=10 ></textarea></td>
</tr>

<tr>
<td class='col-md-3'> <label>Price</label></td>
<td><input type='number' name=inputPrice max=3000 min=1 step='0.01'></td>
</tr>

<tr>
<td class='col-md-3'> <label>Sale Price</label></td>
<td><input type='number' name=inputSalePrice max=3000 min=1 step='0.01'></td>
</tr>

<tr>
<td class='col-md-3'> <label>Image</label></td>
<td><input type=file name=inputFileUpload></td>
</tr>

<tr>
<td class='col-md-3'> <label>Status</label></td>
<td>
<select name=inputStatus>
<option value="0"> Ẩn </option>
<option value="1"> Hiện </option>
</select>
</td>
</tr>

<tr>
<td>
<input type="submit" name='submit' value=Submit>
<input type="reset" name='reset' value=Reset>
</td>
</tr>

</table>
</form>
</div>
<div>