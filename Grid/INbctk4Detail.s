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
declare @item varchar(128), @ma_vi_tri varchar(128), @dFrom smalldatetime, @dTo smalldatetime, @unit varchar(8000), @site varchar(128),
@form varchar(32), @type varchar(1), @data tinyint;
select @item = replace(data, @d, '''') from #t where id = 1
select @site = replace(data, @d, '''') from #t where id = 2
select @ma_vi_tri = replace(data, @d, '''') from #t where id = 3
select @dFrom = data from #t where id = 4
select @dTo = data from #t where id = 5
select @unit = replace(data, @d, '''') from #t where id = 6
select @data = data from #t where id = 7
select @type = data from #t where id = 8
select @form = data from #t where id = 9
drop table #t">
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chi tiết phát sinh" e="Detail of Amount Incurred"></title>
  <subTitle v="Vật tư: %c - %p, từ ngày %d1 đến ngày %d2..." e="Item: %c - %p, Date from %d1 to %d2..."></subTitle>
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
    <field name="ma_nx" width="100" hidden="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="tk_du" width="100">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_kho" width="100">
      <header v="Kho hàng" e="Site"></header>
    </field>

    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat">
      <header v="Giá nt" e="FC Price"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aliasName="a">
      <header v="SL nhập" e="Received Qty"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền nhập nt" e="FC Receive Amount"></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền nhập" e="Receive Amount"></header>
    </field>
    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aliasName="a">
      <header v="SL xuất" e="Issued Qty"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat">
      <header v="Tiền xuất nt" e="FC Issued Amount"></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Tiền xuất" e="Issued Amount"></header>
    </field>

    <field name="ma_vv" width="100">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="300" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
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
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>
      <field name="dien_giai"/>
      <field name="ma_kho"/>

      <field name="sl_nhap"/>
      <field name="sl_xuat"/>

      <field name="gia_nt"/>
      <field name="tien_nt_n"/>
      <field name="tien_nt_x"/>

      <field name="gia"/>
      <field name="tien_nhap"/>
      <field name="tien_xuat"/>
	  
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
        <![CDATA[<encrypted>OypYpny3a5OvEDusy/KXMIcmPBJn+n4f7Fo8uMRUTjjQi038eU6TUFEjdJe+Q1QUQ2aZGJCc+Nil06QhHS7h+QnZxsL9pe1PsO0q27gnf/jpM33zGNnZee39XtrRN5HaO0VEf3OUFYTw14nShYlOJqsqMSz7No8SR8LBjkuSFO/rPH2Aj579D7B1DLytry3+jwOTpj7Z7N6iVZbZGeBW0rkVptSjiiqSNKpKP/rDS4a7KNkLZYaOjqyRDZZGTBo6G0TAMGXcPIMp7cJBSI0Yyw==</encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;

  </commands>


  <queries>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<encrypted>AFSc9TEh+Ryqcw4hrYc8cHYTfefY9PRqA/mHnvx/OuH9a1ShSIj7r5Z3L2j8HWv1J12r2hQgn1KyuHomDv0BIPwU09O7djC1CIqp0Bw07sXby6qcjPVQNdMgGClmq0Yz14GzMedSmSdKaEJzXhce/XTT+DCZW+S08e+bTX8NJJh509fnCfZNsAbXXVT21e8JkRufXyHxhGfQ6trzNh3sb3lkW59qbeHyPiM7Qcu/CQBWI7Y5ug4hJNLYj1N3vn+nHA1tqkWCuBFuXyo6O/CEgFbHT0DQ4XM6M0J28VEG/lfY9Q5tPf6f7v8B/teM48bc6wDGf+rpSufdgpxkzjMyjDCvcX5YUnfmNNyOOyELLgGTG121dEVwZxvVY26eqNh6vJvwVfRASSYleuwE67DBh0zxft47B2CdJRTqtfH8DQ/MjrfHgV3lIUwu5rLBhRnhDEFw7f90a4eajLrJURZPGw==</encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<encrypted>sjFMaypTqJnpZfBqXYLusRbnpNsq1mfmo/KdHo5nRoktdwvcw+hqnRERNiamEIxayAB/tc53lAIOiNIyFzpmGFrUh+nFMFvzVyUgLPwyicnEhFmvVdY4Z8R4vkywjH3KbtAwDf26sDhXu9yQGxoufRzQ2D4rS9LWLUh9azpcSJGTsHzLYET8YJUdA78m8mN6Hg8SI848dL/OJR9E3KyWRK5ZQxqE9seLr5VTad5t/+vOGi/Xr/SFhbSgtOA2h6+4NH2uZqLu+mrSNHi151mWEux+ZNb0J9LMpwMLdRZpymqoEHERYDvhBW6tTmAU4vgXH2pD1pixrPM7Wu+cqWa/CUstjGiPf9QajT077uuAj+WS3zZyLGiBAv6OMrMHGlrp</encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;
</grid>
