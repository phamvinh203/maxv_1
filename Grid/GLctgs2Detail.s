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
select @ngay_ctgs = data from #t where id = 2
select @tu_ngay = data from #t where id = 3
select @den_ngay = data from #t where id = 4
select @ma_dvcs = data from #t where id = 5
select @ma_bc = data from #t where id = 6
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, nh_dk" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng tổng hợp chứng từ gốc của chứng từ ghi sổ" e="List of Original Document Recorded"></title>
  <subTitle v="Số: %c..." e="Journal Vouchers: %c..."></subTitle>
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
    <field name="ten_kh%l" width="280" aliasName ="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk" width="100" aliasName ="a">
      <header v="Tài khoản nợ" e="Debit Account"></header>
    </field>
    <field name="tk_du" width="100">
      <header v="Tài khoản có" e="Credit Account"></header>
    </field>
    <field name="ps_no_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="ps_no" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat">
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
      <field name="ps_no"/>
      <field name="ma_vv"/>
      <field name="ma_bp"/>

      <field name="stt_rec"/>
      <field name="line_nbr"/>
      <field name="nh_dk"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kghJfbfFrO42rVLCg2xbX4wh+jMf7BC3drRz12KrnKwyp3mhcMLo0yfqHDtPTRwM+m97F9pkGZL6IWR1SaiWHn9EKCdrwAlwKWTVMabGElVZwOfB9fnutOqwvMHwYtpbk7zWW0pt34NF66VwahST2+A=</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <queries>
    <query event="Finding">
      <text>

        &QueryString;

        <![CDATA[<encrypted>QgWBKedxBcnp33dgbOzDaOXh/BToyAC/rZrT9sWzaVg9YAYNTmIbWSLvq4WEMHBZNzGK1PKQqh28Axo676crb27/7suX7yoiPR4uW2MgJvwbrG+7no/FE9ExD4T1TbDy+xwQGZbwI1P1aW1p2xNOdvG89tGi2t/DlYIAGbqkcrWXlA+dnAE7F6JqYQmdISBKZpHKg0gIcVZWaApHyAbkiC5v5s6zzM7XZrgpY5dk+8Z3tDbjQI0H29WszEblmS90BoGC3l8rz8RWIB1bHnlBfSBHWFTaGBV6K/aYdOlr+yAA7YfPybFraxGvdqSHbLjTFUQ8yEr1urhPFFTkfqvchbB872ZV3eK7Aod0mgXZjYS5aIsTU3hjjiuy84Xl/C8D1lRmrqh0cWN7uK92qL1DXHD5OufjodEs0T7JGRGv1EU=</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>PZMNGbWZTvKGtjjEQg9tqYiZ5Lqbv7UJ/dFN2LtinAIM7wKrqORgZlOakwIXcCn5lWcDEVjiCfdaOEmGENyBem+G06wR0wxJ4tZO4fnJgOnHGQHjlBGxVOMiRFsEsNuWCj3taE+Igab4rSg4oc4bJnMQE/Y+DuUnnACzmW3zmqvcXRhZLADQvapr+RBVGYGi3Q73lewJiKwk+3yx5DJKhv36cd8VDBd4EVJtESkENoPWuQPKkeFWqDDuv1dw8PCgB2EKSwtcYYkVmrg7WQY2IXRJq/2pXJpC2LSZmd0mUNo=</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
