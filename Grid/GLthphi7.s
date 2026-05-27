<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo doanh thu, chi phí" e="Sales, Expenses Report"></title>
  <subTitle v="Từ tháng %t1 đến tháng %t2 năm %y..." e="Month from %t1 to %t2 Year %y..."></subTitle>
  <pivot rowField="ma_so" columnField="thang" dataFields="tien, tien_nt, tl" indexTable="2" indexColumn="1" indexHeader="2" indexView="3"/>
  <fields>
    <field name="stt_in" width ="50" allowSorting="true" allowFilter="true">
      <header v="Stt" e="Number" />
    </field>
    <field name="chi_tieu" width="300" allowSorting="true" allowFilter="true">
      <header v="Chỉ tiêu" e="Article"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="" e=""></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="" e=""></header>
    </field>
    <field name="tl" type="Decimal" dataFormatString="###.00" width="100">
      <header v="" e=""></header>
    </field>
	<field name="bold" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
	  <field name="bold"/>
      <field name="stt_in"/>
      <field name="chi_tieu"/>
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
