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

<grid table="d82$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HB9" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c82$000000" prime="d82$" inquiry="i82$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
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
    <field name="thue_suat" readOnly="true" type="Decimal" inactivate ="true" dataFormatString="#0.00" width="80">
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

      <field name="so_luong"/>
      <field name="gia_ban_nt"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="tl_ck"/>
      <field name="ck_nt"/>
	  
	  <field name="ma_thue"/>
	  <field name="thue_suat"/>
	  <field name="ten_thue%l"/>
	  <field name="thue_nt"/>
	  

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
      <![CDATA[<encrypted>2yoodU7d0raf8/2dYdGxiw4wbB6QJOWOq3S0d7/nVsaekkcfvrKI2Y9gAVpkOkmN/u4W/R0tnMmv6DureE3ym9w4pouD1PXxCyCFVm6YPVeOSOghb6yX2QwhcmrC5hTDcYhdULisDRupg44x67chHgUROj3zS31FXaXERo+xTzAVzZa6vwDndTUKQqlshq0BRtRSBg1jSZKkJUn1ctqi9lpAbASj7is2SJCkhf8jviSsSUb81NMl5lRVeskuMRuRIBh6M/BMCmhu0lqtD1beaCP3vrM2n5ZTYdTsTBdqxDTC7hH8PlTY+QIl/rHDASiCEtF1/oIwSAOtojgYrxUenrmDavcREhnjSI2SR6gEtZbYF6bGiz7hzMzHCRO8RmcYSOovZAoWDFinl+XjZP6pq3JMvXt4OlkooE+yMwyOi5ntMrs1o0jvNzmndzDdnMlnEiB6OfMBjwri69yvUWE8KKqunribxmDVXRtgkoydG69H86nMPl3ZCJb07dCPfLfDU6J+TH2/1pTvN+M5ziDjyyWbQlx4enP4L4Tg4MOTHIRLaWXcuIVD27P/+BARe2sLKs2h19UPMLbGkZM/IWM8N4A6t/9rgeKHI7oGH7NMgB32czYHUse4n69YE1J5ZFv1CbaO7+CmYqN1TpbraOqTPQmagdpEEjWXMhkUxbSADATmAVByt+bJo37N6rG4ELbG1KM3HXRYKDeJUIrwnD71fjIwhwOjWK0kC97prfv5U7n26yaFSxdRfp5sbd6Vm5PMic8NbzSs5xb8zoGE0+SHfrhLIsNtrBMPOkxYf6NamOhMwKNTkz7Xmp03Enh84UPpkzJ1/V1b7whLrhRffZqjDFSbPjV9gZw8CER0zsrCF19MO+t8IkO3ULl6XNHfocblmldFhDa5gqbgrGCHRsK7ZyKs7h/GIUnQQ2Y7PGu6MITcr53IdMHXe6S7KGXadjlzrth//hQhP8y9o4JS4pt+TZmJZ+UAayBw56B5QJ7uQCotRJc3sjzCgt7LDsEvTUSdZxVt8alLfjwuOJXBXGOJvSa60/EO6qDb+R1pZxkg/93won9IsQUlgpR9CHyDa3P5uXSoLN/OzkF2zJtf0k2CtfsdJGDHF00A3K8l7HqbBMBrU42V3P2eXhKuajK44rZeG3gk+SNg6nYMskS/uSA4QWAHsOPn97yWFHrNycoGC0vbAUFmYnvgBUz3ztvPw12+iF8sWkLDYn83SZXbBCo+BbH7+fRTqrmpUpKWMAQ6vdqf2i9k7R1CKdN3WGcf3EpxYNPVSbXL34W/k3No02z/EBU3KgWle8L7hcTURSpfbqsNiVKHUkI73Aq1ea6xRsUE7cIsbJg7I0z5TBiriGXGShyEJk9ncGMytuZDqdetu9xi+0ne37k29H+hYc8xfOz8EIILk5Vwysw8UqmxaP1m4BS5d7tIejHdftvRVYUyYlFrBHaVOf02VPA/aX/SWVzpjNyEjvQy5GijVchWsmPDI5jNjwpfuPE+RlNrjIJYuQ7w/ZoIwlMIijzkWj9u+GgZFcShNgE8PUBeZPzymxUf1MUsxNg3aTduyqgoZTPZ1Gl3tQmblAH/vL+KgCpCh7nrukefxdOuKL18n0uTBQptt/tDzLhjvjft0NVrSILqlhM1vPetxxFQ4ljz364O0ICbkm2KS9lDUv7E5XUB5d6OIVkkfx5L65ptqIb7uDgXdrUtl23OhQAoMMyc+mynd+JZeMrjpqoB9GhAVD4iZJGrvJRVK1DdkMil+3nwS1xXhifSky2oRxYuDfQKN3svNNtqt4/SqWAbL3gjbwpNSw2WsqPL2ceAiKyiiaHERdJsw9SkbOniyZgVtY5bEWNVM5+sgsI4neiB8H8xm0g8Xa0NyxwYo30DqmzmlBAr4SsQQ8EgzyltQVLwS+g6CtIMeo2GpQKcO+VxWc4I8bnkCgHlGZ99DwmBCllPQIO4kVGeh5qEiAfMSqSPv4jSB+1v0dqA</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>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</encrypted>]]>
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
