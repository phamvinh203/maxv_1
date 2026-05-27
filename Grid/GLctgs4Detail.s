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
declare @so_ctgs varchar(128), @tk_du varchar(128), @ngay_ctgs varchar(10), @tu_ngay smalldatetime, @den_ngay smalldatetime, @ma_dvcs varchar(8000), @tk varchar(128), @ma_bc varchar(32)
select @so_ctgs = data from #t where id = 1
select @tk_du = data from #t where id = 2
select @ngay_ctgs = data from #t where id = 3
select @tu_ngay = data from #t where id = 4
select @den_ngay = data from #t where id = 5
select @ma_dvcs = data from #t where id = 6
select @tk = data from #t where id = 7
select @ma_bc = data from #t where id = 8
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng tổng hợp chứng từ gốc của chứng từ ghi sổ" e="List of Original Document Recorded"></title>
  <subTitle v="Số: %c, tài khoản nợ/có: %tk/%s..." e="Journal Vouchers: %c, Dr/Cr Account: %tk/%s..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90">
      <header v="Ngày hạch toán" e="VC Date"></header>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC Code"></header>
    </field>
    <field name="so_ct" width="90" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>
    <field name="ma_kh" width="100" aliasName ="a">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" aliasName ="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk" width="100" aliasName ="a">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du" width="100">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>
    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh nợ nt" e="FC Dr. Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Phát sinh có nt" e="FC Cr. Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh nợ" e="Dr. Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Phát sinh có" e="Cr. Amount"></header>
    </field>
    <field name="ma_vv" width="100">
      <header v="Dự án" e="Project"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_dk" width="0" hidden="true">
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

      <field name="stt_rec"/>
      <field name="line_nbr"/>
      <field name="nh_dk"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7XEPSEPpT/ZmHD8iTuD7mhDsyEgeZLYT+AEx8+2zcYICHSy2sdwYnma3cLO7bmXKk/mppRIXAxO0MUx3RC4B2KlmVLHyy1zAJgPYgEyWvQCmK6p7POQFkSzRG6VLHgdjF/HEsrsqQWMjN7b3X3uJWiI=</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>

        &QueryString;

        <![CDATA[<encrypted>t96vpdec/O/MTVnSiSTPdBjPGCe3fCCadSKxhhEpcPp11tVYj6Jibh4y4qT13bQnBfyl/MKQChFIPHGG465K+XLjduncFLGU0S27/aIqI71Xz9mihSYLixw4q1j3JhZQrWvO3gv/QCWSNij5DbL5jetpaITiq+pRGqqPf7ozuv78aiKYtpB0ErHg/WZPeBUyIphWizwjXVW+cqO00XS9u1uKUgPciCML9vjT4Xoso2hdqi1FTVjmbOaXNv0MhRlTFtNEtM8gLwaFNOMDuLQM5Md/VisKFdenws3lBaQqPi5VI9emgJS42pcK7c6O+hISiXBdksNHF6XghGXhUPmLFr8BkDIaN+ZNUm8T3ruPuiJiPglV3F2MNtuYnG67/oHldWikrv8lP3GbYA9poAwt5AlOpZ+/ZcQevpJ64z666c8ctmiEZJdN6nE2acw+qLf+lw89aNyV74gOtdYX9FxuuA==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>

      &JavascriptReportInit;
      <![CDATA[<encrypted>KB+oUH/J5wcdTGyrDt+59l9m4eB9UQdmrvqT4cTjmuw8mB3lR2aoY5UYPkEthyzH/G5GD8wDEEzLMFUOFk/WMEmX2XrkEPVfUGmuxPpcO2MrIix+ajwhVD/yghuCXI91pv70nxLYuips/mp7Y8ErZDF/HUeyHbDQGwvr8G5ECCDSqnk+kyGaT5x+CnjXVDv6s7ViRPiX2k0ZbMHOvvum/SFuo1K247T6ytzLSP7lQgzbTW4hZKIg67ElApFrmzr735SxDg7Dhu7XeYNTXCIPo8qSVqJ4OiADR2TsYf9uDxU=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
