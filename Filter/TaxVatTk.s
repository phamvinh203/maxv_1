<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A01119\ReportCircularTypeField.xml">

  <!ENTITY defaultForm "V20GLTHUE3_28">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">  
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky1" allowNulls="false" type="Decimal" dataFormatString="#0" aliasName="Period1" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ tháng" e="From Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" allowNulls="false" type="Decimal" dataFormatString="#0" aliasName="Period2" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến tháng" e="To Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" allowNulls="false" type="Decimal" dataFormatString="###0" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="bo_sung" type="Decimal" dataFormatString="#0">
      <header v="Bổ sung lần" e="Addition times"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

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
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11: [bo_sung].Label, [bo_sung]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000: [form].Label, [form]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>4ZahQOgb8HyVpCZt6o2hOgI+FzZZ3HOTowpFLX1h2aAJYnfSrSmWd7Wd8w60XydVro77aDKeZP6dEAU+JzQgdGTvqSMwvrxzBSo0JzoljCWGCVTLHaiuXWPnJwhpHTjDCk7OprnL7TfFLwIIPtUc2qa+88Rvv3VXtJoNgaNxGUZtgs421xZhIIEg+ka+QlIibA1rUzOkdKIZIuItV6gz/mopjoWyGB+Z2AI9FtsQxmI=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>ZscIDFm2Fk1i37UGcOU087qnrDmUajfNoPf0f5AlMeazArDrC0HV3Uebi7SvkMntaIaGGSbasn88ssBKnAba5tJEfWyjrmiFSDDY1prNDinQBghSe4j5RHbAQ0VmLjcv3C7Qg58lvsb7AopUUlrtHioV6I2HpAVvo2xKxgCHQ2VeA0kOi7PWnmlTe28L43cBB3ATAsHoEOuhnryolqGaSSRyu/RJ4HF8Y6RWTPdA6tz9vlRKQIK5LqhxRqfpe5ua</encrypted>]]>
      </text>
    </command>


    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLCheckProcess;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>dVhkciZIa+WkQK9FXdgwKJ3nZLCwnOSxO7rJCeHfCClyZ6RHXi8ED+2IetEjkOXQIMoSrZJfDBrc7aXU0wuuRmcmZTNYb8OmuFcwpw+gJxhr22odV/El3BrB1+dib0ZC0aKKwT0Qg8AuIcn/BKHgil2QkjznUtOyJr05OwRDJRiUPE+3w4grL2V6rNJZfttHMu6VeCuL0mXzZeUNH6Q7+gtWCZ+s/Elzx6D5YUTVpFvZynmX3lI0jwmCvmBPMaX7</encrypted>]]>&defaultForm;<![CDATA[<encrypted>hIkygextHKuq2BRkUg7KaDVdfVFR3M1wZHHxj6ACL4p1vdSlSfEH/HLaUmd+tQ++jeaob+qjbD1Ue7xNS7s3JBTlWiLLuLBlpynKsKoyiG9k2c54azJB3I2FPm/YdrfapMFZPoyN2cv/b04zIOwXnQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>jAM+2OWNong2bHD6+883qoaxdl+XdR3QoxiEC5Vg9i2rAFeMS0mj6G9feJZ8/fAyjbDkREYE80fle6dv8eF+FuuHhqWhtH5IL+5iIKarnFoZ05ycvm0A0GyN3qrykKmk/Ui3juTyU1JDsXx3tQ6aOYpP/lO1Pr2CA9t7qlMA0nH0A/8NBxiCWwEASSoMO/PkKgTVd64QQEFEL+IPWSdBefczSsEbwDlnfeGugJdux0RGI2W8jLn6cNybMhjygBz4/hQXgEo4qWRm9iBUuE+cq9IlHYxP8p6vyv0c7rTfpO27FSM/cZzJLb8oa1zBvQUQRHyPYDnquxYtA6tKZg8QGU9plS8Gqg1ZHfh0bU+zBvhGQQU0tk96DwfRLhnHJHDeItWSGrBaPN7/F+C7fLpkLP9+V4aPR1rE0ato6PbqvkSRhQl2rUBzMXBPkvjPdMEcXoFRfE0Pq5MceNe/FdBPE2xJ+FkVo5AP3LQtaSDwh3RAztN/uAFrwi9coblyxX9aV+YbAyJ9xRMehHRWsNTXBlt9Du7u3tj+4kpZaqvkbxUSvQDrILMTaWXLzRIImzyyYJYDglSyH12EHy4WxzJ5HaxvhrltxQIpgwpnoPN7h1VuN3RkSZQetD0e5z5/kh+EgDrIXJyo0IxpjQLUNeYocL/FddOiq/IoPbjUDXsgBsjPTNuAZRJJQ1u0vkFDqg5yTrGgijJpL0qXjIix2/DvE6QyIB7jCRJPu1JIT9cYMItLgL9ag9WRmGi9R33GjtsXDJ+Mg0s3sgV8AijW89qOZfwb31pRbo+SAShNB02JS55rOmWl+xuyDlXx5TCZUzbCkb2jdGvkSB0TiZgSYU8Emb9W9JCiVsTXkqMZKbmoMdAXAwu7Tv4n2lWaBF82ip0duFHa4t7F9M5R5s2Y2FJTzBWptwaKHSc/lWyXRAvPDXRSma7r68ty0KsMSGpHLauv</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
