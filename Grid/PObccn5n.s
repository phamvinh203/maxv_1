<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" code="ma_vt" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng xác nhận công nợ (nhiều nhà cung cấp)" e="Suppliers AR/AP Confirmation Sheet"></title>
  <subTitle v="Tài khoản: %s, hóa đơn từ ngày %d1 đến ngày %d2..." e="Account: %s, Invoice Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Int16" readOnly="true" dataFormatString="# ###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'SObccn5ndetail', Controller: 'PObccn5n', Name: '[ma_kh]', Value: '[ma_kh] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
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
      <!--&JavascriptReportInit;-->
      <![CDATA[<encrypted>MF6sTq0brlU5W1yTrKArH24gyVbdPl32aB3uLtqPxSkeP4vSBz3+BC8E+pTA3FcYFnaL9dXJYoPE7LrROGo+0u8HjusJElzcJqKZ6B5GYMF+YsBmKoOaS+in96HamIjO1lvsxm73ua/tr6KRuAKNyl/VRTkKCps4Ldlv11Un7XTezfkH7sHkIJTDw3MmQcol4lD2FlJTvqB1EgLhXfgXEzkPA9X+dTmZDVajifvn2sEiEVt1vv/e1cucwXC9knWNHMt936Ibd4esuP/2w8U2+cfoEp22Gc1iBEXu/QpFoVt9zutPBwzjI0TU8JRNVmCdjB8yNgVga33sKmApRdxeHiGag0YhqjFnqgbZjyzd/XRLgnGlQk/GGKPMO9UykmRHMLC0IRV8DSRHJtLcjHww6veFk2skSI1StLGBcJ5E1OFitNRy95ZAsytNwuqNTWw2LBk+iPaxHFU2JXpOGfOq+1xKMh4PVCZOIeko6LPqiWlWnJBt8aYTFthA6c8Tx6Ec6BUafyIvdsN5LXKM76luVmy6lQ/1IRA9dSTDpe/eSsaTyFUFx1dpcYNHA6mrReOrPxLyEx3nzq93ut9w0EJVABnEf+hCsgsX649ebF0mMUODkYC81n3Gvz01XlmxKGFcSAHqPzeCozj6FZxdD2hIWE1WWDaP/BbStExX+0c+xc5743n/z/wQ/TsPCKfUzO+6ddYU4m6rPfQwJSXfk4vb/blimA9t0buj9uw1eV0dyN5rgyBFDmjMbizAHYimn29p7tuVnp/lzKQKwAY2xUL7XGNAYniLsX6+d5qCMrgsGzJZtdT59lkf72Z3WoxZqVb+59qcbkb6v5SwirbOS+8OutMpxAJBgSvGCoBHD/Gyo4MnHdIlH4qyESffs1C4I0EPMSlUG1dsw/n5ym4/g0glkF0yELDFj/exBX82516uMjkRIp4HE5ZiHkIvKA406bio68vulSuPXJf2V23M7Hv6/IWFdpixsmyHyi8Z7eUVhL1ZXo7cCtGNgm3KF0zQ2lZHHN3O8+2ZFgGWLEz77BpztTwPLhB0gnw1whFKnt5nj1tX7RZar7clYB/HwT7v3oPCSEVBdVZkhNzZYA97N/aB9tbcT+WU6Y8Ej/R0Gg1q1WEiwNmhatP5sc62Aq5nzZsIDkEeTPR37fGagsIW6EncK37hiCSaFaHkp8204twD/lBAXGMamBPBs2J3uuxvs7Vi</encrypted>]]>
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