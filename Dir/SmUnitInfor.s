<?xml version="1.0" encoding="utf-8"?>
<dir table="dmdvcskb" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Thông tin Công ty" e="Company Information"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Đơn vị" e="Company"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1) and status = '1'" check="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_so_thue">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
    <field name="so_dt">
      <header v="Số điện thoại" e="Telephone"></header>
    </field>

    <field name="tk_nh">
      <header v="Tài khoản ngân hàng" e="Bank Account"></header>
    </field>
    <field name="ten_gd">
      <header v="Tên giám đốc" e="Director's Name"></header>
    </field>
    <field name="ten_gd2">
      <header v="" e=""></header>
    </field>
    <field name="ten_ktt">
      <header v="Tên kế toán trưởng" e="Chief Accountant"></header>
    </field>
    <field name="ten_ktt2">
      <header v="" e=""></header>
    </field>

    <field name="ten_thu_quy">
      <header v="Tên thủ quỹ" e="Cashier"></header>
    </field>
    <field name="ten_thu_quy2">
      <header v="" e=""></header>
    </field>

    <field name="ten_thu_kho">
      <header v="Tên thủ kho" e="Store Keeper"></header>
    </field>
    <field name="ten_thu_kho2">
      <header v="" e=""></header>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  
  <views>
    <view id="Dir">
      <item value="130, 45, 70, 115, 215"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="110: [so_dt].Label, [so_dt]"/>
      <item value="11000: [tk_nh].Label, [tk_nh]"/>
      <item value="11001: [ten_gd].Label, [ten_gd], [ten_gd2]"/>
      <item value="11001: [ten_ktt].Label, [ten_ktt], [ten_ktt2]"/>
      <item value="11001: [ten_thu_quy].Label, [ten_thu_quy], [ten_thu_quy2]"/>
      <item value="11001: [ten_thu_kho].Label, [ten_thu_kho], [ten_thu_kho2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>Uh9Mw8Kb+VTg7FmOLOrGUUeljrByPoEGLkdLdalJbpG0TqsHzV5dEVXup+eJ5w3fSpliMJsq6JidWUx7Xr5o7EziB/yadq6iPhZIY668ALjxkZHKHMUb1VuPSc/n1Z7B98rR+mxB6nYKlseI+QO+8LsS5e8r8bro+Z4EXlJGiyaZGOHa4e1631aZIoTzj5B+9LSpqQCtdU/RGF1Q46fej4z7fhz1ZXdXCcELjiOIvES3ybjkFZz1/XNvuJ5T5mYMbfd/gBk/IGLvaBpQS4YsM3N/FT9HpjpHwAtMXVz/E7jqtroXa9lu6NsIx3rOk9EGMe5a38/h4K4qdsw6AuGYE05o3DErDdbLdQ+DCJ2MqU2FfRIPPHnqx28WkXT0/LEqUeestnueYaOEoPzdOk6VOmJV+A1knISf9zIslUtPN/FdbiMCrfC3J/lcHM9d2vcIQFRIgQqlS5vc9AVTKH1syw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>ri+364tP+6LHPexV+72EVTT82An0A6Z27ucvzzQmLXzYY4vGLCr6Idye6cSS95g1fNk1X2It4+8Eho8BqqLv65ksi0J6t+SsnY49l2MZ2hw9uNkzBWG85NijExmjMTX/ESClQqaAmoZNMshjClI0rM+eROB5cTEOhz/Tj2Z+E/WowM+o6ERfPTPtzsvqPqZIu4OzdDq5bNqaD0ebornGUDiFhsKMFKEMVJDH0f4dvFqGzplGXUzTNTjsILP9EU3R</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7W8sRAx9nzjDjoENJr9GgRheJAuv/Dw6LYanp/qb0c2EGvX3+9N/rO8emZMUyNY8wQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>sqzHkwN8pNxbrcExkQBU5JYGDGtz39W/5rhKPvwS5sTvkcGP3dR+4o3ZiXbA4LB7zYVfNAl5ocjJqD1HIbp1QH5PXffZzMO/Dw5wv3hrSbGOsjZG4huk0qZbF8gOl6VPz/99xFch4SHAowwXnUv148NP7/qZ2Qgb1c480T7jy0isZWAsYxCrfCAkLI0LB+YkCc6WFm5/bJbkT5PDT9mEe3d/5LKNUQcN9OpFV+d32cwzIZxDEsmNRbfN2xUidz/BeF1YmBtROAkWq2Sz2LTaQODaiADWw2atkHAARY5Kmng=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>LcAf9w0vdNvFZFm+wNndgszH6twx6ulxmk8BY11jkFTdRMa0KveJrzRhoLDZyHJtSAoPP+7NAeDguXzM+rxM7YTBzHSIwJxvpCTTp46d9lvrJW5mcxUOlw2UxrnNVldsiVRA4sQsco+dSNuGnBD2MzyWounA7j9RXJSdwQWuang=</encrypted>]]>
      </text>
    </command>

    <command event ="Deleted">
      <text>
        <![CDATA[<encrypted>KD6BS02JEhvKLIIUhnYRvAF4fNdbbCrNFRO04UW4txF6ZeU5/cyj4RQ5QLxbCp35Bj4yehV1WMmsMj1UT390nA==</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>
