<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Sync "EXEC ps_ConvertList @ma_db, @type, @ma_dvcs, @tu_ngay, @den_ngay">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Convert danh mục, TSCĐ, CCDC từ nội bộ sang Thuế" e="Convert List, Assets, Fix to Tax"></title>
  <fields>
    <field name="ma_db" categoryIndex ="-1" allowNulls="false" clientDefault="Default">
      <header v="Mã CSDL" e="Voucher"/>
      <items style="AutoComplete"  controller="dmdb" reference="ten_db%l" key="status = '1'" check="1=1" />
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4zf+cCdyAgFd/lIw+Ok41qmPUbPuNkLh+FXcXYOivU2f7OJ/OKWq3G8Xgr31sKM+sg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_db%l" readOnly="true" categoryIndex ="-1">
      <header v="" e=""/>
    </field>
    <field name="type" clientDefault="1">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Import Danh mục" e="Import Danh mục"/>
        </item>
        <item value="2">
          <text v="Import CCDC, TSCD" e="Import CCDC, TSCD"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4875JrCbhJvDO7z4RNM9K6hdU3unsbnubUF6og2nmdO6</encrypted>]]></clientScript>
    </field>
    <field name="ma_dvcs" clientDefault="Default">
      <header v="Đơn vị" e="Unit"/>
      <items style="Lookup" controller="Unit" key="status = '1' and ma_dvcs in (select ma_dvcs from {$%c[ma_db]}..dmdvcs)" check="1 = 1"/>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ ngày" e="Voucher Date from"/>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến ngày" e="Voucher Date to"/>
    </field>
    
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110010: [ma_db].Label, [ma_db], [ten_db%l]"/>
      <item value="1100: [type].Label, [type]"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7aKcie1BCE2VvhhFSnQV2ktj8/+XxPoj1ESMgLMaKXiaUf8ZCNA3ZjfS/SFs2YiGlp2Aj2TfQiBPWzofN0zBlWctE50IBvAiCu9uG1AuvA/b</encrypted>]]>
      </text>
    </command>
    
    <command event="Inserting">
      <text>
        &Sync;
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>0lv9qcnppEsynmvIQvoBTKPbgmzmY6NUCgJur0x0NyqC2yPo8/a8GrpJ7A4NfDuB9jN98X0mLRoEO3Ihi8De0GXvM0L5ulWQPvZXhUlPfM0bgeNN3fGkO3qvoGbtOSIJ7J61/LgGtgStLZgD4im8FXkwmJh2OQ1Y+RYU9glRce9uGaZZ1cGEfo0JLrcKM9js3NjMEKuQ6HpGk8gv8t+zNmE0hA6dUMpyoLqkAHovTy16mCviy/5lHCSLQ70ZmIuU6xMWLJ0evrDpWX1zgGZhl6onBCiDdGsyHgbYZs/l7DEE5gs6NwJJtM0vAQBPfqYT4gUhss09TGbpYgXvca+yQryiIVWSijD05RHidx64FNCBc76xAHbiJAvwUm0g4afJ</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>