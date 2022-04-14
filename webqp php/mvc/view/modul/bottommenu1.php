<?php
$linkmodel=new LinkModel;
$links=$linkmodel->getAll(['trash'=>0, 'status'=>1,'position'=>'bottommenu1']);
/*echo "<pre>";
print_r($links);
echo "</pre>";*/

?>
<div class="col-md-4 p-5">      
                    <b>Support customers</b><br>
                    <?php foreach($links as $link){?>
                    <a href="<?php echo BASE_URL.$link['link']?>" class="text-decoration-none" ><?php echo $link['title']?></a></br>
                    <?php }?>
</div>