<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">

  <!ENTITY AutoLotForm "PMLotForm">
  <!ENTITY AutoLotGrid SYSTEM "..\Include\Javascript\AutoLotGrid.txt">
  <!ENTITY ScriptAutoLotSet SYSTEM "..\Include\Javascript\AutoLotSet.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY CssCreateLot SYSTEM "..\Include\Javascript\CssCreateLot.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
]>

<grid table="d72$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HMA" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c72$000000" prime="d72$" inquiry="i72$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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

    <!--<field name="ma_kho" allowNulls="false" width="80" clientDefault="Default" aliasName="a">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOsOqCtEJw8sjaJ5AuNCmVB8Q41yuCdKH1zOr5VMa0apGYKxfxKZc1r+KNu1g7NZfk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>-->

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

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt0" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia0" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt3" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá tính thuế nk nt" e="FC Import Taxed Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia3" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá tính thuế nk" e="Import Taxed Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt3" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền tính thuế nk nt" e="FC Import Taxed Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền tính thuế nk" e="Import Taxed Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue_nk" width="80" aliasName="a">
      <header v="Mã thuế nk" e="Import Tax Code"></header>
      <items style="AutoComplete" controller="ImportTax" reference="ten_thue_nk%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthuenk.ten_thue%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMvZ328Um7WXRlcKG/rwAtvDrcYYkNmf4vzQ3kwKiDIVEsXSrov6eeijnHxuQCH2a4=</encrypted>]]></clientScript>
    </field>
    <field name="ten_thue_nk%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat_nk" type="Decimal" dataFormatString="#0.00" inactivate="true" readOnly="true" width="80">
      <header v="Thuế suất nk" e="Import Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue_nk" width="80" aliasName="a">
      <header v="Tk thuế nk" e="Import Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_nk%l" key="loai_tk=1 and status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_nk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="nk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nk nt" e="Import FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="nk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế nk" e="Import Tax"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue_ttdb" width="80" aliasName="a">
      <header v="Mã thuế tiêu thụ đặc biệt" e="Excise Tax Code"></header>
      <items style="AutoComplete" controller="ExciseTax" reference="ten_thue_ttdb%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthuettdb.ten_thue%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPO1bvZ8TLWZE2OR3Bul/M33SX9L2rwnkKpoB0DC3kB8ADsos1QrOT4WiInV8aAqPoM=</encrypted>]]></clientScript>
    </field>
    <field name="ten_thue_ttdb%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat_ttdb" type="Decimal" dataFormatString="#0.00" inactivate="true" readOnly="true" width="80">
      <header v="Thuế suất tiêu thụ đặc biệt" e="Excise Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue_ttdb" width="80" aliasName="a">
      <header v="Tk thuế tiêu thụ đặc biệt" e="Excise Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue_ttdb%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_thue_ttdb%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ttdb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100">
      <header v="Thuế tiêu thụ đặc biệt nt" e="Excise FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="ttdb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế tiêu thụ đặc biệt" e="Excise Tax"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue" width="80" aliasName="a">
      <header v="Mã thuế GTGT" e="VAT Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue_gtgt%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMWANSp+4fESrNXmh3ZBDdfE6jWXZYbV6Fq2+jWE5kEBrfkyz8sxi2bweJpJM7gA2A=</encrypted>]]></clientScript>
    </field>
    <field name="ten_thue_gtgt%l" readOnly="true" external="true" defaultValue="''" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" dataFormatString="@exchangeRateInputFormat" inactivate="true" readOnly="true" width="80">
      <header v="Thuế suất GTGT" e="VAT Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue" width="80" aliasName="a">
      <header v="Tk thuế GTGT" e="VAT Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_gtgt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_gtgt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế GTGT nt" e="FC VAT Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế GTGT" e="VAT Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_vt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="pn_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Phiếu nhập" e="Purchase Receipt"></header>
    </field>
    <field name="pn_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="dh_so" align="right" readOnly="false" inactivate="true" width="80" aliasName="a">
      <header v="Đơn hàng" e="Import Purchase Order"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" readOnly="false" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="tk_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a" hidden="true">
      <header v="Tờ khai" e="Customer Declaration Sheet"></header>
    </field>
    <field name="tk_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[sua_tk_vt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="thue_cn" type="Decimal" readOnly="true" defaultValue="''" external="true" width="0" hidden="true" aliasName="c.tk_cn">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_tk" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0tk" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>

      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="so_luong"/>
      <field name="gia_nt0"/>
      <field name="tien_nt0"/>
      <field name="gia_nt3"/>
      <field name="tien_nt3"/>

      <field name="ma_thue_nk"/>
      <field name="ten_thue_nk%l"/>
      <field name="thue_suat_nk"/>
      <field name="tk_thue_nk"/>
      <field name="nk_nt"/>

      <field name="ma_thue_ttdb"/>
      <field name="ten_thue_ttdb%l"/>
      <field name="thue_suat_ttdb"/>
      <field name="tk_thue_ttdb"/>
      <field name="ttdb_nt"/>

      <field name="ma_thue"/>
      <field name="thue_suat"/>
      <field name="tk_thue"/>
      <field name="ten_tk_gtgt%l"/>
      <field name="thue_nt"/>

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>

      <field name="gia0"/>
      <field name="tien0"/>
      <field name="gia3"/>
      <field name="tien3"/>
      <field name="nk"/>
      <field name="ttdb"/>
      <field name="thue"/>

      <field name="pn_so"/>
      <field name="pn_ln"/>

      <field name="dh_so"/>
      <field name="dh_ln"/>

      <field name="tk_so"/>
      <field name="tk_ln"/>


      &XMLUserDefinedViews;

      <field name="ten_tk_thue_nk%l"/>
      <field name="ten_tk_thue_ttdb%l"/>
      <field name="ten_thue_gtgt%l"/>
      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="thue_cn"/>
      <field name="tao_lo"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>

      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>

      <field name="stt_rec_tk"/>
      <field name="stt_rec0tk"/>

      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>kY8arJPycNaO1CUzgyDpCShIaMNV9x2wyopHZH95Zx+wrGM/OMx4atyDjihXd9cLhb9A6DSfHpLetnYTfZckqyosz1qrXLYLrz6VEe83wK9XTDm/4WZAn4fnELqrBGDlpacnGxrre0aSTqhLbrR5PzqMlSZb/3RQ4Dv+zOUHcMom2FhGDOoygh0W5t0Jhb3o0O/m7tCo+xHeqP9me+rq8ayAQeLREjiAksPVrhI8/rww/lH+t+Mo+Q1Uv5HkCu8lGeZJLME78UWk7vbdJYAc0baNrb+C+oX5IrqYc1Z+4NE=</encrypted>]]>
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
      <![CDATA[<encrypted>n28EDiwj36VRcPrW3nOE8bDbwZuFgJkaVHU20Vyk9ZQnhk+8bzrXmembp1NnecV+mVJ5WUtxooeblm96qo4N25Wr2zqkWJxrhTC3tmUuvHd+1jXvJ5CPqrrFfnz4T5cMaB1R92BJQWqumURWacRnSSMT6P26l4+eo3PRSV8ueLeiJCDE4hTIuDXbZDQlJ37EUMalVxtFdMrwbUnxsSDpBGLRYuxAGi7l9DLVJ+yGZl/wDY2WEoawbjzxr9HtQpzPzCpn2k06DmlNhn/ZeSIwwa/FilCj7zm36LS+wENimkFntNOOEmBAl4hfqWYcfLOiEamYEpcGUVQsIg9aYBR+TCNyV1dQP6n5yQtQZGYiNr7z1pQTVTzjAXg8AgVawaW0/xW+/lf40N38nqJeX4ZKYQNwzu+/VN9KcLFgLhmjAEal0dvnn/BLKx1sT1bR2ZetY5bjjFouy5zWJS3p5KSxXirQL+X0VwERUeKZyfXMUHeqacnDy/bokTb3fgw7xKGFhE2W75VymtYy0Vc3vvbfMkew0SfntUodPRZ8FT0w+FPEhDXeYDWuedinaTTQ5zhz7MLMoRpCbXsEJw8vfzLyXpLIyiFWgZZ/rltcMeXwhEkxaeSBP5wLgpwOLC+dInLYpAoskKrK1f8I+9rQ1E2D3Y7sZqqIy3OqWLsQ2VZAZ1E6qLKAGY1FXet74pZ7QuV/KqAjNfc4nKXRdJUcOPvXIboQP9hx6c3zSF0ZpJotOjJ9qua8gU1Lds9fCZaUZK+hM+i6amBpVkzbOhPMK5cuFdxyl/oV46EiqocS++ggjVNpzgHF8kSzTka5Eaihd9haqEk7644iSR4K6ro0FnhnxDfX8Ma5C6RDxEOQL7C4MuKxUSyq4F2y7EmbiCeH9LVli7RXaHTCp/hYtBYucmWz5E2GPy036NKBa4iqAGfmDyjTuXzh5E56bjzvCs7a0Ub1sqvIU3E7S58mJC22Nyn4+2A5oKZ2JmfQLFF/PEOw2kz0xJNNSPTf4oOEJM/d8XF6uViOtJI98HaaNHDd+MPspzEnhYpuumzqu505fglBajfsvi+hzIzquL9VMEr7ZdUhNOMWJafFsOur061G2KXualDI3rXnf8V2XhGTA1GDfH9vY42jMM084WGEdprncp402fME6GyFiRYdLuYdnKfEqOddqF2CZ9YeNvWEVEqeBeGBGumSdvAltpBWCAui8ENH5QR5je6b06VoSYgcmp00i29s8XmMTVfPnR7+y6afsPErZft2reW47JZuHFsADxTIhPa49iGPfK58mw+6XBJueYqt4XEj9T0G6DyouzX2O2AggL1FLQEhY3MPxjcdH0g1YOWbxhubO7ENMyiKxFL1zIC4NyEV7tAgYUZu056eSyWrdR58Stoqohm204w6+0PR23d20fjc3/yp1iKgHs6OAg+1wzleQJMOdqIrIN+OhPnritigdVGF/2N0ZphUesUrXxBMpmLyqu30ka23kCJr/aRtLVTo9VRIhVZbAPIDO7ArQP8/aw5g1FOG4sRlDauK2ekDPaX7fncAVsKs3n8r5S//LEtkE96+Iw2ZqAM+0NjPZUBbL7/3mzPWfTSO/aGq4ubl6+Kr6q8Sjyd8uX1OHaMnA3/cmFNoYh/WqoSefc991l76GV/3vrvpEDdPFVxw33+NThEHSsYnsNlGKOIA00iW5Y/waGI2b2g21GatuegESgLsqf0wYH24msx5yoQF</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>VqEsGuDQXpRbPSJlGw8qTmSoZFva4tOn7oEXJm0cBZaBOeySdEXxA34mfI86GzuAfotCbZq889DXf/yy7xyhujyqopr8r3Z1GMi60LtKmKA6iM+Qt0HMC7Q77SpSYj2emwf0y8N+ARUhXEauEvpZ1vBI0nYIMUczDiWqdInsIj81DqjUimvpoxn+OXaMZB3O9TY6/rSE+ea+xpCdAV3cwiXTASqFbebX84p3kSNKNKbD0KUXxtcfATSTwEkg+pusBtDMdjBWL9ocgU/D1V4kFJRwPm/etLCRPrbPsWLDu5qqBf/DFMrAiW9ng8jBVwZH0NlzXwQ4JYg3hKA46NHADqchWTRbG8Bei+fqzjIyHj2+AwYKH2ydLDNZIUhuFHq56Ow/fOs7NduUlCbLZIZXOA+Ec9aueDJ19b2NDY4UYRHWZhjI4LgqqNKLmnlNKZxJvzwEc36a1hycGigDv1wFEsa1GbYGb2RxX7G6swtUUgw3GkYMOEAcKfBwgeqGH4xc0rmAlD0iSPGJehsuwIylIquwPfpDmc/pV9b0C9WcxChBLcVzcVyVTALOsvKHkJ+VoxbQrWbuUvGfzAneKAQ24is/hT4mwmdv59Y6dTg3uw2aCBJicc1HqXxgbtP9hFrswzp5u5Nl6A5GLQ8MYqUeZw==</encrypted>]]>&AutoLotGrid;<![CDATA[<encrypted>MJbQcMDWHXw5dbsx9l8Mmn9i+a69Bo/ECN5kzFMZjqtWG2AjNcxK4vqg62qPOM+lDuDUjSocIFTCgg0rxaBrXud17ZotIkACp/ymbDAo69K+OQbfrIaG8k+tXNpqx+WOe48qfN0K328q4mewBFt7kkcInIj0pt9PWmpr/1o556ourk1XBmgxzrRnbskZGaayJTJBDyPzJqXCfc7PLzDVsCePC5gLWtmXGnIe6osLHffTCpeJO2NJXZUeVb8sTs64SS7W5e700tVt0NSC3Zf6miV4JOZ8J3IR7NlLQdSKfrzwkhj9jykz7zbAc9GipPT18vsDEEDiAwqo8Ro7ILrEm6g2v1T+R0viOu4VgJIJLfHfgx60K/ZyS3ScSI5MJZjnuNLjiBsPxFl8ynRE0BZjixKGbpWJuhzDZEk8AKlz6gL8kxIo/YyBCuo4XggP+zDNGWKS6rjcU6Yt1+MfD0df++AxDYi93hPuVh7zfVYegdJQ97//6dHPR8X229Don1SKbwWG3HA06Oc/ZXbESXvTeGpd58Xwh55XJe/uYNAnVeGS7T2by3tGEam02F0g3w+xHeoIgB6N7svw+XS+BM7mOcJc9efZUi3xfD3R6Q3zsZXhPJFqX+PniJaXpd4ZADfxq4i/0fPlJnRMc/vuOLdThEkMszPw4w/pPkEQRyjDYoM20UpptgE+R7c45+S5Jxw6PKAXELRO4fuNgZVkPWSfCcpc00OBvb4TZIXfM1En1tCc+bts/gZRrY7zhxgEMLt/LCPNik+7jZVTUUmi2DnsP8PWv2YlklitYO30+xodWK2szO96ahc0Aj4fOvvB17wj+oAu872+sH2YFqtdovpmeNV0fCZFGyKn8yDQBQVjYieFV+mOnc2Cjb56mYKMCUguRa7Umf+Fyya3lT+iZtf1Nk1v8maZOtZswPOIA+9yzE/PYkOK1oUtCxuepf765b2/x0lB7/kix7mME42/6Kd1ZR0Mha8iCZ3RJqpYz7UGv97CZaMzcHGAKYpRPM6qrXRKnZv1Dt3Afy3juUV8sJBFqXbJ1SNRZ/s8qevsCf0CTqli0e8KzZ1JJ6AWGgdgoi+Wd5oTS7dHmReMUZs1LFbyzg==</encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
      &ScriptAutoLotSet;
      &ScriptCheckGridIrregularCode;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<encrypted>b1nXhVk0Kx5OU68CGbmED3oeIi99F5N4tid6YPJ2/cplCSunP9tlbxPFhnH3oO1/nfqadSAyyOtpwKmsRNRome7H5aSogBSwMPrFNzd7oQUK+o2R+WJLOzj1NV3FXqH4fHGkIqo0JE2ss1fTCqeFz3J+Kx6r+WosyjhLfPoEzUwktPKnUaPTX63GF+K/gZ8LLInKMijhMzSgdMXpRDMEehaTgs7JbMUW6Gz8yhSE/jGLeOXTyIZnWCxMMP9SLPyr</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>dc08hik76x5Apk6GwKudrishBL+SjRFlc+QPc+D1bG7fiviwQTbL/9oKz90Qx6DsKSD0epArIrgOkBiy8QLNXpTr7m1D4nK1nlWT8052xndTvdV9KAztZo3CGzNJi9XyI8KEJJBRh/aYh0peT1UmNluMphUgNA6t+o5SgvQtuqdyXltPk/eAOV2jhhEtDd/X06J1mQTeMD2c0arSJjcthrl+mxg97bI325Jl7/u4/0NzahtyQJXHNA6dxkaKj+iAEYV2ncL4ZLK4tVIVC6ovBg==</encrypted>]]>
      </text>
    </action>

    <action id="GetTaxRate">
      <text>
        <![CDATA[<encrypted>t47awkQ4zvLR02bMcC7C0XVmoNTM05fSKYEi5jv9JidcF6VK0IcE9+LYvwmtcQaIl6EDevwwPM8Zv01IF9dIG6ce4mqQYx/2VxNgejSBiyUTFmRtU/Y58J/6iT4zLIqE6qsu8hCyjX3LVf7n8OS8Kw+AemMcKbrGczKoWNT6EmJbxu4ZjypMIaFcwPUDwK6qmNiNzf6/t7vsrTiGpRPI20i4VoDyzMW48Yybroq3x0wozcH4oBTguI+vJgienzq6ZnXEeUV02gwWMmDVT87BcA==</encrypted>]]>
      </text>
    </action>

    <action id="ImportTaxCode">
      <text>
        <![CDATA[<encrypted>FFMgZyPNm45FHIK+kG5cbjlrTsfy8f2Vj47IhRij8LZvovC7sBMJu3WnXdRRvOQKrRoxktTjFO+1f2tDwlYb3VHFT5Zj+9NXqglnRWAZtz0GgTwCAGhsk4eArRJMMbGnM1V98HMOFRW2yIbC1KsvGkA6L49Q2crB/3AqBT7BuTNF5VcOsGOLXGf1utD0EPBEikpyZjED4sPkM/jO82Y8GA==</encrypted>]]>
      </text>
    </action>

    <action id="ExciseTaxCode">
      <text>
        <![CDATA[<encrypted>+FfY01cvNxLorCAEGC84eK4GT0GNJ0iWjSBNaU62y9x8BUIxwzbXlbfNa+6tAkd/D4Crwy8YFiREUk7RWwOzs71xCnNXamYfbnG4j0ZhQpYIwrAM3tvXNVvIHnksEFKWGU9SkpIglQiVM3eiMa9kWFutr+CEPp0tdaPnPKUQj+Hpuqsp3QJcMzqubycvqwPDBvxKnzdLRpHp+eiczlHi4w==</encrypted>]]>
      </text>
    </action>

    <action id="TaxAccount">
      <text>
        <![CDATA[<encrypted>gl7AIwisx+B7OzlE/8uruQ83Uod6Tvvb1dbx24FNPsNexIn88YU99v5IBl11HM5C1qIcRBuiyvvfTB0RGdjuMOCCAP3Mz8xoXA9BtZTheFoRqzfAdnO+ARzypWfI2dpwwRI2KC8M/zlZbDjr6/UlVptfTGV2ZNAtTg4Ft0FCtLw=</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>4n7MQGkTwxugo5ttlnXqJRwIUBDl8GPR+xO3zyH9GS2rqp0RwSuu7ddbyu6qQpKhxYlRxbMmN+ovciROORRzZvwmFW92iE1zrUCxuhk4Cex0CGigbO+bR3E470OaeJnhW3pl9paspJBVaxXT9z9+4KzkiduGVznYI/mMBgJiAVXEFTCaUp5R6NgahHBzhy/tZ5dZqZKz0FjURr6uEJV5HQ==</encrypted>]]>
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
     <button command="Lot">
      <title v="Cập nhật lô" e="Lot Maintenance"></title>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

  &CssCreateLot;
</grid>
