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
declare @so_ctgs varchar(128), @ngay_ctgs smalldatetime, @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @account varchar(128), @form varchar(32), @maxLength int
select @so_ctgs = replace(data, @d, '''') from #t where id = 1
select @ngay_ctgs = replace(data, @d, '''') from #t where id = 2
select @dFrom = data from #t where id = 3
select @dTo = data from #t where id = 4
select @unit = replace(data, @d, '''') from #t where id = 5
select @form = data from #t where id = 6
select @maxLength = data from #t where id = 7
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết sổ đăng ký chứng từ ghi sổ" e="Detail Journal Voucher Register Book"></title>
  <subTitle v="Chi tiết phát sinh của số chứng từ ghi sổ: %c, từ ngày %d1 đến ngày %d2..." e="Detail of Batch Number: %c, Date from %d1 to %d2..."></subTitle>
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
      <header v="Tài khoản nợ" e="Dr. Account"></header>
    </field>
    <field name="tk_du" width="100">
      <header v="Tài khoản có" e="Cr. Account"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="ma_vv" width="100">
      <header v="Dự án" e="Job"></header>
    </field>
    <field name="ma_bp" width="100">
      <header v="Phòng ban" e="Department"></header>
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
      <field name="ps_no"/>
      <field name="ma_vv"/>
      <field name="ma_bp"/>

      <field name="stt_rec"/>
      <field name="nh_dk"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7TcaLI21z46LEaatog0rwiI474/9qeU+OXMdau6OeN9awGHUzTFZhVG/K6ARXIdmKk5ceWI4irdnfsMsVNHNQKfAbkYYjbBd657wD6HbiWrYtq8XUu4LM21qswwZxJhcvg==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>PToFmfyu57ySNYrPo5Vyge9pZ+Ql+x7BHCqC4EaiNulfHs6jw2YFb6btqKqLy4+hCNPkXj2pBXdYQtSQz9KLtQJvtZinXrLDO3ogj0jZaRKhsOTakLcYpTe3Ti0TpSmlf33/gEdJWNoHHrfxc02afomFbUxQBloH/O1i2uwrCwn0EVcSOTp59Au6y/nW70gum/8Y4jsSBVQF4IRSSq9ecdMuZFsYbV7AsZsJolkDJgvDMv3kMLYZWTxlz8V2NUeu+izC3BP8H/oynQoubOMhawek+aROQnNuKAxlzsNRwd49rzXUVEdpNP+gI5NuU9lvvSFgKLt5ApVHqwmu4jATMdLi2imJHrz7cz2JT2dwbZWyD6pM2xgwo4+8r7FhJ5NWdYEnVAiJFEMCnVCKGDXRI+6gVlJVveGs17CITsTaF3lIcQ//HgrGJVuQK8mPPfu8pMCv1vI68UI/C7kO7mIr+0WAWHWhA3HYERvKB68N3GC/q3mPL/ai9XMklnorLwy4qkRzNxzS8UsW3+VpdO+t2w==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>R7SxxBpl5/IA3YrJVbByn5P3tB2Bu94lZTTJDT51RttHgZOvo6kmnoJVlO5iDn5AG70ch2bVKSViQPJ198hwUeO2BO4qDFJrOauUJvuQyXxp+vE0NDLRVqfDE4ITWgKBsIySpKcd4xdNrj5izPFbgn+m3ZmmH3VL5jFHdQS4Ka922DpX0OpqLNtZryoGYKj8a66aJ6FcsIoX5rFDMy4cvbXpV+5s6n74jgeyTXD45xHhuX4N8yp4mx3pO4niFPWanWY8tAhTNhS/VFu4OiLdmK0qqpLBDgmkuS2B2N3m95LdraDeovFURQTG5r+i1QCq</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
