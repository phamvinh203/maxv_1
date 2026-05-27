<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" code="ma_vt" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Thẻ kho/Sổ chi tiết (nhiều vật tư)" e="Stock Card for Items"></title>
  <subTitle v="Kho: %s1 - %s2, từ ngày %d1 đến ngày %d2..." e="Site: %s1 - %s2, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>

    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'inbctk1ndetail', Controller: 'INbctk1n', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="60" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="ton_dau" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="true" readOnly="true">
      <header v="Tồn đầu" e="Opening Q'ty"></header>
    </field>
    <field name="du_dau_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" aggregate="Sum" allowFilter="true" readOnly="true">
      <header v="Dư đầu nt" e="FC Opening Amount"></header>
    </field>
    <field name="du_dau" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" aggregate="Sum" allowFilter="true" readOnly="true">
      <header v="Dư đầu" e="Opening Amount"></header>
    </field>

    <field name="sl_nhap" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="SL nhập" e="Receive Q'ty"></header>
    </field>
    <field name="tien_nt_n" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tiền nhập nt" e="FC Receive Amount"></header>
    </field>
    <field name="tien_nhap" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tiền nhập" e="Receive Amount"></header>
    </field>

    <field name="sl_xuat" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="SL xuất" e="Issue Q'ty"></header>
    </field>
    <field name="tien_nt_x" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tiền xuất nt" e="FC Issue Amount"></header>
    </field>
    <field name="tien_xuat" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tiền xuất" e="Issue Amount"></header>
    </field>

    <field name="ton_cuoi" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tồn cuối" e="Closing Q'ty"></header>
    </field>
    <field name="du_cuoi_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Dư cuối nt" e="FC Closing Amount"></header>
    </field>
    <field name="du_cuoi" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Dư cuối" e="Closing Amount"></header>
    </field>

    <field name="sysprint" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>

      <field name="ton_dau"/>
      <field name="du_dau_nt"/>
      <field name="du_dau"/>

      <field name="sl_nhap"/>
      <field name="tien_nt_n"/>
      <field name="tien_nhap"/>

      <field name="sl_xuat"/>
      <field name="tien_nt_x"/>
      <field name="tien_xuat"/>

      <field name="ton_cuoi"/>
      <field name="du_cuoi_nt"/>
      <field name="du_cuoi"/>

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
        <![CDATA[<encrypted>kof4M2uYBMWxyUkTrAcAtmsv1n6f7GK4G1CTcLHL9mpm9f+sPxSaFtb0zTnSUlnHkBuLd7Yj6q85axai9gHk5pDBe3RWedm1FkvWdus4+8sXOcyw4FRFGm1nadaivVaT/eCYAFk4caEs4oH4R/YFu7nFjCwQqjEeC6+5g28uCVn69t04Ol43+CUFbnZWP5Vd21EmjNsgFHvjvIe6KWGAAh8IKT8mlDdFvRg7Q6z2iqOX8zgny5gpVZ+hMhf06oc1cF+wLOm7r7Sw4zm2swLyhJO6EoUNWcBd97kJYAxYtO52I4L3nEhci62nze5wq6BOMaQJyz7u86KWHlbKzNqbmA==</encrypted>]]>
      </text>
    </action>
  </response>

  &XMLStandardReportToolbar;
</grid>