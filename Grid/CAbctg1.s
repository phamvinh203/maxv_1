<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid" valid="systotal = 1">
  <title v="Sổ quỹ" e="Cash Book"></title>
  <subTitle v="Tài khoản: %s1, từ ngày %d1 đến ngày %d2..." e="Account: %s1, Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true">
      <header v="Ngày hạch toán" e="VC. Date"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true">
      <header v="Ngày chứng từ" e="VC. Created Date"/>
    </field>
    <field name="ma_ct" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="180" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk_du" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>

    <field name="ps_no_nt" allowFilter="true" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Ps nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" allowFilter="true" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Ps có nt" e="FC Credit Amount"></header>
    </field>

    <field name="so_ton_nt" allowFilter="true" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Số dư nt" e="FC Debit End"></header>
    </field>

    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" allowFilter="true" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>
    <field name="ps_no" allowFilter="true" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Ps nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" allowFilter="true" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum">
      <header v="Ps có" e="Credit Amount"></header>
    </field>

    <field name="so_ton" allowFilter="true" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Số dư" e="Debit End Amount"></header>
    </field>

    <field name="ma_ct0" hidden="true" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã c.từ" e="Voucher ID"></header>
    </field>

    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Dự án" e="Job"></header>
    </field>
    <field name="ten_vv%l" hidden="true" width="180" allowSorting="true" allowFilter="true">
      <header v="Tên dự án" e="Job Name"></header>
    </field>

    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Phòng ban" e="Department"></header>
    </field>
    <field name="ten_bp%l" hidden="true" width="180" allowSorting="true" allowFilter="true">
      <header v="Tên phòng ban" e="Department Name"></header>
    </field>

    <field name="so_lsx" width="100" allowSorting="true" allowFilter="true">
      <header v="Lsx" e="MO"></header>
    </field>
    <field name="ten_lsx%l" hidden="true" width="180" allowSorting="true" allowFilter="true">
      <header v="Tên lsx" e="MO Name"></header>
    </field>

    <field name="ma_sp" width="100" allowSorting="true" allowFilter="true">
      <header v="Sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" hidden="true" width="180" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>

    <field name="ma_hd" width="100" allowSorting="true" allowFilter="true">
      <header v="Hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd%l" hidden="true" width="180" allowSorting="true" allowFilter="true">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>

    <field name="ma_phi" width="100" allowSorting="true" allowFilter="true">
      <header v="Phí" e="Charge"></header>
    </field>
    <field name="ten_phi%l" hidden="true" width="180" allowSorting="true" allowFilter="true">
      <header v="Tên phí" e="Charge Name"></header>
    </field>

    <field name="ma_ku" width="100" allowSorting="true" allowFilter="true">
      <header v="Khế ước" e="Loan Contract"></header>
    </field>
    <field name="ten_ku%l" hidden="true" width="180" allowSorting="true" allowFilter="true">
      <header v="Tên kế ước" e="Loan Contract Name"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="systotal" type="Int32" width="0" hidden="true">
      <header v="systotal" e="systotal"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
      <field name="ngay_lct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="so_ton_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="so_ton"/>
      <field name="ma_ct0"/>

      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
      <field name="ma_ku"/>
      <field name="ten_ku%l"/>
	  <field name="ma_phi"/>
      <field name="ten_phi%l"/>
	  <field name="ma_hd"/>
      <field name="ten_hd%l"/>
	  
	  <field name="ma_bp"/>
      <field name="ten_bp%l"/>
      <field name="so_lsx"/>
      <field name="ten_lsx%l"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      
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