<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "COGTBC12">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
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
      <item value="120, 40, 60, 200, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11010: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="11010: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100: [ma_ytcp].Label, [ma_ytcp]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>T+TTuM1T+gLN4VyJru2uo0eCkCNemYZeMh8scyjO1c7yaytyKdB0y/64RKTv1q0VCQXUdUTyHLDyL4NgvvD7miMjIeEMsROuwtQtXBsVlORlixTGkMC9uetgRBmTNXq1PGWjGjfnX8i0Q6bkUB3qV8xs2PKSV3ix8AhTT1cSVomxHg/9LaOKpskAbGEnL9vk</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>DmJBiMdaUK0mDbgXzrcur8YSTPjFBZam/As0QB7JbpMuosnRvwb7aDh3QkB4lOGEZXNDwZBGbCRastbhhx26WhDQA3uaRsF0dIWaMh27olG+RFxvveGDT8UNZGMFPO9mJKSCkyC5zIckEPcXmN1N9Oz8J5ekk5mXXz9rbjJF7UR7+zKUK6WA1pMrmS0WLb2uvgfeAC/80D7AvZ0KxpF+DMSkgpPFfH34qF0zURpWV1EoY1YpFBc0/1TMTfPDX/z9xEj8lZxab9BU79WYcOxvw0ZBOIbKXMUR4gDgbPdiwcjGjM4+wGhpXTiroifRsLRYWCMpEt5G2NMVr+xjMrIFCr0l0SLSfO41UdzevNhXheX996NqICIvFu1PNn6P8myIgYyIzPwlqFWA90dY2uxUlRIsmWVmOB5hRPXEvtNeQBtLacBXo5zZZjEidcMxBEP+0eo408LS47bBrzhkwItca3LcFYpi3Zcs5azD5y8oaVdRBNsrAhLLa9RK6QCBjmYG00CocW4R5zevVJLDbpoGmKpo/HE1QCvsUtLuq7/iRET1OUH2j+Vd8r+H2b5SfAWpiIA0jWzpTEYmCt5XM7Ol4nxsh9BpPiLRSEWeFAwalUjRBNbcJPGYo7KEHoGFDGxzMhUDYel9GF9CU5goxEybsGUnF5mBo1UJw3iKza8UVAOa85WRNoAh2JYCufbLAg8dWvTNCmSyxK61YsTNyEP1c+4nn3J8Yi1DrxpZI4VDd1u70CMVGleKzCKo7t+srv7IGq2HI9Un1DwRifuyvhBzdw2667otoSbRzbtcw0T/OVKSnwyCq8M5h8gqEVDNF0uB</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
