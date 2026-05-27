<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Sổ chi tiết lên cho nhiều tài khoản" e="Accounts Activity"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="tk" width="110" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'GLnkc3n_Detail', Controller: 'GLnkc3n', Name: '[tk]', Value: '[tk] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>

    <field name="du_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Dư đầu kỳ nt" e="FC Opening Balance"></header>
    </field>
    <field name="nc_dk" type = "Int32" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>
    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="du_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Dư cuối kỳ nt" e="FC Closing Balance"></header>
    </field>
    <field name="nc_ck" type = "Int32" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>

    <field name="du_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Dư đầu kỳ" e="Opening Balance"></header>
    </field>
    <field name="nc_dk2" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>
    <field name="du_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Dư cuối kỳ" e="Closing Balance"></header>
    </field>
    <field name="nc_ck2" width="80" allowSorting="true" allowFilter="true" readOnly="true">
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
      <field name="tk"/>
      <field name="ten_tk%l"/>

      <field name="du_dk_nt"/>
      <field name="nc_dk2"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="du_ck_nt"/>
      <field name="nc_ck2"/>

      <field name="du_dk"/>
      <field name="nc_dk"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="du_ck"/>
      <field name="nc_ck"/>

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
      <!--&JavascriptReportInit;-->
      <![CDATA[<encrypted>MF6sTq0brlU5W1yTrKArH24gyVbdPl32aB3uLtqPxSkeP4vSBz3+BC8E+pTA3FcYFnaL9dXJYoPE7LrROGo+0u8HjusJElzcJqKZ6B5GYMF+YsBmKoOaS+in96HamIjO1lvsxm73ua/tr6KRuAKNyl/VRTkKCps4Ldlv11Un7XTezfkH7sHkIJTDw3MmQcol4lD2FlJTvqB1EgLhXfgXEzkPA9X+dTmZDVajifvn2sEiEVt1vv/e1cucwXC9knWNHMt936Ibd4esuP/2w8U2+cfoEp22Gc1iBEXu/QpFoVt9zutPBwzjI0TU8JRNVmCdjB8yNgVga33sKmApRdxeHiGag0YhqjFnqgbZjyzd/XRLgnGlQk/GGKPMO9UykmRHMLC0IRV8DSRHJtLcjHww6veFk2skSI1StLGBcJ5E1OFitNRy95ZAsytNwuqNTWw2LBk+iPaxHFU2JXpOGfOq+1xKMh4PVCZOIeko6LPqiWlWnJBt8aYTFthA6c8Tx6Ec6BUafyIvdsN5LXKM76luVmy6lQ/1IRA9dSTDpe/eSsaTyFUFx1dpcYNHA6mrReOrPxLyEx3nzq93ut9w0EJVABnEf+hCsgsX649ebF0mMUODkYC81n3Gvz01XlmxKGFcSAHqPzeCozj6FZxdD2hIWE1WWDaP/BbStExX+0c+xc5743n/z/wQ/TsPCKfUzO+6ddYU4m6rPfQwJSXfk4vb/blimA9t0buj9uw1eV0dyN5rgyBFDmjMbizAHYimn29p7tuVnp/lzKQKwAY2xUL7XGNAYniLsX6+d5qCMrgsGzJZtdT59lkf72Z3WoxZqVb+59qcbkb6v5SwirbOS+8OutMpxAJBgSvGCoBHD/Gyo4MnHdIlH4qyESffs1C4I0EPMSlUG1dsw/n5ym4/g0glkF0yELDFj/exBX82516uMjkRIp4HE5ZiHkIvKA406bio68vulSuPXJf2V23M7Hv6/IWFdpixsmyHyi8Z7eUVhL1ZXo7cCtGNgm3KF0zQ2lZHHN3O8+2ZFgGWLEz77BpztTwPLhB0gnw1whFKnt5nj1tX7RZar7clYB/HwT7v3oPCSEVBdVZkhNzZYA97N/aB9tbcT+WU6Y8Ej/R0Gg1q1WEiwNmhatP5sc62Aq5nzZsIDkEeTPR37fGagsIW6EncK37hiCSaFaHkp8204twD/lBAXGMamBPBs2J3uuxvs7Vi</encrypted>]]>
    </text>
  </script>

  <response>
     <action id="Print1">
      <text>
        <![CDATA[<encrypted>cUUV+FsL90wy7iPTIv6Pf43ZWM8wk6I/ZyFymGi7dHqtOr1VObTmtf08Hz8XGwn/utJ0sDhIBjeal1AwYo66Q81xhi8JZioDeGG8rF7rxK9FOqh5bJEs9DCNJLPJIb+i9SCrTiZAsf21xIMVM0hEfGVrX8fwFBiHj/r/IjvLm7FhB78CZeS2vndrBqkTsvHYbS6icGXrwMtBaH+MOp3ZetdHezE/anxG1a/DjlYfKR3rdE64/YISJcwAj6ef/3+sp9GO7bXl7afatDnQWyFbv3GtLgSfPPmE0Klyc2P4b4ogx2oVnlwC/doSYm+t5H3aH6aGQPtlDtKEer4uXnu3dw==</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
  &XMLStandardReportToolbar;
</grid>