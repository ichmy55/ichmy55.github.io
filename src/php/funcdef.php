<?php // 関数定義

// Navi 文字列再帰呼び出しで作成
//  引数　st1 : コーナーのコード
//        sectiondef : セクション情報の元帳
//  帰り値　  : Navi 文字列
//
function navistring( $st1, $sectiondef)
{
    $kek = '&gt; <a href="/' . $st1;
    $kek .= '/">' . $sectiondef[ $st1 ]['jtitle'] . '</a>';
    if ($sectiondef[ $st1 ]['parent'] != '') {
       $kek =  navistring( $sectiondef[ $st1 ]['parent'] ,
	                   $sectiondef) . $kek;
    };
    return $kek;
};
?>
