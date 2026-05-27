<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" code="stt_rec" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Hóa đơn dịch vụ" e="Service Invoice"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày hạch toán" e="Date"></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" width="90" align="right" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" external="true" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" readOnly="true" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
	<field name="dien_giai" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_nk" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Quyển chứng từ" e="Voucher book"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
	  <field name="ma_nk"/>
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
	  <field name="dien_giai"/>
      <field name="t_tt_nt"/>
      <field name="ma_nt"/>
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

      <![CDATA[<encrypted>MxCYWISyP6y4QotIhU9HIjKILW7wulVKjV2uQ7l9+IZOsKZqQ4FodiPy1+6bUD/hZo8WHLDjhXbVT8uecRAVggaMvYPtHogNT76QG5HcnRI2PnLQpUmcnfUK1IzJ3QrBbAIn45v9CbtwmyVFqnlshWGS1OtTrKXM7DGVOvNL0U4Xjm8sgvwqfnWOq8GEyplG8qrAiXvhPTPuxC8h2WWj0uqGgGGvNB7WbMFHDKWJX3yvGMLUpCE7Xc0OhutUZCuh8CC57OFz2NuqhkPonsau6k0w0cR3BeXT/IEOlEBxfVOp/Pfrz3/0YohcnC7MTx3ohsANtfSYcKBTh4jVHw8E6moUynf0p4+BTq+HdgXNOqlVZmuTvCoq4hcYSir8OLOEpHz7c0WUICunVkTMoRUan7ELtzQOfzsJ0KVJcwkZ50qDnijdPN5svWOrBXcuTdNIl04mVLW6yxYJ36rZeo5JLsmcBkSJ3tx5S+E78cMhvVdnFrxR+0j3TTXsfkXd3kjjii1VPmfFsorvwx1y0u7gBeOsYCEmw+93yEES7PaD86xjZ7HNg1JMzL/BhCSRNnMYyden4w5tzOvK7cICyevDDW+lZkmAUUODbYzj2+ym1EFXwm9TD2HzH7cpk37Isc56Ce0S5+oEnDqIiiRh5zDhExDPlkRLdR38cpOozQFpqYyQd8jMO1T41+OI5QRoG6kOVqS972f8m/wnnFHvhzr82WURfxs21Tsx7x+jmjwipJkstOfPKj7PzjjahRkHNn1lAqiOuv+CUAfgEzcaPn5x+nhJmaDx496zjYlOVtOoxiJ9NFdxwwuUnYQYqBWj1LS5ITtdCXs+MSKCQ5HupZlq4rp3Lzcc2e9uanmCmi4MyLuJTOAi/Tm4YoQ3X9qCydFhtDyQ+gL1HR7gC2WbAY4HSmNoDP5MnqcauyCQS+yUbcsQj/vZv8rW3i64Omt+9+0UaUAWteCaDp8tPRklZfs6kDzXbcSPSi576hEzStpYsRSxnFm/hU61HbHIZx1bXvC5sMtEzPa7b1DcIeWY5LPB7QqKQvD/EDgbr2MqxG+d3ly6uFqm0GGLjcvbTgOrgVrTr6ateG81NzKnkjw3OpWVTGepBeW0jTLDeWd2+NeiEEz7fPkMqoKUVtJjI6bwrxZpbFry62Dtm/Fxq+XtBOKRLeCIQzXIckRM3+N9Hjhfh//UgqVcIXGzMOMqSuMooiI2wX2P4QQVE8d7l0ku33RdSvzKpHYlxs5MFv+ItWHbOjfhTApA0Fb+kE/hXMwKPwXdUuzmAUtvVCX5ZQ3AHkhBXipf0Aq7ud9XBulGZPbdTjXw+SFL/s/SV0s0Y63JOskR7BivTiGOGDwVl0xqEvEHBZhyrN9FU8DOj432Yn+sgOIYe0Wy0UcxtwrbukGJLHOphZsxYflJe/FBuP7jZNlQoIk6BaO/KAcZkXEB/s7PrzmcYQyMpMBq+D+iqjlOXGnfFQNbpKGKLtsb6upvBBIy/CD6cRz6/uBu87mo/8DFx5Fv8QDlx0s0mdRN04l2MsyKMvQEaJ48gqZX4HQSogqxgcQe8hQPOZJK0GDcrjcQhzE82utE4JHo6Ou+tYVXEfmenN13JqjJW+03HG9CLgEz4PWMhYvmDEww870McQ571hJ8KiKIDN0wLBwBh57l1FKCiOPz3ZnFPoqhD5ourWp7sbpbBkarax6FNJWL/k+s47B8Xz20S8zuXi8ZCgK3pJ2OCfkNPxFFcbVMQeK1A077U87gJn6K6+RhnF6mA5kXucpLVQC4bXqEDS1BOeOig5WCP8XNKccF4XVRLtCPzgSTxWBzBWukmPYzYRNTSb1w5y1f+dB6UCZ5wKzVBkVSCsdWXLzoONlhBkwbyFsTeXngR3iKlLbH3QJvhG2EGebV4tU=</encrypted>]]>
      <!--&JavascriptReportInit;-->
      <![CDATA[<encrypted>MF6sTq0brlU5W1yTrKArH24gyVbdPl32aB3uLtqPxSkeP4vSBz3+BC8E+pTA3FcYFnaL9dXJYoPE7LrROGo+0u8HjusJElzcJqKZ6B5GYMF+YsBmKoOaS+in96HamIjO1lvsxm73ua/tr6KRuAKNyl/VRTkKCps4Ldlv11Un7XTezfkH7sHkIJTDw3MmQcol4lD2FlJTvqB1EgLhXfgXEzkPA9X+dTmZDVajifvn2sEiEVt1vv/e1cucwXC9knWNHMt936Ibd4esuP/2w8U2+cfoEp22Gc1iBEXu/QpFoVt9zutPBwzjI0TU8JRNVmCdjB8yNgVga33sKmApRdxeHiGag0YhqjFnqgbZjyzd/XRLgnGlQk/GGKPMO9UykmRHMLC0IRV8DSRHJtLcjHww6veFk2skSI1StLGBcJ5E1OFitNRy95ZAsytNwuqNTWw2LBk+iPaxHFU2JXpOGfOq+1xKMh4PVCZOIeko6LPqiWlWnJBt8aYTFthA6c8Tx6Ec6BUafyIvdsN5LXKM76luVmy6lQ/1IRA9dSTDpe/eSsaTyFUFx1dpcYNHA6mrReOrPxLyEx3nzq93ut9w0EJVABnEf+hCsgsX649ebF0mMUODkYC81n3Gvz01XlmxKGFcSAHqPzeCozj6FZxdD2hIWE1WWDaP/BbStExX+0c+xc5743n/z/wQ/TsPCKfUzO+6ddYU4m6rPfQwJSXfk4vb/blimA9t0buj9uw1eV0dyN5rgyBFDmjMbizAHYimn29p7tuVnp/lzKQKwAY2xUL7XGNAYniLsX6+d5qCMrgsGzJZtdT59lkf72Z3WoxZqVb+59qcbkb6v5SwirbOS+8OutMpxAJBgSvGCoBHD/Gyo4MnHdIlH4qyESffs1C4I0EPMSlUG1dsw/n5ym4/g0glkF0yELDFj/exBX82516uMjkRIp4HE5ZiHkIvKA406bio68vulSuPXJf2V23M7Hv6/IWFdpixsmyHyi8Z7eUVhL1ZXo7cCtGNgm3KF0zQ2lZHHN3O8+2ZFgGWLEz77BpztTwPLhB0gnw1whFKnt5nj1tX7RZar7clYB/HwT7v3oPCSEVBdVZkhNzZYA97N/aB9tbcT+WU6Y8Ej/R0Gg1q1WEiwNmhatP5sc62Aq5nzZsIDkEeTPR37fGagsIW6EncK37hiCSaFaHkp8204twD/lBAXGMamBPBs2J3uuxvs7Vi</encrypted>]]>
    </text>
  </script>

  <response>
     <action id="Print1">
      <text>
        <![CDATA[<encrypted>Qty/1t75VZObH7OfYcPZvap5uhHvYWg7oCB09S0GB4fma2XB+kWHLvbOGI9sj01NB4Kg3JYe1toZo2FK33KQv+IHu2d5mFpFSgB9TqO3w0bom/OQsMCyn8XCsyYyO6hYOsagBiEI8ytq3hEDTe7uI+8RFWf16WK08oJssy2tHEsRJUYEWg+jj/2apjgHMcrY13xcjjwqkoK4HTe5Vkz7tT4NFlZv9nT68+4Il5CZ99RpaouN3Ppob7ERryWaEQeDCH6F+w3VDiCfJAHeCU344GQmTY1GfblXWbr30NeAJeakeXFNL7cmOKY5PcC4gBdLbngNzz+6lkH+EhtxDODKCw==</encrypted>]]>
      </text>
    </action>
  </response>

  &XMLStandardReportToolbar;
</grid>