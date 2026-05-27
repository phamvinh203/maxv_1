<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>
<grid type="Report" valid="sysorder = 4" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo chi tiết tình hình tiền vay" e="Loan Contract Status Detail Report"></title>
  <subTitle v="Tài khoản: %s, từ ngày %d1 đến ngày %d2..." e="Account: %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ma_ku" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khế ước" e="Loan Contract"></header>
    </field>
    <field name="ten_ku" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khế ước" e="Loan Contract Name"></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản vay" e="Account"></header>
    </field>

    <field name="ngay_vay" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày vay" e="Loan Date"/>
    </field>
    <field name="ngay_dh" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày đáo hạn" e="Due Date"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true">
      <header v="Ngày hạch toán" e="VC. Date"/>
    </field>

    <field name="du_dk_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư đầu nt" e="FC Opening Balance"></header>
    </field>
    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Trả nợ vay nt" e="FC Loan Payment"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền vay nt" e="FC Amount"></header>
    </field>
    <field name="du_ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số dư tiền vay nt" e="FC Balance Amount"></header>
    </field>

    <field name="du_dk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư đầu" e="Opening Balance"></header>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Trả nợ vay" e="Loan Payment"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền vay" e="Amount"></header>
    </field>
    <field name="du_ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số dư tiền vay" e="Balance Amount"></header>
    </field>
	<field name="systotal" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ku"/>
      <field name="ten_ku"/>
      <field name="tk"/>

      <field name="ngay_vay"/>
      <field name="ngay_dh"/>
      <field name="ngay_ct"/>

      <field name="du_dk_nt"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="du_ck_nt"/>

      <field name="du_dk"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="du_ck"/>
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
