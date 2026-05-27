<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Tờ khai thuế GTGT dành cho dự án đầu tư" e="VAT Declaration for Investment Projects"></title>
  <subTitle v="Từ tháng %m1 đến tháng %m2 năm %y..." e="Month from %m1 to %m2 Year %y..."></subTitle>
  <fields>
    <field name="stt_in" width="60" allowSorting="true" allowFilter="true">
      <header v="Stt in" e="No."></header>
    </field>
    <field name="chi_tieu%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
    </field>
    <field name="ma_so" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Code"></header>
    </field>

    <field name="ds_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Doanh số nt" e="FC Revenue"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế nt" e="FC VAT"></header>
      <items style="Numeric"/>
    </field>

    <field name="ds" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Doanh số" e="Revenue"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế" e="VAT"></header>
      <items style="Numeric"/>
    </field>
	<field name="bold" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_in"/>
      <field name="chi_tieu%l"/>
      <field name="ma_so"/>

      <field name="ds_nt"/>
      <field name="thue_nt"/>
      <field name="ds"/>
      <field name="thue"/>
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
<![CDATA[<encrypted>AJ7hoP6BO02FNyOHBC5CVOnP9UqsZubwkUqoi2weXQ1a0aK8na8BtMVPfR9EJ5Fa14QMOAMjn3j0XgIBRAJACL+Im5Raua7fx3nZeUeNkmeLRkDvUrPi+KRpJX3OfRTHaePnX747TqQ/FbDMZOuoSnVgAEDXyM6nL7uC4fm+PR9LwQn8By65KNsr/T0Iuk6mACVZguyBJhh//ZWjVESCYDNcNfAPkmdCnGmBIzNmOIj+m0j32SY8EyLRn8cOTFdlVwV606k/W+2YOSsUEv3XzvACO/I72LRtEsE3RrrR5y5G6O/rJq6OpIy8pw5DJNewdQnCKgfXpZjjswjPfNtnW0BoJoiftGnRcXNIalgx6eTGpjtqvt0d9sZ9Jhtftd4xYzGse4wcoM4YvyxBxHmpYlnhxq5qoDjgFiTzFY81VYfSXGJfTM1gUvN84FnXgTaCY/x6eF3stPaW9riL36PzH0C0ER3ThY9/1jV2G7rsMRMKddBDYZQ2N0+Y2QnjdSox/HUC1MvAB0Ea74ONMchApbEZOm20xyZ0hFUOl2oPYyrMvIeDxicSdcnsdJMLcSOYc0OmGBf6edF047jpypVY1Dvg/oqmqRsd5FdSqmGmyvxmhra53EyrpdmdsLVr+N+VMGmNEDZ8XjRlqBmE1vxpLDNK9bJid1kEXl0iH+vXIqC3sEpVejVy8JnUPqHwWzrbQdemS6wH+mJ0hi7GgEXq1w==</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>