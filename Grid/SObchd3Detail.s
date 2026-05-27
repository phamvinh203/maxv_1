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
declare @contract varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @account varchar(128), @form varchar(32)
select @contract = replace(data, @d, '''') from #t where id = 1
select @dFrom = data from #t where id = 2
select @dTo = data from #t where id = 3
select @unit = replace(data, @d, '''') from #t where id = 4
select @account = replace(data, @d, '''') from #t where id = 5
select @form = data from #t where id = 6
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết hợp đồng" e="Detail by Contract"></title>
  <subTitle v="Hợp đồng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Contract: %c - %s, Date from %d1 to %d2..."></subTitle>
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
    <field name="ten_kh%l" width="300" aliasName="b">
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

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110">
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

      <field name="stt_rec"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9OhPozPuBqqxKKu1aOJmxweErZHfv0mwdFNZJnhBGPY25JwGXgvjyIwwD3Dh4ObeZ6FfPSKmpjeHPzN+4rNa5JXqt7MZOEVt1X8ScUxhDUjLsh74g8Xl3fnvEQslIRzsJQTr22e4VPPff1dl4ZhgWOqebEoGbItt164Q6n+UI7+RLRQJ1XABxa9e77i2ol8tBXyvne1iuJZM3h//IkpWkGatiw8RlC6J96CznL0YsmAyUr4mu8zRYSaRnes5ganIRiAyf1AFhSeIr+yBsNGTf2vbekX0cGL50We6kaNn5x/6</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>BhY69WySBMm4v4rxAL1BvzHokDui1Bn3KljIzYht7ntJAjFkHhbSkEcaS2Q+cYcPgsrI7WLXJ/vCKEggSLBKv09ZyAJPkXW8yu1+zgoqshIUS5DT6Z5Pw2TJuJrTV7P0VzmlZvSBp3oE5uOnI49lBZktwSlTx5G+btqO1Wfxf2Sk7nNu7B/E5Ba8RDYRshQV8T7uI4TapKLuH6A4rgg4lOR0UVt8K5ZZdMhz30xUoS25pP7m731Px4nkuZe1aLL4A9e1vUFg+SkiC9XiQ4ETLpcITYdF3YKavoq951Hp9d8FqyaQkxwF1nbOhPmC/NMFMnlomvnpb8dGOpZYMNfjCCVgL00GPENSs4Fd5na1A/QrHiIgRzuC13JKPxaLmr1xRF6nm855yAfW35MUnWKuQrzLvbGHMnp8xeEZvnerZZU=</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>KK6Hv3V89OBjigXX2h8pNrVOR6/BLRdz1YjXma6/kntGCy4KHm1s0zFkAdeQspQeGYRilcTz4JjuGjRpbtM9V5Y2mUmo2xsOmBkOamruLjnkKgtNN2s0J9rZrXEwOrlUYfLzh5rBri+n2/NrY4Z4ZbE1g738hgw9/09rDP5JyBpL3oewRTPXwnDZWDGGHW2/KQbZs2SLyNz+j9P3Y4SsJoh+1LMDcoxfRi6pNpk3Uz7JKOtj+dnrx22+SlgyCIH/w71D/lnP9/SP9t5CpqyeUJxzhbolV1laqWyUQfwpi43NJH0hIh01NdlyMgfbfigTJxOlchPyVF6xaugaBSi9RQ==</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
