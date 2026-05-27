<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>
<grid type="Report" valid="systotal = 0" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng tổng hợp chứng từ/Sổ chi tiết" e="List of Original Documents"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ctgs" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày ctgs" e="Batch Date" />
    </field>
    <field name="so_ctgs" width="100" allowSorting="true" allowFilter="true" align="Right" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'glctgs2detail', Controller: 'GLctgs2', Name: '[so_ctgs]', Value: '[so_ctgs] + String.fromCharCode(253) + [ngay] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Số ctgs" e="Batch No."></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="Tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" align="Right" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="Tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" align="Right" allowFilter="true" aggregate="Sum" readOnly="true">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>

    <field name="sysprint" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="sttkey" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" hidden="true">
      <header v="" e=""></header>
    </field>
	<field name="systotal" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ngay_ctgs"/>
      <field name="so_ctgs"/>
      <field name="dien_giai"/>
      <field name="Tien_nt"/>
      <field name="Tien"/>

      <field name="sysprint"/>
      <field name="sttkey"/>
      <field name="ngay"/>
	  <field name="systotal"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kqcrJ7STqo96DkOP3y5u3vFUVN9hjoNTORchvmgbDj9G3p4UwbRxa0UonfUVeGQcZBg9CxW/aLcqo38VXd+JbIhDKuHiPD3OqORqAYTQI4b7</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjqN8AscshQnVlzdQ7G/9mra8xXWGNroGBZuBhQQ6PM1aFnWcowcCRBXs2xohkf0RqfiwT8oik3HQqc0MLFTTTU=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3knOBAwn8fMi0bMmtdvgjFp45LHQTJ43FiW4N3Yrmi7UoGoxYeY9IANmdkwoJ8nY2IwCcb5iSfiR2FTJWD/Z22B/QgUH/u3ObQRw00la/Zd7T</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>+4MGZi70gd99DJ1Xmp9NU+dmmTGVA7E/KgerMbNePoIhTCJuv09GbJ2RN84ATGWCHXjEmZaa+hmrO/cOf3SFtRuAljKr/+RrU8y00nzkAdbsdUcEkvzNcMxm49OZgmljOO+i+L3HeP4n4cy4vdOROEP5Ybcp+Oq31htW0juEenbt1wh5i4BckAOsTOh6TukBJPAeIfFYnebrT4Tk6jlikoAbEVMQMluGALIk8p8csLIKmxBD15caCOL/ttNzsZIPpKziz7P/YrjT96vR77AnYxhgWudkwNn5aQQD0pgPNSsVhtEU0B54fVt/pmRDqb00S49VJsk8DnplbBvxP1/lAEe818OwFIETJWduSRwvfIQdQOEB7R98P5EFReqe/4J4txf5NqB4i1wGxE+T4IK6R2aeCSCjilAGf4vXOBP9H0wXurXL4djOb7qtXhISb05yMeDVgFwagMS94QcLO+yAiAP+TxHeFMxABajtmBSBHbUgeyrpbezJxJiA4zvLONXDuSs7iWUmRMDEabzNSgYR2H47aZeFk5VN6fE7oHMckYcap+Xi436unMNv8efwTXFItKYBh8J1hptVd1yTATD3SCwWq2aEwzXqLT2IFCYQr7F1pnn6LBds6tKJSVk0Ywe7Lq1+IGu5n+WyZO7scZ4Sf1PbiqANoZ5RyAI02B496XSMEPa4NsH8tLq96i1p/ImFKdwBki7N25tquy/p0vXnu6EX3wVk2jWc4FdQqdrllfyGW9aQMliK/nvtPMrWynI0zFQUUmVp7isK+qQFzj66clFfYoLvhcFu3wPDMRWf6Y1gwk5DDtkNsrFx78/tYKmZ21x8XZj5ziG/jvu4mLg1LFgUbbEiCGf4qBp/zTL/fQoEGig2j41S4D1DPHIQVn8tKFjfrfbjDk1jlPouTUtCWa2NBH1imkLgSk532WIas9vpnjQDzPeP1lfqVogM5hzbQ4tL9bhWNHMbuIXkPZLJYpHerwePLelYOY9Q6x5j7LVqlTazP0D/SFKd2niv2U+FqnPcWWOSFrJWkfRQyBEPH56q3VwG3iiAUtw8j7ekG4DmyK6wNiqoxS+iNuXHvYXWMPlbMTjuXtOkw+VaXDuf54y08KjS5s2flaKxssPtPh0=</encrypted>]]>
      
      &ScriptTagReport;
    </text>
  </script>
  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
  &XMLStandardReportToolbar;

</grid>
