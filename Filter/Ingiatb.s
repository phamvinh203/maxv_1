<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate.txt">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Tính giá trung bình" e="Calculate Average Cost"></title>
  <fields>
    <field name="ky1" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Từ kỳ" e="From Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Đến kỳ" e="To Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kho">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh" defaultValue="''">
      <header v="Nhóm kho" e="Site Group"></header>
      <items style="AutoComplete" controller="SiteGroup" reference="ten_nh%l" key="ma_nh in (select ma_nh from dmkho where isnull(ma_nh, '') &lt;&gt; ''and ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)) and status = '1'" check="ma_nh in (select ma_nh from dmkho where isnull(ma_nh, '') &lt;&gt; ''and ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1))" information="ma_nh$dmnhkho.ten_nh%l"/>
    </field>
    <field name="ten_nh%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_vt">
      <header v="Loại vật tư" e="Item Type"></header>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1" information="ma_loai_vt$dmloaivt.ten_loai_vt%l"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt1">
      <header v="Nhóm hàng hóa 1" e="Item Group 1"></header>
      <footer v="Nhóm hàng hóa" e="Item Group"></footer>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt2">
      <header v="Nhóm hàng hóa 2" e="Item Group 2"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt3">
      <header v="Nhóm hàng hóa 3" e="Item Group 3"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="tao_px" dataFormatString="0, 1, 2" clientDefault="1" align="right">
      <header v="Phiếu xuất chênh lệch" e="Create Issue"></header>
      <footer v="0 - Không tạo, 1 - Tạo khi không còn tồn kho, 2 - Tất cả các trường hợp" e="0 - None, 1 - When No Inventory, 2 - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_cl" allowNulls="false">
      <header v="Tài khoản chênh lệch" e="Difference Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cl%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk_cl%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="kieu_cn" allowNulls="false" clientDefault="1">
      <header v="Kiểu cập nhật" e="Update Types"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Tính giá rồi cập nhật vào thẻ kho" e="Calculate and Update Stock Card"/>
        </item>
        <item value="1">
          <text v="Tính giá rồi cập nhật vào thẻ kho, sổ cái" e="Calculate, Update Stock Card and GL"/>
        </item>
        <item value="2">
          <text v="Cập nhật giá tính vào sổ cái" e="2 - Post to GL"/>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="130, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_nh].Label, [ma_nh], [ten_nh%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
      <item value="11011: [nh_vt1].Description, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="111000: [tao_px].Label, [tao_px], [tao_px].Description"/>
      <item value="110100: [tk_cl].Label, [tk_cl], [ten_tk_cl%l]"/>
      <item value="11000: [kieu_cn].Label, [kieu_cn]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>CsCLefXR7BTcCiTbxnu/xxirrEhx5+EAst+Tnmmwlw89adO7VOAjJ1DfRZxkp19N9bMgZj0EeDzcR5uXLhiomoWtHVxejO0QQsiKMCQJYASQcoOjN9AqVdhv9i7cS0XJmnljyU+o5Df8x1Hp9xtbsMv2wojsoisEbwSW5nDtUBWtPUeFYl5AAo9riYs97Lo//KDJjhzvKm16CPHFCjiiXaJ1RqSnuIAWMS5K6WKIbV0Wy1ytgExcg40GPSDE298YDY08ncn+0AD4xSZ7bAJMYGux/6dlutWzof9ywQWdetW8oRbdMmnh+g5+WKgw4GU50a0lz5TjQP67ALSvYZMMLGQGKhZipzLxz47W9CQHGU3FzT3h8Wg4nDWL8dq0FwBw</encrypted>]]>
      </text>
    </command>

    &XMLCheckProcess;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>F/DDqpq8NF6YAviIRy14AGFHz8NzEeTIh3lIiH2tsjCmztzPKKp6+IcDHZl2++ru8+XLtDiUJctPGwVWKVf0bhWiNxOjIMPuD5Pp3RLgQclw4x28SmMsCE2orT5jmsyfvK07YIsqXfVn2cmTgUwNN56kzMID8DrT5Pi0/5tymtdwBJcXSkosRPLK5XnqvUpMBEx2Ri0OyxFKfsPt1Wm0QyYVg0UrZjGfunOfeLO0oLPdq1Z1b/tOI3mPgoLoRmWvXfP+q9IG+6gBGUMHkeprVpyG5g/14RG8/JE1pSoEOWcv+K9c6UZJq+HbZcPA3TdOivuXm495V4VVb1ZOVDApo7QFVu6wUO0VLlukg4NJe7fG0mBANdgiZ9GVarppISLL8KAH8RaQsR4/ZVRJzojoxJ9N7Y9wZUsz5f2xL5TRwe2GzeYCbK/ocmeJndJfdW0j2+z8yiCjV+xZWrOboMRDcfmlGzYy6rcgJgNj9RyL+wLE7rbDZdrg4D4Vt2pQ4Fgd35KMgovy0t2TxBSHCGIgskW/vGm5mlaKsgF6jD0cM+GYaAGfBJjmvJlItzKDEbAdcOVE/rc8WmBHDq/pD7LgYdBQy5weJPpTmu8hPg7HugoOPx28qm0s0ekliIrURsJIo+vaiTXlaGq8j6HOc7MXWDI77tNZTAAmc50AZ5AzVKI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ZfrHIeA9T6FeEReHVwdXnyp2R3ZD5/8GchxA5IfUPy7zO5IZ3pH3ua+SFBGzwusJBtkji3u5faiFZhoy0lg7JqQq55dZ7FnL3T/j22yphAFGhz74yxiRV5isQCT52wjM5zvAKhl54zZbLbJacBIeSEoqCKehkDeUodngu8ujz0ZvDT7FLlsR0Dvdfxbr1my5o6j4sy+pA4X1Wbhv3fjqxo9nWK8UaBpazDDogZHQeiNnOwiokAvaVRlRomXQ3oWDN1zZPRGGrvV5JD41kmZYDyBWBu0Sz1REpmB1R31olXVi/ZAIpgFskQUJ7krl8Y7gir1IErvC3dOrlAN51mZZV4yiu6BwWWe0Pv3z7qMS7SmtUKgxg1pFveDkzKiIYWFU</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
