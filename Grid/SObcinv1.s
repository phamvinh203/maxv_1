<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng kê công nợ theo hóa đơn" e="Receivable Report by Invoice"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true">
      <header v="Ngày hạch toán" e="GL. Date"></header>
    </field>
    <field name="ma_ct" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày hóa đơn" e="Inv Date"></header>
    </field>    
    <field name="so_ct" width="80" align="right" allowSorting="true" allowFilter="true">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Cust. ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" external="true" allowFilter="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="t_tt_nt0" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true"  allowFilter="true" aggregate="Sum">
      <header v="Tiền hóa đơn nt" e="FC Amount"></header>
    </field>
    <field name="t_tt_nt1" type="Decimal"  width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Đã thu nt" e="Received FC Amt."></header>
    </field>
    <field name="con_pt_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Còn phải thu nt" e="Receivable FC Amt."></header>
    </field>

    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="t_tt0" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền hóa đơn" e="Amount"></header>
    </field>
    <field name="t_tt1" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Đã thu" e="Received Amt."></header>
    </field>
    <field name="con_pt" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Còn phải thu" e="Receivable Amt."></header>
    </field>

    <field name="han_tt" width="100" align="right" allowSorting="true">
      <header v="Hạn thanh toán" e="Payment Terms"></header>
    </field>
    <field name="ngay_tt0" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true">
      <header v="Ngày thanh toán" e="Due Date"></header>
    </field>

    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>

    <field name="ma_ct0" width="0" hidden="true">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="stt_rec" width="0" hidden="true" >
      <header v="Stt_rec" e="Stt_rec"></header>
    </field>
	<field name="systotal" width="0" hidden="true" >
      <header v="" e=""></header>
    </field>
	
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="ngay_ct0"/>      
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="t_tt_nt0"/>
      <field name="t_tt_nt1"/>
      <field name="con_pt_nt"/>

      <field name="ty_gia"/>

      <field name="t_tt0"/>
      <field name="t_tt1"/>
      <field name="con_pt"/>

      <field name="han_tt"/>
      <field name="ngay_tt0"/>
      <field name="ma_vv"/>
      <field name="tk"/>

      <field name="ma_ct0"/>
      <field name="stt_rec"/>
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
