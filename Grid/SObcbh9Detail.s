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

declare @ma_vt varchar(128), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @so_ct1 varchar(8000), @so_ct2 varchar(8000),
  @mau_bc varchar(32), @loai_du_lieu varchar(1), @tinh_ps varchar(1), @ma_dvcs varchar(8000), @maxLength int, @ma_kho varchar(128),
  @ma_kh varchar(128), @ma_nvbh varchar(128), @tk_vt varchar(128), @ma_nx varchar(128), @tk_dt varchar(128), 
  @ma_vv varchar(128), @ds_ma_ct varchar(1024), @ma_gd varchar(1024), @ma_bp varchar(128), @ma_hd varchar(128)

select @ma_vt = replace(data, @d, '''') from #t where id = 1
select @ngay_ct1 = data from #t where id = 2
select @ngay_ct2 = data from #t where id = 3
select @so_ct1 = data from #t where id = 4
select @so_ct2 = data from #t where id = 5
select @maxLength = data from #t where id = 6

select @ma_kh = replace(data, @d, '''') from #t where id = 7
select @ma_kho = replace(data, @d, '''') from #t where id = 8
select @ma_nvbh = replace(data, @d, '''') from #t where id = 9
select @tk_vt = replace(data, @d, '''') from #t where id = 10
select @ma_nx = replace(data, @d, '''') from #t where id = 11
select @ma_vv = replace(data, @d, '''') from #t where id = 12
select @ma_bp = replace(data, @d, '''') from #t where id = 13
select @ma_hd = replace(data, @d, '''') from #t where id = 14

select @ma_dvcs = replace(data, @d, '''') from #t where id = 15
select @mau_bc = data from #t where id = 16
select @loai_du_lieu = data from #t where id = 17
select @ma_gd = replace(data, @d, '''') from #t where id = 18
select @ds_ma_ct = data from #t where id = 19
select @tk_dt = replace(data, @d, '''') from #t where id = 20
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Vật tư: %c - %s, từ ngày %d1 đến ngày %d2..." e="Item: %c - %s, Date from %d1 to %d2..."></subTitle>
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
      <header v="Khách hàng" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt2" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá bán nt" e="FC Price"></header>
    </field>
    <field name="tien_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Doanh thu nt" e="FC Turnover"></header>
    </field>
    <field name="thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Thuế nt" e="FC Tax Amount"></header>
    </field>
    <field name="ck_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Chiết khấu nt" e="FC Discount"></header>
    </field>
    <field name="pt_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aliasName="(a.tien_nt2 + a.thue_nt - a.ck_nt)">
      <header v="Phải thu nt" e="FC Receivable Amount"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá vốn nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền vốn nt" e="FC Cogs Amount"></header>
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
    <field name="tien2" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Doanh thu" e="Turnover"></header>
    </field>
    <field name="thue" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Thuế" e="Tax Amount"></header>
    </field>
    <field name="ck" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Chiết khấu" e="Discount"></header>
    </field>
    <field name="pt" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aliasName="(a.tien2 + a.thue - a.ck)">
      <header v="Phải thu" e="Receivable Amount"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá vốn" e="Cogs"></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền vốn" e="Cogs Amount"></header>
    </field>

    <field name="ma_kho" width="100" aliasName="a">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="ma_nx" width="100" aliasName="a" hidden="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du" width="100" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
    </field>
	<field name="ma_vv" width="100" aliasName="a">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="ma_bp" width="100" aliasName="a">
      <header v="Phòng ban" e="Department"></header>
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

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="sl_xuat"/>
      <field name="gia_nt2"/>
      <field name="tien_nt2"/>
      <field name="thue_nt"/>
      <field name="ck_nt"/>
      <field name="pt_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_n"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia2"/>
      <field name="tien2"/>
      <field name="thue"/>
      <field name="ck"/>
      <field name="pt"/>
      <field name="gia"/>
      <field name="tien_nhap"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
	  <field name="tk_du"/>
	  <field name="ma_vv"/>
      <field name="ma_bp"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>

    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9EEY2W9MUsUL/pWgvJ3W8Bh9AuWhesKOlYhy5dt+e7bV2eRZAioSg+nFdGF7pQLLtsAZlIkw+CsRvT7tf3MOhM/NRcKuKP6hQrI6jm9eaoYto/IPBXJyO3ZeMzMJunqvTgegVMXD6gWn/Bro6KGVpdVsWO+EBkEcy62xPIkfJOyvzCEcDdNgWYmg/tbe5kytZmj8Lw3gLAh1BrB3fkaAn6sYtfyUGLemjETkz9QEhXY3RhxmYNh93qazWKwEY2QBIAfv5ILTULCfxukQ3qDDm63EzQz5P7rSzPDC2uDt+Hns</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>aHcpWEg0vI12NTuUVTZM9dcD1s+nKZnrps+fgpaDHulAJH8GXpTppKtoANiXvdGZpsuaa0I/sTLcU9ICzCsnG8OcNl7rS7Okg/VrJux2zUryTVdMick46jqE113UoRIFeqMCJ+BrEVxFgC0iMG97IJB6ue91+STPm35rjRDEIj8aOHbG+0EVkkeJGeHw2RzgjBMB/tsx/ko30/ItTY5LaTPb/EZpulK7RckLuQzjvzREZ3XdSyje/gCE+e061NtLQ0cPTulpibdMFEFU9xJJYKEceeyLwljR6IA3RcOTyQFlL+qodmsxUXaVnJ3tzwM9EHE8gyDIgsAI5BNLxbN9iI5gskqshb05UxvN4iJXNf//bb6HjBmbPC4v8Pusf3csHRZONRmXAIduVeFSwPKbVVIviNyWEJhGATwGFgpJGih7QGqlGg+NpphVL9mfxFegrljfo3qOkjqb3GtoLFLVmi2ZzYEXbM8TksAvLypzRXSIlYUTxGnjF+7JzYrNubiwunEZrROvepNCnUTvaaYx4ac/aRc6NPb8BUQUpvuVf+DibHEoSefkkER5jV9e5mhxnDkp6kFtM+3YpKomcecCuzFzeoy5yK9nPQLLAf8YII45KTTSDgzAy5HtX6lNRtaE0X8sr4FMryeedrbiLO4IvRqgtHEdyU8Ul2ehiX1TfFkzIWem+Y8jTo71JHQYW9UPIW3o8w0bXiQXf/uUDpOpm3HksREbvqAfMN+gV/u5dJs=</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>0yH65H5mH4Ezet8KK+KLrDCorACc1GZnjoBdYnQ15uYvMNjQnY16aDPt8YZBkt33slaU9Md4Jdv/mRNbDyWfxIJYwdzk1p/otDUGcrjInKmcgAP1ubjQlJvlY15gdKmYiekY1UC1qHP5DyoJYuU9e80WVTvYPZvuBSgg9NE05qme9CmKpyUIm1cUxyjSZeyGRsvjc5K0R31wzinD7vTMY4+KsMvo+ZnWp3UcxR3dNsXzxlvogSCbRBvDcfqYIGzZIAjU8NqTvCnQnsi84LutM2bv6CZPAflqwA/LS7kCPNtUnfPdz6r2KA7vBepVXv65KPttHP4vAJkV4iVaQxk64MFFHNGfra6e5mS+CT1ChMVTCtAy1vUfMVKhzMk5nmjI</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
