<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">


  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Codition"></title>
  <fields>
	    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="HĐĐT từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
  
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)" reference="ten_dvcs%l"/>
    </field>
	<field name="ten_dvcs%l" readOnly="true" >
      <header v="" e=""/>
    </field>
	
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130,0"/>
      <item value="1101--1: [tu_ngay].Description, [tu_ngay], [den_ngay],[ma_dvcs]"/>

    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
	<command event="Processing">
      <text>
        <![CDATA[<encrypted>wnsQSyIeOEzR0A8io4Qk8mcBqp7f9/Pblx7jw0qw6l6iC8MTf1cdGV+mBsWGRJk8VB0PCcFpvfEKtXXFb7pjljlu/sgdTZCDG8U1HhDvMZskZmNymRFF4rG2LyiNnpem27TT1xCxWKQj+UOo32K3W0U28oAWTsU/RT/ZSY9fxTH8q3dEJ+RgBbIc+EhbNg81tTAtuDlOt1kaw6c9Zj4hSUjRa8BUL0O53R45eEa7BtA=</encrypted>]]>
      </text>
    </command> 
  </commands>

  <script>
    <text>
	&OutlineEntry;
      <![CDATA[<encrypted>xFwenAlxgy4lxgH972wp9upvoUQuvutEUSNHMg/aSYGgCwgAHeqmzzw+5rMXwqaRZLQIHuZI7lfgBlxJGcBpH75ACINgEn2LlJWeTtKSbMaRpFDndal1MZg5bkex4vkd5qJYYcMEBanVd9MsoQK7vnGHbPN/HEY6c6Alqfn6Rg3mqtx4uNCmflzZSqWnjZJEZd6MfuD54dVGXVbIvTthmnof+4o8SkJLe+SoB1T9niqyth81FM0rIRCWg67F4ej/hnNR6Ng7mm3pTCMm+0c0T5J92bLNh13n3msterBqWc2Up68h+mFqYagos6VF5NNQRwi5NP/u+7CAXGfhpbIE/RDi5ogfFa6/gZpU4KMx/AFN59AN4Cw3k7E6kJ11NLTXhKmDUdXVUbao+K5PtCwF3pXrG10aRcM7LYJUpuxBfwd0e1yHpo2+nKEOlzTTLWEWAD33h5hD3dm9sgPWBkzeXAbPWX6LNPJkUrXcj7xGmXU=</encrypted>]]>
    </text>
  </script>
</dir>
