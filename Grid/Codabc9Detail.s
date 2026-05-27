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

declare @ma_vv varchar(128), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @so_ct1 varchar(8000), @so_ct2 varchar(8000),
  @maxLength int, @tk varchar(1024), @ghi_no_co char(1), @tk_du varchar(1024), @tk_gt varchar(1024), @vv_me varchar(33),
  @ma_kh varchar(33), @ma_ct varchar(33), @ma_nt varchar(8), @ma_dvcs varchar(8000), @mau_bc varchar(32)

select @ma_vv = data from #t where id = 1
select @ngay_ct1 = data from #t where id = 2
select @ngay_ct2 = data from #t where id = 3
select @so_ct1 = data from #t where id = 4
select @so_ct2 = data from #t where id = 5
select @maxLength = data from #t where id = 6

select @tk = data from #t where id = 7
select @ghi_no_co = data from #t where id = 8
select @tk_du = data from #t where id = 9
select @tk_gt = data from #t where id = 10
select @vv_me = data from #t where id = 11

select @ma_kh = data from #t where id = 12
select @ma_ct = data from #t where id = 13
select @ma_nt = data from #t where id = 14

select @ma_dvcs = data from #t where id = 16
select @mau_bc = data from #t where id = 17
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết dự án" e="Detail by Project"></title>
  <subTitle v="Dự án: %c - %s, từ ngày %d1 đến ngày %d2..." e="Job: %c - %s, Date from %d1 to %d2..."></subTitle>
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
    <field name="tk_du" width="100" aliasName="a">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>

    <field name="ma_vv" width="100">
      <header v="Dự án" e="Project"></header>
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
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
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

      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>uZBMGjUWJlT3mLgBAQrGY39E3Fz3Pzc/UT8eBOGlVi4q53dv/rrm+Oi4rEE295TS/tOGRSZy+tc/yQTtvi6qSu4EhMu2Xpd8R/Yws7BeXZIKsW80qp1tMY/EFWXlZVxIG73xq3mLwCkWJPuTO8tcdkWPmcoQjKIKRQM5kzQSq3AFbHTOCxPd7rvF847FaNU63yx0Q4+xWiogVFNv37ghEdjCdu+FpPmb/xlijAvcuqVIWSDJnrDshXxf8IRo3jf738ZOh30n9xHiVYhBihWJmV/DdhpYQ+0qMBNNlI7IGYU+qwb5HTAHBeU+p2IK4zi9Blba9TOufAv7r33wewyCQXd1eqJI3/pnMaxb93bcitk=</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>X/nXJ2WCbJMUxYDcchc4ZSEVhydbS1495TN8si3Eg/tZ6gqMuAZzJBlhKLM8PqzaJL06Lr6SU0bcrb7ggYc4Lf6SnCzJys+Jo/nqKmzPc+vD7LCYECszMfRofjPoPekCbKZVog8+fA5CJBSuZ/9oSG6kTIYh/DNptZwObWCVLBAV1JM3bJ9eBm2hSZ0jaylRvnJsX+S7WUtl38PDmM0UVMnlQfipzg8WdzZK2O7TJ2kc4azt8QvPHB5uwG0qplJm8G+sQJFaraVnx4gsK+Id017dYUwArH/FfiQzkChdvg0QYHE5u3o2lgNFA6YDKQ5bYdnUp3cFNar+Oe3+2f2y4SgvHWBIWYNBF296dxHIOO346g/LJR9C2HAS92CWpIblkUKKG3enN0v7HqXtdnmLAA9JeTroroIEKUdVyKvbeXL+5JJAaEuwbDWNxeWrElRWkwl+9BptYtvy3+FRjND/DTN91xJOVB16Zt8+dYFbF+w6+ZuqyQhhayMREY4PqlxfbO66wbWPlYn/m12Wofu5vRKD+skg8opgaCWU6AC6x5SPPRD9+RXhoe2PgiKkTeX3PpR+zQXHETTSDk1uMRMHBoaI+ZBJogEptBzZSLZ8dSQH6dwJP2LaIBTEqekT74x2GSXxct4J4qLFRsdZwcEUajIAwAcsmSKHQYSzhp04VC2Bow/qXG2JUlVMeGuXr1zWu3dY26CjwrE2DRc/vPTuSXxKyDPIDHnsDEfwmQj+qS0+BUUiofIrIoJbTGTiV9ggSErj5j1mQtcX6Cpx6gdtiitbG0vZnqh8JPIJ37AQKMbTEuFRySw1fLdnHCBdj4a0xf0PsKiV3r69XjvwqRZA+3+BEiek4K8gchm4A87osiZG/bWDoyJ9gH+zxCepllwb</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>agdcC2BZM+qqSDVaPDgcNcC0xOyzZlEPTUEtKN9yw+1a/JB1JZb1iL768eoHyfUd781T4hAno8wu8OarXmCjsRGdSRs2jHVyscFQLi2OM/cKZEcvzqPU3tajGp1g0NFh2nfA6+/Kr6K+LK4oNCbal0yDM1+QZC35a4tdEPdc9xarYqsAzCPNHzOwOdm6OXhkOyi2ShFoNh3DjDF+vDPw4qvEYailJiOXyYEDD/j8wIMvbVNA7GGCtGyqyrUQpih994qWjgj1Pin4VOGoquvcjNZ5/kOj6Z4n6F6rXQocj/miBt1/9Ybtusn2v+Pb47t99eAF3KZR0nTk8FspUUmi8g==</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
