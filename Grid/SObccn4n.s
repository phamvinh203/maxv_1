<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" code="ma_vt" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Sổ đối chiếu công nợ (nhiều khách hàng)" e="Customers AR/AP Comparison Book"></title>
  <subTitle v="Tài khoản: %s, hóa đơn từ ngày %d1 đến ngày %d2..." e="Account: %s, Invoice Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Int16" readOnly="true" dataFormatString="# ###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'SObccn4nDetail', Controller: 'SObccn4n', Name: '[ma_kh]', Value: '[ma_kh] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên khách" e="Customer Name"></header>
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

      <![CDATA[<encrypted>/y46pCoMQH3BojTbrrsxXOTKx3PKjfuzXe/GSqQWY1h54zpQy4TTfbKor0Z6F1GfY2V2NQf4Q82wd0sMtCIegOj1Rj1FEKY64SAhuX8tzYSBQ49rZe83trVGIhTxEkJnqBdzLQpvtZAgGq7BbpM0+OAS/3zzLlUFIwLLfL9LfjXiu+xNgXknIacCZGH1lpbkpzIemmx8IJDtZe+L7QAUfZ/oeVJKjJqN74sOVZAhuKzlZ7UegxS0l/u2LO4JRxpcPMMByplCesa1RmWHqdMQLWOoATYddfxHC/M1A8EccUIddVJQlmcoYw1LI3YuPzSADxQ+bc0SK2kZyV0PiRWS72p9FOlrKn189/v8ddPA14ZsYyr8RtGBvA89QklUNbDuCJbl8TF2WXvh8PeziLR9Y92uYa/7QXGY0GogcFlwgkVJhY6UglzIC8ojJ6ZO+NCXF8Y0xUE+2YyPlkkL3HOTWQhxKJjdXtJbcUrCycDq0xzcwI/y7XjIuuBPruTCX6uWVky1OQiA354Esph+fxxv/dTt/JlNqLuA78iICNqZaQRX/kzHo4hmanhsyEce4kbHK0w0y1IkBHkJpKRhfDj0X+8mxkcosmCmwJ4hlZapgQCiX5CvpqEGjonP9IG7LXDBQJnjgnU+U/9JPZ/K8KEb9ezJafywPmhTwVFu5i/6dxQD5Fv+o6JBuaITcqi7nqb/qPPNf7vruJCZnpQANqmlvrw9HdLaj2HfLN0C7TLxpStWh73crofccRfJsm712yuAuJ9GXh+iS1TjhVgh0B/2lvDh0Vty+bI8UIjKT29G9hyMoJMU+ddkK3fvn5HFU61KzarRPeKR6eL0Jav/rWIzieDGSR5ETnDCmNZBHbeTIIxZqaE1Djdc6TPkiVBJM6fUtxW7XmieylpExFr3tQ2iD2D0u9XBSrDUWDwPhnDE7eqrAWw9+1MeepQ8o+nrsCf4XkXR3BO3xwAm7GoTYjrlOa6u7Nyrp0FPDEX9VNxhNWKM5yAH30PU+NbGgRg5Ev3tMG2V/Fc2IfHdRcVr4OF+jCRTzAIRxAMhBdQual2EmDmBac02+ZoUeLpOTXaqyvnjF6DVMTndfNm57triFBdtGjxZBORgiH7kNkyfIhY/uvAJh/KDk8cCADKjoVmiD6xn6BulkDawxxzJCHlKEZiTplpdc8lYtcbDYuC0O0p0agwF7Ruw02s5BH4dIJ5wHtxb8/i4TjGwSjA128Afa3rl1s+lZVFpfavNL795a6ZOdFyUodIipjOF7LP81Ed9gKRHB2tAeXvnH4tk7iqmTlhXHrF5D0lxxTSfRjwERpefu0OolXuwBIXOVCw7BqpN0LBgbM3coKkLo4sTJh3xYb4c+/vt+F7fbUqgSOxE/1SzbvvEqI2ND75tfVsHRK1fmK2aNH3pzrVVjIKXG9G6ZFkuVFuBUqHnC/YGvFDWQsleODmZsEPFPtEwstzPZReljMtVEpPbH6QSvNoEDnMv37cHD/UdSZl+ZRdhKVO5+mC4YWU1I1wDF5LeqQrCfbYZ2HE9sqJHI3OwL9YzVyG2n4RVSEldTFRg2bIk4FgTkE2hf7CJkCmdbhk3BJbYD2lQjPJyRGvBCnBdyo29FuweDljNjJxADux0VGsPx0jCTz6l++aQmqyyJfsiVTymc2rE5imJM/dEoUg7shq/ahKOgk8cxLT9CSTH8P1qzYjPdtN2IsTscahcz+Hi2aMjK1zT3FkeWehF5lhM8GzFg/KEr+o8MLVrzYMO0EJRpK/Tx6IZtzUOqdb8Fqh2jDisAx6lonz4m3Ftuj8pufVHp708YzTd7nBK5hzbBhh1uQVdQJbiyunXKAUSSw5AftZLf1rfGskD</encrypted>]]>
      <!--&JavascriptReportInit;-->
      <![CDATA[<encrypted>MF6sTq0brlU5W1yTrKArH24gyVbdPl32aB3uLtqPxSkeP4vSBz3+BC8E+pTA3FcYFnaL9dXJYoPE7LrROGo+0u8HjusJElzcJqKZ6B5GYMF+YsBmKoOaS+in96HamIjO1lvsxm73ua/tr6KRuAKNyl/VRTkKCps4Ldlv11Un7XTezfkH7sHkIJTDw3MmQcol4lD2FlJTvqB1EgLhXfgXEzkPA9X+dTmZDVajifvn2sEiEVt1vv/e1cucwXC9knWNHMt936Ibd4esuP/2w8U2+cfoEp22Gc1iBEXu/QpFoVt9zutPBwzjI0TU8JRNVmCdjB8yNgVga33sKmApRdxeHiGag0YhqjFnqgbZjyzd/XRLgnGlQk/GGKPMO9UykmRHMLC0IRV8DSRHJtLcjHww6veFk2skSI1StLGBcJ5E1OFitNRy95ZAsytNwuqNTWw2LBk+iPaxHFU2JXpOGfOq+1xKMh4PVCZOIeko6LPqiWlWnJBt8aYTFthA6c8Tx6Ec6BUafyIvdsN5LXKM76luVmy6lQ/1IRA9dSTDpe/eSsaTyFUFx1dpcYNHA6mrReOrPxLyEx3nzq93ut9w0EJVABnEf+hCsgsX649ebF0mMUODkYC81n3Gvz01XlmxKGFcSAHqPzeCozj6FZxdD2hIWE1WWDaP/BbStExX+0c+xc5743n/z/wQ/TsPCKfUzO+6ddYU4m6rPfQwJSXfk4vb/blimA9t0buj9uw1eV0dyN5rgyBFDmjMbizAHYimn29p7tuVnp/lzKQKwAY2xUL7XGNAYniLsX6+d5qCMrgsGzJZtdT59lkf72Z3WoxZqVb+59qcbkb6v5SwirbOS+8OutMpxAJBgSvGCoBHD/Gyo4MnHdIlH4qyESffs1C4I0EPMSlUG1dsw/n5ym4/g0glkF0yELDFj/exBX82516uMjkRIp4HE5ZiHkIvKA406bio68vulSuPXJf2V23M7Hv6/IWFdpixsmyHyi8Z7eUVhL1ZXo7cCtGNgm3KF0zQ2lZHHN3O8+2ZFgGWLEz77BpztTwPLhB0gnw1whFKnt5nj1tX7RZar7clYB/HwT7v3oPCSEVBdVZkhNzZYA97N/aB9tbcT+WU6Y8Ej/R0Gg1q1WEiwNmhatP5sc62Aq5nzZsIDkEeTPR37fGagsIW6EncK37hiCSaFaHkp8204twD/lBAXGMamBPBs2J3uuxvs7Vi</encrypted>]]>
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