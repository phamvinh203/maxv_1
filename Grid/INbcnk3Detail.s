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

declare @ma varchar(128), @ngay_ct1 smalldatetime, @ngay_ct2 smalldatetime, @so_ct1 varchar(8000), @so_ct2 varchar(8000),
  @mau_bc varchar(32), @loai_du_lieu varchar(1), @tinh_ps varchar(1), @ma_dvcs varchar(8000), @maxLength int, @ma_kho varchar(128), 
  @ma_vt varchar(128), @tk_vt varchar(128), @ma_nx varchar(128), @ma_vv varchar(128), @ct_theo varchar(128), @ma_nvbh varchar(128),
  @ds_ma_ct varchar(1024), @nh_theo varchar(128), @ma2 varchar(128), @ma_kh varchar(128), @nh_kh1 varchar(128), @ma_bp varchar(128), @ma_hd varchar(128), 
  @nh_kh2 varchar(128), @nh_kh3 varchar(128), @ma_loai_vt varchar(128), @nh_vt1 varchar(128), @nh_vt2 varchar(128), @nh_vt3 varchar(128)

select @ma = replace(data, @d, '''') from #t where id = 1
select @ma2 = replace(data, @d, '''') from #t where id = 2
select @ngay_ct1 = data from #t where id = 3
select @ngay_ct2 = data from #t where id = 4
select @so_ct1 = data from #t where id = 5
select @so_ct2 = data from #t where id = 6
select @maxLength = data from #t where id = 7

select @ma_kho = replace(data, @d, '''') from #t where id = 8
select @ma_vt = replace(data, @d, '''') from #t where id = 9
select @tk_vt = replace(data, @d, '''') from #t where id = 10
select @ma_nx = data from #t where id = 11
select @ma_vv = data from #t where id = 12

select @ma_dvcs = replace(data, @d, '''') from #t where id = 13
select @mau_bc = data from #t where id = 14
select @loai_du_lieu = data from #t where id = 15
select @tinh_ps = data from #t where id = 16
select @ct_theo = data from #t where id = 17
select @ds_ma_ct = data from #t where id = 18
select @nh_theo = data from #t where id = 19
select @ma_kh = replace(data, @d, '''') from #t where id = 20
select @nh_kh1 = replace(data, @d, '''') from #t where id = 21
select @nh_kh2 = replace(data, @d, '''') from #t where id = 22
select @nh_kh3 = replace(data, @d, '''') from #t where id = 23
select @ma_loai_vt = replace(data, @d, '''') from #t where id = 24
select @nh_vt1 = replace(data, @d, '''') from #t where id = 25
select @nh_vt2 = replace(data, @d, '''') from #t where id = 26
select @nh_vt3 = replace(data, @d, '''') from #t where id = 27
select @ma_bp = replace(data, @d, '''') from #t where id = 28
select @ma_hd = replace(data, @d, '''') from #t where id = 29
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

    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Supplier ID"></header>
    </field>
    <field name="ma_vt" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
    </field>

    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nt" e="FC Cogs Amount"></header>
    </field>

    <field name="ma_nt" width="60" aliasName="a">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá" e="Cogs"></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền" e="Cogs Amount"></header>
    </field>

    <field name="ten_kh%l" width="250" external="true" aliasName="c">
      <header v="Tên khách hàng" e="Supplier Name"></header>
    </field>
    <field name="ten_vt%l" width="250" external="true" aliasName="b">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>

    <field name="ma_kho" width="100" aliasName="a">
      <header v="Kho" e="Site"></header>
    </field>
    <field name="tk_du" width="100" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_vv" width="100" aliasName="a">
      <header v="Dự án" e="Project"></header>
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
      <field name="ma_vt"/>

      <field name="sl_nhap"/>
      <field name="gia_nt"/>
      <field name="tien_nt_n"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia"/>
      <field name="tien_nhap"/>
	  <field name="ma_kho"/>
	  <field name="dien_giai"/>

      <field name="ten_kh%l"/>
      <field name="ten_vt%l"/>

      <field name="tk_du"/>
      <field name="ma_vv"/>
      
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>4CPwiDyq9r00dpapYy0/jWhJ+wTnLwyDy37WlPdQKziFVloT87pcjNzm8padXYzvqoa5A4sHR0E0j9IfKLrFLo7xMwwSx0SVcuxXPKW9n/ZS2dXnlkZc3XK1voyzq4AHIqfX0jQjVlsif3FIcCVfbafYjPrrAmf75aSsrQSgEGxNf9B18ybfX55p0C9YH1uM5xFnt76mg5S+K4Au+tmdMBr0iesH5660HZLcsW71igYHQEjSu4QgPZR6hOmDMBV08fQrNv6G1vHvOamOFAFkZIKcm8gUdmC/O3JH6pTuReltnr5UxeLYUGr4pt9TE+2sI9JL9QQpqMFi3W5m/cx5ZNfS+kctCPUx+HyuIVQOr65Ev5CT14v2tvYhAD3ZfEPKqTgVPZMRwStFr4kCiwWhCQn02gxy7zCr7XTw0zodwG5J/HExwbp9Ztku4XiU9yMGqrcmPF6wdOlUDGe+c5XREQ==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>i7A0jD7HcK/6Su/AIScjcqp1IPAKoYeuuecELuvgkJ677mH6Ltf2OYI8D1tSlzGRfN5/e784BUnCb+boSF6U/EpLLEe79YVAsaxNDgOAnnfiNWRsVQZGXe5xrzDfesF2Agh0QrKghEX9fMYTEZLbkCMQ97lTEZpbcQMIpeyfKnoBg7p4cxxrOoX0v+1DpvDAOTzhCmKwYRmckLjIC7ZeyY4k2VS1BTnao4IkoMuhtgdcEg2gDkH189juwCb0NmeO+4i2h4G1pMtqHjt6dNXJCQeqfyAipIL6KZKVeXyQygE5wEpjyILsC0zsY1lyWsEGwuUMQzPUqT394YbMocxG9kLUOa8tu6Drm5ctBAUUdHnKn6H43AL3VYnu4Z142BoD7y9QjSOOkG83rXmkw+wWHT+/jIRkvLyE1u67MkTimJUxSj8OMzl2hrVyJx4dlVY/ET7FfG8MNA+K3Um1rSdDJfEsugNTPp/RK+miQGej/dcCDIVpt6dWx6heNjrmic6Ks0hrC27OAZzuyNaxM3VgxHSH+jU4T2C1JPuLIMWzqU3ZBRSuf0F8eR2HZmCop4mlp3YG1blncv97gtcoBNZmzYnViDTYM2RCC3UPKybmeAUQI4mgMrgi8uLILkEdnGyN2CtQO6lik2LR9SD0AB9SQxMI9GaDBf8czi4XXNCbq44rzf7gW3yRFUaCkOU6J4WEWd1VCDalA/4wf5Pn7Dmm7kHRfIBJWIWri/g7Kgia8+3xz6PQHhEBSLWtszrv8tvi9jjW53GUZPGEsn8YALr80ZEtkqLE6X02YW5jhXq9teXFVlE00/IREsCI9hHSMdbdVlUvmBovIyq478hC9KtNv9iuwTPFSe0Nk/AhKoyyDq90XjPlcw61H6UnewYD3OGLpBpY5E+4KW4IkQ1WWpt6xttokQPURzRYDr08zqkk1kweUYUmK9DiPBjB1hCu6Fo4pC062ZhlQSCzx7jkfuKGo9a2UFnS/27Cz2x0c9jt1BMTyjYjkpEtp14+e9ZYFi4f</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>agdcC2BZM+qqSDVaPDgcNamlSFf7Bia2iAA7CyicZD/5Ca/ii4TmavRu+xRBMH+/hJ7AnDWhP3N5X60lju9PDPBl4nOkAbPdNoFjQrSMu8fLPJkxKIdouuGpaNzqPJkDrtADqoiqFymvShxQCJAPYFEmqKTTIeIwQrPO0zt4v+b8sl5NDeGmw6oDUt64e8fZTpMwjBG/BDduoSl6qJ8ZuoG9Z8imQoikp6qFADmCf37ajxEGc7cGQZRnAJXu+Uh6tQB53vWIh4yNISSysbO4c1ZyhSHfBXYF9uoV5ow4ihaGzx4LLrBJZKJVdl9oYZfqBmpl3ObRo7f4GXf0Sa+ZhvQ78guyfvxDaoETEejGa6A=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
