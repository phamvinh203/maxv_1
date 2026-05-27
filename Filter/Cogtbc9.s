<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "COGTBC9">
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
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true">
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
      <item value="120, 40, 65, 200, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11010: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="11010: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
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
        <![CDATA[<encrypted>+mD13EXoTpvXPzbL2QTOYgsneL+sYKUKpW3sg+lBMq2BHWz8i5Ree6H6FRMh1gHdR1Cgf/QLQXnC8F02vg9+EuZOeiC3ih87fd+5qT4FV+WvUfI6+xddO4ZnUZbyK0QQehzT6P1vVpPLnE03g+NkM5yc318TR/UvsGsliaCAwupwqYegfMr8/yiIk3bCtMhWNrFOol7jDeJEcjJBtA2FAg==</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>BZZUOpflWnOZbc8B6lxDDgwduRe+l+SRWH3hz3KHQa104AlRDSTK2yKQdOYDMxuL09maXZJ7Sp62Zn+sFHphznErIi/CGHqP4adTdydK571clY6fk4h99WUrP/AhfcIx3BewTgaWxh1p52dn/CBV1PyCjx9U8Ztc3ZcsDuRuVg9nxlD88jwwxV0WbOGdIkILD5WYOaTLqHrU2INr7S6cIdgVCwHT/X2Qfr4Y6/iz3/6wyiSZ/yyWGsM5thVxY2+n4baGTurrOqhubibWlm4DY/qy2rH269pYazhAUCtN1F+6/8pWxfC/ngAZ6wnqrxcmDAfwCcQb3q7wu8fhfcJL9m+1AJd+2Zj/bU9fu89BqQqQVNxGA/02tVXOxhf/OjyiXF8f6dfW82gBZ8/fZsVxXUt+ARwvttuhbZGCF/2qFKTv5d28IBCtG/qc/1ChDJqEh1fJhwI7LLKP+Q9AIbzgQ1onaEFhw9BSNFaxslJJAQakbUpXlq9byg5h8TLQKBd9kGkUxIitK/fYZwB89zniIYo3MzwKFff6qbDgSH8kquKpBZv/W71yDtaMBkBzzLUrZxKKug0GtbYcjtuO52VT6Jb6JfIw8OA2BL/fE/x0YwqCYlbiso8HZrJBIPnj1+M5QxgCXG5Eyms3A9tcapPr+1rq1eRwzFuqbdtlBcyWYeWY0r+BzYNisLBew8pZawvK7lPE5qJllKvsPV9d2iyOqh3WJIRYzYnpHpaBHQbisBFhS64iZ5rkbVBwL2Zwa0Sd/XX2qZTHEkzfCDXiXlLKSqz/AZk5oI9l16bAQiiDnTeadICAT9+Nb4ujprENa3sH</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
