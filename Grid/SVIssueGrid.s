<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">
  <!ENTITY Identity "SVIssue">
]>

<grid table="d66$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PX5" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c66$000000" prime="d66$" inquiry="i66$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" readOnly="true" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" width="250" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" readOnly="true" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <handle key="[nhieu_dvt]"/>
    </field>

    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      <header v="Chọn" e="Select"></header>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA1whs3wOzIi5HIUuY6KXqZqSL7fyGFj4tBTSBHevZK+ZD</encrypted>]]>&Identity;<![CDATA[<encrypted>v9X3kPSlVq6XJyW3b0ukefQ80seWRMvpS0bWQe3gWOBrOSs11y1R4J5/euozxt3b</encrypted>]]></clientScript>
    </field>

    <field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" external="true" allowContain="true" defaultValue="0" width="100">
      <header v="SL hóa đơn" e="Invoice Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a">
      <header v="SL phiếu xuất" e="Pick List Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" width="100" readOnly="true" aliasName="a" hidden="true">
      <header v="Đã xuất hóa đơn" e="Issued Invoice Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kho" readOnly="true" width="80" aliasName="a">
      <header v="Mã kho" e="Site"></header>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" hidden="true" dataFormatString="@quantityViewFormat" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ton13" type="Decimal" dataFormatString="@quantityViewFormat" width="0" hidden="true" external="true" defaultValue="0" readOnly="true" inactivate="true" aliasName="e.ton13 / case when a.he_so &lt;&gt; 0 then a.he_so else 1 end">
      <header v="Tồn" e="Stock"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vi_tri" readOnly="true" hidden="true" aliasName="a">
      <header v="" e="Location"></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" hidden="true" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_ban_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" hidden="true" width="0" aliasName="a">
      <header v="Chiết khấu nt" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_dt" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="kieu_dt" type="Int32" width="0" external="true" hidden="true" aliasName="case when not exists(select 1 from dmtk where dmtk.tk = b.tk_dt and dmtk.loai_tk = 1) then 0 else 1 end">
      <header v="" e=""></header>
    </field>
    <field name="tk_ck" hidden="true" readOnly="true" width="0" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="kieu_ck" type="Int32" width="0" external="true" hidden="true" aliasName="case when not exists(select 1 from dmtk where dmtk.tk = b.tk_ck and dmtk.loai_tk = 1) then 0 else 1 end">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" hidden="true" readOnly="true" width="0" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="tk_gv" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="kieu_gv" type="Int32" width="0" external="true" hidden="true" aliasName="case when not exists(select 1 from dmtk where dmtk.tk = b.tk_gv and dmtk.loai_tk = 1) then 0 else 1 end">
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
    <field name="line_nbr" type="Int32" dataFormatString="#####" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dh_so" align="right" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" width="0" align="right" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
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
      <field name="sl_hd"/>

      <field name="gia_nt2"/>
      <field name="ma_kho"/>

      &XMLUserDefinedHiddenViews;

      <field name="nhieu_dvt"/>
      <field name="he_so"/>
      <field name="ton13"/>
      <field name="ma_vi_tri"/>
      <field name="vi_tri_yn"/>
      <field name="ma_lo"/>
      <field name="lo_yn"/>
      <field name="sua_tk_vt"/>
      <field name="gia_ton"/>
      <field name="gia_ban_nt"/>
      <field name="ck_nt"/>

      <field name="tk_dt"/>
      <field name="kieu_dt"/>
      <field name="tk_ck"/>
      <field name="kieu_ck"/>
      <field name="tk_vt"/>
      <field name="tk_gv"/>
      <field name="kieu_gv"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="so_ct"/>
      <field name="line_nbr"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="dh_so"/>
      <field name="dh_ln"/>
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
        <![CDATA[<encrypted>QGxbsPHCMPAv3vvc+Bap17lkHfmwyPy6eGA/EXVi1+KEHUBdB1ypZor3hnFHW9eJLpuZCxPAgYOZ9u1RQztLiDn8vN4m2WVfq/s8PAi9+zRwbXe/9ERrI1EYa+DekaEdD0hVzqLXabNcr1BPE67NbjL7XkJzIFgesLiBp3I5wOoIWqYN2XxI/HVLVqBIDYPQ/Z2aulDA0GADNpSgAK6png==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
