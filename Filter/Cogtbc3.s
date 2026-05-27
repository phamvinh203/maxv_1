<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "COGTBC3">
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
    <field name="mau_bc" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
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
        <![CDATA[<encrypted>5GUaUYgT9wf2P9Ae45ieYEvCHkJZsmRtr0m/opFovL0mkBOzYyFH3Fcew0LsUFQo2ZA0iF/AD91HseXC0doQESN2Fx9b2zn/QGh1lMxaFciesfGn3h6l+VBRYqRR/bNnlrYy8jLn2n0CI3fzZCNRibQbvPw/3SFoieSbEgM5y0Y9S/Mv7ZPf1lqACEnlUAKd0CiNVVQ0hdybFFSyO89cKZRmouooo1KvzdzO14LQl7Y=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>KtWEnc1ljNOhRP68KRZhaW6h5cS5wQp+akTI39Sl8of8782mV6wrNfjwnyb3Ai01+3/FjvxVB0uLF0fheL5KHhxIOY0ngcXFL9UpX6VIE3xvGcY4p5nLBAvoxCLvyVKSyootbIOLIw2uGwcGsGJgn3X0eg1py5cLY3xB+2FlKjsFLUrYjwUf412EA93udxn4UnazBJC2UnsxKcv3UzmwXwXsOp9TKpcwEsuJNpS8RxUj9pdFGqKyhgl6J7+VCfx9zbc79P8VElv93LWVbRzDdFOs62y5dXnDA2GDUbAKDkmrWVwbKsimKNO3vYQHJMIfoxi0eYu+Pz/fypBxthC1BAbjjDccY+GUpE6c0xG2u2rpC6DXwA/SYgyQIsFzDcfJ8R4SrUwsDNPHX9o32v13s+f2Tq+uX+EWZZ1dzMAy8cibBINkJNe1m1in08TIR/kBvEfxuRkOkOSqX8KJ3OL/nXYjZsvBlA7FShtSDh1nV0sgNf/bFOPBV/ZRkYlfpqkku72gjsbRLs+aVXjPBj4FKgxThQKRjraWKA91PHnxx/ZOmrtZhYH7S03lDLZxL6pS1uKH72Hfo01tpkbGVickEAMbK08+YcY9sj7ZqJuH57JhIuzNIK8Q6BAzQIZlQhgkwubNFc6jYmvbRtphOh2ZGsIW/jyLGbRJ5w3NggzuQ/DUYK0MiEflstr3BX8JG+v/Hr3m6hKqUouWQHiQDl1WooAzna8+sIbMNCOZtDPZDFtrs5H6nJDWmbjYj1ZW4vn2QLDt2ZnpmfctpYrVvXL/qZyqT1lGXctTS7a0S/E80bIdejScv6T+uziqr1Lo0OSrmZicFsMdXhDx/A0VnRyAaMGqflzxz9rOXLvmGshpmdLL9gMzgELYXJrVDi2yw6d8GN2zjxbrZd2n4yetWxI5/WxhqackhqW3OzwQTEqS384=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
