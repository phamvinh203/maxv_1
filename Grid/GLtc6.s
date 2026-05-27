<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo lưu chuyển tiền tệ (phương pháp gián tiếp)" e="Cash Flow Statement under the Indirect Method"></title>
  <subTitle v="%f1, từ ngày %d1 đến ngày %d2..." e="%f1, Date from %d1 to %d2..."></subTitle>
  <fields>

    <field name="ma_so" width="100"  allowSorting="true" allowFilter="true" hidden="true">
      <header v="Mã số" e="Number"></header>
    </field>
    <field name="chi_tieu%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ma_so_in" width="60"  allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Print Number"></header>
    </field>
    <field name="thuyet_minh" width="80" allowSorting="true" allowFilter="true">
      <header v="Thuyết minh" e="Interpretation"></header>
    </field>

    <field name="ky_naynt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số kỳ này nt" e="FC Current Year"></header>
    </field>
    <field name="ky_truocnt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số kỳ trước nt" e="FC Prev. Year"></header>
    </field>

    <field name="ky_nay" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số kỳ này" e="Current Year"></header>
    </field>
    <field name="ky_truoc" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số kỳ trước" e="Prev. Year"></header>
    </field>

    <field name="lk_kn" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lũy kế kỳ này" e="Accum. Current"></header>
    </field>
    <field name="lk_kt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lũy kế kỳ trước" e="Accum. Prev."></header>
    </field>

    <field name="lk_kn_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lũy kế kỳ này nt" e="FC Accum. Current"></header>
    </field>
    <field name="lk_kt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lũy kế kỳ trước nt" e="FC Accum. Prev."></header>
    </field>
	<field name="tk" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk" e="Account"></header>
    </field>
	<field name="tk_du" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk đối ứng" e="Reference Account"></header>
    </field>
	<field name="in_ck" width="100" allowSorting="true" allowFilter="true">
      <header v="In (1-Có,0-Không)" e="Print (1-Yes,0-No)"></header>
    </field>
	
	<field name="cach_tinh" width="250" allowSorting="true" allowFilter="true">
      <header v="Công thức" e="Calc"></header>
    </field>
	<field name="bold" width="0" type="Decimal" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_so"/>
      <field name="chi_tieu%l"/>
      <field name="ma_so_in"/>
      <field name="thuyet_minh"/>

      <field name="ky_naynt"/>
      <field name="ky_truocnt"/>

      <field name="lk_kn_nt"/>
      <field name="lk_kt_nt"/>

      <field name="ky_nay"/>
      <field name="ky_truoc"/>

      <field name="lk_kn"/>
      <field name="lk_kt"/>
	  
	  <field name="tk"/>
	  <field name="tk_du"/>
	  <field name="in_ck"/>
	  <field name="cach_tinh"/>
	  <field name="bold"/>
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
      &JavascriptReportInit;
      <![CDATA[<encrypted>XAZTY2X7RvTuwY3TnEsak0loUzGkmDEYtirzzCeetFVhXS3TVOid1S6hTgizZiOQJxzzVm3VqSGPg2OuW89+8wd+UQC2RHwfJVVWNo62EW8htbBi71wOnO/CRH1aMy59ZgYTuBwZW3rsNnHtIqu3qGZbhKACuzK6UoxR3VDI/IFlPSAbXvjItStq5dUdVvRS99LfsfK3twLQOtOvoVEzpasUqXB+1iKFDj4hrujArVHIdzN/J6idrrOfqR7QLed0SRlMkJXIE2d7+EILM8FAJM5n2gbgTYj3PQdLN5siNeqWVS0RN/PhYmuQf7QzTj/rForgMGMpP1keqXChFYWSMLDlCutCPtQVGGt91DFzD2staw0FCu2UxGqrk57QdBYrgh7XKhiKAT+NNP+Z5UHktoRq57mN7U+yOshKcLA0chM0LymuJ+uJ/NhA424KsGC29rqaBR+W6E20N9ZcXZDzrATFO8co1VSn3+b3SBNdxSjrkNcCgfXtR3ZmV868UlTh34GCBpe5d6bG960XwmuCrz/wdKoTyJBf0m9dPjokGNg9Kyh6MTyE7GRaG3ki6oOGn0ObLf0yY1bHLh5S7H9PWKmFXbdlqxi/7k3pZ6yr6D9EyHtGs7pNI+TO9Qo/QyBiLwrnZE0pEx67Q32jeSxLOr6t60lpRc4eZi6En7+GE+jitgCUSw4vzTip0Bg5G65b86Akgkw+S2HcWarmpZgN2ldSu3k2/ObiOhef+TJ1KNxkHZHXa5Q6OQ68//Eq6ryxBZ8MMnAQTStIpImTegmIfoL4KGsoTcqLKJkvA94dYsE3XBOVV2fLSzU3U0b8/Y22D3fnuSRNe8jv0zFNhbUzAgK06waq7NfVDtKyDCLRnD1c7io/T3BGI+QjfJ0ZDDiL</encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
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
