<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CODABC7">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Voucher Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_vv_me" onDemand="true">
      <header v="Dự án mẹ" e="Parent Project ID"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vv_me%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vv%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="kieu_xem" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Xem dự án tổng hợp" e="View Information"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa40dobUkFaMH2mSas/bDifVYTSQDcLdLvb4VLM4e92CJ1UILouahv6410NQdMPp5/BQ==</encrypted>]]></clientScript>
    </field>
    <field name="kieu_nhom" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="1 - Dự án mẹ, 0 - Không nhóm" e="1 - Parent Project, 0 - None"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 75, 105, 105, 110"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
	  
	  <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_vv_me].Label, [ma_vv_me], [ten_vv_me%l]"/>
      
      <item value="111000: [kieu_xem].Label, [kieu_xem], [kieu_xem].Description"/>
      <item value="111000: [kieu_nhom].Label, [kieu_nhom], [kieu_nhom].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>CQbpEaIJOH67+FB/QxiH/bVF1g/TEjN76EoKZP2MzcZKq5nG+aVi5sW8v7pwCbNyridDoTVGC3AjDEK0ZTtDpAzZplmhMXVhd2GXhFarNyOZcMyg6KSMkwdwCcrcTFqD+/5VyhffQlRRT04CXrWGQzaMrYZTHi+JLuLGWrywYupIAqDDaXNSkRmZZJr/2jEW</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>jAM+2OWNong2bHD6+883qt7nZ7QzHBDQocCkgVoMLxPetebHiJamjv7iI6B66eDvADzFE/Zjjq3yuOZgl6BwFw8jaAZL2Gk39h9RSjZ9nA8CPq6H8q7BFXtNsRTyqeLwdlDwak6PSc0hcEBUiZsj+uwKOm4HAmp7NKljpeft9n4Lf2vWHC0pA1aHzoQErC9CPshbgFXj73MHXHYhKD4KlBl0eWNAk/goHzV3igUaUe5aHGxZdOkWCGzfl+YTIkFprY3u9sjDgUIaQtqILtcSk2KdrA/EH33AVv1iZvfulTMQUctoeX8xvbUSpB273HkHrb2GdjbV+dePmX/LlmJZtzqKxkbv5Jxr5yIlEB2MIhu3QROoxifSt6HKTc9IiVJkYbj+B32+JAWAkCHZlHGxQdAxpqDNzvnHk38VuMECA5iqaLCySkPCV0hbgtDqTNKjNMvQTNqKQ9q+ZULAKUrf9iVxTFormjRzOil/YTVruMHhT7dXWyM7RurIu1qBD9cJZR7bhGth1e4S6bfFAu/gZJCo3YsjSxj+dxfY8SeSY9cyYPlNLUCTUJcwafZVJTk3SOB4Q55QyxhxLJliD2Sqt9xUrjp5F0Iw9esA25nV7Imo6uujRDtVFyEN12sCRH+DFJSwtIYw2T0oRLCSmis3Z6e9aRH/cbhXUOkbZpeARDxYXrSesgCtUz9VHiQfVrlfe7ox9oa4DWmzeQcat6Wsrvc6b+vxNTy/MqVBLyLc/MTYP5GKHyvhXGhpKoYTkkp9ftcOv6UJgoU0sIJJj4UxbREnvChtOHVC5ncrB9Kz0qC19Qi+UL1478eJ3D+2k4mZFY3JiQarUMpf0aCQrnwa0gDTCJ6gr7qA+mvrZBBWzuAYSC9cB0l6+ZpPCvAUoo278vRqlkQ6htd/QrBks8/xng==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
