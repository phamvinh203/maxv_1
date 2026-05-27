<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
     <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Hóa đơn từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="kind" dataFormatString="1, 2, *" clientDefault="1" align="right">
      <header v="Loại dữ liệu" e="Kind"></header>
      <footer v=" 1 - HĐĐT mua vào, 2 - Hóa đơn đã hạch toán (Kê khai), * - Tất cả" e="1 - Einvoice, 1 - Invoice GL, * - All"></footer>
      <items style="Mask"/>
    </field>
	
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"/>
      <items style="AutoComplete" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="150, 30, 70, 100, 100, 130,0"/>
	  <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
	  <item value="111000: [kind].Label, [kind], [kind].Description"/>
	 	  
	  <item value="110---: [ma_dvcs].Label,[ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>647JQIc009OaK20CLaB6Y+edGSUXfS03+81HfTO7esm1mrkU5GFmJuDtPLdMiTLaq4ziQvNqL32AjU7j1IcKQ2ik6q9HYK6BXwE/jhrIk8DGtggYvmxqa1Wd52FPcK0ojeRwGyX/eumXFzB/9A4ylLJ5lnG+CvWNHS7Wj0qEDq1Ay6n3dYDt0WqpdUDPUkpr1084aSLgwjVi8p38lGYwmA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>+YPgmLfCrU54P8MZSya//hU//LyNInToF1nUyuHpJzIm0dZ3xJJjXOLTwpu5EDA+2eXttBA0hqgyrk8ZItzJK7hp+c1D2o/RebnWEROz2DcWIBcISnJouZ2SFBY8rUxIh/6l6MpWKFTYnYIZBVngUX168hrYbwMLGhSiBUMJ5LJFQ7nHj6KvAwVbzC0f3FgodYV5Sf/GZ8vogEKiP6f2Jkf/5usVTFSjs6JtdBBY10lbgCBT42/5q92IP+ez0ivz+ZOgxEcukbx1X9MtHW3x/UWkZL1Wfra8iA0+cM2F8EHMcZZRG9IYryXxQKjzXYP25bTJMebQC3759sGQ8VJySfZysZKQrJ+XC8FKoXEZSpCihAfjeelAJDZf4ocZfgQaOwb/i8p10t+QMR+FbNMVQYN5XHknoxsQz6HStvuUP7nSXb5lq7KGxpeyzk70YwRo6HOwwGZh+j3enGF9t5n3WKVh6592bYkiG7RDgo8OYxZpbuZ4iNAKAqXv2lpZ1lr3f+rszkJP9+RJmODkWgNMW2ZR5olblLtb8z3NvoL5sUs=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
