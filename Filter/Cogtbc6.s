<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "COGTBC6">
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
    <field name="ma_ytcp">
      <header v="Mã yếu tố" e="Factor Code"></header>
      <items style="Lookup" controller="Factor" reference="ten_yt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_yt%l" readOnly="true">
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
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [tu_ky].Label, [tu_ky], [nam]"/>
      <item value="111: [den_ky].Label, [den_ky], [nam2]"/>
      <item value="1100100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1100100: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110000: [ma_ytcp].Label, [ma_ytcp]"/>
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
        <![CDATA[<encrypted>iOD//dQ+WxO+KWMqe7o3ZDF5J+Nteu9Hvfhv+O9BVwBd1Mlikhah5CdyOylK6FnwCKrbwiCGJod2SZ7XiTMUAMJhtTKLbQeosQxNY5EnwneibmDg5Gr3zDskPNBo0IPa+KT2bFSgmCIZo82Ws6PZYF5kcEMGxxUby9K8qyus+ORI2M89fkUq1E45kECsZ5Mq8EAViCGE2DSvHvwE4i0GTZyXVw96KZNyxgcm+i8v7Bk=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWOVTbhLQ5kweZgcMMsoTFBgyjoxSDR17Rek+JD/pr8l8OCLCL9rlesl5YvJ7ifrbOgZCfW4L/SKqOPWXf8ZOhxQmz+SluSdLnj7k2KxJZRQF2jgLdSPrV19Bx2gi6RttOAKbqNdcF2XFcX5qRAvnq5omSy/IROZTSb6H0v+Mm0NqxwhqnEzVhgimYNGiX6w7L5vRNYVEId0ziwvufgByiYNOpDyfvzkXV2qwoy3AVccBaaCM0dDAdaLtVgxU8hagagnLXdwqMu8JbJJp7PMKqYcse0lsQ8uqflO3WBOSyrREX5X3feh4rxUW7fkJgzbWgxYBN1l3EHOgtDIrsTo1atCBPH3wQoTjmRK7A59+h8mFqIZTMiFk7W9vOCjKoBxt5oCRH/uHXWo7vDYv3NA4xVHSBnrlOaVIwMwifz3sRinSKGmtKTTfcVpXl7GTIUh+3JvwflycNLsRwQs3SmIGfQEhhWxWccUum/azce6OwcNw91X4LvbSttuSvoOqmyOek+PpiFYPB/PZSHzWNCNdFx6sk4J2regpnXSFls75fjD2bBNu22pzhNlQ2MHinAv/bPvR+D+aB9Py4tf9ttmDK/TehWBC6CKXMlTBODOu3Q4IDBDNr4zV8K+r2QtfXHQHHIZEfxtZa2C7K2Fn5L0aym5A1XceSh2xV8V3u0/2XBBuDZyQ/+qkt4BCClk/4KPuVQvhG5F4XteRQx2eckkqpDwSWMfcpZvYhiXEx1o/MtQMy93ASkxtd93h1J2YX5GFwXJuBgom1DZxIg2cCfcpJcYETE8H+cqoLa8loZBYH1J/mOkEMAN/GV+CeIgMBKdUrJOpo8gfqKpMxIQ/qo8q3Ng7noy1fjNqCZVNNvtSLkmO3lDpSP8eW7IBRL6Soyy7Qw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
