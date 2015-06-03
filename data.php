<?php 
if (isset($_POST['submit'])) {
	$section = array (
		"1. Необортні активи",
		"2. Обортні активи", 
		"3. Капітал та резерви", 
		"4. Довгострокові забов'язання", 
		"5. Короткострокові зобовз'язання"
	);

	//Таблица темпов роста

	$z = 0; //Count for new table
	for ($i=0; $i < count($_POST['origin']); $i = $i + 2) { 
		if ($_POST['origin'][$i + 1] == 0) {
			$rel[$z] = 0;
		} else {
			$rel[$z] = $_POST['origin'][$i] / $_POST['origin'][$i + 1];
		}
		$rel[$z] = round($rel[$z], 4);
		$z = $z + 1;
	}

	//Матрица темпов роста

	$f = 0; //count for first element
	$s = 0; //count for second element
	for ($i=1; $i < 26; $i++) { 
		$grow[$i]  = matrix($rel[$f], $rel[$s]);
		if ($i % 5 == 0) {
			++$f;
			$s = -1;
		}
		++$s;
	}
	
	//Матрица эталонов

	$f = 0; //count for first element
	$s = 0; //count for second element
	for ($i=1; $i < 26; $i++) { 
		$etalon[$i]  = matrix($_POST['expert'][$f],  $_POST['expert'][$s]);
		if ($i % 5 == 0) {
			++$f;
			$s = -1;
		}
		++$s;
	}
	
	//Сума элементов матрицы эталонов по модулю

	$sumEtalon = 0;
	for ($i=1; $i < 26; $i++) { 
		if ($etalon[$i] < 0) {
			$etalon_m[$i] = $etalon[$i] * -1;
			$sumEtalon = $sumEtalon + $etalon_m[$i];
		} else {
			$etalon_m[$i] = $etalon[$i];
			$sumEtalon = $sumEtalon + $etalon_m[$i];
		}
	}

	//Сумма совпадений матриц эталонов и темпов роста

	$sumHit = 0;
	for ($i=1; $i < 26; $i++) { 
		if ($grow[$i] === $etalon[$i] && $grow[$i] != 0 && $etalon[$i] != 0) {
			++$sumHit;
		}
	}

	//Оценка
	$final = $sumHit / $sumEtalon * 100;
}
 ?>