<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 0" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Sổ chi tiết của một tài khoản" e="Account Activity"></title>
  <subTitle v="Tài khoản: %s1, từ ngày %d1 đến ngày %d2." e="Account: %s1, Date from %d1 to %d2."></subTitle>

  <fields>
    <field name="ngay_ct" type="DateTime" width="90" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày hạch toán" e="VC. Date"></header>
    </field>
	<field name="ngay_lct" type="DateTime" width="90" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày chứng từ" e="VC. Created Date"></header>
    </field>
    <field name="ma_ct" width="50" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="280" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="280" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tk_du" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>
	
	<field name="ten_tk_du%l" width="200" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Debit"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Credit"></header>
    </field>
	
	<field name="no_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Nợ ck nt" e="FC Debit End"></header>
    </field>
    <field name="co_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Có ck nt" e="FC Credit End"></header>
    </field>

    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
    </field>

    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>
	
	<field name="no_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Nợ cuối kỳ" e="Debit End Amount"></header>
    </field>
    <field name="co_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Có cuối kỳ" e="Credit End Amount"></header>
    </field>

    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Dự án" e="Job"></header>
    </field>
    <field name="ma_ct0" width="" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="systotal" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="systotal"/>
	  <field name="ma_ct"/>
	  <field name="ngay_lct"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dien_giai"/>

      <field name="tk_du"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
	  <field name="no_ck_nt"/>
      <field name="co_ck_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="ps_no"/>
      <field name="ps_co"/>
	  <field name="no_ck"/>
      <field name="co_ck"/>

      <field name="ma_vv"/>
	  <field name="ten_tk_du%l"/>
      <field name="ma_ct0"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>

  <script>
    <text>
<![CDATA[<encrypted>y+jaaChMtw4mwnSnCwbdVH3q+5wV3v+XafRycwCQGgpOVZ8PBC8OKKJQHwFv9Zf/yEV9WXZVKxR7nDTtLQVrqOIdYt9lt4Z1MJhhD8L53f8aOSL9AajcqKuALXj7toVdxg0hAmm6+mRil6jCYPTbAPHWD1nDuVpbIpgzcJn7m/PZzxvoDHx+MNwE9fv9NqyJl5JaWqH2cmA2z9zOF/JUtYnL+pdYZxIBxJ0rPNWvLbYz40CEcPhR434PoJEdZEaRdJ8nc3QcnBrmGuks2ik9EQXTkGPp+DEMEj1DGVbVBdEfx1auGNVHY2tn4POEM6PVtvxDZuawz1MwTmwEhVnXWRMgHi1tOcrrDBKbDqcTDQF7GcBVQKqmij1Ziuj5nPxJfOqSWTw9yJv0j1CE3wT6JrChdAE4+Ge0UwV4e/P5HkHA+TkLk6ojeoPUp65SjXlm//bvzzQv09cHwpm7gZR7ot47FIitYnpWsCNKHRugTJ5Ac3Cl+vewNJ0XleC61DMJZeFpc1eDQmGlplPDqgmjOaUvEe4gzKlvYA3Wc9LyaYUduOxLmI+njsAlyRafXXC4grCmMQAz4hzlljaLnz0cWWZ/ZwJkPwRTG8wuqRkYXh27oIAR+/NoM5NB1TAmLWwH41gZkfi5BN/G2ZdXKId6WowdVvrt0c81hq4FSyjQItP6WFBgSeanC9wo3Plrq1ihHFZd/eL+qM2KGGMwj7JdnNW2mqfWQczm+lVtXOw2Hf0=</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
