<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>


<grid type="Report" code="stt_rec" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Phiếu thu tiền mặt" e="Cash Receipt"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="60" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày hạch toán" e="Date"></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" width="100" align="right" allowSorting="true" allowFilter="true" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" external="true" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
	<field name="dien_giai" width="300" external="true" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" readOnly="true" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
    <field name="ma_nk" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Quyển chứng từ" e="Voucher Book"></header>
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
      <field name="t_tien_nt"/>
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

      <![CDATA[<encrypted>MxCYWISyP6y4QotIhU9HIjKILW7wulVKjV2uQ7l9+IZOsKZqQ4FodiPy1+6bUD/hIcvZYOIQAytzvF4YL8gY3GwsR7GSnBzGR2aA+eB8II9stUzJcQ9pKwQCeaqd/Klo5HWMBifRhzazulk92go8GGdC5N9wHJCw5Vjs9ZymW1+4fZuzwszA+sR0CaextC1i/Fz+GcQHb02hERx3ZeFfk9+NAo+76vSWtUl0Bg8EwALrOlk3+7a48R40MAylLLDeaBjlRDCnG+sYZtqw2aKwEvPPLDl/QpF5rLq9BetTizmCaqH1rGNBiEhrQpESzuqCEcdKtqMxAz62jcdmxAe5A7p37z9IPawU9hspA+PZ1D0taML/U70bTM7cNljR3G6c1AZDtWKmDybGbGvPP1DP7AEsKUXbOHjxMzw4o1ZCBzQ24PdawwHnOJTzewGOwrML/X0+Nx4jK3JWUdZS1l551V4RBDWqvaYu8JzrLaKA4tvWg3yK9LQ5OGz2qfRmvrb4tB6QnS9CpaXbkgbS/fWRcM+TCRCtBfM6hNjXfZv5EMOC65VfXxp+d/ZJAKTwLH6JD1pHeSnRHIpjC+l11N+aRy+C1G7in80nJOomf+Y6ObFhP3j66ktrwdMFimQoFxK1UP5uoT1M4WEzjmCKN9BFrX56rikeruGmG/OkGAwmnwHUG6QSCkK3ZbfaIpK8f/+2XZ3UBgOIwPoaeAA5OI1fne39VQBeQXkj043iLfYUrYWtM+IsBjQSLl8cCnF9IOb/h7D0aOxkw/8ekcay1bnB6yh2c0IeAGakuQou6a1Htd/ImFr5pl+KFgzZ4jQjdxiKS8z+/O/lY1ED7vk6FTZzbEk4Io7sJoYsn+Xkeib6RMNyYi+158XP/RLbd4e6HicQSl4n/uIQt4bTB5uG8H8mV4WMA2N4J9E10WVTOcI73iUSlV1SSHqAbJO0PPtolCqlRnDQOx03HTcxYZdJqqqsIecKKxNnhbu2piyxsAUWKA1sERLF1acyGkhuI2wXR90aKWQQ7KL4hqTMuAAufpnoSMDMs8e847VTZKWPE033LZze0RqR50NqUSADfkqvWmI8ll+0QMI5dPCvxSHMdvZZoqL/9LYNtQyC3X6Wy0EKUqJSQJVYb83rDxyrOGRw9NG/N7r4qW+DmKk5aS7qfxyCrlSPr99HHPqwfMTRbmIEk3tyVJGiTDf7zvRTy61nfwFpmCVIUGHC9xedWy/BndFhGsi1hr9OrO6ETST1z9LC0P6AKjrAJUfYh1d1fXUWaoNB6wowdHavTQarZ/zEd77dWs2dOb5RCFBHik71cmq0gzI8wMl6yDYTzFIpe8x5im2JfswEWzNp/EWSns+sBApER+3nmYKlPF5Stv+FW5Iscp4cToLfA9peumBqHGVgNoNJbUXy1XTHYoBeUfRvowApBI+2QuINgeK3dEPznoPeLaa+fp8QC5haMoJ//pym7G6bdG/g56zxIXl8dsDoNhdNGG0oMICcUY03lxogw7B6+AqZ1k1JQlGdcH0M4SybUwd794lKywCJMOyysTBCBtgyhCrGI8g/59gD9SMAgq5tJlVCgBR4gjgMmgvycOavsoxdvzBjH3cXervt/+Dk8153QejVsFcTORfyDjiJLwjPzEAHVCCo+/+J/LQPNn7v2mGDC18r/oiDQI6nJStRiaVdC9FQUZx1nr+TyTAGq4SigTkl5AHuJyoGwybuAHyMBAmjWxiTUQoppq+A8QnKEeNssFEhvDsl9SvpYbUtVfyibHX4b5kB8sV0Espbe94bFerYNt+ZtiuhRkRMF66/oGDaDi16cAjrh3xIa6/WWvSZWWcGRl+PaK5uiJjXZksUwRhismuYDLPWJtE0SKQM7mGhf3pXVCt2UoUZW5Jz+s8aJHGWtuf5e6LXPhwl6mdSEIAl</encrypted>]]>
      <!--&JavascriptReportInit;-->
      <![CDATA[<encrypted>MF6sTq0brlU5W1yTrKArH24gyVbdPl32aB3uLtqPxSkeP4vSBz3+BC8E+pTA3FcYFnaL9dXJYoPE7LrROGo+0u8HjusJElzcJqKZ6B5GYMF+YsBmKoOaS+in96HamIjO1lvsxm73ua/tr6KRuAKNyl/VRTkKCps4Ldlv11Un7XTezfkH7sHkIJTDw3MmQcol4lD2FlJTvqB1EgLhXfgXEzkPA9X+dTmZDVajifvn2sEiEVt1vv/e1cucwXC9knWNHMt936Ibd4esuP/2w8U2+cfoEp22Gc1iBEXu/QpFoVt9zutPBwzjI0TU8JRNVmCdjB8yNgVga33sKmApRdxeHiGag0YhqjFnqgbZjyzd/XRLgnGlQk/GGKPMO9UykmRHMLC0IRV8DSRHJtLcjHww6veFk2skSI1StLGBcJ5E1OFitNRy95ZAsytNwuqNTWw2LBk+iPaxHFU2JXpOGfOq+1xKMh4PVCZOIeko6LPqiWlWnJBt8aYTFthA6c8Tx6Ec6BUafyIvdsN5LXKM76luVmy6lQ/1IRA9dSTDpe/eSsaTyFUFx1dpcYNHA6mrReOrPxLyEx3nzq93ut9w0EJVABnEf+hCsgsX649ebF0mMUODkYC81n3Gvz01XlmxKGFcSAHqPzeCozj6FZxdD2hIWE1WWDaP/BbStExX+0c+xc5743n/z/wQ/TsPCKfUzO+6ddYU4m6rPfQwJSXfk4vb/blimA9t0buj9uw1eV0dyN5rgyBFDmjMbizAHYimn29p7tuVnp/lzKQKwAY2xUL7XGNAYniLsX6+d5qCMrgsGzJZtdT59lkf72Z3WoxZqVb+59qcbkb6v5SwirbOS+8OutMpxAJBgSvGCoBHD/Gyo4MnHdIlH4qyESffs1C4I0EPMSlUG1dsw/n5ym4/g0glkF0yELDFj/exBX82516uMjkRIp4HE5ZiHkIvKA406bio68vulSuPXJf2V23M7Hv6/IWFdpixsmyHyi8Z7eUVhL1ZXo7cCtGNgm3KF0zQ2lZHHN3O8+2ZFgGWLEz77BpztTwPLhB0gnw1whFKnt5nj1tX7RZar7clYB/HwT7v3oPCSEVBdVZkhNzZYA97N/aB9tbcT+WU6Y8Ej/R0Gg1q1WEiwNmhatP5sc62Aq5nzZsIDkEeTPR37fGagsIW6EncK37hiCSaFaHkp8204twD/lBAXGMamBPBs2J3uuxvs7Vi</encrypted>]]>
    </text>
  </script>

  <response>
     <action id="Print1">
      <text>
        <![CDATA[<encrypted>fjM2UCz7a248rAa7J1rodj1GWO2VH6lXfI9aCLB72hH1drkB0mTWu2VNiduolF+xzt7ntnXrVoqEO1k3ZAs29XRFELeClJYpNw0jsoAjyt/KOYuyJqxgR+EcgjujR/VvoeG+mReWoa+jYter+5jSPKqSfFJLh3HtqM2sa8cQEQN7b70yTiehgqWTxCSNE0AxAYaVdh0L6PmZKmgzMFF4inmzMTldKg/brO5ah4H9cSPgDAbPIKHwfDaqlsvQOHaLP5fCJbokGLAFhMJ671CB7BAt5NWiUSA5PvgTm58rlyBdrBa88TH+VgaFtGy6KhS4PGRM1GF5zYUrkeCziNH5qQ==</encrypted>]]>
      </text>
    </action>
  </response>

  &XMLStandardReportToolbar;
</grid>