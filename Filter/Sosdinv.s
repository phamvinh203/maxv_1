<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="cttt20" code="stt_rec" order="ma_dvcs, ngay_ct, ma_kh, ma_dvcs" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc hóa đơn" e="Invoice Detail Filter"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày/đến ngày" e="Date from/to"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="kh_yn = 1 and status = '1'" check="kh_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 110, 110, 230"/>
      <item value="111: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2]"/>
      <item value="1110: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>VssetJL5I2+BWzhiqAqlBVIMTGHyTHUDoc3LFt3YCDgdrc4kF4MnzRxjzo+LgdjP6aHc8ZiWvTXtPEDajKL+1Cn1I/xaET8Empl0K5xEbOsMg09LuWBRSTLZEGLhfh98n8TxPgnGCkXRvp19xSjPaS5+j+0BdjLkqdDSPgq6Zyf6/i5j7oFzgApNFJf9mMYgreePrCbzGIOCuV7vpkuOC5URCcssSh/Z4YHHw5eWOTG552WV4f9O0Zq4ZwkeT8Ug5f49x9yyigDl/hQ3Zj9BfLv6mIC/kL8KIGVGTym2ePF2NLFYwEoJl74RV1o8/fl8+nxqasRr08bmeChvZt/xcdNlx4Ayg/XfP6TLYs3vOeA3JH723cIGUs4y4AcK7twvXXXT9cMOAmFSujJM7J4+2ZBuuZfXat/8Nr9Qj87jfnemoRDDg7E8RiXD9X02gSC85PNi5rRWfLuIUl9oZQKKwHdVCK63LzZZqLd3Qh40AYqT5DTzxhPSo49kl9CrSjwr0J8sFSKiJHlLhM2GDsRIGy/BItPIQUuxvd9lBdlNBi3EMeNj/OmkEjUcCGEytOVV</encrypted>]]>
    </text>
  </script>
</dir>
