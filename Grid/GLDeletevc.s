<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>


<grid type="Report" code="stt_rec" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Xóa dữ liệu" e="Delete Voucher"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
	
   <field name="ma_ct" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
	
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true" readOnly="true" >
      <header v="Ngày ct" e="VC. Date"/>
    </field>

    <field name="so_ct" width="80" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" align="right" readOnly="true">
      <header v="Số ct" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tong_tien" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" aggregate="Sum" readOnly="true">
      <header v="Tổng tiền" e="Amount"></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="90" dataFormatString="@exchangeRateViewFormat" allowSorting="true" readOnly="true">
      <header v="Tỷ giá" e="Exchange"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>    
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
	  <field name="ma_ct"/>
      <field name="ngay_ct"/>
      
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
	  <field name="dien_giai"/>
	  
      <field name="tong_tien"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      
      <field name="stt_rec"/>
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
     <action id="Delete1">
      <text>
        <![CDATA[<encrypted>12XSjllFbGiYVd6XWGUjwcdExf1n4HRjBMi2fivi3v/124rVHTQvgr89TT5uV8GqHS0cl/hWJVX1FE93FxlRnjHkyVh2+obWZMhV2ufAMPCDsnPk8YJRHCRrx3IFNl4WtFvHoEUXwTpCuzGPfnrZwc6cl9fL+YUpATr8i4DSoP53py2pv+LkC/rER1Z0roCWiL/Z3rlPdCf3uT4ezAQ3iwG0LKWfswQ/IvbQZBJiXDhunz8K3ly5p9Yz4b4TEAsSWbSnUib4uDZ92OtjuwGy3ZQk8LdEtb7qSPTu0GVnjmSvcKxilYclNsDgMTpM4j5VBWqCA08ZSj/3F9NbYfpkWN2R4FnWxybQmrUM1PeSpmRF3E0lMas+UFItkVXr3ZVlh7Fy2zWfzrygdbfJRtYVcQ==</encrypted>]]>
      </text>
    </action>
  </response>

<toolbar>	
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="DeleteData">
      <title v="Xóa dữ liệu" e="Delete data"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>