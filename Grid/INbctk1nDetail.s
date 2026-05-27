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

declare @ma_vt varchar(128), @ma_kho varchar(128), @ngay_tu smalldatetime, @ngay_den smalldatetime, @tk_vt varchar(128),
  @mau_bc varchar(32), @loai_du_lieu varchar(1), @ma_dvcs varchar(8000)

select @ma_vt = replace(data, @d, '''') from #t where id = 1
select @ma_kho = replace(data, @d, '''') from #t where id = 2
select @ngay_tu = data from #t where id = 3
select @ngay_den= data from #t where id = 4
select @ma_dvcs = replace(data, @d, '''') from #t where id = 5
select @loai_du_lieu = data from #t where id = 6
select @mau_bc = data from #t where id = 7
select @tk_vt = replace(data, @d, '''') from #t where id = 8
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết theo vật tư" e="Detail by Item"></title>
  <subTitle v="Mặt hàng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Item: %c - %s, Date from %d1 to %d2..."></subTitle>
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
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá nt" e="FC Cost"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá" e="Cost"></header>
    </field>

    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="SL nhập" e="Received Q'ty"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nhập nt" e="FC Received Amount"></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền nhập" e="Received Amount"></header>
    </field>
    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="SL xuất" e="Issued Q'ty"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền xuất nt" e="FC Issued Amount"></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền xuất" e="Issued Amount"></header>
    </field>

    <field name="ma_kho" width="100" aliasName="a">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_nx" width="100" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_vv" width="100" aliasName="a">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="250" external="true" aliasName="b">
      <header v="Tên khách" e="Customer Name"></header>
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
      <field name="dien_giai"/>

      <field name="gia_nt"/>
      <field name="gia"/>

      <field name="sl_nhap"/>
      <field name="tien_nt_n"/>
      <field name="tien_nhap"/>
      <field name="sl_xuat"/>
      <field name="tien_nt_x"/>
      <field name="tien_xuat"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="ma_vv"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9Mt49+c+TiQJAv0VuuergNy1DWtyAxKShMywzfXoR6bAh38EOQUnZhs6z2sfXne+HSVB0HuZBgx9PTIG+C/lO6yzlhnuIlGqUuTYfj+i3n7XxIeP2kFqicHfRoDYEwExu0mawriy8G7Pq9A6+oItHKZrbKSX9UC6KaEyUHre+ifXvYy6ZzJVHJU28u0CqKSLImboxp+OZBqk1FfYvQcawCL0mq1fha6Pd0IuGMTHG4yzQa4JyRgs1jkFa2i17raXS/ArMcXvjVDjh6dH3MHwKQL2ClqFqk6YjLM46QX4GcAp</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>0K78trbV+RfjRUUZA3MXNxGqNFaUcPj1SFYE5dWjcy4pgFf1Qleniq6CztKK41aa6MomRdu8uWHDYOEvRfiM/2vHU6w7rxB0MhDSwPWQD1D/QDFGuqzKipeJS0UUWbawwUwWmd4R2skbf8O7xdG0h5lr/bB3xWtVXR5ee7o1QdUTGoHoAyyjNnviPS/0LT7dHdocYTAe8fj3g6legWPUOfxrBd9tyPKJx4DFZUgDCUTVLGjhTu/Q7Kakyiqaf4hobhRWvaQxIzbxe4U/IQXmTUIpx2jw9qqY08mmgnomCzj6xWYRWFOtphVjYh0xYdUkTdoOEQuyg+ZcyD0Wl0LWryd8ztAlPsqXvmvkywkzK0mTYhAWsVByp0nL3ZSmNd0dZAoz6lTH9XxKApD42IOzZ39Nw3ICldygjmSlgvU7mmW5415Tm6qn06/nYVP5N/O+subQ56hNABZUPPXc3skWPA==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>ZrzwCUm+wTPWd/a2IlE3u9i7BZ70uzPI4eX2adBHiXaxZX0rE1E4SV5gXZQvo7ofIbn4TClcyHPSfl52JfX4jvePvmTIV8kovOOu/K/N/vtGIpa7Ivsawz8B5NOUV+Init8lo2Dl1hga7tr1H/2Mynn/ugs1NcsSwvgAnlxDkppg0bSmDG7NxdmqaF9tZPsX0wzBpHhDjlQUAdKOSAC57vP/chnYNIpOH8FufQNqu2hqjEbnvuWxtr46qNKLD4y0u0kHUc/WYxkbkcIDAcv8mk+pnFBJjgHUA1PSILx3tGSMrm4cLS25WajJoxE5SDK57GsAZYA3XcP7sEgDuGki0JK9fDNxcHw7pz+Wa4DBBG1H80QzP2PqAbUtCClh8yCK</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>
