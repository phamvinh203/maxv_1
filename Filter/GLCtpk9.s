<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate4Unit.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Bút toán phân bổ định kỳ" e="Periodic Transaction"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()" allowContain="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" key="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1 or r_access = 1)))) and status = '1'" check="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and (r_new = 1 or r_edit = 1 or r_del = 1 or r_access = 1))))"/>
    </field>
    <field name="keys" hidden="true" inactivate="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130, 0"/>
      <item value="11----1: [ky].Label, [ky], [keys]"/>
      <item value="11---: [nam].Label, [nam]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>sVV0XVRytihjEQAw92yQ4EeXLdJ1Vr4pPfbzrbKaOvR24XSPx0C7ofixE9EYHOhuuAkh9mY5sf/HnWYi6aq75AKQuggWPLGKH/LM6dEp3AE=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>L1UqQpsgEn7QV5WHb6UGeN+6cNtk9pJpe+MBG/Nz9c3bswBlJ1GPefwPVbwZN4eRG6ZJNYqhC90y7wanJfYlQx0Zx9vROv9i9gtNWqAzUT/nuTh/ozqVIp/zpm5CZKBPhc3Uj5MQtFyeVUwLuqrLOLAv1a4T3dEquFo5dKdITXcBL1SINWtJa6oJoDE0WnOeZTDZcMLBKqKpwH1wj6IZN6BlVrKdEPhPMFpgPXsa6Alo7eOgC8tlDH4msjT2/3tfRYLMyCwbQZHKFOiifZZG6M/C2CTX6qT5bB5eRPRStMYwRDJc/zgU65DZf0JA2qRq3nu6aZPDBoz2573IIgx0gt0C6/qcf1x5dXT3QnJQP4LLhosP3Y8/GsU2OT0k3/FIa0Xi1ESjRmV50Et2PdiuqeotGykg4KbJHSPM995HCHoJUjWf3+vsYfm6/MR/h9mXFjRTHe7L71t0Q48Hu74JF0PWOJrgOsaavP77QsWDvXdI0KrQdw427dz2AuSSDZNXQMTVOHVLGBcp4Uq5lgTUzS/2+yPLA7l0jyhgpgEj4v5+V3FNIGtpjs1ZTHhB1I3CWMYvfaTq2tyxeD9wv6J8gGfz1vMAFv8mYUbRaNAFFmxUrNnBSxvYUMNrllN9CZLDjIBnHpYO282KxnBSizFHLpHFleS2doKbkg2/P2diPnEJl0iUhlp0wPMowSQY+hZMn+D09ob1braA41At0CikNQmQABikgMWKkMAV+sQBd+EJHJZffFWAffKSakA2LSg2dDlwrhAVuHiygZ7gYLpxfzUocsLhEs176xMeXpdcusumxODHirXM5FrQNAkUbTh0kjZ2LBPJQS01P8zBpcj0u59oiYVpbJs+1KeIkdYUUq+d3MaeQ1VkUVCX+wTHSTJkTuhVcWELMFSobVxY9sAH3rzcWtYyTKTr4cy/MPo7ofEy4ULYBJr8x1JPAswMxkBrw6UuiLv5dYCtH8KICFIhuW5vQ2bfGqaecJjNVOWUQyk=</encrypted>]]>
    </text>
  </script>

</dir>
