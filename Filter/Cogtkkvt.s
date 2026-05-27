<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="xcdvtdd2" code="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc số liệu kiểm kê vật tư cuối kỳ" e="Closing Inventory Detail Filter "></title>
  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_yt" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Mã yếu tố" e="Factor Code"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1' and kieu_yt = '1'" check="kieu_yt = '1'" />
    </field>
    <field name="ten_yt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 330"/>
      <item value="11--: [ky].Label, [ky]"/>
      <item value="11--: [nam].Label, [nam]"/>
      <item value="1101: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>8E1McYxu5F16bWrD/bv/T4KwQhncLRuuamaIgvCKQlWaHa5o7CYHlkoXrlLf7ObDmtSEEUBFjNqEGKEIMWbsIT+Yf8uzhPQYklkbpH/bHGL2N72ddYIx91FTEHTS2fgVfetB5ykF/JZ3iy7DAGUuiBQ8RJ0gvuFp7JO3whe6fBXzGVskN3XwdW2/2GtL3XEvzmSpqDn42AJ5OdQUnoKlSKXnRsI/NmytUgrMTRLFEWXLFat3/RlP/uatgFy9988Nh8U7L8/sTl5soNM/eQ0GEomI/Wg+IEMQpWlpmxQxrPjOamsz3GQVIkNlOyYjeNOZLiWR4tCNBhI/cPoQnqRra7ge4A77Bk4yv+K6gp3+Ss8JxJXMps0hrGnB8c5XL5XCeGsUSzZVaBIkUj/yCwJrW9g6QCvyWOPWAQxnff53eHffrj4j1GD11T8H0fAlUvPnNzPTfT5MXg9/Yd8ZRfHczNJQNrDLddJ+IltM61HORELUscYbAPQ011v0GJ6BTK0kV2GOVFZqSgHYpxIhVtXSDq3rgRe0KPMk7pZN+58tKB3r8fICe2gJVMclhdPGBHI5IZZUoO3P9/2vayDWux3dAfhKxqWD3EAlX1SspEb5WquJyePw2bryKHrMC2o6rBz2</encrypted>]]>
    </text>
  </script>
</dir>
