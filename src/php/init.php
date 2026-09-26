<?php
//
// 関数定義
//
    include("funcdef.php");
//
// セクション処理設定
//
    $section_def = array(
        "index" => array(
            "headmark" => "toppage",
            "title"    => "Ichmy's regend of OS",
            "jtitle"   => "低予算ＣＡＥで遊ぼうのこーな",
	    "jtitle2"  => "ごめんなさい。まだ工事中です",
            "parent"   => ""
	),
        "whatsnew" => array(
            "headmark" => "whatsnew",
            "title"    => "Ichmy's News",
            "jtitle"   => "更新履歴のこーな",
	    "jtitle2"  => "何もないところから徐々に立ち上がるIchmyのサイト",
            "parent"   => "index"
	),
    );
    $section="index";
?>
