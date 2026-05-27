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
declare @item varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @form varchar(32), @data varchar(1), @type varchar(1), @ma_kho varchar(128), @groupby varchar(128)
select @item = replace(data, @d, '''') from #t where id = 1
select @dFrom = data from #t where id = 2
select @dTo = data from #t where id = 3
select @unit = replace(data, @d, '''') from #t where id = 4
select @form = data from #t where id = 5
select @data = data from #t where id = 6
select @type = data from #t where id = 7
select @groupby = data from #t where id = 8
select @ma_kho = data from #t where id = 9
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết nhập xuất vật tư trong kỳ" e="Stock Movement"></title>
  <subTitle v="Vật tư: %c, từ ngày %d1 đến ngày %d2..." e="Item: %c, Date from %d1 to %d2..."></subTitle>
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
	<field name="dien_giai" width="250">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_nx" width="100" hidden="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
	<field name="tk_du" width="100">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_kho" width="100">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="SL nhập" e="Received Q'ty"></header>
    </field>
    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat">
      <header v="SL xuất" e="Issued Q'ty"></header>
    </field>

    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nhập nt" e="FC Receive Amt."></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền xuất nt" e="FC Issued Amt."></header>
    </field>

    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền nhập" e="Receive Amt."></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền xuất" e="Issued Amt."></header>
    </field>

    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="300" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
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
	  <field name="dien_giai"/>
      <field name="sl_nhap"/>
      <field name="sl_xuat"/>

      <field name="gia_nt"/>
      <field name="tien_nt_n"/>
      <field name="tien_nt_x"/>

      <field name="gia"/>
      <field name="tien_nhap"/>
      <field name="tien_xuat"/>
	  
	  <field name="ma_kho"/>
      <field name="ma_nx"/>
	  <field name="tk_du"/>
	  
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>

      <field name="ma_vv"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>DZdNczswdDOSj8KzbhDu9Crrqt4MlBCpUsG6XyuHG698i+5hVX+rjDRF5cwSfipw08UmksubdQ1Ope43OL8oAmlTOF6L+n+ZNl5wUuYCRO3s/xw6g/Iwia4tywv8Df/utCRB4fwR6gKFaLwrKwJiVt9kE8DL2STJQbpJCJYLChURDnqj96Dnf2kVngn9d1wkO6ZgfMBu13r/65Bfo+aYQAKRe4qjL2VbqGcqgl2ikfDSJmCtJfoRXcPRBd80IRx/R7yOmBl3EpEYvx7q7ZTWEd6mmPvgYAWhP4ZdY/qL/M7TAVyzHssTsyq0rnTZd+IpJKMMAKSZZyu5/9wydpwHVQ==</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>ME6Kszu5VnYBv+wSHkimg+ME5qxrWo0HfK63ctOwZqP+3RNmi6XHF5s4/ZCHPauSLPrZfLZeWmEdwJT6BCC7cmsG0ZFFiVve7Mn6aESGxjptylNP4ZpzQ2GQ4f7TbAqPaSSzMVwYrcAerObqRmk4JOkRZ5RjbQkZLWvgZ+GY2mdapPhMgN55nJ+ex1sEtJfRVW8u/9XeToE6e/DWKaL1YPVwQrCG/SZg2LN2MGK9d5rK9qg0G/iGtiv9+CedijWTmBTXtpwxqMt8/S/IEn3SsHxkDf5QEWhUWkFARBiNX3UP3I4p7m+ojP0MotjwQSU72sCo3fzpi+ggj7By4EARJifGUSd3NVljnPjZEj5ApadXNwUZ/Jh4vkic676jMWR+ALgia/pBXXdPuGxfuOdPPjZdQwgpK3PETiomZPiHHs2k/Rk3dUGr9EKdFvS8pnsy5VD3mK/ygehmlQOfPQ6ld88ioB7LDWXNA/dpLdBTdjcPQgU1hg4fyXaJeNcOFDoI</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>9cvVjARAXpuFnvGAaGQrLDSpYdEKM6/lkZJpE1k8g0bKs+jtStWaolWEw61tzvb2DuRBmKPPAqmg2GfHBoEntWvbunWgmodLs6WWs972AhmWRhvm2aq1bu4/wKBqbZnq/AopKOOruOrX9UDCHx9LzTL8TWntSsbvzMUBlmUvRfuOauDt2gmd3nkGIC1VuDuuwludW6gPp72OI1CRBhRt+rfvIPCmvqVpiTm5lsUDblaS2jPiEugm0/D/J4t0gI+r7GDwp5qzLn8uoseizDYc/0JWbRl5QpDn1tNn/KLkm5mDMTk+Dc2B7Ap5DHh0rz94t8/aaKyidKTzyQ/cOjHU/KqSvLxyR8XrAFEznW3LCWM=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
