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
declare @refAcct varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @form varchar(32), @data varchar(1), @type varchar(1), @acct varchar(128)
select @refAcct = replace(data, @d, '''') from #t where id = 1
select @dFrom = data from #t where id = 2
select @dTo = data from #t where id = 3
select @unit = replace(data, @d, '''') from #t where id = 4
select @acct = replace(data, @d, '''') from #t where id = 5
select @form = data from #t where id = 6
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo tài khoản" e="Detail by Account"></title>
  <subTitle v="Tài khoản: %c - %s, từ ngày %d1 đến ngày %d2..." e="Account: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày hạch toán" e="VC. Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="90" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300">
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

      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>ru8StUPnlkC+uPfBOTMqt1p2zJxMfi+lQ+EslY/F8qpFZwg9LQuWEbWBxJFpLR1+QSP6LFL6IQOBABkfi1kITkXJIRxiLEySUHv1pHEwYhOlMy8sxPi8udTHMhRRpTMTdKqwI9aPBdfeRXP6k6Jru23jaC3tnm4oOYh2bDh8TtijYU9C/fdFEVICEZs8HZVrQSfTplP75dT0HaHkiDBsiAT1soOZ/hyL+SiYP38UfBOeLouW4vn/hqp+8YE23R5gCFv4GVDVlDHM3aQjCYoV20Z/W425AdNbshvBBC8JJo39JYHSyhnTj88KglCYZzuKMqPEoFo9/jow4+isfE66hA==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>zqxTC+64O/M2hnN4hCL4cohCbLU5Gb8Uwk00QrqEAtD7gAtz/PwC/13riBD1xh1HJJ6GBrzX1NV/704zwI3I2EUOC56eN36v+dYfM7hNSXjXyq6FA1Mcn7Ac2aikXMOhKyZAufZcV2aM2Bu4bjU3SCm/gj3A7IR9irzVmTKEWb6lNdBtW+zETgJhZoYGHviGWKX+nRHmJ3XxfnSJXmVZPxZfRc3YG3Xu455XOEHwprVOfGmFbaEZxUir1mebSGwH9byxNX9xLMgtj7Mb6RbVbk9ImZRwysr238d7N5YhVYPAAHCacP0LhbeZQxXuBtRj0J4t+oU8jKj7SvjD5oOFX6FEdxd4uDONor85POB0LO+dBRakTcyTFtxSmtx8p0DTEVjMQl+yTc7sU8XQVsENUg==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>TDR3aefioLXGbhRms0a/LJc1tEP7jIroiUfnO+wSX3o5YY9wVVfd9YL0nhRdYkYtTL0RFVm6fhgU+SwANyW2LxeOA/9lnr9TY6+xpmDydPnMXYhPcQEL4iK2KqTB3++K5GIEOrk8SaxO/4s87l6sLZbrCquR+4rUS3fZ00f5Ypx8GRCcJl7d0zmwr7VbUWuT+eVgTrjRaM57AZkfg6hOj2GYClUtYSiPSlc6ulSqPXOY1+NUuS6JPGk1VsjlyRO8bICYl3AumkQZrfR6zakGy+h8zbbgO4HHccZNt7eg5t3T8S3RMloqBgM3w2aemFDynic6dxB+wxOad+GSyIncAA==</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
