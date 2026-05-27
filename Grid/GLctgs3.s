<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>
<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chứng từ ghi sổ" e="Journal Voucher"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ctgs" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày ctgs" e="Batch Date" />
    </field>
    <field name="so_ctgs" width="100" allowSorting="true" allowFilter="true" align="Right" readOnly="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'GLctgs3Detail', Controller: 'GLctgs3', Name: '[so_ctgs]', Value: '[so_ctgs] + String.fromCharCode(253) + [ngay] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
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
      <![CDATA[<encrypted>c0MyTRbm0vxRWGQcOrjg1ywE9LAFDYGNEasiE2SxuPvn7B+PlqHtziiPSXvGi2d86gtfaFytFTrXjYTTk6kwTbPyD6PQMrRH9mtyCDgzfbBwUhw/ZQ5LxGFaqC3cxlHlWU+vyB1zfY0Mzo+R5lTo/SlsYb0JrtCw963iAHYvtGDVsbrym6Xr804d3iVybedaRbsogXFErb6TBxPe9mk8XfrcggzTY23Y5kGmOspgCYG3STainZGmCJ3I0UkbNS7L+DqTScXEtFQE4Ch7KUlgsHoxp6EYbbHtEQV11RcQo+5dBfuFew+wOIO+aafpLRIysWHQHSiPQ1syUHkb+kjqHo8liwrJc0NI+GskNThmPft3gFQltvKkLAJuq+eH4aobZD7VGJwVtOY6AhMwkt5TaJDk3cf1Q4aOWCVXdgtSyGgZ4AWC3IF7IheYxSr9S6UxQUKza4rOINO4t+Z+UUzv0+lzXYyuMv/15+bHcRc5BEIKvkeUQeVRZPeLT48BhiLgfwSIiOfLlOM9lN1kYUgjtMb2+UYbRwDrCZ0d+KymTH+QBj91+9oek2FR/54JGXO10UPgTNjeRigs+Cp/gBv+j/nMfp19P2J7i4VmoPHnqorTs3r9RkyJ89MWs8ey+2weqmT7ZMWG1vxLTGEv2SIGP4h+BXT4EpGd2iI/+LFu61w6SCrNA4ZOWppaABBasObs+cw5wW95vJLMTpbYr8FQGIcmvNlrfSRluFEBQUhNFCRrVeHt8duVFFsbkRdidINPb7Ds2lI957kMrmkza17IAbiV3is260OxXSiw+bI/rcqQhbV+OuFb4RwtMLsE1BdJxbf41SFCCqn5oVMIkKfy96RIHvK6cxRZLLmClE1hbWtgH1WPPGDTB3Yu01l8HqNJ9yzmkUJbSXm7c9a57avAs3B1zjSkNy1pyMhHkdWmIUz1SMQdOjjidWP5ZPoeIVfJkFIkQvJr2a1YtZQOSH9jXXHuHSzAlH/uQvNKovKq3F7SjlU0ycM1fditDmqj8/YTBw6O63HKz6sr/WIcrMokJ7v+4Vg2FFyBF8CQOr22oN6dUtnEv3Cn8sLDJ3GZVgiqLKfeKqOMmReq4oJqn6K+4Q==</encrypted>]]>

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
