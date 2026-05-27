<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "TSBCTG1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="tu_nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year1" defaultValue="(new Date()).getFullYear()">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year2" defaultValue="(new Date()).getFullYear()">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="nhom_1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="type" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tăng/giảm" e="Increase/Decrease"></header>
      <footer v="1 - Tăng, 2 - Giảm" e="1 - Increase , 2 - Decrease"></footer>
      <items style="Mask"/>
    </field>
    <field name="nhom_theo">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList" >
        <item value="">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Loại CCDC" e="Tool &amp; Supply Type"/>
        </item>
        <item value="2">
          <text v="Bộ phận sử dụng" e="Using Department"/>
        </item>
        <item value="3">
          <text v="Bộ phận sử dụng - Loại CCDC" e="Using Department - Tool &amp; Supply Type"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111----: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111----: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="1100100: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1100100: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1100100: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>

      <item value="111000: [type].Label, [type], [type].Description"/>
      <item value="110000: [nhom_theo].Label, [nhom_theo]"/>

      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6inE9H+FbWdGTTq3PfO228aI/cEqVfb0FHxBb9DgKEDsEP++v9Bo+iJuNc4nmvcLZBSSVqocPleMIlUu2/+kZs+ybgkbFN/MVE356TnNoJNpZRXw5V6gp+W5DEffbfjLWdPCn/uTfo71KhvjmMS5IbVEPxaczXWtQ5ym+sSVjbvcnm6ijshw4R0a+ZHeZOIgo9LOLxnuwDShEPlvDCspBy0vkxy1xt8J3BEHiwOHFoZP4</encrypted>]]>
			</text>
		</command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>0VKmfwvrBk6PmyZ59x0b3cNbTli8l1cRGh5YIaAnb5mms+dNNUQaW0s2c5vKj2MAvp0T6mkLIaBQ5hdfw5hcn8u08zC9egfqakvJBou6DCmxFnH5F/1JxhVx71E7S75i6f7zPqCx6vRtBbXUEmYkxwYh7s/y3MsL/oEgjFlY7vm0vISb2aPgUntFfGVfk7CrKSbhioakmfWrIPs+KdIuPWq6mcNbdEkOH1BAW2COwNiOlEGxg1yHcu9ckwIRSd+GTI06HzTTWDLCem4LLH5lXDzsX2OCoOQcQ3Uj46RwMfQRrpToZ/ZsyyNYy/XPHgTI3lMNWe0xmISRfvhlZ2JH4aYDen8v2Djs6SCCUUEBYGA=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>KRhuGVxlao8jdLszGVMujCnHgvFcRHDel4dhfipGBRMqTzrzLyNWioVsB3JdzLdxw7GNmGrz3NIBotKxfwhcMTnuODGgd/zpKQu/vr/WBFXVS+AtEALJjqIvVRKepZJnqU/TXIx/EOZCm3e7b38DcF14jt/gFETQ+GcQ0kH5O1WU5vZabPWzkwY8hckVpq7hE685YJqJraMVTVqvGRUYDWz4UxtnywR6J9P1YGYkBGCakoGrBXgoo4Rf44bPrVD90uk7lOAcD7MK2jPhgjyDlOBxWvsZ7yCBuGEd0w5Aok8GQREibJcVnwwiuqtUH9ap0oruVFdjKO6Z9ABfVrso+d4mDkidjDWmMlxc3BB3LbNEW57oZ7GsJrTh6wK5mjadjbxJ7tcOqpYO6abasvY8X9hJjnFBOxxtmtuP4gfPGce0mIGvZ0lkRC0Ynj5AblrxS7EuHlKKfkL2cr1WgQ8MuKbU9GH/w20DIO1F8NgALBBrSzcRCNeb+oliPZ5KxGAy+gt7oI09E/pBwbG3rte1/GUJLw1/8kMEHdwmiqMpshsxL6cX+kGTYYz/TR+KGJL7vU/6a74JLdriJgn/wG5OYB5/fOWxx33vzt0A4Y1z6favWrZXadeQIA+11UOC8vXur3gnorvRp0BGVFspZO+HfDZ+UQnX6nJN5oiQFacDDOaehbZFmG42TjYmJ+9TDBkw1UzwXXhbcpV2vzMZzNxIsEySXfN6eFoprVMAhJuQTORnUmCwVgcOCtTKeAToxyFjZ1smUU4nGmz0xJW7q3nEXQ==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
