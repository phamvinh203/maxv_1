<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY QueryString "
declare @c char(1), @d char(1)
select @c = char(253), @d = char(252)
select * into #t from dbo.MaxvOnline$Function$System$Split(@@queryString, @c)
declare @refAcct varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @form varchar(32), @data varchar(1), @type varchar(1), @acct varchar(128), @nhom varchar(10)
select @refAcct = replace(data, @d, '''') from #t where id = 1
select @dFrom = data from #t where id = 2
select @dTo = data from #t where id = 3
select @unit = replace(data, @d, '''') from #t where id = 4
select @acct = replace(data, @d, '''') from #t where id = 20
select @form = data from #t where id = 6
select @nhom = data from #t where id = 16
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo tài khoản" e="Detail by Account"></title>
  <subTitle v="Tài khoản: %c - %s, từ ngày %d1 đến ngày %d2..." e="Account: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="280" external="true" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="280">
      <header v="Diễn giải" e="Description"></header>
    </field>
	
	
    <field name="tk_du" width="100">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>

    <field name="ma_vv" width="100">
      <header v="Dự án" e="Job"></header>
    </field>
	<field name="ma_hd" width="80">
      <header v="Hợp đồng" e="Contract"></header>
    </field>
	<field name="ma_bp" width="80">
      <header v="Phòng ban" e="Department"></header>
    </field>
	<field name="so_lsx" width="80">
      <header v="Lệnh sản xuất" e="MO"></header>
    </field>
	<field name="ma_sp" width="80">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
	<field name="ma_phi" width="80">
      <header v="Mã phí" e="Expense"></header>
    </field>
	
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>

      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      <field name="ma_vv"/>
	  <field name="ma_phi"/>
	  <field name="ma_hd"/>
	  <field name="ma_bp"/>
	  <field name="so_lsx"/>
	  <field name="ma_sp"/>
	  

      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>pQ53+Ed3OhJfULn9kL2ZciMRRpU3k8ZIMLRoo7cHoDQbLWMR+PFwhsiupvOyAmaWc1A7dM6EpEvOmz5inSYh7JdZJjyDzwtcGUpjXHQyMhjpJqAsIlI1yyms45kEy+YQCkDEIkdU8NQx1XRdU+vysSWr3mh7TSQAQuq/1FY8LZ0XPwC+N0DRJUKZhxNyWaeoVoTGE1wsAmKgWKCaKPLEQ31+eW/LYf+JAbIzsaqspayg8aHrWHZy4hTJwlCFqxskjfG0AoCGyGaC31X/UxO4yZ4WyV9jDor4w9U23fL0AXb/W8lnCLeVhYE3zadwofv1XA58LVYjyY9PNcfASK3/9JpZbhOxAXgdtm9X8pscB2SmA4woysBrrM/BngH6UmNhApi57KsTPCHpCMvyTQxlvLWafZUr4olmGUKqh6+k+Tc9MO2XRjMqMdt/JQIa/IvxAUYr5xUYbb2ZAEPhkk6AUzOzmz3ovey5FUtEk15eTVo4xOvhVWuiAJnraVFc/4BwZBrxCEJuh/jW6DiivGwz9t4T+Jjff0sJU+DxY+v1v6pe7h/eP3QPtQztBiQkJRZnpPMZ3HNs2emizvb8nW+KjbvR2bCunqmRvpTQ1zaf0n4=</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>nIxnqpid7wrAKNQiEYsQoM9HwlrnYL0h7+3vERkT+h9tleGxtQFB26sMhuzIDfKHbpnhdpxSJsFbxSinRHWmBOPsBVOH44lkws4I6l4uk+ZZrGZZXUH8zbDdmLSJb55ejNvxzkX86upb+CSxTyKaSvvHie1tZbc81OMpTYwMUrVnAkAfEG7PDZzXmPiaqRcuoUZ0L5WwMTQ07YdKb5jv5tbdniUn3suVW8SjJlqg1B2poR4wR72HBCxL8AWyDNJfGNPDWOHF58Ltl7tHT7pJXQEfox3eZigID5UGMqWyTpwPaEtw6Dv6+uZW++FU1cMCrsTv+W+2FydRORmHI4duKeR/m4SOePla8gMEFU8/FPbouS1hYcoyJh/UFxAsVFml2eSRGuhSb0B1V+cA6AxizQAM6zVUCSHVgb7gvdc5o3A7XbpxtyKc13RXSj8UoVSN9ZJSWlwe0sS96SKwI2kISpKtj4re74Kp5s71XEzNj5ug+OOMYSlRg+VDPrMdkZRNz00cmH/4Vp3VspZ4GSjAvc7lh5XAIGfUb20GOnYIInqKx2o0KcA4WMI6fP/42GLS</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>TDR3aefioLXGbhRms0a/LDZWtMazBc6RMGaLhr3s513SFUosupdWUXDB9rp1/8bWkdlOescm0zxCBN4bnD2fKdG2zgOEgKtg14CULl7eO08mP7UoyztDS0+kvXAUpABvF1egyC8Y9S8cmNw8oWMzJBV/6zHK7VgQqztM1lMjLWEXTHUo3E6kpUMfuU/iyQGlDo8he2KZpMhuZBcMoj/y9Bp5mZsorc0tSwfxEka5h6QG6Yr4xlSYhXH5HYgGbpWM9ISSkRWxWKuMra+YEkufx9EhSr4iV6XWWrViFnwSnkkujNrTHoI2jrkYJJjdCYv0X7T3MdMAAg6B/EwkY/fAFg==</encrypted>]]>
    </text>
  </script>
<toolbar>
  <button command="Export">
    <title v="Toolbar.Export" e="Toolbar.Export"></title>
  </button>
  <button command="Freeze">
    <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
  </button>
    <button command="ExportDetail">
    <title v="Toolbar.Export" e="Toolbar.Export"></title>
  </button>
</toolbar>
</grid>
