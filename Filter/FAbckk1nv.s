<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "FABCKK1NV">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="dau_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"></header>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_loai">
      <header v="Loại tài sản" e="Asset Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 45, 30, 100, 100, 130"/>
      <item value="111--: [ky].Description, [ky], [nam]"/>
      <item value="1110000: [dau_ky].Label, [dau_ky], [dau_ky].Description"/>
      <item value="11001000: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="11001000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11001000: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="11001000: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="11001000: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
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
        <![CDATA[<encrypted>Z6nNxH/JYRfXRA+MJ33fPA9vJUvl1IqwVNSzRM0O+vhnihjSUcPeK7P6bdxY0eQl/bzI3edtWwpmLyw16OuTeLcQ4BdVusAZOuUPBnr9ksl9Z3z+5y47K+gU//WlIKZBzGnxXKa01z17anDQfRo+TObsWMoZ0yhboqNEBo6aNlXJgPLman6QovwtvuNXsFEWHQbwelDArBsU+w+YmpuxEYmUfJMsvLg0yfWVBUvUOffUO7xhAjrL1o11qLWhM+ezRXkyE5xVVrvY9uK+X2zH3W3Ot02XHIEVSHTNK3CIzHIOx1KIRRGEDkJuQnqkNqQPvmuMs26Dpdnzr/QFUfcPuaPjvTFpCyxb88nZBdgexDPzMX22pyK6gClzVXROYuArPhamdzCJQhnL2nfHygLnrQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>oYvfojAxniijv7xeESp1nboRBf1O59quDIUPLk4h1tVO9rB4p+PcLZvz1U8QNF9N/AJ7R3an9SFsl4lOMmJp6VlOQnDKCbqmsyxxrA6Xk/3Rt8/EMQEdnidlNFfUihsWh0z/C3IYIsTggqzUcERk1ScAsuVJ6/NDdlj8uBwVlsrMs8fWmK/wvxrIhy/qgfQTX+c9w3gAHJ8sWyY5tuI5E+jNuPDZq7uQgYPTT4JALfqroUNCQz+Saeqm7HtwAWDRn5cMZgo8apw3dpC58SU8rimvTfW0qzpmjxJs1u2Qy0pQeJ75qmV3P4sNmuJPD7ipe+9aa5DhKefV3KR0Kx4MG4Nl3venmW8QO2s/6FoRkc1cJh/m9HVaSqlvCvr0A8EGOO+QiiTJebhAk/EdGkMzUSBHgR5ykJ/N8OCAvWb7rikYccnakqU/E7bX75pERl5HOCiA4LmikYE8POtfvjCRxAbjjXrz3w9sb240Q+uOp/b90DnJTryZw2Q99/b74h+rvEVvJ9Z70N7PzzBbqB16PQRXWW4jNk+8mm8Srd5CvLb3AjN3iPQkEj3JZ+x8QH/taWmToNJacsywRq/ldhbpiREfc1bIcr7TNGg98CxIsyN0uW4g8vqRqHEJBHzGscXE7JsQcrykSV//PsNeGVcc3eAow/0l6pxVNJpRwma7BKqLeXBXKdfzC/4eIQ33T9li2SpsT5UwvbsDV7b/WzaZK9EeKM4JicCxyO6uL6vl7f1oX+AA/57+PZRlw5ETczUa5fLeIOSa2g7wtwGPVEWejsewVUC3eyW0F/9yr5uf6TE7UcLHdla0pQ+JzFsYxM5p</encrypted>]]>

    </text>
  </script>

  &OutlineCss;
</dir>
