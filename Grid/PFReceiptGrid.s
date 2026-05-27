<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
  <!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
  <!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
  <!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">
  <!ENTITY CommandControlLocationLotShowing SYSTEM "..\Include\Command\ControlLocationLotShowing.txt">

  <!ENTITY Identity "PFReceipt">
]>

<grid table="d73$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c73$000000" prime="d73$" inquiry="i73$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="1" width="80">
      <header v="Chọn" e="Select"></header>
      <items style="CheckBox"/>
    </field>

    <field name="ma_vt" allowNulls="false" width="100" aliasName="a" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="' '" width="300" aliasName="b">
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
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
      <header v="Chi phí nt" e="FC Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_vt" width="80" allowNulls="false" aliasName="a" readOnly="true">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="hd_so" width="0" align="right" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    &XMLUserDefinedHiddenFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="line_nbr" type="Int32" align="right" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="volume" type="Int32" width="0" hidden="true" aliasName="b">
      <header v="Thể tích" e="Volume"></header>
    </field>
    <field name="weight" type="Int32" width="0" hidden="true" aliasName="b">
      <header v="Khối lượng" e="Weight"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="chon"/>
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
      <field name="cp_nt"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="tien0"/>
      <field name="tien3"/>
      <field name="cp"/>
      <field name="hd_so"/>

      &XMLUserDefinedHiddenViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="volume"/>
      <field name="weight"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/5NRu3nfHu1FzbNr0dJx1pHqQCXQLsFS97Clv4jvECuqM95S0c4Voaevj2DYYv/tA=</encrypted>]]>
        &CommandControlLocationLotShowing;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>
    &XMLFlowGridCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowGridFunction;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>ZTR3zuhndR7bHC2cShHX6E7at0pF3iC6uwn2NbL7eSLo248Zku1le2FBK4g//ULQZe6nv98eZhn6fPQlhrxdYNnqI/qmKr7pWo/PnOnH4VU30gsI4LyAeBUlBR1tzef1iVfW4uqH4uFRsyvirxrRMjrZGrVJtosCEshmz+nkxGeKsJ3ERdgBbI1UKq8sUWxdfA070ekFgVr2Nl5Qm0NOI9T+GIr1KHcmgAW+siBJxgvjfLiGiF3qtYt0hhKsGY4l77rnxnJ1NPJN2g3l7KOUQbpCsDW7vTuRr7CjOy1vt8db1ge3W6fxUM0Owpr2kjaxhXkUfDSCCn21WZmYi3yFIS7Yaha9STXsaAVpId9kMroR4AshqdAR3vbtRMEx8cQ1l+kbSV0Fme0sDcc8c9Zbb8bUiH+fUI0NPSbaoE7UHtQZmtqh/66qMPFPOIWst1iLZAnxNS/YeK/d/555sQ/j2+TSL43KUrEDU1MUqXskJhH7M6QFb5o2bm1iuCDTaxz1uYfdMdeJbWUIzXNOuw5XcqU8LERdXBTEMSGgoy88V6//+URtrFIRL8+WwMb610pVy8bqwVue4hKkcAQ8Z02TvTr62tR7vmY+k/xrGi6olV8Ko/m8D6XfgoWNGT+FRcxLdptody7dPGTP/iTqTZ+OefLOI316kpVO+u53cvegIzUjreGiWsYfhJrOa1AJrvuTHEjlZgcwhgZrG0kf14Q0yX1Xzrmai29YguPkmdr9pEpDF6zKFiGP223o6rpf7j8/2FUOjmfSm1ZlkI19+4HY1SZZdVFJjM2NkBS0cVhm4MUOMxWZlxCyzG0c9JvvABZ0dt4AKBMmY0D0E2cxWgcu/A==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>