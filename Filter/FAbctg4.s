<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "FABCTG4">
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
    <field name="ct_theo">
      <header v="Chi tiết theo" e="Detail by"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Loại tài sản cố định" e="Fixed Asset Type"/>
        </item>
        <item value="2">
          <text v="Nguồn vốn" e="Capital"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 200, 130"/>
      <item value="111---: [tu_ky].Description, [tu_ky], [tu_nam]"/>
      <item value="111---: [den_ky].Description, [den_ky], [den_nam]"/>
      <item value="110010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="110010: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="110010: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="110010: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>

      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [ct_theo].Label, [ct_theo]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>w1Mxpby+vPl4D8SrDEM9vlFUwZnFXgd30IEk10aEHfWCm6wJVUvjtYi5NCc4i1bbq7mo9w2Bvd9RuehEEI2Ch31qJTNu3MlO/ItMkIbh/ZRGfJjOTU0lSy//1ej5g8rVEee2oph+/K4PjvK1ltqzNurbw3DZ1xX6da3rUb435mLm3gJegP/UnirwJcQ6xKXSIbXiqwR0ewn218y9Yx+XvX6Kef/5PtnAGn/I1G+qNKoKWIYKAqdBD0fq9PhSEIHT4Wr0+epbadVDsoRP0qHqr7PI+yvRwlY6/K2C1f0Uxww=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>KRhuGVxlao8jdLszGVMujPyWfVFlSGLhUCnu2FA0PU3Tg5Xsg6EXGPqXOvjpsm5KYDF1sDnvK+Aje8Zy/0DmTN3OW2No5DGyZTNBIRMKJXwihHry8oD9FfxF+Bonqk1+UJeTyMxLvxzf+YwHKwOnQ1jmf04H3yxK/7epd2hdT3fGcvZAVFKan8PkRPKeSrP2a2H6hXY4g2+ylq2ABkQZ4JSRFHilYFH8Os73pmzZpp8ROnhz/co3uwDkXg4AbeGT5+pTpELuyfz8Cb0JZpVhAf7Qx6w2UMjUQFlWyGsfrIKXsXzMDom/0bDARDK0LcFPw4BEpahURyak1/LH3S099prs6ddK8o6q3FVMw4wOP8rfjCY6P7deF8OHZT/PLiB2ZkvUQpfoFr6dOhkiprSgp0rieV/qDtOwRT9OoWZv+FKG/KxfMAVjPACc3NAwqtEw+xUfIg+N2tnK8mIPXB7Y135VKHIJo+lFgKGN4wxTV4zi4+xrx3KAemasB2MpURk/1kxtB49LRV2/sCacJ+36naYd2OPzk5R6IOfzAl/TE3Qb+2jZQN6A+C7rW1/lBEpbbLbv/AueDwV52Y52UMm+CFujpEjw6DQv55c9MdiRTjLqe0cfdKYAf9BpNIz6US07GOePzAxRcrrJwGq9UtEYlt7L2+U2qtbcrzmf2d1pLM2Idor76FfAyZEYDICy+GbMCRJ6OgskrpyRVVwodwlsRQ==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
