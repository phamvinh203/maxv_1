<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY Identity "rptNetSalesSummary">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY XMLUserDefinedReportFields SYSTEM "..\Include\XML\UserDefinedReportFields.txt">
	<!ENTITY XMLUserDefinedReportViews SYSTEM "..\Include\XML\UserDefinedReportViews.txt">	
	<!ENTITY Form "SOBCBH6">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ky1" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;"> 
      <header v="Từ tháng" e="From Period"></header>
      <footer v="Từ tháng/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="ky2" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến tháng" e="To Period"></header>
      <footer v="Đến tháng/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
	
	<field name="nam1" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="fromnam1" defaultValue="new Date().getFullYear()">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam2" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="fromnam2" defaultValue="new Date().getFullYear() - 1">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>
	
	<field name="giam_tru" dataFormatString="1, 0" clientDefault="1" align="right" >
      <header v="Tính giảm trừ" e="reduce"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
	
    <field name="ma_kh" >
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
	
 
    <field name="nh_kh1">
      <header v="Nhóm khách hàng" e="Customer Group"/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_kh2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_kh3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="CustomerGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>

    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_vt" categoryIndex="1">
      <header v="Mã hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_tkdt" categoryIndex="1">
      <header v="Tk doanh thu" e="Revenue Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tkdt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_tkdt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_tkvt" categoryIndex="1">
      <header v="Tk vật tư" e="Item Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tkvt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_tkvt%l" readOnly="true" categoryIndex="1">
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
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" categoryIndex="1">
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

    &ReportDataTypeField;

  

    <field name="ma_nx" categoryIndex="9">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_nx%l" check="1= 1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Dự án" e="Project"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <header v="Phòng ban" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" categoryIndex="9">
      <header v="" e=""/>
    </field>
	  &XMLUserDefinedReportFields;
  </fields>

  <views>
    <view id="Dir" height="210">
      <item value="120, 30, 80, 110, 110, 130"/>
	  
	  <item value="111---: [ky1].Description, [ky1], [nam1]"/>
      <item value="111---: [ky2].Description, [ky2], [nam2]"/>
		
	  <item value="111000: [giam_tru].Label, [giam_tru], [giam_tru].Description"/>	
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>

      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>

      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [ma_tkdt].Label, [ma_tkdt], [ten_tkdt%l]"/>
      <item value="110100: [ma_tkvt].Label, [ma_tkvt], [ten_tkvt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

  
      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
		&XMLUserDefinedReportViews;
      <categories>
        <category index="1" columns="120, 30, 80, 110, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="9" columns="120, 20, 90, 100, 100, 130">
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
        <![CDATA[<encrypted>ccbh5gHAD8slNnlu1Bz9hzsL88QTXITtnxV8RAeecOEo0lNmJd2tIP/mwasuLU94Ks56RMuAQXvu08KdR8P19DvAPZc4XR5galh0534mzGh+GioC6tJtlt+BdH+uBjWGiEoE4WAKrzLCSU5SV8FaD+aDFD1+0XxC6XGFmzMhk2kPCEptbtS3LNVjQujSR/8Qr4iFB0CPrgSXZtAeYlSSnARKsYrXmTn+5a6TLV7zM2H1MMBDSNSQ8EVVvZ+mLutfrhxTPMsuduCl4ZmNBkMlwtSBSut0muVjW3WQ1oWI6OceTr+n0//kiF4dZWIJy+jj</encrypted>]]>
      </text>
    </command>

 
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWA0fshE0Zv9RjVpwCC+2XBLDF5mDi9lW87JuqALa/wpCuToFquI/KqpLTcPyEBRf4wIoJhbM5OlGbk3P5qDqLwWL71PUYn1ovIh1fMMPqE/+eBpOWreqQM4jjPPdX5IYwyTcyW6/ppESkRfdnzGWEbZyy8MJH4knnqiPEiEEZa99gGj7lFPDbJdHifDUJdWopAH+VvUr1EdPyzDnhNfh6U4XwnZFYum5THFm1Euxt4oDfXLt2tZDcnoh0iPoFkue28o8oeqKvyORVj30C1sU1gfsbGwAos6o9zRjseX5Xw+3/c1OQ8hcE/IQqoKrgYA6Njv9wJ+ybkhc2LALBjKrUPKMOkQraA6RmoG7vBMfpSVeejvEbXKU38jI3VbRGoHl85r4BHgthQeJk6N7pfEryHICMAncHq3ahH2mh2LQfuc0dqNE2iYyvGuhG5jdAIqTBTg/CG8pP9YdNbRMbfa3BPhaZhsiejLzYtDF4WzDicG5lCof0JRQBIF9rnb9KZmU7sl1r1w7qqLcNwRTlvKNg1aa6dXAujrvbF9cdHpvjNyQeUldpHTy6yXCejXY1yqEcq/c0Cu0I34L/wEhqn0WGs1r5hUVgw/4UGCfaMugJrxGbmyCplhXGVdn0QwsQzWyVtra1aVQv6CoVzUjTnsVDzpcmMZzNBDmwptKFuUhk3XLlTPkygDPgRV51LPbTpbEDpeiG8wAH03GowyHWPYZVi027fUBfWEf2hnUwE3bzQJSQXxpN5JRG2zyBjmlK4/XAJzLZ1X9dd+um/aRKgRNtrh8kHF51V5zO42PM6D0fjAXcEEJ0JRItieJHEitowokjYr6XWPiqIntx2g5akbsmr2lODOBRGjVLcO/RMte7apkk3f8XtteaeYOQw5RmsXoEmLT2UfrDTNpo2G2IdI04+rJVfsoES4Rn5uYk3PNI2jW</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
