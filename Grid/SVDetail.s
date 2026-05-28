<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetCreditTaxRate.xml">
]>

<grid table="d81$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HB1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c81$000000" prime="d81$" inquiry="i81$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPO5Vu7zotkPNh5UDN2V7J3FvVhxkFLSxLNK45HvA2sFImSqzms1JcVt8xLVy+uouIk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="dvt2" width="50" aliasName="a" readOnly="true">
      <header v="Đvt 2" e="UOM 2"></header>
      <items style="AutoComplete" controller="UOM" reference="ten_dvt%l" key="status = '1'" check="1 = 1" information="dvt$dmdvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="so_luong2" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng 2" e="Quantity 2"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong2_nl" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="SL 2 nhận lại" e="Quantity 2"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_luong_giao" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="SL giao" e="Quantity 2"></header>
      <items style="Numeric"/>
    </field>
	
	
    <field name="so_luong_hh" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="SL hao hụt" e="Quantity 2"></header>
      <items style="Numeric"/>
    </field>
	
    <field name="he_so2" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0" aliasName="a">
      <header v="" e="das"></header>
      <items style="Numeric"/>
    </field>
	
    <field name="ty_le_hh" type="Decimal" dataFormatString="##0.00" clientDefault="0" width="100">
      <header v="Tỷ lệ hao hụt (%)" e="Discount Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_khay_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá khay nt" e="FC Sales Price"></header>
      <items style="Numeric"/>
    </field>	
    <field name="gia_khay" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá khay" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>	
	<field name="tien_khay_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền khay nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_khay" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền khay" e="Amount"></header>
      <items style="Numeric"/>
    </field>	
	<field name="tien_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền tính nợ nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_no" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền tính nợ" e="Amount"></header>
      <items style="Numeric"/>
    </field>
	
	<field name="ma_dhb" width="100" clientDefault="Default" align="right">
	<items style="AutoComplete" controller="SaleOrder" reference="ten_dhb%l" information="so_ct$v64$000000.dien_giai"/>
		<header v="Đơn hàng bán" e="Sale Order"></header>
	</field>
	
	<field name="ten_dhb%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
		<header v="" e=""></header>
	</field>

    <field name="km_yn" type="Byte" width="30" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="KM" e="Promotion"></header>
      <items style="Mask"></items>
    </field>    
    &SiteField;
    
    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="ton13" type="Decimal" dataFormatString="@quantityViewFormat" width="80" external="true" defaultValue="0" readOnly="true" inactivate="true" aliasName="(e.ton13 - isnull(d.so_luong0, 0)) / case when a.he_so &lt;&gt; 0 then a.he_so else 1 end">
      <header v="Tồn" e="Stock"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOqKYjGjeQ2B720vXiYhNo2aXrKV+GKZaM0F5zqnH2gIgrIagCNh2Gk44+hrme8DzQ=</encrypted>]]></clientScript>
    </field>
    <field name="gia_ban_nt" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" hidden="true">
      <header v="Giá chuẩn nt" e="FC Standard Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá bán nt" e="FC Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_ck" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="100">
      <header v="TL chiết khấu (%)" e="Discount Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Chiết khấu nt" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_dt" width="90" allowNulls="false" aliasName="a">
      <header v="Tk doanh thu" e="Sales Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_ck" width="90" aliasName="a">
      <header v="Tk chiết khấu" e="Discount Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_ck%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[ck_nt] != 0" field="ck_nt"/>
    </field>
    <field name="ten_tk_ck%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="px_gia_dd" type="Boolean" width="70">
      <header v="Giá đích danh" e="Specific Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá vốn nt" e="FC Unit COGS"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền vốn nt" e="FC COGS Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>


    <field name="tk_vt" width="90" allowNulls="false" aliasName="a">
      <header v="Tk kho" e="Item Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_gv" width="90" allowNulls="false" aliasName="a">
      <header v="Tk giá vốn" e="COGS Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_gv%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_gv%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_cpbh" width="90" aliasName="a">
      <header v="Tk khuyến mại" e="Promotion Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cpbh%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[km_yn] == 1" field="km_yn"/>
    </field>
    <field name="ten_tk_cpbh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="gia_ban" type="Decimal" readOnly="true" inactivate="true" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" hidden="true" allowContain="true">
      <header v="Giá chuẩn" e="Standard Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá vốn" e="Unit COGS"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền vốn" e="COGS Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>

    <field name="dh_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Đơn hàng" e="Order Number"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="px_so" width="80" readOnly="true" align="right" inactivate="true">
      <header v="Phiếu xuất" e="Pick Number"></header>
    </field>
    <field name="px_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &XMLUserDefinedFields;

 <field name="ma_thue" width="80" allowNulls="false" aliasName="a">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMWANSp+4fESrNXmh3ZBDdfE6jWXZYbV6Fq2+jWE5kEBrfkyz8sxi2bweJpJM7gA2A=</encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" readOnly="true" type="Decimal" inactivate ="true" dataFormatString="#0.00" width="80" aliasName="a">
      <header v="Thuế suất" e="Tax Rate"></header>
    </field>
	
    <field name="tk_thue" width="80" allowNulls="false" aliasName="a">
      <header v="Tk thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[ma_thue] != ''" field="ma_thue"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMKX/jXyRzZdRui4xXGR0atDgtr7LdP2IayqEI8Ci5JjDyi+oIJ5TLIyprM6tYFdg0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kh2" width="80" onDemand="true" aliasName="a">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
	<handle key="[tk_cn]"/>
    </field>

	<field name="tk_cn" type="Decimal"  readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
	
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
	
    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[sua_tk_vt = 1]" field="ma_vt"/>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_px" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0px" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt2"/>
      <field name="dvt"/>
      <field name="km_yn"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>
      <field name="gia_ton"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="ton13"/>
      <field name="he_so2"/>
	  <field name="so_luong2"/>
	  <field name="so_luong2_nl"/>
      <field name="so_luong_giao"/>
	  <field name="so_luong_hh"/>
	  <field name="ty_le_hh"/>

      <field name="so_luong"/>

      <field name="gia_ban_nt"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="gia_khay_nt"/>
	  <field name="tien_khay_nt"/>
	  <field name="tien_no_nt"/>

      <field name="tl_ck"/>
      <field name="ck_nt"/>
	  
	  <field name="ma_thue"/>
	  <field name="thue_suat"/>
	  <field name="ten_thue%l"/>
	  <field name="thue_nt"/>

     <field name="ma_dhb"/>
	  <field name="ten_dhb%l"/>
	  

      <field name="tk_dt"/>
      <field name="ten_tk_dt%l"/>
      <field name="tk_ck"/>
      <field name="ten_tk_ck%l"/>
      <field name="tk_thue"/>
      <field name="ten_tk_thue%l"/>

	  
      <field name="px_gia_dd"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="tk_gv"/>
      <field name="ten_tk_gv%l"/>
      <field name="tk_cpbh"/>
      <field name="ten_tk_cpbh%l"/>

      <field name="gia_ban"/>
      <field name="gia2"/>
      <field name="tien2"/>
      <field name="gia_khay"/>
	  <field name="tien_khay"/>
      <field name="tien_no"/>
      <field name="ck"/>
	  <field name="thue"/>
	  
      <field name="gia"/>
      <field name="tien"/>

      <field name="dh_so"/>
      <field name="dh_ln"/>
      <field name="px_so"/>
      <field name="px_ln"/>

      &XMLUserDefinedViews;

		
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="stt_rec_px"/>
      <field name="stt_rec0px"/>
      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>vjrTpmF2Z+0W/paelcn11J09Gxkc6w3chSXkmWofCDh6LlliBCjA/a9We/a3Rl73Oh5LELWJ8Um55rI+mGnqSiPN+Ucwa6JIuiR9KlDFljvWQYiD2V5pUVCdpiPAg+0BV3kOGBMKAl4ljjCV8PeZh4vx9za0Puta3oLGklWDzUx2s3p2ngg25tlMZDyCKfnlijVBLeH8t4q7xSvGAxYlizwjoXHbyW8gvAAD2Ja3VXuVsEogK8rz/a90Sdnp78iR8285sXXR2VkZ+JeNRL4ZpBho+2L+62N1sikJ5hSVgSd/faO+bmaMcecwQA0SSCGLZf5vvGNpQvEcVY+wwAZ0Tx3r8ewkQsfwP5vPwYXuvlal//nJc8kgjeGzlN/RPQ9lh5sEhTfxArvSBhEX/Ru0qmQsa8S3Lh6YkYJ0jED4uBurNv8IBhPgILUdTcvPOl/QQ6IIcO2wLsqzDxc4ENozPA==</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>naDkaoCCjb3ZjhLBPz0j4I34qjly58ghVA1SqzllqYwEQ2/S6p9xWZE09DIhwbqNMPIFo28gnp2g38A3tHZRP9jF/pyDnD9+pERGODtkoA6tYk2AjLNfG1czXFSmmZPGJR98iAKLf56FO3+HJ/ivfA==</encrypted>]]>
      </text>
    </command>
	
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khX63lKwmzHzjwARyexDzCpOZwlE4lOVaY8k9R24ocGHqr/Y9vn0dleP1J95VH2VAf79ctKpKvXbOok8q6nET2T8O3xDK38OIY9OHxrvW7pj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>gQeObe7cZWvgIUfPfMxsXDLInpApyJBE1vWHUBgA/rBvoHskz3UJucsWTqCp0KkXD/5KfYUKHy+x7l89e06qM7vhWAbtwHqnhkN4CDqQR6FOvQM5BfywMMEEpUUwYfczo3ILzhkJdb0stIlhBgKvknhbk4DkoTOLyJ+RvING2oGE4A6YMvbw8I4knCphLbcIjuxA8Ak0kzbJK7gYFeoFrwv8xUKmDhzEji1VgnEve8+Fmty+QZ18uUuCRJSKkhJxVzDqqOYRIDIFkJCpC1E7uwnE/9zFwjRUGiFCSlZmqrbu2knGC8mR7a3vJbino8EMw9IkwG+mhcwxdJQJ4M455kuuZVjlafqpKH2yfpC0bzw4xsrb/adPbgiH+ul/aXOyzIoenq+A0UObh0QGCsl5hMpdK0wYkQAgraJbh16EJa1pZ/T07CIwW2H6oghDHgYQJAz262beRTCaW7YeknQ6Sd8LKYJT4WwbLPCV+cGUR+FXvQ0D9b/nDlRRqeZONHOktrNcJKH2AF6EwkeNDN3BjOTk21Z1Hy1etWop6pv9lORTGTnXQkIYuD9Nw5INwkIPm3rZ+Ij7MDkbM9jBbsdc46Az4lWTuoZD0TyAQyX17LEjQybljJtSiFSQwossmP33nfor2EkfPlbRo2aStjcu/E+6EJEdkAUL57H2k1jf7ZbzgdFpxAxgwykyl83TNolNP3XKqHTH0JP48ZzPn/TPMR7wQETCEsroybGSwRld3BHRhaXdton4EkjpNQK/34xLUAJZoSCjtHH4hgGp31vGr8llng2Lr4zyx3gvxCk8iFxBNknpejYTLdSaBex16zUy+OYlkFgkUAXVvwN41c8B7LxVtqifXvXqBHZFN/XiV/k0WBYSy7h6Tp9Iu+RLkhgJA29sxBL9ji65567PpJ6l/R69JvhXG+J0Gazude7DZVQgsW+05DonxLRl/r/IRmWgsA6izrCyM7zj4xaEiwyiT5bISha/EHC4ohVwA1Nb27+JFYAOZ40Zhtd0+wh3I3YcFI3yGUtlRcrF9qrexlYSL1+Ny8Qmnq6TwN5GmKzkXpDkWMCKi4kW4c2QjOL/vOdxbwbE0yCn44oEG6d/ydYA10L6AwGVtKuWhYp51IIUWYjbi7UFLzOdcrRah+WVkfoS9vmRBq6cgDKFhIRGoa533KuaojEpwj/2lM8U23Ieth8906Ru364WR31qot/G9n9vBi215y9jR+SQO3hjfEfYLSz9MmFCN8G+p2kmAeaNLdeMoFOFpQgY0kxxgOvTaSKwUnBoRune9chfJ3i4cBZMtniuUCrKgJ71kGVK8969eLdzQGGPJOsGdMS+T/9nG3NumjJ6GduyLisH/8Md8aOeGDEZl8rTj0/M0mE4QVkKyOZL1XdBI3xwUyV9TXuOtlr1r4RmYFrd/gk+o4hixZa+lNYQw1X9QlHY/2UCqou9Zho2AbqJ3pyYJBRz10wSnF1bIsFylaR6scEZ60mGEd5Jcf3LzXMwoUg7xaSI+yh9X6Hpgi5TwsUMDxm1onwRoC7EUBbfQyG0aOE68INuUrreqhCWKhccWeNSH3V1+Iz8spcfLDFfRq50zEEk78A1+Oi34607Up4nEH+5cXkrDdcbziUqeyRZk8ov4cSZxOiHxr9/7jlFPBzWVV9fhqLV5O+n2L+cFcj1EKAIof3wy92C2YG74lUdVFUsNLpEfVt/i90MMaf+YhP+xqINaZqeRh7JwAGyVaIO8zby/mBK7g8BQaBU8lZpykZTNdrnB7OiqkBsktfqMEFsKQhjY9VbaaFe9TD0nUSH3PYNh4FcpPi8kizZar92yJeXbs8s6zXjXyMa12/yzMiIFDpgIKLOCgnz/VPS6FD9OFfHg7Hb3ibWv20Y+Z1xnTaRH7BAac9x3XVFOtLqjNU2auHcZNlTLNWWeVqelmMSCkZHRVuWeB6D6Mu6+uPIuV5sMpNaMLHYYVw=</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>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</encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <response>
   &XMLGetTaxRate;
    <action id="Item">
      <text>
        <![CDATA[<encrypted>ICTLQmU/XRQdSK/WPOTfeEaNMFlQ8KkCpXG5NnJzUBcDw2Wm0wjrNQhekWLmBHnYTi8SMMW58+cFw0vZ+qcI9A/g+qizVHMu4DZ+iVaSMq0L+6dP36zcn1oFBQd9IQ+2gIvOi1GiMx7OVx2gpyihBpDLcF7Erdykk+cxDNDE4yrMZswMkwlJOZVRxiBF67dLuOcRtxwqc4l3c8e/VPb6qCh96szj6jebckhIOUaMJnS5uvMZ+Vqrhx02N77c86mYNNEvkU4td1OtwZDZQyWs/o9YDXit8p/8Z335Vhl1np0059mAUtY8EdyOiAZHgjfsOignZTr1JLj7Jsqgr5PCcWjlB8dmEqQMC2YmhCbG8ILQvX8fbC+9TX4qtDKL8M+r+FwdJCwbJWhM6h2sscGxki6FwfwvbbgS9BPuG2HS2oE=</encrypted>]]>
      </text>
    </action>
    <action id="UOM">
      <text>
        <![CDATA[<encrypted>v1K4lluWqOCE0lb0Fol1s3k4RWPKEUapmB6Ni0Dj0Q7nmy2pYKMPo+ZCq6FpHp6f6WI/7gECYpiIywOhG2+aWpFMKYHNE6o7zoYQBJAMFnoFmL4SFzhcWw02CYGR3eNjte2GqWt5lzPilD2GBNLTdygPn+4N9nC+CEweFi337CvxXbfvTlukQQXk74WqujaTFrXD5kd09xH4FerwKcJxR44B12gKQie/33g2oKzDbYO0FnezfEUk/CBpn1BWWnYPD1/ZE8OaJijtrO0+lYSwQmWf9oYZdQqpZ0X1ZLGYSd9bbEmr/CLPAL72cKZk8qouw5CELJKA5iU3blJOO9DGhVx+DsEmLnwcNRLGGVgI/oSXL2DnwROJZnZAH054DCQI8UnJmBxlal7xGm71fpFrzchQTlcDcr4A+h0a3i51tj9KDgj+Ue20w6rj4BhIA94mkpfOmjWCFsoXbF/R0K6wwg==</encrypted>]]>
      </text>
    </action>
    <action id="Site">
      <text>
        <![CDATA[<encrypted>Rehy0YT8rIq8m3vWzWxN0Bdnuv5A38wuF7lFCHOhHkzWSvXmGA/3RyZRHmtu5KrWJ4Fhd+UchO5OgDkjiNNS7LMSsOiIAkMBolNX61EOnFWhNTEBgvkbrSUg8hfecD3pLKTL8AWnfRfBXjp6ZsaPrJnCrA6ZeohjfzsBhJeiwKQchsfw2EDPOL1sGwY5OkLFaTwcI+C+33idMU/RC7+3vJb31B5oUs/RsbKAtSL8ge7Tg1nyYSiAdUu0HM+QwMSWn2hX2QhOfna30H2yl27XVd6IuoO9GUaDjcWQByCO9SvmhYA2yw2r+F3nRmXJYC37i1IiJBDdNUkm8rWkSjTedirllxNxbUFyX0O16ZIZxmmeQhNanQzIUWRbXuU6dkD4SlnFYjhm8coDXVr9PqBvpd4X5hhx03YSG+K4lBZ6z5A=</encrypted>]]>
      </text>
    </action>
    <action id="Quantity">
      <text>
        <![CDATA[<encrypted>WeAGCTH6arWSy8eLE+X5DmhwkJtKolc0+VLFsPCgUhQNljF8BE8dCdlnNjD6mEwc+WPycDSYj8/5kGQNzzm1vpZFXA9dtg6vGDRV9v/6R87PQH/ZOFLvCrvJ0gf4rvdgnc5h8pNaQYzSMp1G4swT/pxDZ2m6L6vUSM+yqlbtmvqPoFTE6NydX8x3R5DzyraYQ0UziXAvTcVW+TNl1NNSyzTeRUm0SZnlmJwQ2umpiZi2gDR3oqL18cMz+4ZyxC0hHMTCA25aPmbvTXJ14rxFIA==</encrypted>]]>
      </text>
    </action>

    <action id="Promotion">
      <text>
        <![CDATA[<encrypted>z6jhJU9j8Lul7tNiRIKnmCloyOYd1v0ZTGCqb5ZJavXSGx2xuCgc4v8g7iedXNuglQT8IA8HEknPOT/yF3H2+KCSjq3kvWOdnW8vDpI38TzFyOmA5ctijyEG+VgabSeELyqwjc0vMnj4EmWtn9L/mmy2X6M+7Jx8+tpcg2FnhAI=</encrypted>]]>
      </text>
    </action>

    <action id="TaxAccount">
      <text>
        <![CDATA[<encrypted>fzaFi+yneMQc4B5tUV0FMOxdTnIfz9+Sc31M6PkKc49T5OK8ACyjebkZ7GBF9SjZDLfVt8xVaFTdL1EFM8NEqlHP/IiM2jf5B/2iMzOVvha9JL6vvsA/XVQY2Wz+CzWXkzsGE25TNBp68NUJ1nxmMw==</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>f874bmvUfaLKygwspP/jA/5IClHk+bDNJWtqrPaQD73+TlIB5MaYYQNduOmKinq4/gXA/csCJBBvZAjOMUd6ldF0myoRaQs4ff1r8SgNxh/LPyDvzpepfKEVlw23zc7sg1/6G5AWfW+DsRm6xdVWwBUxR6IbAKPcF0l+/gZANzXRcsMTdBeg1FsGuk/glvv8F7CyiyQSDHVT8VErM7MAFG51dIudKIWkHBo7hkRtLCWydd82MSgBLHfTUFz9MBhxCQjJIybGfpPv5g/ygf3UdaAswhubrkB2BtXsnPVrP5B8kwRXM05+FaCY1vx3EsDjMzrSO52K225X7o0+ovfQpQ==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
	<button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Lookup">
      <title v="Xem phiếu nhập" e="Lookup"></title>
    </button>
	
    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10" urlImage="../images/Menu/SalesOrder.png">
          <header v="Lấy số liệu từ đơn hàng"  e="Extract Data from Sales Order"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>

      </menuItems>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
	
  </toolbar>
  <css>
    <text>
      <![CDATA[<encrypted>WhoHWfpyjmSwuVohldl+0GwShYFgtpQMJszOXDWrm1uzW88d/b6qaTd+BjAcEjETOCDCsreBYb4otcSIHS9Bv2+X2S49JgaHzcT4Dzu1TEnSE8JBvLLY6mL8vwYGXyjccHyc3/fXbtqcAER2aZKjZ8fnrHIheRk+6iIMS+EOcfE=</encrypted>]]>
    </text>
  </css>
</grid>
