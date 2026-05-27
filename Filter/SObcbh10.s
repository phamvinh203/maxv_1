<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
<!ENTITY Identity "rptMultiPeriodSalesAnalysis">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY XMLUserDefinedReportFields SYSTEM "..\Include\XML\UserDefinedReportFields.txt">
	<!ENTITY XMLUserDefinedReportViews SYSTEM "..\Include\XML\UserDefinedReportViews.txt">	
	<!ENTITY Form "SOBCBH10">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="kieu_bc" dataFormatString="1, 2, 3, 4, 5, 6" clientDefault="3" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Ngày, 2 - Tuần, 3 - Tháng, 4 - Quý, 5 - Nửa năm, 6 - Năm" e="1 - Day, 2 - Week, 3 - Month, 4 - Quarter, 5 - Half a Year, 6 - Year"></footer>
      <items style="Mask"/>
    </field>
    <field name="ky_bc" allowNulls="false" type="Decimal" aliasName ="ky_bcSobcbh10" dataFormatString="##0" clientDefault="4">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+EmVaRpy8ApP7Bak3O/pJyunilQ+NdTEEGo59XBBafozDqEOr92lsMWeKoyYwBYbQ==</encrypted>]]></clientScript>
    </field>
    <field name="sKy_bc" allowNulls="false" external="true" hidden="true" readOnly="true" clientDefault="2">
      <header v="" e=""></header>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu" e="Begin Date"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="ma_nvbh" categoryIndex="1">
      <header v="Nv bán hàng" e="Sales Employee"/>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_dt" categoryIndex="1">
      <header v="Tk doanh thu" e="Revenue Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tk vật tư" e="Item Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm hàng hóa" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
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

    &ReportDataTypeField;

    <field name="tinh_ps" clientDefault="1" categoryIndex="2">
      <header v="Tính ps điều chuyển" e="Include Transfers"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính phát sinh điều chuyển kho" e="No Include Transfers"/>
        </item>
        <item value="1">
          <text v="Tính phát sinh điều chuyển kho" e="Include Transfers"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="ma_gd" clientDefault="" categoryIndex="2">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="ds_ma_ct" hidden="true" readOnly="true" clientDefault="HB1,E01,DX1" categoryIndex="2">
      <header v="" e=""/>
    </field>

    <field name="ma_nx" categoryIndex="9">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <header v="Phòng ban" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
	  &XMLUserDefinedReportFields;  
  </fields>

  <views>
    <view id="Dir" height="260">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="111000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="111: [ky_bc].Label, [ky_bc], [sKy_bc]"/>
      <item value="110: [ngay_bd].Label, [ngay_bd]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="11100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="11100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11100: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="11100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="1111: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
      <item value="1100: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="1100: [tinh_ps].Label, [tinh_ps]"/>
      <item value="11001: [ma_gd].Label, [ma_gd], [ds_ma_ct]"/>

      <item value="11010: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="11010: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
		&XMLUserDefinedReportViews;
      <categories>
        <category index="1" columns="120, 100, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 100, 100, 100, 130">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="9" columns="120, 20, 80, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
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
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKuvKjAC91BPaEGJ50LHifayZ8eKPtx4468PJdSlJAjV6PVcWF2SzxmXH2KfHWpV9Bepm9NO02NEiGuNtsVRqPV83SkYMApqQhYsWTjJEoUkzh+b9Rzs+w5jd2QaW32FEiRm3u26IjkruFX2+FzI1qHQ=</encrypted>]]>&Identity;<![CDATA[<encrypted>EKdjFQLelZjdmEtUUC8/t/KN8vpY+gxIUkYLjdbdpC3jV+uOyMVLxP9SByQGWs1QVWjg27GmtQq652AQfJ0lUsvvbl9UHJfldvhlGIjN4zkO0UPN72C/k7Kl2ueI6vtZOBSy4CdZSVLS7EMm+2j67rNp4AMfLRFZpPe8ICSJCDTRgucZVJjC08M8j2bPLLG/8XQbz1zaLYa2hV8BDIAyvm4xM1seve+f6hIJEov9VELsNSUDvjQWoyf0Y6QwciyPc6baKWyDZJfUcapWPItsqSC3Xzq9L7E5W74WSAqUWL37o2gR5FSk4GXxZ4OGDhAnxYQUrkKpYfx3jGQ5+ktN5tYDKT/T+FGameoX50KU6/Ysb7SwFg7Q78RRONBWv7qKqnncVAycJA0yIiJoN6IojXKhdDdeIUebj1BhHhEui3yvcOYTBzL5q9aqZvW/CiAeNu88AySrJFVUBXBB/H0k3N4otjBt5G0su+n5+ASYxM4KKexa3xPGhSSJg8G94pgf</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>CBceptDkR1lJWBkjhfaB8t4YVDO6IiMeCEzTHFHRanAkhLTBkcHbRUCzUCUbQUGmU2mtT2ruj1BVKMMtCayrl1juk/1DX+dfSI+CW64Gxgyxte9n7Q8YC87IHM6eOYNx6Gf2e9iENa0KRWU6Xz/TQdcnDe3UDXZKeaR95rvjg2tkaEbJlfvaii4rFeda3rqn5hHnRTg7OXggc/LbySWLAfIxqDzI56cuOY2A7LaG2cTpitOHc0BVhVsbxAkXjByxSAsv5JDS+wKGD4/zBmlNdmi6xgDHZIcz3WM1gohLJF0SzgY9/gI6IAO7Ee+xyEowdWwhdj/URAkiDxyar3lBcH3TAYU7/0p70vC3JIL4+wMr+bOdltTZN2mzIiOjpDwnO/RUwCx1wioW+6aMZp+XIxLt7NuHymkZ9RrK/ff0tGeFW7x93jf4+SnnccKH1yn6BIAQ5xjfV7LX+Ab1TZDHXTntSI9M1gOinztkK2nAefOmk7mPFW/LMJT/V0iJaUcnLx1O4/0a4GFD0Mt3Lo2g4i9qS0UfrhEFj4smIHJ/LEoHe7ZGfYzhHjpSqcLYGfQIgx1Cp6ZAzFNHWByi4Z1h/eVkqvOoMBXnP0aL3H9fnM4BKsM+xiid5us4hdt5YiQsQYdGMKPjqhDueAWllJj7Jb2V7yX7V7a59l87DbARKQzRRUd6pT6J5lS5zWtgwO3/vi69XEFOzf2xT8ZEspxU1PPzN2C3mE1AbI/RVArO178BtLNWz8KkUP2df/Nd7iUVjpkxjo9STdOXIDBDOXOxK+TWHPjBqKLh/Krrb/8oH2vcYdI8u2ncAffoDyHgmhYZ9U9r1TO/tlaDb3qn0OFio7AmtiJRc1zTNKuooT8JgzeyexXYFsE1/It0KlDY5VkQKZWkpP5ih/UjYLC2yXV+3AyAxuaZ91ZcjB7c258STNn0LG2v+sfyYCZ8RS7tBcIbb6TaND2AaOQOFv3cCfYgFQaetBcISBq4K75MqYUnGdoUcEfAbW+qb5sW0eBoPXkcgl1r2gBxHzqeGaswKGRWGXzFSfPojnQ9GHuTtjMh3P6TW+TgaWjcg/ng/m//e68vVkavp4KTiob1QBxFUW5163q+Xhy8YlCe4L0MZJxOtJ+N9phEMazO2dKR92FJVAJ0AmZ9onU8m18kVjtIcPpBZ77626faosUJiELcQ6JDNNh4NidmNlpFPbpJFHWtYDmmRBTyouacNEkRLB8EVqsluhalszO91xWV70v1rbvAtXCQiXiOzWQzJmWz039/AnL0Og/lyjfiGtLAQ4bGPGZqdR6cqRR7dc/qVENkYajYAwLeJkqjFnCAFwgg1YxVfGpG</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
