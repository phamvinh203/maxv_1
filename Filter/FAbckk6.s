<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "FABCKK6">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_loai">
      <header v="Loại tài sản" e="Asset Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="nhom_1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order"></header>
      <items style="Mask"></items>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="" e=""></header>
      <items style="Mask"></items>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 25, 25, 25, 30, 70, 100, 130"/>
      <item value="1100010--: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="110001000: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="110001000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110001000: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="110001000: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="110001000: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="1111-----: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="11000000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>eB9CJmEOD88r+3mmJmsbLcg5nCpA95RXZkjTU2h9uo7s4rUBhME6+w/+8dd040vtOkfTpme1gQZrCJPJZgkamilFvsMRoUUO2AxMh7sMg0NnmK0KXygAbf3sX1r1DNSRjfgTLusrmAcFCJ/Zos2zl0sTUeZekxGpondByCw61tLUe+wzBr3MB+pQ2esI0Mu0sENqtk2xqFlLXT3ME9ZiZHfFOJ9UB3Cd5DIea1+a4XBvdCBgUsb4Zze1SQRQUEIXJiQmioNOlg5pKe0dvKqWYgaH3IAH0ZOF04bm+HRMOrDyDUlZvxs7GeUm4FC91FFX122TBLzYgPaDM7h22Url/dnUQGIhLuNHVnJAFnS0ccudTuwgIIpXLxDOnK1cfkqkHXcdVKS1YkL1P4t5M+gQdQ==</encrypted>]]>

      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>9XZS5blo6O2J4yFjjf95EbdAItwJgGWfYJNatEaUobyn9/JX0lVRbl2WvE5PTyYT9NWmmWAZVEvlwuRqNy9T6KZKtrIRKYz+U6Rhgzw0q7n04HK9+7LRFo1oHoObtoZq7QitzudHNMmspuTPgUwcQdQBPO/waecru+vyLH8/5AdtHZPOom8iqSVw5ibJtbXgBVLwUkV314jTjum4XMO4UYPkqce07/3cGiRUkkTfxYASE4IYCXheGTOgTk74EjDZryJPPXzeEU5a50ZeGQXPpBIFqmr0O1EZPMrGILoZ1alxGpuUXLtLOlViATHGRpm14QGYBwfoH38XvBJeEsWhNidI8PffxVJDVA3GDR44415BXRpCF0X3fepZiRR12/JV</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>Gbouw4sllsNlbpYPHkxtAigMSgrCq/nwk7/GAyAGo3EJxTvGTdVdlow/Gcq7Hfs/WSJmNGjB7xWaXb0vHlwbApqqIi4eCJjnOoKIj3TjYkMVlLXRojmS53LZB9BmXJabfUZlpmoJSUcoQLFay8C6EJ8WwUE6cb2zaeL/smAP3tgdup1DnqkfZYVHzpAK5srqHHpV1Dxr06mB0dhZ+XgpPaeN1Y47RHGSYVnvjZ9mUEwtMsHRLvfULCRlPIGR8o2fFcjfw91CoCQbeag55KiCopPMe1Kkab4deP7FMSCNIjgKHqWNZefvyWyEBkU9eIsOafVBvvvtNe3NjmUUzg4PCmv8g7kroHm1bSwfShdhCyOPhl1v1a1rWZ44Zh250KUxNK2G3H5a5OXCbkJMtrxtZfDM7xDcFN+pn3cE3uTrb++DGq/SHQ9UTbW0dT9JfdW/DH4rrGOLsdUv9Gwd1HJ6kD/rqrz8/BM4cLht6TaSyoW9NOBDK4F+2hKNdjvyTfWkZMRzfDfh63yFc+vtXyKsih2v9k3hlgaI+upP4KgF5Xp8mryj3+2TRj4v6quEVXlIwh7t5wtY7wQ8YhwB+vQNWqj/hxj5A3rSACYyrSmo3l8pIiQY+l/t8MWa+wndL7EzszjGLH2611wNmMbg4+4dSVAe1lxr+5hEN7C5jhtaryD+XjGiMrwAsvcyp/KY9McTmgdGsEvOw/iI5PVW6mjHXg==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
