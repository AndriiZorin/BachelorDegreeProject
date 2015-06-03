<?php include 'data.php';  ?>
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Оцінка ефективності</title>
	<link rel="stylesheet" href="style.css" media="screen"  />
</head>
<body>
	<?php if(isset($_POST['submit'])) {?>
<div class="block">
	<div class="table">
		<table border="1" cellspacing="2" cellpadding="2" align="center" bgcolor="#CCFFCC">
			<tr>
				<p id="title">Таблиця темпів росту</p>
				<th>Розділ</td>
				<th>Темп росту</td>
				<th>Експертна оцінка</td>
			</tr>
			<?php 
			for ($i=0; $i < 5; $i++) { 
				echo '<tr>';
				echo '<td>'.$section[$i].'</td>';
				echo '<td>'.$rel[$i].'</td>';
				echo '<td style="text-align:center;">'.$_POST['expert'][$i].'</td>';
				echo '</tr>';
			}
			?>
		</table>
	</div>
</div>	
<div class="block">
	<div class="matrix">
		<div class="matrixSingle">
			<table border="1" cellspacing="1" cellpadding="1"  bgcolor="#FFFFCC">
				<p id="title">Матриця темпів росту</p>
				<?php 
				$count = 1;
				for ($i=0; $i < 5; $i++) { 
					$td = 1;
					echo '<tr>';
					echo '<td>'.$section[$i].'</td>';
					while ($td % 6 != 0) {
						echo '<td style="width:7%">'.$grow[$count].'</td>';
						$td++;
						$count++;
					}
					echo '</tr>';
				}
				?>
			</table>
		</div>	
		<div class="matrixSingle">
			<table border="1" cellspacing="1" cellpadding="1" bgcolor="#FFFFCC">
				<p id="title">Матриця еталонів</p>
				<?php 
				$count = 1;
				for ($i=0; $i < 5; $i++) { 
					$td = 1;
					echo '<tr>';
					echo '<td>'.$section[$i].'</td>';
					while ($td % 6 != 0) {
						echo '<td style="width:7%">'.$etalon[$count].'</td>';
						$td++;
						$count++;
					}
					echo '</tr>';
				}
				?>
			</table>
		</div>	
	</div>
</div>		
<div class="block">
	<div class="final">
		<div id="sum">
			<input type="text" size="50" readonly value="Сума елементів матриці еталонів по модуль: <?php echo $sumEtalon; ?>">
		</div>
		<div id="sum">
			<input type="text" size="92" readonly 
			value="Сума кількості співпадінь між елементами матриці еталонів та матриці темпів росту: <?php echo $sumHit; ?>">
		</div>
		<div id="sum">
			<input type="text" size="30" readonly 
			value="Ефектиність: <?php echo $sumHit; ?> / <?php echo $sumEtalon; ?> = <?php echo $final; ?>%.">
		</div>
		<span id="result">
			Висновок: ефектифність даної установи становить <?php echo $final; ?>%
			<?php 
			if ($final > 50) {
				echo "Це свідчить про достатню ефективність в роботі.";
			} else {
				echo "Це свідчиит про недостатню ефективність і потрібно провести модернізацію в робочому процесі!";
			}
			 ?>
		</span><a href="index.php"><input type="submit" value="Ввести інші данні"></a>
	</div>
</div>	
	<?php } else { ?>
	<form action="" method="post"> 
		<div class="data">
			<table border="1" cellspacing="1" cellpadding="1" bgcolor="#def" align="center">
				<tr>
				    <th rowspan="2">№
				    <th rowspan="2">Назва розділу
				    <th colspan="2">Значення
				    <th rowspan="2" width="17%">Оцінка екпертів (кількість балів)
				</tr>
				<tr align="center">
	
				
				    <th>Період 1
				    <th>Період 2
				</tr>
				<tr align="center">
				    <td>1</td>
				    <td> Необортні активи</td>
				    <td><input type="text" name="origin[]" value="108660" style="width: 95%; height: 100%;"></td>
				    <td><input type="text" name="origin[]" value="130335" style="width: 95%; height: 100%;"></td>
				    <td><input type="text" name="expert[]" value="2" style="width: 20%; height: 100%; text-align:center;"></td>
				</tr> 
				<tr align="center">
				    <td >2</td>
				    <td>Обортні активи </td>
				    <td><input type="text" name="origin[]" value="87620" style="width: 95%; height: 100%;"></td>
				    <td><input type="text" name="origin[]" value="97543" style="width: 95%; height: 100%;"></td>
				    <td><input type="text" name="expert[]" value="2" style="width: 20%; height: 100%; text-align:center;"></td>
				</tr> 
				<tr align="center">
				    <td >3</td>
				    <td>Капітал та резерви</td>
				    <td><input type="text" name="origin[]" value="90700" style="width: 95%; height: 100%;"></td>
				    <td><input type="text" name="origin[]" value="85150" style="width: 95%; height: 100%;"></td>
				    <td><input type="text" name="expert[]" value="3" style="width: 20%; height: 100%; text-align:center;"></td>
				</tr> 
				<tr align="center">
				    <td>4</td>
				    <td>Довгострокові забов'язання</td>
				    <td><input type="text" name="origin[]" value="18300" style="width: 95%; height: 100%;"></td>
				    <td><input type="text" name="origin[]" value="21123" style="width: 95%; height: 100%;"></td>
				    <td><input type="text" name="expert[]" value="1" style="width: 20%; height: 100%; text-align:center;"></td>
				</tr> 
				<tr align="center">
				    <td >5</td>
				    <td>Короткострокові зобовз'язання</td>
				    <td><input type="text" name="origin[]" value="90380" style="width: 95%; height: 100%;"></td>
				    <td><input type="text" name="origin[]" value="121605" style="width: 95%; height: 100%;"></td>
				    <td><input type="text" name="expert[]" value="1" style="width: 20%; height: 100%; text-align:center;"></td>
				</tr> 
			</table>
			<div id="buttons">
				<input type="submit" name="submit" value="Рассчитать">
				<input type="reset" value="Очистити форму">
			</div>
		</div>	
	</form>
	<?php } ?>
</body>
</html>