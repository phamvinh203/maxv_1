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

    <field name="dvt2" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt 2" e="UOM 2"></header>
      <items style="AutoComplete" controller="UOMItem2" reference="ten_dvt2_l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt2$vdmvtqddvt.ten_dvt2_l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
    </field>
    <field name="ten_dvt2_l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
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
      <field name="ten_dvt2_l"/>
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
      <![CDATA[<encrypted>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</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>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</encrypted>]]>
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
