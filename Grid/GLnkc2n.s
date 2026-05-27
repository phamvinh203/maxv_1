<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Sổ cái nhiều tài khoản" e="Accounts Ledger"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'GLnkc2n_Detail', Controller: 'GLnkc2n', Name: '[tk]', Value: '[tk] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>

    <field name="du_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Dư đầu kỳ nt" e="FC Opening Balance"></header>
    </field>
    <field name="nc_dk" type = "Int32" width="80" allowSorting="true" readOnly="true">
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
    <field name="nc_ck" type = "Int32" width="80" allowSorting="true" readOnly="true">
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
	<field name="systotal" type="Int32" hidden="true">
      <header v="" e=""></header>
    </field>
	
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="tk"/>
      <field name="ten_tk%l"/>

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
        <![CDATA[<encrypted>fjM2UCz7a248rAa7J1roduHtUGxIjlGXeRDkrsi2GrqWVb/1mHS+wUVc67nofszj9k4/53RzS86CWTia69kXKcrRVm9kxB71aomJxF+wPwIbxhduScZXwQHpeyvLn8HBGUKo2fcgFlVdKWWEYQz50SoFzjCgGADjmqsYzdwLT3qRc8Cgsctc6Tadt2h81pPKbVpHns7N9sOXEGLDT++j9K9jDJ22BOL5u4ueemWek05aAj238THHNrKOsBIye+/Zer9WiVs4uBLInUYAS/odZlth+YhkhZSUQx3D2qrFUEjVQl8mK1iGieuMUFgLmhXkluyfXfm9t3jvxrWw1ttLM8kioy8mfKsZo5gHHWVaAzg=</encrypted>]]>
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