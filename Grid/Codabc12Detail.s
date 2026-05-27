<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY QueryString "
declare @c char(1), @d char(1), @tmp nvarchar(4000)
set @tmp = ltrim(@@queryString)
select @c = char(253), @d = char(252)
select * into #t from dbo.MaxvOnline$Function$System$Split(@tmp, @c)
update #t set data = replace(data, @d, '''')

declare @ma_vt varchar(32), @ngay_tu smalldatetime, @ngay_den smalldatetime, @tk varchar(128), @giam_tru bit, @nxt int
  , @ma_kho varchar(128), @ma_kh varchar(128), @ma_vv varchar(32), @ma_dvcs varchar(8000), @mau_bc varchar(32)

select @ma_vt = data from #t where id = 1
select @ma_vv = data from #t where id = 2
select @ngay_tu = data from #t where id = 3
select @ngay_den = data from #t where id = 4
select @tk = data from #t where id = 5
select @giam_tru = data from #t where id = 6
select @ma_kho = data from #t where id = 7
select @ma_kh = data from #t where id = 8
select @ma_dvcs = data from #t where id = 9
select @mau_bc = data from #t where id = 10
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Vật tư: %c - %s, từ ngày %d1 đến ngày %d2..." e="Item: %c - %s, Date from %d1 to %d2..."></subTitle>
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

    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aliasName="CASE WHEN a.nxt = 1 THEN - a.sl_nhap ELSE a.sl_xuat END">
      <header v="Số lượng" e="Quantity"></header>
    </field>

    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceViewFormat" width="100">
      <header v="Đơn giá nt" e="FC Price"></header>
    </field>
    <field name="thanh_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" aliasName="CASE WHEN a.nxt = 1 THEN - a.tien_nt_n ELSE a.tien_nt_x END">
      <header v="Thành tiền nt" e="FC Amount"></header>
    </field>
    <field name="ma_nt" width="60">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceViewFormat" width="100">
      <header v="Đơn giá" e="Price"></header>
    </field>
    <field name="thanh_tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" aliasName="CASE WHEN a.nxt = 1 THEN - a.tien_nhap ELSE a.tien_xuat END">
      <header v="Thành tiền" e="Amount"></header>
    </field>

    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_nx" width="100">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_kho" width="100">
      <header v="Kho hàng" e="Site"></header>
    </field>
    <field name="ma_vv" width="100">
      <header v="Dự án" e="Project"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" width="0" hidden="true">
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

      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="thanh_tien_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia"/>
      <field name="thanh_tien"/>

      <field name="dien_giai"/>
      <field name="ma_nx"/>
      <field name="ma_kho"/>
      <field name="ma_vv"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9Crrqt4MlBCpUsG6XyuHG698i+5hVX+rjDRF5cwSfipwY0wcq1TYg12kqA3z7yLxgAkAWJmGRCv1zhHsjpQQSGm4MP7Wy2WORGZtcOsabncSuJYXLdN19QPhdG7i7f3T2JIpcL7+xzLVPPFo36H3sndQrxS0gzqdP2SQQMmMfY/boq3Huv3gjgiOvMIw4DvOwFGfyNyQvHiT0OhndQd6N8PTpEc3L83685+YmNTodP1jfwJKbwcmclNuNjBkW1xCHPFqmeucxGvUZCleqUbueSQK8rH1OoWLvceUqTuZypElUE6H/Q7okidky8ZPA0ZmhQ==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>gPGMQop9BqFHgOMCwCJe3UHw56AHJ1R9Qc4kUT/Lhs5MUQeTNAi/DgX7ljyDQ1me6ox49Pe9TRtBIFavDFOHDghMRR0OKMMr99yMAd71vPoNyj429wXSMGKVlGfXoepVUmFTlpS/9xiPzt8CM/m/X4TsyAIbNCttJWZxKjth821da4Olkc8fYUEvIk6UrsGAXB4otycsdCTSXU1x8oomkUxhDFXPC84xdw6GA8t6azBvIZOo2HmrlT+BfT4TfR5zYOR56M93VuHkPSRZc6HrBqWx9DckEy832fpm9nlKaPebXuC0IBKpFzsoRyOBFiu1iCiUHe7i65n4EC/aU1Ld1nsWCyRxS1B0sebGDoyL1iWzfW7qVzKCJN7LXEQjWUS+99kUpjbqMz8E+i/f81CSg25pbQL4cLV/R+fVM8x6sMxKRCrr6+YaRaoMgRTOozAGVjgXgd7jwSxqFIb7y0d0lXZMX6KAnbDUmf1IyKQ3pmeF8BnLqWiQhAn78E9iUWW5</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>agdcC2BZM+qqSDVaPDgcNWcxxCSqnuII9oybu0MwQBMrV1fHUDwpxhocBm9AY3Gft6PIPc3Xg60c+70Hk3XPmOuiKmrknSomXVvDaAk7M2l5WYGfH6hhUBXzsZW6YBoX7Lt0+cPqsCDDXwUUZXziSOX5/L95dSMJfcScCuZS6AQLelzaaW/I/1DlSRZHF7k0b0BblTcyWTFhR8cLaP8L+b8Uk2M6pXEMzz14WRZvINWjCKbp6OTtlh9dzBqOZ4qr62aXAjIkKUXqKXeVnqzOVkrjBXZcwMDJh/LMPuyD9bo2OlzXe83+mxfIWAyv0qgw9PJ4BFOFDeXzh4ko7gcFQ2ApXfR5s5k9KaFsSUzT8is=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
