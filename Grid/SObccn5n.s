<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" code="ma_vt" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng xác nhận công nợ lên cho nhiều khách hàng" e="Customers AR/AP Confirmation Sheet"></title>
  <subTitle v="Tài khoản: %s, hóa đơn từ ngày %d1 đến ngày %d2..." e="Account: %s, Invoice Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Int16" readOnly="true" dataFormatString="# ###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'SObccn5nDetail', Controller: 'SObccn5n', Name: '[ma_kh]', Value: '[ma_kh] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Khách hàng" e="Customer ID"></header>
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
	<field name="systotal" hidden="true">
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
	  <field name="systotal"/>
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
        <![CDATA[<encrypted>Bh8Vj7RBck/iHxG5rQhVhIFkQwEiOavK0j7wYf8oDb1a7HXDhr+M+X04s+O/Q2fZSJO0xzzXdnb6raPX/6Ni0BHzWLFALXu7rZg1h6wnN9J9dhxe6njM2hTWlmQ14XXlTddIC/yK29A0nJ9+Zc3e1PosMSi6FbxUFmItlgNq8co0KJvCzZJZ5NFJ//JYfVlG2YtenOnSKUUIUGmFJW20kkV+xE55ADMzfrbnDITWXy1nugBRU6n4iBlJUOmhxLOKO5sxLVa3rtZmCAUIuygr8A==</encrypted>]]>
      </text>
    </action>
  </response>

  &XMLStandardReportToolbar;
</grid>