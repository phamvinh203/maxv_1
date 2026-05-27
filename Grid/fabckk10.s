<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Biên bản bàn giao TSCĐ sửa chữa lớn hoàn thành" e="Hand-over Report of FA Repair with High Value"></title>
  <subTitle v="Kỳ %d1 năm %d2..." e="Period %d1 Year %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>

    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Số thẻ ts" e="FA Code"></header>
    </field>
    <field name="ten_ts" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên tài sản" e="FA Name"></header>
    </field>
    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày tăng" e="Incr. Date"></header>
    </field>
    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày tính kh" e="Depr. Date"></header>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Số kỳ khấu hao" e="Depr. Periods"></header>
    </field>
    <field name="tk_ts" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk tài sản" e="FA Account"></header>
    </field>
    <field name="tk_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk khấu hao" e="Depr. Account"></header>
    </field>
    <field name="tk_cp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk chi phí" e="Expense Acct."></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Bộ phận sử dụng" e="Using Dept."></header>
    </field>
    <field name="nh_ts1" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 1" e="FA Group 1"></header>
    </field>
    <field name="nh_ts2" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 2" e="FA Group 2"></header>
    </field>
    <field name="nh_ts3" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 3" e="FA Group 3"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="so_the_ts"/>
      <field name="ten_ts"/>

      <field name="ngay_mua"/>
      <field name="ngay_kh0"/>
      <field name="so_ky_kh"/>

      <field name="tk_ts"/>
      <field name="tk_kh"/>
      <field name="tk_cp"/>

      <field name="ma_bp"/>

      <field name="nh_ts1"/>
      <field name="nh_ts2"/>
      <field name="nh_ts3"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kqcrJ7STqo96DkOP3y5u3vGHbVg9XYQbkhvxdpZ+dngrycLQCwps3uTsDrdNwm1I5+awxka16pG6vR0hL0HxYka/IJJ3IVuJ5Z8wCFZ+6nKY</encrypted>]]>
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
      <![CDATA[<encrypted>4mILtnoZmnpElEHAE4cnqnCexCCLTbzuo7xbsvYdkrtqsqXLmoSd3hpzLJokM9LmfnQSwUmfmeyy364eUCjo3L+9xxCzH6hEUUkOjlApwxHMN5muUXYf7yeVxAlb2RvPP0M9gw85eimF3eA8AIEJajfYvbvyEvkfO95y+W5QYyAFTAxE9+JXDcHMUSti2/I8Och6LWlJvcPyOb3yO+dbl9YcruzfLjZ61dMSeTjYtDnoG4MBNuRx0XhCkCzIznxmzurCqWxkFwG8ewCjpGAdGqcvb+B/zPRIhmg1dd/L6/LiDj5qHpkBwMV1UvT8CX88I8PkbuzB8m3q5k9cuoiePHoyFL7Q7LrkC4++90GwrllXjHUCKHOHQDyHtcmqcxTXzAGSGjF8ENOKFfJA/eYgv/buJFgjNAz2cak+AgW33pN3K/QmqTHVOBthJ/t/GPH8hdgcgxeB6Edz/3e/3YITS59/8M4qy3UKrdOs9qtAB5GeI8sjAifEmbrvwJ9aLPUKkMRqQRlS2t341spav294Kg==</encrypted>]]>

      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
