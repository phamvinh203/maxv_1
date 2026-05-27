<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Tổng hợp nhập xuất tồn theo vị trí" e="Stock Summary by Location"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'inbctk4detail', Controller: 'INbctk4', Name: '[ma]', Value: '[ma_vt] + String.fromCharCode(253)+ [ma_kho]  + String.fromCharCode(253 )+ [ma_vi_tri]  + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã" e="Code"></header>
    </field>
    <field name="ten%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Name"></header>
    </field>
	<field name="dvt" width="50" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="Unit"></header>
    </field>
    <field name="ton_dau" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tồn đầu" e="Opening Qty."></header>
    </field>
    <field name="du_dau" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư đầu" e="Opening Amount"></header>
    </field>
    <field name="du_dau_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư đầu nt" e="FC Opening Amount"></header>
    </field>
    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="SL nhập" e="Received Qty."></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền nhập" e="Receive Amount"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền nhập nt" e="FC Receive Amount"></header>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="SL xuất" e="Issued Qty."></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền xuất" e="Issued Amount"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền xuất nt" e="FC Issued Amount"></header>
    </field>

    <field name="ton_cuoi" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tồn cuối" e="Closing Qty."></header>
    </field>
    <field name="du_cuoi" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư cuối" e="Closing Amount"></header>
    </field>
    <field name="du_cuoi_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư cuối nt" e="FC Closing Amount"></header>
    </field>

    <field name="ma_vi_tri" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma"/>
      <field name="ten%l"/>
	  <field name="dvt"/>
      <field name="ton_dau"/>
      <field name="du_dau"/>
      <field name="du_dau_nt"/>

      <field name="sl_nhap"/>
      <field name="tien_nhap"/>
      <field name="tien_nt_n"/>

      <field name="sl_xuat"/>
      <field name="tien_xuat"/>
      <field name="tien_nt_x"/>

      <field name="ton_cuoi"/>
      <field name="du_cuoi"/>
      <field name="du_cuoi_nt"/>

      <field name="ma_vi_tri"/>
      <field name="ma_vt"/>
      <field name="ma_kho"/>
      <field name="systotal"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
  
  <script>
    <text>
<![CDATA[<encrypted>y+jaaChMtw4mwnSnCwbdVFcaIW8pLYlrM3ZT7RSbOIx2T21TaMxz7mgN3GcpvKS0G1WlK8l2+foxCRMX99vGI309VItYqsA8b+kWMTxQ5dI+AXIzZnaPBYqJBVAAGd7b+++yRDWw7fKhPvoNBvLRk9/5KA0vdpoETXF+XQ/sijNbICL5sqyACGyTCGa/tBx+U1KpPtYlfqI9df/pXoVw+xe+JWH0va1PSPIeok8p3CrVS/qt/7VL5onLXphPLDNGZJuMxUFYruc3RA9sU3C/7y5wXozZYX7YOF8r9af/W3M2Ial1RG9XvjyKkvAbfpFzbu9oA5JloerQZZeNqeg8s1nYSasg6mENjbsWu4nplhZODfV3crEao4hluxtlqkjihuo/xpZtfZVLLjPXMEsb/D+8dFL5XQnkcD8l3Ug6T2iWJklE7n/y0+ropxXdIl3n42bhThixcnQxczSP3qqch7vHB8lPSsFWTCeINhwBQjKWU270Bj+QUiNU6gaJBoxEw5XQr2w1++Jry161sOOLiPXyVd6HPdpnMsI5RHbEzBUIdgt9C8MsyQ7A9pH5JphiSdxyLIp1MeEZ7Mlm8vU/FPzDl/FjOcUnY7F0/UFdCN/bLK4VqjVY6tKC3USaf8eCAj0vL5683UOflYd8L9Vhi+NuKLNlGtvRk+BcDMO6s2rRiVhHypC0tJgEIbpGNZRsf2as20Ic2XtjNkRY7k82xA==</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>
