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

declare @ma varchar(128), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @so_ct1 varchar(8000), @so_ct2 varchar(8000), @tk_dt varchar(128), 
  @mau_bc varchar(32), @loai_du_lieu varchar(1), @tinh_ps varchar(1), @ma_dvcs varchar(8000), @maxLength int, @ma_kho varchar(128), 
  @ma_vt varchar(128), @tk_vt varchar(128), @ma_nx varchar(128), @ma_vv varchar(128), @ct_theo varchar(128), @ma_nvbh varchar(128),
  @ds_ma_ct varchar(1024), @ma_gd varchar(1024),  @nh_theo varchar(128), @ma2 varchar(128), @ma_kh varchar(128), @nh_kh1 varchar(128), 
  @nh_kh2 varchar(128), @nh_kh3 varchar(128), @ma_bp varchar(128), @ma_hd varchar(128), @nh_vt1 varchar(128), @nh_vt2 varchar(128), @nh_vt3 varchar(128)

select @ma = replace(data, @d, '''') from #t where id = 1
select @ma2 = replace(data, @d, '''') from #t where id = 2
select @ngay_ct1 = data from #t where id = 3
select @ngay_ct2 = data from #t where id = 4
select @so_ct1 = data from #t where id = 5
select @so_ct2 = data from #t where id = 6
select @maxLength = data from #t where id = 7

select @ma_kho = replace(data, @d, '''') from #t where id = 8
select @ma_nvbh = replace(data, @d, '''') from #t where id = 9
select @ma_vt = replace(data, @d, '''') from #t where id = 10
select @tk_vt = replace(data, @d, '''') from #t where id = 11
select @ma_nx = data from #t where id = 12
select @ma_vv = data from #t where id = 13
select @ma_bp = replace(data, @d, '''') from #t where id = 14
select @ma_hd = replace(data, @d, '''') from #t where id = 15

select @ma_dvcs = replace(data, @d, '''') from #t where id = 16
select @mau_bc = data from #t where id = 17
select @loai_du_lieu = data from #t where id = 18
select @tinh_ps = data from #t where id = 19
select @ct_theo = data from #t where id = 20
select @ma_gd = replace(data, @d, '''') from #t where id = 21
select @ds_ma_ct = data from #t where id = 22
select @nh_theo = data from #t where id = 23
select @ma_kh = replace(data, @d, '''') from #t where id = 24
select @nh_kh1 = replace(data, @d, '''') from #t where id = 25
select @nh_kh2 = replace(data, @d, '''') from #t where id = 26
select @nh_kh3 = replace(data, @d, '''') from #t where id = 27
select @nh_vt1 = replace(data, @d, '''') from #t where id = 28
select @nh_vt2 = replace(data, @d, '''') from #t where id = 29
select @nh_vt3 = replace(data, @d, '''') from #t where id = 30
select @tk_dt = replace(data, @d, '''') from #t where id = 31
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo đối tượng" e="Detail by Object"></title>
  <subTitle v="Đối tượng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Object: %c - %s, Date from %d1 to %d2..."></subTitle>
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

    <field name="ma_vt" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="250" external="true" aliasName="b">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt2" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá bán nt" e="FC Price"></header>
    </field>
    <field name="tien_nt2" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Doanh thu nt" e="FC Turnover"></header>
    </field>
    <field name="thue_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Thuế nt" e="FC Tax Amount"></header>
    </field>
    <field name="ck_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Chiết khấu nt" e="FC Discount"></header>
    </field>
    <field name="pt_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(a.tien_nt2 + a.thue_nt - a.ck_nt)">
      <header v="Phải thu nt" e="FC Receivable Amount"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá vốn nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền vốn nt" e="FC Cogs Amount"></header>
    </field>
    <field name="lai_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(a.tien_nt2 - a.ck_nt - a.tien_nt_x)">
      <header v="Lãi nt" e="FC Profit"></header>
    </field>

    <field name="ma_nt" width="100">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="gia2" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá bán" e="Price"></header>
    </field>
    <field name="tien2" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Doanh thu" e="Turnover"></header>
    </field>
    <field name="thue" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Thuế" e="Tax Amount"></header>
    </field>
    <field name="ck" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Chiết khấu" e="Discount"></header>
    </field>
    <field name="pt" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(a.tien2 + a.thue - a.ck)">
      <header v="Phải thu" e="Receivable Amount"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá vốn" e="Cogs"></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền vốn" e="Cogs Amount"></header>
    </field>
    <field name="lai" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(a.tien2 - a.ck - a.tien_xuat)">
      <header v="Lãi" e="Profit"></header>
    </field>

    <field name="ma_kho" width="100" aliasName="a">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="ma_nx" width="100" aliasName="a" hidden="true">
      <header v="Tài khoản" e="Reason"></header>
    </field>
    <field name="tk_du" width="100" aliasName="a">
      <header v="Tài khoản" e="Reason"></header>
    </field>
    <field name="ma_vv" width="100" aliasName="a">
      <header v="Dự án" e="Job"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
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

      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="sl_xuat"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="thue_nt"/>
      <field name="ck_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_x"/>
      <field name="lai_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>
      <field name="ck"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien_xuat"/>
      <field name="lai"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
	  <field name="tk_du"/>
      <field name="ma_vv"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>a3+XUudrVXaaD3g+PnkhdSphT1DZGXof5siuzSl3fJzVggoNTIHKk1sygRdBCRu25RM3gXo3orIlWBtl8ADRPBOSs/RBDwVA56sal206KhCxxTRlo557a3f7EhJSfLjMeviEeVvx+H9bASLSLwRkAfqTpw6D72PTeoveAlGTdUP/qc99hinyboTO2H9YIzpbs/+50ZiYYxBXGJilLxFY/6PuNVGfzoedK2uLKN5sh+BdkYR9gEb7dKw2q8SEIXQnPp7CESqZWQsETz3dd4DhrsTcEX56uWXi/CgmllSXubzwtr973RQE8XlVVlYWG3LFPmzZZuDUMUhA4MqXiK4pAODqJzdzBorSfo/2A8cQpr/bZnS3P/XygDNEEIOT9oKDbBtXvel+A62izjNqrB48gRDQhz2bkUyO7v9hBJyQ1hiLUioNGm3odI9t/UEOX3M9BQtShVmaxENK8jTLPM4IvfxSTisl7wYCb59Gn+1C/W4=</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>pomPAw/Am3AO6stTEn2C2kU2mEPbKV8AZUchwcfWXnI+ftRhHzOYlPW1thtUp5bOaEKwrEXi46E/6BalyiKRmI7KbXVR1eGxAexvNb4zhEfA8PAcXhtCwqZiG9H5yqvqykT47IbbgudqSZTbLKjDrfvj+Djz/5KBceFhw7TrbQ5d+7HakQBRZXz+xNBQGEtJjRlMFXF5FaNKA40WhzkTGwvycLL/CNyAiqSCyE4S3mcSCIAcQKdC1XijHUcU7iW/IHpPCCVA91HlFjyxaiqZ1BkDgD1CEDmUFA7Vk4rLLhW3hTid7cFFgxYyxYvYmv7tSyngLBQ+7fi3OyDDXTl3ART8dAQNRaEtToh7rUH6T17lcdzHB7F8ZQMUVwadrefLcjyYblpF669fS8ZMKuf4JL9H3HsMEYZ1St0fa5SiCZQS63tteCmhzPwO4rR+dM4lGAYV7Pmbf4EXfw83dDbImr8h9Xs0W0j+Dc+h6/N+H+8XEHEwXGegT2rlE790sMrbO764O88ckiXEjU2rHmzdxhLEl5r9nEoFzsseC2renyY/QtHNtHpFATBPhQkLdMEGTUC1C4bD0/DHMFZPVSiFb1iol3T7em/d3yImhRx8RCLK7MzVTPBAftCrAm69cQ7j54L6jz3j0D4dJ8Juo9ErlMH/CLSEF0PGakNmk3VsWjmV2qlykE4JWhwBCtjpT+Ke5921/kgpVKOjrchxABG80XsVFxfys+zkfsoIjYwz/76Cfkf/n7RkHIaj3t6IaMOowB8J2MMIovr8iUDba0TuLh3wZZCx5DW1nAJyiIb8mF6jW/TOheFipkGSafzJIZl1iko3bWJip1uYhE0DmjbDX3tHsMPNOocWBCKweMNKaTOUeFolh9cYYdJUq0xf/hh0T19cAUGLUFf0JyVA45VjKcxLgMSxEpTslPjlkpKeKyZhyMwE9wVBMosg1RlVShE9TuK4+uxE8CX8Dyf7fRznBynHjfhk0VRZ1YuPc/Flx2CKw7xHiyb3Rc/M/AUbzB7WAmFJ8I7rj2c6qMO44POH/Z9chtiVmtuNctcczvE1Nmg=</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>TDR3aefioLXGbhRms0a/LGDie1ulyFUxu+tQ7a0QcBCl1vuTt+VDBMJbOe7Zml1tppsk1LAjlaF24pPqywcRUQBJciyQHvAu8CWTnjV1RB/Lp95JuB2ti7+MnbltgyZ9m2ZThh/UgJ7zApWjXg5iucOGxIjRkJQYcfCdWJ2Udv03LMLJ5g9HtpH7bzLDbIcO9cCtQJrPL2W34T8DMwy7qSp2dKpvoNXgkTcrfKTsHIzM+pVgpKOoKEFeOELSZXe3H8vq5/HJUNcGekNaUG6gTdLytAmf9UxIHGEOTK1t9e5YXHMzNWws330tMBqRpVixzboA9wvmQ8J5cSJKYyhgZBDr8D+Zhesg/E3ZvUyX8wBhmNBszdG0j58cgZ1lNTbd</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
