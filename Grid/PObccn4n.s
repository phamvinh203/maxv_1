<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" code="ma_vt" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Sổ đối chiếu công nợ (nhiều nhà cung cấp)" e="Suppliers AR/AP Comparison Book"></title>
  <subTitle v="Tài khoản: %s, hóa đơn từ ngày %d1 đến ngày %d2..." e="Account: %s, Invoice Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Int16" readOnly="true" dataFormatString="# ###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'pobccn4ndetail', Controller: 'PObccn4n', Name: '[ma_kh]', Value: '[ma_kh] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="du_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Dư đầu nt" e="FC Opening Balance"></header>
    </field>
    <field name="nc_dk" type="Int16" readOnly="true" dataFormatString="#" width="80" allowSorting="true" allowFilter="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>
    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="du_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Dư cuối nt" e="FC Closing Balance"></header>
    </field>
    <field name="nc_ck" type="Int16" readOnly="true" dataFormatString="#" width="80" allowSorting="true" allowFilter="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>

    <field name="du_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Dư đầu" e="Opening Balance"></header>
    </field>
    <field name="nc_dk2" type="Int16" readOnly="true" dataFormatString="#" width="80" allowSorting="true" allowFilter="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>
    <field name="du_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Dư cuối" e="Closing Balance"></header>
    </field>
    <field name="nc_ck2" type="Int16" readOnly="true" dataFormatString="#" width="80" allowSorting="true" allowFilter="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>

    <field name="sysprint" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="stt"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>

      <field name="du_dk_nt"/>
      <field name="nc_dk"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="du_ck_nt"/>
      <field name="nc_ck"/>

      <field name="du_dk"/>
      <field name="nc_dk2"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="du_ck"/>
      <field name="nc_ck2"/>

      <field name="sysprint"/>
    </view>
  </views>

<commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kipSji91fjPcSMbqqKdAa4ut6fXHKYiqByGfJUR4VgtUBE1uHRqkNzfbGeLtA/2J0TQDFHUQctwLXrKPFy7kAQc=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3knOBAwn8fMi0bMmtdvgjFp7jfEnmGmtOuV5L/RwXFESXOIwklgKEeySoYD+tlQ6Zc/5DSkJH9tDENrnnyTrRnXJA3y6kdW5Ev1l+xg74WuAT</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjqN8AscshQnVlzdQ7G/9mra8xXWGNroGBZuBhQQ6PM1aFnWcowcCRBXs2xohkf0RqfiwT8oik3HQqc0MLFTTTU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>

      <![CDATA[<encrypted>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</encrypted>]]>
    </text>
  </script>

  <response>
     <action id="Print1">
      <text>
        <![CDATA[<encrypted>kof4M2uYBMWxyUkTrAcAtj9fk2jqQWbG8rzoAbIPqyW9P/sL+mxRaGKN0XSNJPxRvjMQVW3UX8SZC9cHwmoNNwe1qaEYrCyTrumDEE4FcGGY3PJEYtS+Ezn7iYhCuk3hi7XJ3/Im4HT6amD7atwTcQtOIW3XbXeElU1tAKuG3BneM/zg3/9VJfDkzaIaaYqdWdmCJxJwy6FwB3cKsujicOeU4LnK0vcifmOoRt9xs7I2hnhUxh97+lWMCDlJpKvYZDgo7rxqlc0tBQ6v0eY+Xz5Jdv5C/K//kFjU0pJ2rRSjLBsdLQaPbYWyWKhPXEwv9yk7OHrqNvDol8sWQjf/Tw==</encrypted>]]>
      </text>
    </action>
  </response>

  &XMLStandardReportToolbar;
</grid>