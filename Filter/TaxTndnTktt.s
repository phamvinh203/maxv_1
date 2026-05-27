<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultForm "TAX01_28">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="bo_sung" type="Decimal" dataFormatString="#0">
      <header v="Bổ sung lần" e="Addition times"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Tiền hạch toán" e="Form"/>
        </item>
        <item value="20">
          <text v="Tiền ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 30, 40, 100, 100, 130"/>
      <item value="11001: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11: [bo_sung].Label, [bo_sung]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000: [form].Label, [form]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>MKOpN47QCzG/2+KflUfZj6Qf8+8bBP8Trm8frPCi1+yC9tY/1WWtpCnoZm0GWHFyzvNJRixJQy1KzLQlngYZFjr7r+oxEGr/Dkc1J43Lv3YImWFDCYzwZ5BOZzgYWu9RyW5ctHgxHTcIw5X9NA7Jxlh9Kn+nZF0lu70MxUmE0dT/gk18WbRxjwR5SKRxczLlVNGE8ioTzHtSQeT/04bchwxv6akBcVGZpIB0O04y6Y4=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>ZscIDFm2Fk1i37UGcOU087qnrDmUajfNoPf0f5AlMeazArDrC0HV3Uebi7SvkMntaIaGGSbasn88ssBKnAba5tJEfWyjrmiFSDDY1prNDinQBghSe4j5RHbAQ0VmLjcv3C7Qg58lvsb7AopUUlrtHioV6I2HpAVvo2xKxgCHQ2VeA0kOi7PWnmlTe28L43cBB3ATAsHoEOuhnryolqGaSSRyu/RJ4HF8Y6RWTPdA6tz9vlRKQIK5LqhxRqfpe5ua</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>XsLIzayYnGBOOVVhEm3Sjk3aUfo/J0puKsR8xr3pWSQi7MzraJHgZtJUe7j/Dsfb2rK7aR6FdP66ZZTV1L75BkNcOlT6VY8Yz2+IrtnzW6ngrz6CCero56QeTrQgVWm2uZfa0VUSBk9dihlHhk05QEDGZIw17DY86YbCsK+9wbX0vON5WGXXtM95DkCb242P</encrypted>]]>&defaultForm;<![CDATA[<encrypted>jZUBTXYp4Qk2W20SHFjHdtQPjH1HynO+sr57p3OxoMYojHIrk7UDG8wnmSGiQfCVl84Qpra47YJlgKZ4lYHcXHZHkmOgd5ZJ2CMaEouB1rM7VxclAb8pnReB0Fbw2fR3/U3GfR8nYNK3ZRROC+gCS+puLfpLv3uQfp9AH/vddak=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>Gbouw4sllsNlbpYPHkxtAgh4psVy4UNkeTvSIk+bvOv7BuyqlRp+IhiwCiw6zhhsIM7zWpfgtnWpQBbKR0flLBivgb1cw99AnxgQ3JILb60yXpSiFgY97x4mphV7U2q4Zia3F6nisfJUJknZZh+NGfjenPfHb6qUBJMex15yT8u8Xe9HBrYjwGG/DdRvv77oNWenj/Vgx5HpwumFPp2xCFNDfEUCa3eY5qJbsKc0vBjazS4+9OZc7tSLpW4Vy8AjaAeoKdx0+XmSwu+87dRvuXbA/c4msSmxnVdX/HgJjqoM8HEjRZ157JJ8+hEUb+7qzB4enqqT8UPR3/cr1pDxdY1mropDWP8kPIA7TKz0FrV4+R4ZB+9qvZykB1dIv7RjL44bYJPNcyrij4z/LwijoBDdzR0ZBQUvT4m318lCUWq+u//fKRbP0rFBzExByb9uV3hMXzwsbpm1zmRNsSUWl7ScBoiwnL3ZYw3WMoY17WmWPD3+0fMscc2+92zgX6vCIaDRBk/87bUEa46GaE2X9sqpiEue5weoY+nPDm0lXyhbMqk9yLxQp5aD1n9Dnv8p9djnoasXHmnqRVxVUonJ7WVI19zPCTM54TkbX2e6DY9fmCYb0zKFMnUSUXf/qhMpshKPN/+a+/414SiKD3BBYHaX5upf2gVbnr+V9bNdes1I7uHD8ofwcwZrOu5OJIrM</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
