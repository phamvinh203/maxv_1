<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A01119\ReportCircularTypeField.xml">

  <!ENTITY defaultForm "v20glthue3_28da">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky1" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Từ tháng" e="From Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Đến tháng" e="To Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" allowNulls="false" type="Decimal" dataFormatString="###0">
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
 
 <![CDATA[<encrypted>4ZahQOgb8HyVpCZt6o2hOgI+FzZZ3HOTowpFLX1h2aAJYnfSrSmWd7Wd8w60XydVro77aDKeZP6dEAU+JzQgdGTvqSMwvrxzBSo0JzoljCWGCVTLHaiuXWPnJwhpHTjDCk7OprnL7TfFLwIIPtUc2qa+88Rvv3VXtJoNgaNxGUZtgs421xZhIIEg+ka+QlIibA1rUzOkdKIZIuItV6gz/mopjoWyGB+Z2AI9FtsQxmI=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>ZscIDFm2Fk1i37UGcOU087qnrDmUajfNoPf0f5AlMeazArDrC0HV3Uebi7SvkMntaIaGGSbasn88ssBKnAba5tJEfWyjrmiFSDDY1prNDinQBghSe4j5RHbAQ0VmLjcv3C7Qg58lvsb7AopUUlrtHioV6I2HpAVvo2xKxgCHQ2VeA0kOi7PWnmlTe28L43cBB3ATAsHoEOuhnryolqGaSVNNEVQFASokbqUxgDN+xhCLeW6PgM3VV2wfTatY74N5</encrypted>]]>

      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLCheckProcess;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>dVhkciZIa+WkQK9FXdgwKJ3nZLCwnOSxO7rJCeHfCClyZ6RHXi8ED+2IetEjkOXQIMoSrZJfDBrc7aXU0wuuRmcmZTNYb8OmuFcwpw+gJxhr22odV/El3BrB1+dib0ZC0aKKwT0Qg8AuIcn/BKHgil2QkjznUtOyJr05OwRDJRiUPE+3w4grL2V6rNJZfttHMu6VeCuL0mXzZeUNH6Q7+gtWCZ+s/Elzx6D5YUTVpFvZynmX3lI0jwmCvmBPMaX7</encrypted>]]>&defaultForm;<![CDATA[<encrypted>hIkygextHKuq2BRkUg7KaDVdfVFR3M1wZHHxj6ACL4pYA/npS6cCLe+jFXaHTPsua5C0C0DJATH6pRebSGLmZ18SmNgFbdkoQegbncoYChugsM648Z1OrV4b3D6u8/CPVpdzutY9gfbET0nRof/gJw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>Wi9Lhvb7YQp+9K8x/bFhmylf8JjMVGOeM9AwTwio5lsqn5nLbPpzTDlubtGyvEZXmBrmG8qSMzSkBRxmmH2/KH6nUWFAVWx/wouBjWX0+HnqrsQOvoa0cTFdVquVKgM8RgTFOd1YvbKwOFkM91aeFZ1m4RAfzQncInbzv2p53KAEW6vXke4dwPa0HUtF+AJujC+f5WxDAJzvPa2byOPRSf858CahSS1fV9oFYwPzjCh9PjADDQGKvae1lIndJmvx9nIzSLd+uE4+NcmmP/aMEKfyRM3NLQomypvffJx8eDA3CFiotW1Qvb0PAkXHPwkjGeKc/iUkcL9LQcut1/iA2rhJJbgxBFjwcGm0ADE0+TJWmkn7HRn5iyORDOSsqHR6Y8CdcMl4WUSEKZUn3qFBN+kErP3l1WqK7EWtBA1ww/trwy8gwuW2bW2BvSB9qcgBYF09NifFOUIC9/SVNHiXF+xSdN/JZU1YFwKJbXauAsV2VqCvZ1KICtStzomDz18w+rLxZHHvsRzDpf31SBIQCRMantk8Feip1FO65g29x3QlxOrQL3/u/u/1PpuqR7z9f/6f3DSzMBvuKfreK5Tygr/iVUP1r+r16WgmaCZQRa605cki67jwsHmd7zErTNL9sU1JJUKArod1MQIZ1YdQN/iRoNISuukHFhLP+CU1drNkVrAYJOQNCg7N4n/8zaGT+65wklEQyndpzLumkP9xQhcrO47gEoAipmxrWFXs+Zalf3r5yroudQpp6maUaYlMjU9Kp9hERak2G6Otg0k38/txeFNkWvmYqwud2IimiFaJxJHjSiHlXAysW0TPYCNwKGq7NC6D7ofB0f7CsmZPEUICl8IebbhqpMPANFWPlHE6kt3phROhaePM7Fc/ReB8hgaCcKGpkDn+0iQZQ//ysaXf/Z16rDSdytZOCjl1YhftoOgFChyByCMDx+uXLfRlzzgSQnfvPxgg+5OdtMh4cQ==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>