<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "PSInvoiceDomestic">
]>

<grid table="d71$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HM1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c71$000000" prime="d71$" inquiry="i71$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" readOnly="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" hidden="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" external="true" allowContain="true" defaultValue="0" width="100">
      <header v="SL trả lại" e="Return Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="SL nhập mua" e="Receipt Q'ty"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kho" readOnly="true" width="80" aliasName="a" hidden="true">
      <header v="Mã kho" e="Site"></header>
    </field>

    <field name="ma_vi_tri" readOnly="true" hidden="true" width="80" aliasName="a">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" readOnly="true" hidden="true" width="80">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="tk_vt" width="0" hidden="true" allowNulls="false" aliasName="b">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="he_so" type="Decimal" width="0" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="pn_so" readOnly="true" aliasName="a" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="pn_ln" type="Int32" dataFormatString="#####" readOnly="true" aliasName="a" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" dataFormatString="#####" width="0" align="right" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="so_ct"/>
      <field name="chon"/>

      <field name="so_luong0"/>
      <field name="so_luong"/>

      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>

      <field name="tk_vt"/>
      <field name="sua_tk_vt"/>

      &XMLUserDefinedHiddenViews;

      <field name="nhieu_dvt"/>
      <field name="he_so"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
      <field name="pn_so"/>
      <field name="pn_ln"/>

      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW9J4vpfFqiPVDhWSruApxZTboPgHnVxCMgniWt/a65RP</encrypted>]]>&Identity;<![CDATA[<encrypted>l9xp2d6SRt86RzI3iXeL3IpySku7+s4pj4sfL1GfZ/wkeG+w1dUyrDpQFecfJJjjoDHs689WMOIiEvIrdqWhuiABRyijK12EGI1cURbPqirkAo0rGutPRPB7OXtNrfSfemxfcjHEJq7EaBGr5HkPNDAgp5YpD08EVFoivYQJ4ihqRE9QFqVE0/hbnmY3bcf7AUnfRKZcqACGeyha14FvAVSz8DA0GWEZZ9P37+kN2YablwajuJaRVgtgLF2rImLwxJ5t9hj/bA0YSXS3scUeqg==</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>WvNDtXHzUovwtj9YxS0pGkQzDsL0kPMjEWy1PH8fnHVvzCulgR92pcHL7PUQ0ORIQkRUY4eiS7whQ6+bTuiIdCzRE0LyqXv27sKFyox957dNzy9h9kTmdPk8YSHD+4mL+69RS7staA0CmhiBPvahq3FcRg6/iTlqw52Zg2VoZET0/7KSlY9twxbsX3Ko7bcC</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
