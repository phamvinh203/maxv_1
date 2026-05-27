<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Sổ tổng hợp chữ T lên cho nhiều tài khoản" e="Accounts T-form Summary"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="tk" width="100" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'glnkc4n_detail', Controller: 'GLnkc4n', Name: '[tk]', Value: '[tk] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>

    <field name="du_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true">
      <header v="Dư đầu kỳ nt" e="FC Opening Balance"></header>
    </field>
    <field name="nc_dk" type="Decimal" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>
    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh nợ nt" e="FC Debit Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh có nt" e="FC Credit Amount"></header>
    </field>
    <field name="du_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true">
      <header v="Dư cuối kỳ nt" e="FC Closing Balance"></header>
    </field>

    <field name="du_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true">
      <header v="Dư đầu kỳ" e="Opening Balance"></header>
    </field>
    <field name="nc_dk2" type="Decimal" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nợ/Có" e="Dr./Cr."></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh nợ" e="Debit Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true">
      <header v="Phát sinh có" e="Credit Amount"></header>
    </field>
    <field name="du_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true">
      <header v="Dư cuối kỳ" e="Closing Balance"></header>
    </field>
    <field name="nc_ck" type="Decimal" width="80" allowSorting="true" allowFilter="true" readOnly="true">
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
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="du_ck_nt"/>
      <field name="nc_dk2"/>

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
        <![CDATA[<encrypted>cUUV+FsL90wy7iPTIv6Pf43ZWM8wk6I/ZyFymGi7dHqtOr1VObTmtf08Hz8XGwn/utJ0sDhIBjeal1AwYo66Q81xhi8JZioDeGG8rF7rxK9FOqh5bJEs9DCNJLPJIb+i9SCrTiZAsf21xIMVM0hEfPnebbKe1zYaLLDV4LwroHbJQPPp+m7xM8RfJBBHr3F/81rqKiL5vJ8pQfKMP+QE3zRJ8ytFf56ee8DZHcuwe1ZfI6t1nCL6MvPZgrPT0Wfk5C7lnu3mW9zWUuNwzcI5B357+/33LoRAArnyeK4dRxcnFdKRdDQ/MuGG8YC4R3DfNJAPC2dcSyr2YfKQUpv20Q==</encrypted>]]>
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