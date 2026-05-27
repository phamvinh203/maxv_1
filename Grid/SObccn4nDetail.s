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
  <title v="Chi tiết theo khách hàng" e="Detail by Customer"></title>
  <subTitle v="Khách hàng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Customer: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày hạch toán" e="GL Date"></header>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày chứng từ" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="100" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
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
      <field name="ngay_lct"/>
      
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

      <field name="stt_rec"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9IUrUGv5j2JSirzFnO25AhcUP1iE4NGIoHB9k8f0z7S1X2TBaXgPBdFyJ1ZiYMXwYOvxNKsoabi+Ino8PN8xuz+8OJ7sAG0vhF4n0+4f0Sk/KVyDs88mp+AyV6o+b4C1IbmEDx7GI1uuTC32AT5S0CtG0fA2MV2mUCQTjHCoKI6wmkXZ8TELSl5oC2fDcDY4JO/uD34p1cw9MzLLG+fG9JynwWr8f9KVL+UkhYh1dMPFeXKq4eXS3z2CahbLQ0avlii0LgFR7nTjz2GWLpXtNyhZHENx26rFuuiCt3ufsufR</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>WcMXUjp2piXi2BpXsbzkJaa4RkbmWFnaLrizd78JHr0kiz76mnmxOXmZf80GBzHytujRouL09ek3LOyRjhwYpmMXDx2XGdAVRKXr8a93LR3yIYIonoNFXwmP6+1JaWoYmtMMPMt+K7sqcMjfj11jgdH9jQHJ5OlUh7PbW0ZSB4KeGLqjaR0IXZB1MoGQf8iwT+P0ks9lWmk28AwISyZkckF2kNXPI4EvQIN1n/trJ4gapl9IxsO+yAjGdyaZbb4zUnvQA3qWL18uVuD6wYVs4cEMvZL8OfbDNdeOH+f29OqtKkiBGP+RtjedvlbDDbTc5qvX1cNUdEqHikcR2aEuW9cebqu6kUvayScTeqIeIBa4J46/OInOMDHAom5LGeP1wbIbP28jOnOzF3CYgTQyQ3bIGyNo6Ujhv2RLfLTsPef+ykPhcXN4hb5B7UyI61GxSmkAR8YbT4OlA+aKKGwuBYHZRc3+nR8dU5/SR8EJVH3hR5uOzaTLAgHQ//mLsn06nV/yyDwBC3NEg09q9mYeZQ==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>agdcC2BZM+qqSDVaPDgcNTNOVD34+NXK7JhXJZRG5YQtM8J8PordydBrVH+YPbpwnvhcrTIZDijw9S2YO1ImcHlPxZzbUNJcmo32H0z9Fxo/wvfyWEAvI/wAkrKMEhFxaiPVJf+x3DIgN+U+TMwm+Y6ZMG4dTiUwBcGeSmDEHKyVPgcAfZRQvNL86QmiwIHBGIK0/MqJdfCxz+m6NWhgGGAqgr87KU6RV9HULH9lFddL+zElE5xEF59VlmneWSxMyGQtSiTGvk1ceyqZgLFPG7raj1yC/yQtCF0LhXFKQD/645acPmNCC1bKSBmGPJ3gfaimgwXmxeOboJ8eWAXQsOCM8W6vooraAU54WAXWHnM=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
