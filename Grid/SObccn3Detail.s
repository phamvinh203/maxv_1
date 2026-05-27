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
declare @no_dk numeric(16,4), @no_dk_nt numeric(16,4), @co_dk numeric(16,4), @co_dk_nt numeric(16,4), @ps_no numeric(16,4), @ps_no_nt numeric(16,4), @ps_co numeric(16,4), @ps_co_nt numeric(16,4), @no_ck numeric(16,4), @no_ck_nt numeric(16,4), @co_ck numeric(16,4), @co_ck_nt numeric(16,4)
declare @ma_kh varchar(128), @tu_ngay smalldatetime, @den_ngay smalldatetime, @ma_dvcs varchar(8000), @tk varchar(128), @ma_bc varchar(32)

select @ma_kh = replace(data, @d, '''') from #t where id = 1
select @tk = data from #t where id = 2
select @tu_ngay = data from #t where id = 3
select @den_ngay = data from #t where id = 4
select @ma_dvcs = replace(data, @d, '''') from #t where id = 5
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
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày hạch toán" e="VC Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC Code"></header>
    </field>
    <field name="so_ct" width="100" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk_du" width="100">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
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
        <![CDATA[<encrypted>/MzfmTfNYP3xVPB5HJKK/bl1wdtAUuG/6KW9mcgysHR7YYvM8zvPtkTwlVvKNwTZs1eekYQQhhyY5DVLnhuix9xHMAtGQb8Q6iqKmAiO5KCdQZmN7LVRSIkAK6huJYQGCVcEMoeMKU9ScmbjCV//8WinQSBZ2MMwwemGi5aPxo1pclyqGMRQWsiFkKy61xXjyU38jcjd4ZOLplOyqTR478f3PdzUpjRT/aMBF0NvwEXkYnExyfWASUulQoFgdjC16I1ivPapLPCr8ni0gtkNjnRFeU8Wd7q2Z+NdPHApOvRnX3qDQkqpeEaaQipofPqA879RstCP21x7wZ5TvrCkKA==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>

        &QueryString;

        <![CDATA[<encrypted>XIDlbIrMxfSQHs/X3zsfEJduSewiaU0e7S9+rLyRpsihK3egkfHW920lF7N0bKFQ6dNVARtModXNLqhAsnwW5lpJA85A8dGA1VVg2/NSPT+rIzTvxwWQPkvlfn++iIvt1n1oM0EyZAOrV8+ilkCGKKl6acdONt/VX/ZReEjItnLKf9V1CXyofqowhssHts72I+jJR517chzVXWi6HgvIPyjFFoX7Ysuc1ror8DRl53/RLl+0hVKOCBy12coz7Bj4XixudALFvGVNnU7d86BbHtmkY4zoT92wDgzIxAOReSad+R8rD362QCOU/zWr+Z9EuZlcgdROz4WLjXs6etD1XEECo7MvSeIvbyjKgZYui/Due7kpyEwPOdyX604KRo8eoID/APkOMsc+pL+m/tH1Hh930KVk8d/8ojbtCFVRXzrETgWo3ckUDexA2wPTKniH</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>0yH65H5mH4Ezet8KK+KLrOxwx3kEeZWVs+Z8MMWFkwB21r4mKHyCCJ6pP3B8bNGYW3kF73k79xJL2TJV8zsTikj/JsPezqe3T4yb01kv/aYfeUr6soN/VjI9Xd7zV2k8YdVv5IZuDX1evqHYx7wlzT9dy3vYP1yyXBHrMxYF4hsrEZqboUwyXahrluYft9R90lpJYvDvjzWm/qcT+e+/znM3MchWynlnWXQX/ys6uenTmZE4X9hI465qwQpH0dCEAfcBr/5lmFQnaUSM5w2g7hiJbB5Gkj/Asm0ryDHs3OrCieJl+S/Q1YEU9YfEKeFsN1PKH5z8UfyWAo/7Y06TBg==</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
