<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng giá trung bình tháng" e="Average Cost Sheet"></title>
  <subTitle v="%s tháng %m năm %y..." e="%s, Month %m Year %y..."></subTitle>
  <fields>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
      <footer v="Mã nhóm kho" e="Site Group"/>
    </field>
    <field name="ten_kho%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên kho" e="Site Name"></header>
      <footer v="Tên nhóm kho" e="Site Group Name"/>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn giá" e="Unit Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn giá nt" e="FC Unit Cost"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="gia"/>
      <field name="gia_nt"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3krnFX3/bJhFsWGYhUdJ1nfabv6+tVxAyNzClJZmqvIoPOn3GnBBscyjKJgXImW+YHydzssCeOnvYqTWa//4x3mk=</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>J4gCSM9Q22uYhDRHzP+HH9zEGyVVclf//CUfzMHFt7SV9znlEH4OGwkXoOfgMY30Mc5XGcjRlrTBAolWtstXTDSa4FeMHQrjiu5UcPLX2jRFIe7SDYoay3on/DtH5/vp3M5FYVR6szyzF3o9gUpjole7EV1JWFIUdPwR9rFinqjpCjyiwpzFmP9QIuK2ZVhW/gpTvgc5JSjRVSDLab/CrpTefm5qN+WfJVhYXBcvCyX5B9d5UvALcRMg5CnYVj6QF7Bqpr0QNVFw1oAeTiaGiRLsIeLyJ96+zxOb+9SNTaAE4TfR5KNNb0t3qHxVNv1L</encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Print" e="Toolbar.Print"/>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
