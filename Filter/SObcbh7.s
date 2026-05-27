<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY Identity "SObcbh7">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY XMLUserDefinedReportFields SYSTEM "..\Include\XML\UserDefinedReportFields.txt">
	<!ENTITY XMLUserDefinedReportViews SYSTEM "..\Include\XML\UserDefinedReportViews.txt">
  <!ENTITY Form "SOBCBH7">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ ngày" e="Voucher Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến ngày" e="Voucher Date to"></header>
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
    <field name="nh_theo" clientDefault="1">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Khách hàng" e="Customer"/>
        </item>
        <item value="2">
          <text v="Nv bán hàng" e="Sales Employee"/>
        </item>
        <item value="3">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="4">
          <text v="Mặt hàng" e="Item"/>
        </item>
        <item value="5">
          <text v="Dự án" e="Project"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="ct_theo" clientDefault="4">
      <header v="Chi tiết theo" e="Detail by"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Khách hàng" e="Customer"/>
        </item>
        <item value="2">
          <text v="Nv bán hàng" e="Sales Employee"/>
        </item>
        <item value="3">
          <text v="Tài khoản" e="Account"/>
        </item>
        <item value="4">
          <text v="Mặt hàng" e="Item"/>
        </item>
        <item value="5">
          <text v="Dự án" e="Project"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_nvbh" categoryIndex="1">
      <header v="Nv bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn=1 or nv_yn=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách hàng" e="Customer Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=3" check="loai_nh=3"/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_dt" categoryIndex="1">
      <header v="Tk doanh thu" e="Revenue Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tk vật tư" e="Item Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
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
    <field name="mau_bc" categoryIndex="1">
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

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

    <field name="tinh_ps" clientDefault="0" categoryIndex="2">
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
    <field name="ds_ma_ct" hidden="true" readOnly="true" clientDefault="DX1, E01, HB1" categoryIndex="2">
      <header v="" e=""/>
    </field>

    <field name="ma_nx" categoryIndex="9">
      <header v="Tài khoản" e="Reason"></header>
      <items style="AutoComplete" controller="Account" reference="ten_nx%l"/>
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
    <view id="Dir" height="306">
      <item value="120, 30, 80, 110, 100, 130, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="1100: [nh_theo].Label, [nh_theo]"/>
      <item value="1100: [ct_theo].Label, [ct_theo]"/>

      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="110000: [tinh_ps].Label, [tinh_ps]"/>
      <item value="1100001: [ma_gd].Label, [ma_gd], [ds_ma_ct]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
		&XMLUserDefinedReportViews;
      <categories>
        <category index="1" columns="120, 30, 80, 110, 110, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 125, 100, 130, 0">
          <header v="Lựa chọn" e="Option"/>
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
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKvUVNBXDDKosuvJqBVaY10jSRODsw+t2L1ivibC+IJBBpRDWmRNl0JH2TZFRBKxObV7idltLFvk41t+9VbnoyvzoHKwk1WEaoRcwndbSgQ7pBP5PP8N7V7v7T0/x73rnLbbx6MussXAItJhiKy6HQwE=</encrypted>]]>&Identity;<![CDATA[<encrypted>IwPlH5vZ2b3YxFmmeo8RiwacsuFVSwt/InTRN8zGRaqOO9sV1Ovftf7TRshPUSmyCSbAO1ZfA3At2afgzfJ3tGMZhHjEl4Z7LcqeTOaRZshwINc0Jk/bojskiMYWgj+g5K/FTuuMJoCcZgZAC+uljG7yDTmp5pNbUHwO2rSxryWj64RswJslXNK5jf0cSw5MowhH7UownA64+3TwscEPNJeMWygYy18T5CPACaEcsNGtF7l6/O0KfUJb50UiAplGyK2iL7UZqMerHkbsCi4c8mB8NZPdMSCjZS65V9rUNKi+8Pgn7vreQm2AUrXNUHVWZBfECSdNMlQBa1jZPuhcyk5KLHqNJyl9Up0gDSryOkOMDnU1CfAaTTF9iJJEe+RoANu3rSpyf9my+LairxNfuv2sZNHVzh0mFM1SqMioUXg=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>j9Pn7YwtzE9JRZ/vdVL1fcq1jI/2lW8TG8nH3R5CCBOEVLuj6b+W3QZmPbEWIlp0gMCm5ib+UL9WQ5wNwAjAA55c2MaLGjBHPRYAoNzOyNBAKPt7pF8+dVhdM8LcP3uGWojgOf4xMYn9N0wlQlM1xsGenZmHbbmd7zDKsg7v7ci45nS4OAFclmT296sy8xogBSAYqgYtPw/dWZEHy1ZCxP/qdlsNrGT3VO9W856O/fQyMXudHygfs8xCb0XaMCyPwVJZpqB7GMHrfb7TiVKYdFlGsISn/8Lc7pPp8D2jfn2o0MbXHjmELr7HeYiOPb9CuqTQ6gHJKhrgLldja0IJBA5T0sJC8Ua4sG0zmWBYIu+WYhlCg9dZIrv6zCBpRDkp</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>jtYl66eD465rGFRfHuag3oAoYTQaIm91mPY8I00NxgKVbrZn/kI7685lqYTIechkVLXVBMZXAN/JE4U4p7lLDZ8MPZv5ukbnQzBEwR7+LmAjpb40jhnMEudzIxTGP56sCUPMo5yxnKLiA+fFaumRemHDZ6U+x5/6H4/T6DecTThQTcwaOMPrBnEFX68V9md2oJwwVFZf1zEsBdh2dm1WHCBdbG3CUWe2POIkNP4jC5UunmhCwH8MbaG1pWf3ZxE0wDjOjdLTH8xl8/5wyasth4TeEzwra6QOQTzze9WWzS8bTYvfzaQwKGjw8ZDEY8w8sT4cTVDmzhMZmptGM/1Voye9zIKF9w3FW/o62Ooe5/j/K8pw8EAPFYipJkt4ww5fnTW9DsPeAdXBUVgcYuU0x4yKb+r45Hp0+sPZZq4luWhcdPVN1J5fZIeP3gJ6ToNnskV85LnKAoCSgAzZxQuW8c9CuuZCJpt1OlMnQffUCSfB3w2dm60rCHfVp0omYDobIIsqOdXTrl42oJktzjifWZfDIyEuG9LGWwV012zNpbZtOFbIYX1jqQSqNrVCHh13GuMZYwNwU7PAt9kpKlm7PfMOBmrIz7c4UrmuGeo2x+wtjk9VN9D9zRF3H3XGfyPikshN8uE1sEK/jlVXGCIRVPE/usyP7+aIcwvKDE207KiQQXfo6yClLMPKJc68Pch0OcKdLo+WESSz5zyciF2pjIYaZPcPR7c62r9AnvRPhSN2orZWQYIISa9ccH1CxvH5i6UFcOiLCuORLBKAXXAEWVe8FaTOTKdHPrCKlTndLoLykrajt1/Zx3WLmEWLBFZ7oLeLhrJ5tQ2Ul1qunnybLJNssz5xa+dZBhV+nTFIaxirKl0tRFrFXC6LLQQlePmOEZii9wgmIiJ/FBHZatrgh6NkMxiP0jX7rmkqfKCXFfhkMBtxlrj3+NLW3EYLx0VatmwlfodL63vR5OShxpfMcFDj3RFOLAW9GeXTDCi4P86pzWLaVdeVZHnNJhQQHk/Vyy3/mK+W433tFMx+D0YrCOEScuQGCoGSmP61iM5BGusguauv6bXh3UGfehcy79u5JL5DCCDIH7ucq/oQScc9pPhsXzPwQLTQF7l+WXwdJmvxOw3HVQi6gKMwBM+TVH/DklfZtZCkcIYPzFYubYivVPmQF8SWIU3FUkOzIZZFEY4=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
