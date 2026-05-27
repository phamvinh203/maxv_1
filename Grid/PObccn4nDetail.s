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

declare @ma_kh varchar(128), @tk varchar(128), @ngay_tu smalldatetime, @ngay_den smalldatetime, @ngay_hd1 smalldatetime, @ngay_hd2 smalldatetime, @mau_bc varchar(32), @ma_dvcs varchar(8000)

select @ma_kh = replace(data, @d, '''') from #t where id = 1
select @ngay_tu = data from #t where id = 2
select @ngay_den= data from #t where id = 3
select @ngay_hd1 = case when data &lt;&gt; '' then data else null end from #t where id = 4
select @ngay_hd2= case when data &lt;&gt; '' then data else null end from #t where id = 5
select @tk = replace(data, @d, '''') from #t where id = 6
select @ma_dvcs = replace(data, @d, '''') from #t where id = 7
select @mau_bc = data from #t where id = 8
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo nhà cung cấp" e="Detail by Supplier"></title>
  <subTitle v="Khách hàng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Customer: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80">
      <header v="Ngày ht" e="GL Date"></header>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" width="80">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" align="right">
      <header v="Số ct" e="Voucher No."></header>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" width="80">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="so_ct0" width="80" align="right">
      <header v="Số hóa đơn" e="Invoice No."></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>

    <field name="ma_nt" width="100" aliasName="a">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>
    <field name="ma_vv" width="100" align="right">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_dk" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ngay_lct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>
      <field name="ngay_ct0"/>
      <field name="so_ct0"/>
      <field name="dien_giai"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="ps_no"/>
      <field name="ps_co"/>
		
	  <field name="ma_vv"/>
      <field name="stt_rec"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9OhPozPuBqqxKKu1aOJmxwf5EE+20AvgZtYytKpUt6b9CR16F3DWHbMgwWXl1m8krNkgJMCelOYf99ApGxn6c5DlUnQBOQr44C9EwkUIQMY0qXHrO4EK5xugiJ1CeooyhahX7O+E2YqET5IGDXl3Qq1kTG49DmqV2X0ZjcoDvm2Pq31hbj3QzajLa93HOt+WepoJg2/BlNRnjZAGVW0VEm9plAjgNxnPVABuorIa3IzPEVxiMGTn3DDmJramSwDIJ8NYDkcpW1eiC05adRqvtMv0VPEnIhWjaO+ZWUp/Mla9</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>ngPq0KF+DePYzwdjIaTeUpRpvLcvvOSF3v9dX93he5xJpmmV4vnA7l0zX+b6HAqy7kHqT7HUbesx/+ywlmf47RUPc/lTuHeHzIh6GfbZBX+zfgZjn52u6Zb005/2hd2Gk581etP4wvFsaolvBQgdg53bCdDZMV1lwSNtN/pQFn6NNfBD30NJ9PBQwxnugXw7OAJQgCSifudqRrCEUjJo+XU2x0ckeucW4ZJeeDzg6e+Kg+lqFyV+/eFT3Cg8FlHyki+B30XNfs2x8kesD2IYTmdhE3DEozL7aVP//RCtuotgkZUr9JqKgFur41nYcv64AHCjPhZSk0o9JbPO05YchWkZ9OJVxkYLodlY7padfkkft+rr+3wVQaqtYO4aEIVM8JkU2zUvRQwcTbdXvlAg+xrwNXrFgGiIQqRCAGEK85LtJ8R9x4MLiRn/CtT4/v5JkOnREZzjOy+Ir9HyjLDnCimyrJR5/SuXGGSzIIlBl3XQTV8gaKwYJzMkpxeuUJ/eKR5vYgsLj4zLSiF/qdlT4A==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>agdcC2BZM+qqSDVaPDgcNU2aDBy/eVQztE5nOUf5RmeUUvaTEesb3bEybC+DKV3bZR1T0rruj+COpjQvXJAnFphk1FvUAXLOlpNXctr7XTlLgvf73q91oJDDoNswS2WoQAIn2iyBV7zGezGRnF538s6V/Fa1nFOzeqaRWn+qf6jQKw7gB2ctizRZN4KXZJZzM7Y8M7B0LeBWXbnkHcYlwZlAn1CxP1mMyOPYQx37QKWPvxAFhaTPKbD6H7198Ce7cc7Vr1QzWN1krfwLYNaHyhPEB6F9Lyx7tSpFnC6LBfen4p7oc3vBFV6o989+ed5p3P67A1CD5zhD76+BV3q5AqKIEMglTLW5nijZDJTNpC8=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
