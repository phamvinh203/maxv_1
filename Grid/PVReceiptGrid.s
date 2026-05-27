<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

  <!ENTITY Identity "PVReceipt">
]>

<grid table="d96$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PD1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c96$000000" prime="d96$" inquiry="i96$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

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
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="80">
      <header v="Chọn" e="Select"></header>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA1whs3wOzIi5HIUuY6KXqZqSL7fyGFj4tBTSBHevZK+ZD</encrypted>]]>&Identity;<![CDATA[<encrypted>v9X3kPSlVq6XJyW3b0ukefQ80seWRMvpS0bWQe3gWOBrOSs11y1R4J5/euozxt3b</encrypted>]]></clientScript>
    </field>
    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" width="100" external="true" allowContain="true" defaultValue="0">
      <header v="SL hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="Sl nhập" e="Receipt Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_kt" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a" hidden="true">
      <header v="Sl kiểm định" e="QC Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="xstatus_name%l" width="150" external="true" defaultValue="''" readOnly="true" aliasName="c" hidden="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" allowContain="true" defaultValue="0" hidden="true">
      <header v="Đã nhận hóa đơn" e="Received Invoice"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" clientDefault="0" readOnly="true" width="100" hidden="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="dh_so" align="right" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="Đơn hàng" e="PO"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" readOnly="true" width="0" hidden="true" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
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
    <field name="stt_rec_dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true">
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

      <field name="so_luong0"/>
      <field name="so_luong"/>
      <field name="sl_kt"/>
      <field name="xstatus_name%l"/>
      <field name="sl_hd"/>

      <field name="gia_nt"/>

      <field name="dh_so"/>
      <field name="dh_ln"/>

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
      <field name="tao_lo"/>
      <field name="gia_ton"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
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
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW9J4vpfFqiPVDhWSruApxZTboPgHnVxCMgniWt/a65RP</encrypted>]]>&Identity;<![CDATA[<encrypted>ky0Gv/EaBiqGB3Soh+tZNRvMEN8SCvUxXrDSRlW0lbEH5CLiEHdLI8/YU3df3UGabt6xVevtonS13kvro8XXWtgviJZ8ektPxJxZYAqKFvcEkt/2BqLeVtXaClUROCTo9UGthdjIzUfWRVtXdZ/eDM6xrj6z3q+hgcRtzSUvaCf0Z+3Sd0p4D1CKUzi5vkLjAdbJEeh8k+AitpUfU+mMw4tUSFqogP7J0BiD6rIqo71fm7ZZlMcgl85TU5nMIZxsAO5gEZoXqtZr8wGljRX0fImWyULsj+Xi+yzsIqcN9uk=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>dt36FFXWeSi59Pw0qWXqkmM+1WPna5ic25CK+cGxUWM9lb3grJ4P+ajMe4pRKoNq7vlke7Hs074cR6BNKqEI/4bgooSgYnm07elbTe6XMTBpyiR1qCIgMQg7uavUTJ8DjS9E2b4Fa7X6/IN5tviMOVEjf/KR4x/Gyq2TbcCkDUj0F6G2XdPMQfLTeXajUNaO0nXY8mRmxCaKGbbSm61W1Q==</encrypted>]]>
      </text>
    </query>

  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
