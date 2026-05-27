<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY defaultTable "GLTHUEPL01_28">
  <!ENTITY defaultForm "GLTHUEPL01_28">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
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
    <field name="mau_bc" clientDefault="10">
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
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="11001--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>j9KRGWw8ZrUez8x9376ngAW6TCVZtxRRE8j6EGsUxL7J5SKTFyRZxz26ZjtuRpIGfAdNTtm+xfMNO9AqJqx2QODxcZ7ndWHdOa66HZiKkY7BJpRr1l+eZ2Sc/YM4Bg33AZ7PPDan2Zja2OKOvzCW/77VIhvI42lBl8KyRZgV1FY=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>hIkygextHKuq2BRkUg7KaDVdfVFR3M1wZHHxj6ACL4r9WBUlhzpyuYj4XFcfXv5NwOL+FH97uqtGKfS7pjSrB6o/mW7aWzV1SUlBp/hPd54m5ggGfrtq7SfOUwPhxKzpsBUaTL3lfPPD5cvkxNkL1w==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>qCc/EsPd8J8l9Da4NC0zqfhdYWNFioCPAhX4lHH/bnxvax0InGSB2ljeCWVU1UnxQj8Qq6XSlWOTXxHVy8hFFi98MuOTj2Uscgukv0LpMpS3Nn9nRIojCYwuEBfCASojUuyKsE3iNjI+Sb5v0nXVps06oKgry4lhtwtMO0H0Mf/0DfEmVSgegg4LXPNkE1ceYmbUj42/2qMlYA4WiUh/N25HUiGvesjA8tAi/ausav4+iRNQmpzewQ8ifRaZ+uomWowhDNUo5Ma0xzxXCGYrkYdQm97Bll/ODk/5cOEYBRqWxBzWHnz1pEfKT+/0o8f0FqdBp7blM6+VvJxVhn4kPgZvktrtghl/7vOmaGu8j2DpNUH7LKqeqOhro6X6n6xc1Q+ss0Uikt8dXWTORNguKeUy6G4OUB3Kf9XLQIaRAqtLHoG9zIm5QkEOSEKDxPw7xWU215/XutrFhmOxhn6v6MKBFAcfW2OClrjbMcEe6enJFL5ucSteyZc5pUfR2abtWStQ2UKKCI67OExkbPxcJXVpcG/7DIw5gDsPp9+3aKVCu9s1PAKa7fTXgkuOWvzyGQmnmSN7ac5c/EhtFz6MHHzYptaNRw3oJig620LBmB0CDkpt+H0KhyUcxG6gAp1i4U0w0QSdJLE3ozRqlY4Q+JlGVaiRq24k/6GAMsyaVJmxokDlzNMIcllu/7hB/vbBgh24tO1rQBKUzZqgdX1OaPd7Nu/F/7RrPhs6rxuimJWCxljsjzLSRdGQ2LxJfNoR</encrypted>]]>
    </text>
  </script>
  &OutlineCss;

</dir>
