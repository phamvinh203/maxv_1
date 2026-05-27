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

declare @tk varchar(33), @ma_vv varchar(33), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @so_ct1 varchar(8000), @so_ct2 varchar(8000),
  @maxLength int, @ds_tk varchar(1024), @ghi_no_co char(1), @ds_tk_du varchar(1024), @ds_tk_gt varchar(1024), @vv_me varchar(33),
  @ma_kh varchar(33), @ma_ct varchar(33), @ma_nt varchar(8), @dien_giai varchar(8000), @ma_dvcs varchar(8000), @mau_bc varchar(32)

select @tk = data from #t where id = 1
select @ma_vv = data from #t where id = 2
select @ngay_ct1 = data from #t where id = 3
select @ngay_ct2 = data from #t where id = 4
select @so_ct1 = data from #t where id = 5
select @so_ct2 = data from #t where id = 6
select @maxLength = data from #t where id = 7

select @ds_tk = data from #t where id = 8
select @ghi_no_co = data from #t where id = 9
select @ds_tk_du = data from #t where id = 10
select @ds_tk_gt = data from #t where id = 11
select @vv_me = data from #t where id = 12

select @ma_kh = data from #t where id = 13
select @ma_ct = data from #t where id = 14
select @ma_nt = data from #t where id = 15
select @dien_giai = data from #t where id = 16

select @ma_dvcs = data from #t where id = 17
select @mau_bc = data from #t where id = 18
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk, line_nbr" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo dự án" e="Detail by Job"></title>
  <subTitle v="Dự án: %c - %s, tài khoản: %k - %m, từ ngày %d1 đến ngày %d2..." e="Job: %c - %s, Account: %k - %m, Date from %d1 to %d2..."></subTitle>
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

      <field name="nh_dk"/>
      <field name="line_nbr"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>tK1lqal5Q7PnOMZtBvJ1f+4wesJDEA8ZYj/jlOiTrMxktZqTQwaYv9nFXmlw9vZFcg/iPZtixuEwdnf6OzDwdgpyOyK9/HoBRiBkVQqfzTG5kG8YJ4qm6SBSKXx5zOMAzEk40EoOb3Ykj33OOINoISWWX5yR6xGJIIt8nke4zNbD63yRDdFBm+ksMIWMWjomCACEicDKtmqig/o3r8iKGm34JWlkqAw4yIOhPvmcW0ip8/9jMf7Z5QY/Orf03iUHBTroraJ439CEUX+pOYqtl9mSk+q/7bzb/zg7zd4U+zrrf0zcbzqXOJGspDIubZL3xt/ObhDD/Vo+f4Rf9bJYXnDTvG9c+ySDFEGI7pAZlqJEOBXd6z584YUgsZK/fEUWfs5vPm3PSHjqm+UlgIZYrYskwesudoD9xXzrxCpEEwc=</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>wuC1cn8ioHYQn7whZi+P0o9J30adDe2CZDCJjdBfTqUgXrR0Rg3ArszA8QNojZSzkHH12UVtBReTwJHdqQr32ULGTvxDla2eA9oeqY1WlnwRKjK/+vtXXmbKtUSdYjT06k6xJHyjFv9Z37WiikTwKxF2MoM/T+/rx1/vlDozeENuZMX0zxj76b6rPvhI6dm8RVRP/EJmNWkq4JAGw3+HEHqXvFL+t5CM5rK/k15wlSJ48rIPuk8w4YWVaEct4rPGePMhSdtZp348PPws8d3dltOxoMu9zhie/jkrMMAmhCy+ranqxdIq5XVygppDgUBId8SPaqgBd5uUiaZCquuJXk67MeeVa46U2gA+6HQw4dSAQek+gaMl0RIFKLbNJj6eZN80sIpnkGiQ6hLiKZMl5X9t1GAWbSFqITH+p/cjBppW0lR5JGf9pGqrencFnZQxRGD2nxxk37euaFWhQNXw7NbiKJgI5mwS/iqKKZJNDH+fJc+VfQzHqnIv5IDhFJK9Mos6Es+FDmfFwDZrbYfYfjekYBdYuL6/g84GQuPaltm+xi8G0GY7FbSk/HGYxEjh8l1IwlZqMZaApO18+oHw64jZLkbvzSKZ87RMdTZY/U/fXoKfXCFjxRQA/CNqhrFIsESExoTqxSDvqUIJHmIwGyxlSOp7y6bmbNawegkl/8i2rJCbpWEeNQlIKV6tzcXTMDmY6jynCWNk3SS9RYPKKcEaG2GN4rjXuJZP5oWHNtRaERk3B7eZrFEYLLs/y0NzUUdMMV+kcEnaOvkhpIaHMA==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>X3/OKKrN+uSxOleJpbyW9ZfIkVBaF1kUcnGvBbs42TA0h3WdFo3LnJvGSlOHoe6K8exzfCLxwSFXV7HtKqoEJn/a+cfv+pmb7H6FEJlNSzvN1ewlYVDxP+vap/ZcExlsYVWohBtiCpt1rOAasbbSbHMwFh23eqGtAIe/GQscC1zRnyyioM+8R2yJMCjkga3tUN1lf7+XghyKw9cn3l3zt2EyVfHgJRArM44WpGWESfx2t/GryDL+kd0D7/Xe+S2n0K3GrmTtbgh8yl7h90JixAlbQ9LPlkLeep6moLh7wxPQbtMftYtCisCLD8B7+gchfrsiUk7FGMcnR6fwkzhrNwi1Hoi5p8sfx+BaTo0a17A=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
