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
update #t set data = replace(data, @d, '''')

declare @vu_viec varchar(32), @ngay1 smalldatetime, @ngay2 smalldatetime, @ma_dvcs varchar(8000), @tk varchar(128), @vu_viec_me varchar(32), @mau_bc varchar(32)

select @vu_viec = data from #t where id = 1
select @ngay1 = data from #t where id = 2
select @ngay2 = data from #t where id = 3
select @ma_dvcs = data from #t where id = 4
select @tk = data from #t where id = 5
select @vu_viec_me = data from #t where id = 6
select @mau_bc = data from #t where id = 7
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết dự án" e="Project Detail"></title>
  <subTitle v="Vụ việc: %c - %s, từ ngày %d1 đến ngày %d2..." e="Job: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90" aliasName="a">
      <header v="Ngày hạch toán" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" aliasName="a" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="90" align="right" aliasName="a">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="250" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tk" width="100" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du" width="100">
      <header v="Tk đối ứng" e="Reference Account"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100">
      <header v="Ps nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100">
      <header v="Ps có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110">
      <header v="Ps nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110">
      <header v="Ps có" e="Credit Amount"></header>
    </field>

    <field name="ma_vv" width="100">
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
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>

      <field name="tk"/>
      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
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
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9Crrqt4MlBCpUsG6XyuHG6/nA+ESvNQg0lWjBscMA/nf55sTunnUo1uwzEzznXM8bHZ8sbNgnnuy0L1GUDMRt1XVE8/hAT5pS+g0KgDtqJr9bCxd19siAfwMah0crido8K4fgndqXyXdxsbNnZGM/H8fggvLf1fxJKPtZjFQTOSBfYdU6eVdsjiyvsMNbijLwzUNmxjph+3G47ZzjxpftlSlYyQV1XX1Jq9sxPEvWo00TOXjjGYfLVu287sYQoSJn9PqUYz9Bdif1pZqPETdmI+1uejd3HkJAegxk7vbLFow/GhsVTMvp/oU0i03xtU9yw==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>/8uIQ72SsvVCNqmTCfvdAAfuNFpXq60JHL6qRxiZMdadKVGwmfXAkWCX2Io13Vi6qrxbHBsOVYEt0EuhuN6wru0tpte5xTTlHARjPH5ig65Uqde5aO0EoTwkvu+sDp5G5QAVge4Qt7IgLtdm/byq0wNu4c2nJntXnX/6XlPadMMrixADDj7PPbBBQXp4HrzL96ZWDHwkucuwD1xCtqAgA3P+X2nsHrW12koIu9HcmarGt8MGTGW4F5CpuFQbfAym8BDMKhTTNK8+sK7UZ0cvyFtnrrIlQ6bGdpDqdVvgJY+OYJ5zP/Na5be9O1XMdh3YGY0wcgFvbzeJ1hvP5KKrCsP3PNHyBHC7myZ7FUTGV4c+hhX7I9WF107BzMIPgiluOk5Iej4IXpUOE4elyG5u6ciMwqujPdbHeyEK5iTpvvkt6CSfJBqIcVyaneIXH1oCaGZwQXfb+ZhZhsBtpFIxd/I1Kn3oZIh42f6kau9c5lM=</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>agdcC2BZM+qqSDVaPDgcNcB5L0BPjBA2WC/ZjaFTEHGUbUR17bz3+XVjsICMe/Gvz/UVdX/30xuTqzqlGKIT6yg6ZAb68KBLuqJZSOpHA/wxxl2V/nrk6/7HWaQlrK4fGAgMFG7CD0nfOWxuxydrMcFsEQC1x6XrmvcDLDiTqI/Feup4SYm6ht6g7aH28xlgoCvGP2TnxPEqQltGcooEsludc2+Utg+6Nd5B71UP5mbciTgcVihwolcgvh7XR1aB519jnX/2vfPSW3kxGoecBbC7QSVljmckHXm05o+zVabpBZg7U646/kl7r3bN3BF768CKu8T1g1WB3UGxonM6AA==</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
