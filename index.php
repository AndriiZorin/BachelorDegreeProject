<?php 
header('Content-Type: text/html; charset=utf-8');
include 'data.tpl'; 
	function matrix($top, $bot) {
		if ($top != 0 && $bot != 0) {
			if ($top > $bot) {
				$num = 1;
			} elseif($top < $bot) {
				$num = -1;
			} else {
				$num = 0;
			}
		} else {
			$num = 0;
		}			
		return $num;
	}
 ?>