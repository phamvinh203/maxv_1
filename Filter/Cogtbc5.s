<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "COGTBC5">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ/Năm" e="From Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ/Năm" e="To Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year1" defaultValue="(new Date()).getFullYear()">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam2" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year2" defaultValue="(new Date()).getFullYear()">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_sp">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l"/>
    </field>
    <field name="dien_giai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 45, 30, 100, 100, 130"/>
      <item value="111: [tu_ky].Label, [tu_ky], [nam]"/>
      <item value="111: [den_ky].Label, [den_ky], [nam2]"/>
      <item value="1100100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>n7WiY38rGx7BO3qPmle8zp1JaNgiwQUJLjzPfZG5F8FY4qg+7KpqcfLHB7mm0anCrhaJe/t8QSyKmr2CWMbVSRxIWtAUM7fX7by+Hs2ITRCa82Kna9jxJZlGXPEUrSlmOhMPDbaM4nBqSYhgmaLjcXyo2LMF8Qpt76jzawG2R9VqMB4LnF/rKWn+mfP9VztBWjf2X6L62d2l3SsGWjOalvCZICucs8c0BEunb164HZW9p8Pni8IOcjXXavexXZyLTd1564cfsT70ia3hg7rWOBLXXuNpQtKJ4OUgk/rh5MsA5/d5h7dfWukPWxBS7ZjJ</encrypted>]]>&Form;<![CDATA[<encrypted>t5/OLHv0rYiuX11GAuCYa4jcEGQcY7Y4OEM01RECbR/r6lRwHSShpEvnIIGBlKju28tM9rm9m+fDTDlxRMjobv2kIxU1OWyLN0EN2YCwebfTusKHzI0W5Se5mDgo0bSbKT6ET3SmYo4bmiQ1T0HxR2WnSMTghzfypGXSyLBAVEtnZR00JJYNUkS258AtuopbR5+pUNvRJDY9zwuZMv4Pxj3aLI2JSDq4p8w/1zxkUFKTiM3w6wL3zhG0k7J95j/0aRFjCAMIfmrzhyVeVf0m2fz2NW0Yyzo8p2xJJw0SVK6JsdA8D8XSi77QuoEOL+OO</encrypted>]]>
      </text>
    </command>
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>3Gs23MECRlAoeJJ/VaiwP8c5+7STJsTT7nKtyichJLgCRp5KoAph0qG5Xg3ydCcjWODioRem1F9BRobZ7gpyD59B1rREbswgYIkPRYdUx05MX1ontwMVF/etAI4DGQZudJeB3zFGsEIQcLWYM59Llf5TZYp+munqPYupzt8vyn5VuNED/xTZOKGaFglw75Uiu8DPFkL1Hy3jQKaDzCULRA==</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>3IIG3VvR8liMMNaL8yCXHZBJMwMWlq5jLcTxiKlaT4CooUnsukK6AsRJcGntixIieJCAiROTv1vKtJcW0ojJjLjaSXoqLLmcJkdHc+cli+MGDnKNh7o0Cv/6jE+WSLNJQxZqmtOTEIlGgyX8+yPEq4MxR+emnVDbwYTS1n313AvzJyz0ZQUloBeUMNvWlbKOwPIfIN0+k7XmU3oLvywnuuzW9HBx2N2crx5MIuNaETktUYUNTTfjXIXYddYlB9P95KuL/k7sWscmI8msJAA2WVAxc1yBMLhpH20A02EdSNHLyC+nYceyadlv3JVT2l3v5zVztAJHu5UYjK8Erm2vthbvrjpcCVhC8vr2IeiI4fFMKgDVvWj19q0ejmrJRsllTchBRfaoERf9l04xsZmyNiZf4ixrazd6ud7HF0PVxJoFpV/0KCw6V+63L5TFUo1P/TPkQ83GZzPr/h+1n1OYK3fomgRtwoMAEF1fKHkhlZX3q+rnMRlFh0iNytKG6GE6+HdAVdpjnX8DlyrKQUAlYLXeE4Usy7qujT5CNrenejTDD08Q3WxR3Knhk8Qf2zY8uFzM2q7RBaEZZGmVhHDyv81cidDO9JGzIIzul2kKosNaKfqcuELFWm57wGX1LJLH7qN/DQ+tknSitlfb2bmqllgpb24eqImlCiarI89RJUVCiQWD20yBpFnGNxZQufg+XQWFb8893Cb2ZOcjx7z3O8mf49Y4vMIQwPT8+Gc4JFWbJTzjeCDYgpEdRoA1YZmgwK8wBzfJrEcWT7HSjry+i8I7zmdsGwvbbX9XKmG+PIe48+ogi0EEoxIsgsZUMEnRGfbwCksyGlL/Q9Ytn76ZBnL9XDw2NJLd4kr6OqqcS9S5l8QTT4iYSY4CDbV4vBbN</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
