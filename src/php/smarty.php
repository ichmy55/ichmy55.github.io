<?php
//
// Smary の初期化
//
    require_once('Smarty.class.php');
    $smarty = new Smarty();
    $smarty->template_dir = './smarty/templates';
    $smarty->compile_dir = './smarty/templates_c';
    $smarty->cache_dir = './smarty/cache';
    $smarty->config_dir = './smarty/configs';
    $template = 'smarty.tpl';
    $outdir = './htdocs/';
    include("src/php/init.php");
//
// Smary 出力
//
    foreach($section_def as $key => $value) {
        echo 'keyは' . $key . "\n";
        $outfile = $outdir . $key .'.html';
        $smarty->assign("section", $key);
        $smarty->assign("headmark", $value['headmark']);
        $smarty->assign("title", $value['title']);
        $smarty->assign("jtitle", $value['jtitle']);
        $smarty->assign("jtitle2", $value['jtitle2']);
        $nav    = navistring( $key, $section_def);
        $smarty->assign('nav', $nav);
        $outstr = $smarty->fetch($template);
        file_put_contents($outfile, $outstr);
    }
//
?>
