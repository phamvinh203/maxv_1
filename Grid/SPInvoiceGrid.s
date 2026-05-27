<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "SPInvoice">
]>

<grid table="d81$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HB1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c81$000000" prime="d81$" inquiry="i81$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="90" aliasName="a" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="' '" width="230" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kho" allowNulls="false" width="80" aliasName="a" readOnly="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" width="80" aliasName="a" readOnly="true">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" readOnly="true">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="1" width="60">
      <header v="Chọn" e="Select"></header>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA1whs3wOzIi5HIUuY6KXqZqSL7fyGFj4tBTSBHevZK+ZD</encrypted>]]>&Identity;<![CDATA[<encrypted>v9X3kPSlVq6XJyW3b0ukefQ80seWRMvpS0bWQe3gWOBrOSs11y1R4J5/euozxt3b</encrypted>]]></clientScript>
    </field>
    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" external="true" defaultValue="a.so_luong" width="90">
      <header v="SL điều chỉnh" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" readOnly="true" clientDefault="0" width="80">
      <header v="SL hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Giá bán nt" e="FC Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" readOnly="true" hidden="true">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_vt" width="0" aliasName="a" readOnly="true" hidden="true">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" readOnly="true" hidden="true">
      <header v="Thuế" e="Tax"></header>
      <items style="Numeric"/>
    </field>
	
	<field name="ma_thue" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
	<field name="thue_suat" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>	
	<field name="tk_thue" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
	
    &XMLUserDefinedHiddenFields;

    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="tk_dt" width="0" external="true" hidden="true" aliasName="b.tk_dt">
      <header v="" e=""></header>
    </field>
    <field name="tk_gghb" width="0" external="true" hidden="true" aliasName="b.tk_gghb">
      <header v="" e=""></header>
    </field>
    <field name="kieu_dt" type="Int32" width="0" external="true" hidden="true" aliasName="c.loai_tk">
      <header v="" e=""></header>
    </field>
    <field name="kieu_gg" type="Int32" width="0" external="true" hidden="true" aliasName="d.loai_tk">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="so_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
	
    <field name="so_hd_goc"  width="100"  aliasName="e">
      <header v="Số hóa đơn" e=""></header>
    </field>
    <field name="so_seri_goc" width="0" hidden="true" aliasName="e">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hd_goc" type="DateTime" dataFormatString="@datetimeFormat" width="0" hidden="true" aliasName="e">
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

      <field name="chon"/>
      <field name="so_luong0"/>
      <field name="so_luong"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="thue_nt"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>

      &XMLUserDefinedHiddenViews;
      <field name="gia_ton"/>
      <field name="nhieu_dvt"/>
      <field name="lo_yn"/>
      <field name="vi_tri_yn"/>
      <field name="tk_dt"/>
      <field name="tk_gghb"/>
      <field name="kieu_dt"/>
      <field name="kieu_gg"/>

	 <field name="ma_thue"/>
	  <field name="thue_suat"/>
	  <field name="tk_thue"/>
	  
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="so_ct"/>
      <field name="line_nbr"/>
	  
	  <field name="so_hd_goc"/>
      <field name="so_seri_goc"/>
      <field name="ngay_hd_goc"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxpgUMynXJ1mqlHw+pbaWDeSNMP0gtligVeTcbOOwuSr</encrypted>]]>&Identity;<![CDATA[<encrypted>dJ2TrE5jD0t8skeB2X4sLFYSnboI4S+TFKo4jAqpxaKnQ9xx4l6I/9g5oe60mdCr//sHMs3WWDV4iTj85RMjndzt2FJyH7ijVTrOxvKmSbsJarJIA0YHOH3yASgMjsR+n+xVhcz0WRxlCTBnP8j3SBgem7a47DFdoIz27X7ScFKrDtAhqox1aj/Sa21flNhysJqeEL8A1UUucespihcPxdf7nyfT4IN3hif2SJ19VgXZkZG35iWHOO34yRi346JrDuMzbPnbQ1Br09lB602HEw==</encrypted>]]>&Identity;<![CDATA[<encrypted>sDZX6DrXJtu6F8Wy3t0jcVMTjvze4RRMZKBr8Vpwf02u5k2Bwna8Sq04QxW0yVU7AV3DxutsMLH22WruZkPsnvOwoT+rMZ9lg+7rt5V3WV7fDlUhurquSL6tMyl9pw1b</encrypted>]]>&Identity;<![CDATA[<encrypted>sDZX6DrXJtu6F8Wy3t0jcezmjj3cBLj/0tkTsMDqOSR2a4f6wN49H6V+CZa+j3qWEVdQN2yZESQu9+3c315aboAlyqJ2b4NyGsRrvqkF4w4=</encrypted>]]>&Identity;<![CDATA[<encrypted>urO0K8E3OIwWMB90ZKRC9anFZd81jOeA3z/rwQ6drGP5gAq1lgYqeAVdwiqX2T5g4nRuLk3/AVBnDgdB+SmWczl4mNAvTw6KeDdf6tEvrzx7vt5Myl8LT/71OPh5Ij3QN5iJAChKpkHYNDaP9W3DVOxwsV/h7eAE4n3j+ABfSzOjyetjY6AIXwjECc9f8a/3dxLL94yKCKOitqfD7b/qyaTkiCtJc2YZrG0aW5eTexf0v2hYbsS4VwDLJgHLM4WMmLbbvtFictnJM2eeiZ7Wfl9ChlxY/z1x5A2zF2APQ7TrSvKA3QEPpLV0UO+QSoeAMZ/qvbTDdP/iXx2dlsMFCAhEQxNw8DnGBOq39nv2OX2+6XyILcxNPhK8WX6I4Z6Q0Zc53NNklvFZP64J4Qaoaw==</encrypted>]]>&Identity;<![CDATA[<encrypted>l9xp2d6SRt86RzI3iXeL3IpySku7+s4pj4sfL1GfZ/wkeG+w1dUyrDpQFecfJJjjoDHs689WMOIiEvIrdqWhuiABRyijK12EGI1cURbPqirkAo0rGutPRPB7OXtNrfSfemxfcjHEJq7EaBGr5HkPNDAgp5YpD08EVFoivYQJ4ihqRE9QFqVE0/hbnmY3bcf7AUnfRKZcqACGeyha14FvAVSz8DA0GWEZZ9P37+kN2YablwajuJaRVgtgLF2rImLwxJ5t9hj/bA0YSXS3scUeqg==</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>IwPlH5vZ2b3YxFmmeo8Ri4KsEiKCA5tgXkpSQurfn292utUcDfz/64Lp53UG/Omlh45SY7NYrU97rhCoTHRJ/RiyJqiYMvX3UpQFLI+WCHRp0TLvG9jeVG3LJ8D+y/CRjj0vREacNcTHZHlndeMOe9/vUGrxUb+lT+OXdrBJyD+FBYucWsqsVVSjrY0Q77vlS9zrkaNvKnAEV9dCgyrYBNcKSiPTxzreifRSQKcgZHTfgXVNV0R4jrEVQeDj0Y4AZ87CwaDCwtpd6yXgJdgPOl2Uc3tB7OC130eUqjjzHTp7q9qZAxfxkvoDj6O+KsIQ</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
