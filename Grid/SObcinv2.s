<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng kê chi tiết thu tiền của các hóa đơn" e="Detail Receipt Transaction List by Invoice"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="ngay_ct" type="DateTime" width="90" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày hạch toán" e="GL. Date"></header>
    </field>
    <field name="ma_ct0" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="ngay_ct0" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày hóa đơn" e="VC. Date"></header>
    </field>
    <field name="so_ct" width="90" allowSorting="true" allowFilter="true" align="right">
      <header v="Số chứng từ" e="VC. No."></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>

    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền hóa đơn nt" e="FC Amt."></header>
    </field>
    <field name="tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Đã thu nt" e="FC Amt. Received"></header>
    </field>
    <field name="con_pt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải thu nt" e="FC Amt. Receivable"></header>
    </field>


    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền hóa đơn" e="Amt."></header>
    </field>
    <field name="tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Đã thu" e="Amt. Received"></header>
    </field>
    <field name="con_pt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải thu" e="Amt. Receivable"></header>
    </field>

    <field name="han_tt" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Hạn thanh toán" e="Payment Term"></header>
    </field>
    <field name="ngay_tt0" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày thanh toán" e="Due Date"></header>
    </field>

    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
	<field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct0"/>
      <field name="ngay_ct0"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="t_tt_nt"/>
      <field name="tt_nt"/>
      <field name="con_pt_nt"/>

      <field name="t_tt"/>
      <field name="tt"/>
      <field name="con_pt"/>

      <field name="han_tt"/>
      <field name="ngay_tt0"/>

      <field name="ma_vv"/>
      <field name="tk"/>
      <field name="dien_giai"/>

      <field name="ma_ct"/>
      <field name="stt_rec"/>
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
