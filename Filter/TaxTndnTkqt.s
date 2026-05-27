<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultForm "GLTHUEQTTN_28">
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
        <![CDATA[<encrypted>XsLIzayYnGBOOVVhEm3Sjk3aUfo/J0puKsR8xr3pWSQi7MzraJHgZtJUe7j/Dsfb2rK7aR6FdP66ZZTV1L75BkNcOlT6VY8Yz2+IrtnzW6ngrz6CCero56QeTrQgVWm2uZfa0VUSBk9dihlHhk05QEDGZIw17DY86YbCsK+9wbX0vON5WGXXtM95DkCb242P</encrypted>]]>&defaultForm;<![CDATA[<encrypted>K7p8benxucLX5nmOG686QuFTN1C+py5M+/QZ/cyBMepIOYwRmWwPSfTAFAv5+YC/RETVywpR4OgCdOKzGSdWwVyrV0/rMl3nkcrAMiHiiLOzaSKnq5tWPFdcjIEjGBtVaifTLhuG3RbVdbRKqYhf3Jvjpk3q/DTGFq8Ptr6Kw+k=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>Gbouw4sllsNlbpYPHkxtAgh4psVy4UNkeTvSIk+bvOu7YiwBzBkbblOZmbQjdGBrNiGd3k442b7uIOu9G69CKyIiIO5pcWbDbPJlS+bDA8gpluNu+UYtyFdEPi18OdCyy0530JECAu3sKzCBdWles6p6RiHFxwD1JC6tfvXqxqGyKwox1TOipSlzc33lpERjTKCwXVT6uSuDofah8qoDld5M2xTZjiQqd2aWlJolkYtVKfC0S02/rjPTZfFkQ4/fdZRx0rS2B/naDEQ/B6kF+G1yisb82aDfC1kjBqv1PIqc4a70J3Fv10A+D8tkbDbs90+m/7cFrohIel7VYu2X/DTPNhr+rwVrEsE+lDeMovJA7Q1PSdstJ0xL1apkunsPUlqsNBvyoIc67BA6h4dNW08t0q7z7H1N507hKhebpoh7KkDAYNTQy7bJLAlQYaaUuLFhgprEp0JJtr1n+0PeiclLYV5gn+WRvtu1QtMNpULTFgXr0YyGmSOwNkfHanhj8yOklwQvKfgp8tASQpP3z4GNN64Syi1+hXYoOJEXFqMmBnD1OoSTqUXatZbXe6AgrgG4b2Dg8gVZB1dHoPbfGxFu2HBHW7ZBpBfNVeIVfdTIwTCQ5N3qHNC3OpfgSYnDV78xK3LPft6g6BoMYj0NPgNfDFsuL7rMdtd3K89AFFcPTrn71zxdFwAmrx4ef1fE</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
