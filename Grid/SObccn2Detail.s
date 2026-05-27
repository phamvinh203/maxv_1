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
declare @ma_kh varchar(128), @tu_ngay smalldatetime, @den_ngay smalldatetime, @ma_dvcs varchar(8000), @tk varchar(128), @ma_bc varchar(32)
declare @no_dk numeric(16,4), @no_dk_nt numeric(16,4), @co_dk numeric(16,4), @co_dk_nt numeric(16,4), @ps_no numeric(16,4), @ps_no_nt numeric(16,4), @ps_co numeric(16,4), @ps_co_nt numeric(16,4), @no_ck numeric(16,4), @no_ck_nt numeric(16,4), @co_ck numeric(16,4), @co_ck_nt numeric(16,4)

select @ma_kh = data from #t where id = 1
select @tu_ngay = data from #t where id = 2
select @den_ngay = data from #t where id = 3
select @ma_dvcs = data from #t where id = 4
select @tk = data from #t where id = 5
select @ma_bc = data from #t where id = 6
select @no_dk = data from #t where id = 7
select @no_dk_nt = data from #t where id = 8
select @co_dk = data from #t where id = 9
select @co_dk_nt = data from #t where id = 10
select @ps_no = data from #t where id = 11
select @ps_no_nt = data from #t where id = 12
select @ps_co = data from #t where id = 13
select @ps_co_nt = data from #t where id = 14
select @no_ck = data from #t where id = 15
select @no_ck_nt = data from #t where id = 16
select @co_ck = data from #t where id = 17
select @co_ck_nt = data from #t where id = 18
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết phát sinh công nợ của khách hàng" e="Detail of Amount Incurred, Account Receivable"></title>
  <subTitle v="Khách hàng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Customer: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày hạch toán" e="VC Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC Code"></header>
    </field>
    <field name="so_ct" width="90" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk_du" width="100" aliasName="a">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh có" e="Credit Amount"></header>
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
      <field name="dien_giai"/>
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
        <![CDATA[<encrypted>w162C8J/g2S9RQTMwqTIg07v4YKik1XBxtBC5ZKEJMMeL8MHQOOIyMA+6J5YYnAHNDBB/mapS1VIpwPBkDEw7S15hHO+8SUPY1i2LGuHXrmvbmGmKucdiD68GExWLFA5QCBJlhC3SQ2lXMeKwWVmc+h/Of/DUXUmDswLJ7aV536EWWnkw41mEyap+1P0Mtsqhgk93MAzEs/mCQOsuL5b8z/UHtHAEVcN1c/7oetq3xGkmzHpENb03rtDnNuGGwLbvK+EEiIGD7Rb4+aw2eh65iUIdGNYHyNXPk+v8JqLw1q+2WJ5PjyPQbZPECOmVv50RQDj7kvKm3jYWukn234YFg==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>

        &QueryString;

        <![CDATA[<encrypted>M03/tScRSCk5g0Hqs7BFDjecNmeTqzbAzqQElRArRofD2xbqO6PK2xRR/LyzMzVnDvTr7akWKTbnjgjRHg+yQyU/41Mo0lpuUjgE3MvQSya0XkzlOPPdph9OeQGQCjeT2SAns39n6dE9FbtxuIr1zMSLMU8SbxuoYDTOkz1eLgs3h6/bJBltQ+vP4XswTzEEApAKkfsWu28doKWHNo2LJFYFTF3+5Y+NXIfpIEydqqnle3fQODxxtt7fmksoGWWBhTY2aLjMwxDk5b4cIcj/aeQjx5FI+L4y3cz1TyXHIhSSvPQjm4lABSb9QVc99LJ/CDpfqRuQHo7i5EYqPXo93XIQ+HPFtX/VAVXojUHLHkh8BefgfgEDopN5ElqKNcx64Xq6dvTHoFp/mJARKUX4xwzP/FRClB8lKTACtkApFJpiWc13Op1nE99AanPeC6KqKuRBp+IbDh79FmaIPGXn9Q==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>KK6Hv3V89OBjigXX2h8pNsaZSnIlvwEq1RmeruX1MbXBbsE0lUViO5x3Umy4drvvTFZrEa9CguBBBuKyFLroBVxUlmP4PN0AiVzk0MyXrd8L9ROYIc9FIwO2EhiBqfoHdIhye0Ti0rzy+5ynGmPfjzUZnhXr35L9aB3m4hdVgbtU3H+PwWsV3prY5jBUtzW5OXm+GnGlCBvNxfzyUuEvFbyGw1bIEoFPjhBdtQKWm1FwBRuXzvw7nNBuxyA35susMB77lBaZKWQMZxSzKyY39HBimQPWY1dUQACN0hr6VMo25vQQj8yARiDmfVJXyTMU8wpT7Rm3CASnwM9o9tAzng==</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
