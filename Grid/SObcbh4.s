<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo bán hàng chi tiết theo mặt hàng" e="Sales Report - Detailed by Item"></title>
  <subTitle v="Từ ngày %d1 đến %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="stt" width="35" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'sobcbh4detail', Controller: 'SObcbh4', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="50" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>

    <field name="gia_nt2" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Giá bán nt" e="FC Price"></header>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Doanh thu nt" e="FC Turnover Amt."></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế nt" e="FC Tax Amt."></header>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Chiết khấu nt" e="FC Discount Amt."></header>
    </field>
    <field name="pt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải thu nt" e="FC Receivable Amt."></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Giá vốn nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền vốn nt" e="FC Cogs Amt."></header>
    </field>
    <field name="lai_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lãi nt" e="FC Profit"></header>
    </field>

    <field name="gia2" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Giá bán" e="Price"></header>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Doanh thu" e="Turnover Amount"></header>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế" e="Tax Amount"></header>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Chiết khấu" e="Discount Amount"></header>
    </field>
    <field name="pt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải thu" e="Receivable Amount"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Giá vốn" e="Cogs"></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền vốn" e="Cogs Amount"></header>
    </field>
    <field name="lai" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lãi" e="Profit"></header>
    </field>
	<field name="tl_lai_dt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="%Lãi/Doanh thu" e="%Profit/Rev"></header>
    </field>
	<field name="tl_lai_gv" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="%Lãi/Giá vốn" e="%Profit/Cogs"></header>
    </field>
	
	<field name="tk_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk vật tư" e="Item Account"></header>
    </field>
	<field name="xgroup" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group"></header>
    </field>
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="so_luong"/>

      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="thue_nt"/>
      <field name="ck_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="lai_nt"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>
      <field name="ck"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="lai"/>
	  <field name="tl_lai_dt"/>
	  <field name="tl_lai_gv"/>
	  <field name="tk_vt"/>
	  <field name="xgroup"/>
      <field name="systotal"/>

    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
<![CDATA[<encrypted>y+jaaChMtw4mwnSnCwbdVFcaIW8pLYlrM3ZT7RSbOIx2T21TaMxz7mgN3GcpvKS0G1WlK8l2+foxCRMX99vGI309VItYqsA8b+kWMTxQ5dI+AXIzZnaPBYqJBVAAGd7b+++yRDWw7fKhPvoNBvLRk9/5KA0vdpoETXF+XQ/sijNbICL5sqyACGyTCGa/tBx+U1KpPtYlfqI9df/pXoVw+xe+JWH0va1PSPIeok8p3CrVS/qt/7VL5onLXphPLDNGZJuMxUFYruc3RA9sU3C/7y5wXozZYX7YOF8r9af/W3M2Ial1RG9XvjyKkvAbfpFzbu9oA5JloerQZZeNqeg8s1nYSasg6mENjbsWu4nplhZODfV3crEao4hluxtlqkjihuo/xpZtfZVLLjPXMEsb/D+8dFL5XQnkcD8l3Ug6T2iWJklE7n/y0+ropxXdIl3n42bhThixcnQxczSP3qqch7vHB8lPSsFWTCeINhwBQjKWU270Bj+QUiNU6gaJBoxEw5XQr2w1++Jry161sOOLiPXyVd6HPdpnMsI5RHbEzBUIdgt9C8MsyQ7A9pH5JphiSdxyLIp1MeEZ7Mlm8vU/FPzDl/FjOcUnY7F0/UFdCN/bLK4VqjVY6tKC3USaf8eCAj0vL5683UOflYd8L9Vhi+NuKLNlGtvRk+BcDMO6s2rRiVhHypC0tJgEIbpGNZRsf2as20Ic2XtjNkRY7k82xA==</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
</grid>
