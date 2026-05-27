<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "IRSite">
]>

<grid table="d59$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PN6" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c59$000000" prime="d59$" inquiry="i59$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" readOnly="true" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" width="250" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" readOnly="true" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      <header v="Chọn" e="Select"></header>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA1whs3wOzIi5HIUuY6KXqZqSL7fyGFj4tBTSBHevZK+ZD</encrypted>]]>&Identity;<![CDATA[<encrypted>v9X3kPSlVq6XJyW3b0ukefQ80seWRMvpS0bWQe3gWOBrOSs11y1R4J5/euozxt3b</encrypted>]]></clientScript>
    </field>
    <field name="sl_ss0" type="Decimal" dataFormatString="@quantityInputFormat" width="90" external="true" allowContain="true" defaultValue="0">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="90" readOnly="true" aliasName="a">
      <header v="SL nhập" e="Receipt Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_ss" type="Decimal" dataFormatString="@quantityViewFormat" width="90" readOnly="true" aliasName="a" hidden="true">
      <header v="Đã chuyển sổ sách" e="Book Quantity"></header>
      <items style="Numeric"/>
    </field>
	
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" clientDefault="0" readOnly="true" width="100" hidden="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>


    <field name="ma_kho" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="tk_vt" width="0" hidden="true" allowNulls="false" aliasName="b">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>
	<field name="ma_nx" width="0" hidden="true" allowNulls="false" aliasName="a">
      <header v="Mã nx" e="Reason Code"></header>
    </field>
    <field name="tk_du" width="0" hidden="true" allowNulls="false" aliasName="a">
      <header v="Tk có" e="Credit Account"></header>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="he_so" type="Decimal" width="0" hidden="true" dataFormatString="@quantityViewFormat" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
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
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="chon"/>

     <field name="sl_ss0"/>
      <field name="so_luong"/>
      <field name="sl_ss"/>

      <field name="gia_nt"/>


      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="tk_vt"/>
	  <field name="ma_nx"/>
      <field name="tk_du"/>
      <field name="sua_tk_vt"/>

      &XMLUserDefinedHiddenViews;

      <field name="nhieu_dvt"/>
      <field name="he_so"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="gia_ton"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
     
      <field name="so_ct"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW9J4vpfFqiPVDhWSruApxZTboPgHnVxCMgniWt/a65RP</encrypted>]]>&Identity;<![CDATA[<encrypted>RyaRKJzfwvDWVOkVeouBT3arZQsfRlNpUs02fRP6FdUmMPcl4fNvBQsWlkGyKotNGFCgKa7F4WIKmLoBtdwcifo5rtSmNP6BoNMorvfg9UdVYe+vqo4MlA7CbUSUd4kH5cHZ5kiDXs1DSXO7V8Ev4xdecjXHfvUEHcnkIp3w/DVkBB+jUIRKVkl+FBxxfhIIYt5lFA87JGks2XpRQjpNpXn6O4+2FERvsKyRYw5Zz7hgWQ+sb7F0SIZtQ4vMyladAY7EzAmqznfk6uN7KEhqX+tJVEWP/NqRJx1BKVMkf7g=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>PIMwMHcDQTnS1pN0VxlCw1DMTFI30cte4yHGuipTUfzN6EH5hjcv5GMi6hUk0KtvRAZUnOzyMoUSJeOn2NvsN65MJpqez8OgZHvMtXDMsEBAl+81XHxMflCcdzGa/IEHzxF3dLxByfGScUDRhR9jWgdoXVqNngutcewuqmcN388szv9mhW8VBOwg6cy7d5L7</encrypted>]]>
      </text>
    </query>

  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
