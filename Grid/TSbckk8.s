<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" code="so_the_ts" valid="" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Biên bản thanh lý CCDC" e="Tool &amp; Supply Liquidation Report"></title>
  <subTitle v="Kỳ %d1 năm %d2..." e="Period %d1 Year %d2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
    </field>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã công cụ" e="T&amp;S Code"></header>
    </field>
    <field name="ten_ts" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên công cụ" e="Tool &amp; Supply Name"></header>
    </field>
    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày tăng" e="Incr. Date"></header>
    </field>
    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Ngày pp" e="Distr. Date"></header>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Số kỳ phân bổ" e="Distr. Periods"></header>
    </field>
    <field name="tk_ts" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk công cụ" e="T&amp;S Account"></header>
    </field>
    <field name="tk_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk phân bổ" e="Distr. Account"></header>
    </field>
    <field name="tk_cp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tk chi phí" e="Expense Acct."></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Bộ phận sử dụng" e="Using Dept."></header>
    </field>
    <field name="nh_ts1" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 1" e="Group 1"></header>
    </field>
    <field name="nh_ts2" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 2" e="Group 2"></header>
    </field>
    <field name="nh_ts3" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Nhóm 3" e="Group 3"></header>
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
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3knOBAwn8fMi0bMmtdvgjFp7jfEnmGmtOuV5L/RwXFESXOIwklgKEeySoYD+tlQ6Zc/5DSkJH9tDENrnnyTrRnXJA3y6kdW5Ev1l+xg74WuAT</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>7rBQ/MTMThjN1G3qNudodT1XmPhsSX2uTa4Z4yVk5hgA+3OxMF20zkjvvYo8ziFVPBoTkNeLonv7jQcM/YEsk7iaFGqvJEAdjSxCSSdqVZtzCL4igrD3Bnus0SeShb+617SrwIZlGm7tF4K1a9vMZlXkTFtoXLVytjZNCAwm5m+rti9TER89NRlkQyqZs2rMzJtaVkHDCbGm8NmO0k8hOF+qrm0odeF6loc/wDjHNAoHxoG/ImXdwkBeNkWmZudJ+gO87KJbAZs29gBQeU65RktbWARpGTrLPn6BHP2dbS33W32iSDt8c4svKH00qfQ7qQJyF5Dhy8/XBPA6Ur/q7wRbPnMUD9GlCGvneBEHPSOYN7LlrZpYPDYKzica9YXFWOHk51XfNh1wCqy9BvbowdWzVnEWCod+//yPNMN3eEYJ/bWa2XU/X+hviXCsSQNcSHgPxYVlz3chdf5dw2Zeot4cZ3P0O2+9hpqirE4InlVZ31z81GdnaC8tZyZR6axSX+d1uWo3LdaA2cxc69+t1A==</encrypted>]]>
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
