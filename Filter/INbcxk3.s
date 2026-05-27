<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY Identity "INbcxk3">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "INBCXK3">
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
    <field name="nh_theo" clientDefault="2">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Theo Phòng ban" e="By Department"/>
        </item>
        <item value="1">
          <text v="Theo tài khoản đối ứng" e="By Reference Account"/>
        </item>
        <item value="2">
          <text v="Theo khách hàng" e="By Customer"/>
        </item>
        <item value="3">
          <text v="Theo Tài khoản" e="By Account"/>
        </item>
        <item value="4">
          <text v="Theo mặt hàng" e="By Item"/>
        </item>
        <item value="5">
          <text v="Theo Dự án" e="By Project"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="ct_theo" clientDefault="4">
      <header v="Chi tiết theo" e="Detail by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Theo Phòng ban" e="By Department"/>
        </item>
        <item value="1">
          <text v="Theo tài khoản đối ứng" e="By Reference Account"/>
        </item>
        <item value="2">
          <text v="Theo khách hàng" e="By Customer"/>
        </item>
        <item value="3">
          <text v="Theo Tài khoản" e="By Account"/>
        </item>
        <item value="4">
          <text v="Theo mặt hàng" e="By Item"/>
        </item>
        <item value="5">
          <text v="Theo Dự án" e="By Project"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = '1' or cc_yn = '1' or nv_yn = '1')" check="kh_yn = '1' or cc_yn = '1' or nv_yn = '1'"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách" e="Customer Group"></header>
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
      <header v="Mặt hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tk vật tư" e="Item Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai_vt" categoryIndex="1">
      <header v="Loại vật tư" e="Item Type"></header>
      <items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm vật tư" e="Item Group"/>
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

    <field name="tinh_ps" clientDefault="1" categoryIndex="2">
      <header v="Tính ps điều chuyển" e="Include Transfers"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không tính phát sinh điều chuyển kho" e="Not Include Transfers"/>
        </item>
        <item value="1">
          <text v="Tính phát sinh điều chuyển kho" e="Include Transfers"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="ds_ma_ct" hidden="true" readOnly="true" clientDefault="" categoryIndex="2">
      <header v="" e=""/>
    </field>

    <field name="ma_nx" categoryIndex="3">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_nx%l"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="3">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="3">
      <header v="Phòng ban" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="3">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="3">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="260">
      <item value="120, 30, 75, 100, 100, 130, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11000: [nh_theo].Label, [nh_theo]"/>
      <item value="11000: [ct_theo].Label, [ct_theo]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="110100: [ma_loai_vt].Label, [ma_loai_vt], [ten_loai_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="110000: [tinh_ps].Label, [tinh_ps]"/>
      <item value="1: [ds_ma_ct]"/>

      <item value="11100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="11100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="11100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 30, 75, 105, 105, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 125, 100, 130, 0">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="3" columns="120, 105, 105, 105, 130">
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
        <![CDATA[<encrypted>bty7jTB7JHCp9qlpZxeMLJrCYfXdDwB1ry/8/1bR3rWlFWR1/sFM2Yg958serMMmilIdWF/ba7z1APCTnh78htE2ykUPY7hjO4ifvow/IvNVoxBvj2yXhGnNHAhsl1AW4s6p5dGPAVowyorrehv1DLukbg/3/VEwYy+UYqWFj/32AfWUDCf0HbqRtF3MvYPhcbiyVFQDdPpLQnPqpWfvE42ROpKe/RpUmp78DLY1skI8e4Jq46PvjUg3FswQ22pmGL/wVVNZBu+XEo9LGk0IBM2Sa48sRRu/jfSF/Tk4EtA=</encrypted>]]>&Identity;<![CDATA[<encrypted>i9xur3pDjwhTYZQV+brBArk/hbZKW1X70HGSA9K4G1iN7ZerOkpLmRLBEN64VNrzq2iyYMaeEWJ5ocSQxutAqrR8mGt3oXszKDng+R++F0bfocQChuci5R24i1U9NiB6RdIC1afuCZMhZaoCJLCEwfsXYtpOSDAlqj76WgFpcdMvs74Q9PWKWersvShPKEiPbbu/H0FMWqEAY/71+oQTpCHqGPgCNkdZYye0Z9eURap/KaAo4L2TN3L7XEStTyMP3E1xhVk7fmVRqYUiWxJdaA==</encrypted>]]>
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
      <![CDATA[<encrypted>XE4YRfWBO8WO95dpKnPT8VmVTPiCDVUhDbZm17NgZx2PwbYh8dIbgBKU5eg+NkHLiUCEXxzxM6T9K2MLs4t5OpM4vkMbgdclBPg9z/BCc3plmYphdw9ZvgeO0k0hS7DUnzYDqoMGLdeFNFvJSaaF9FclScNCalqZ7oj4Z3xHBHm89+YB7tKeCyPFAz1R3xXAJJPSJVInz93q/YxpvWf6z0sDu2lmW5UwUrCgtzoPp5DdRxoU+vlPJ+FFjKPefcj+P0py3826MCmu4qIuJOtEu28yIt7dNe+VnfAqnfW0Lr1tlyM+wInaKl92B1CI7aPSyJdirtgWAoMDwNiVltVCMaL0M76r5KtNycOZ5KiGigKn67VB5Ks7fF8eWL+iPMlXSnrrvpOGrfjtMMTOrl6h+SDmYfRg0YEfHIVsCxaI2vZlQlEsfMWUrYIW1YV45WqWBUcTuxPeHoJDNvwE5eX/QXt45yhbVljzW0E99VE2Wu45jrrHvQlqMQH85qNpG7sNKwKrpzwebr0Steh39DKffOK7DPCCIBx9QlJsFYIvjz/Dh5ae2gd5ERWFVjZoR/1Sd3ckIGkKh5LJjBCWe++yicV7J77orjBYD/QwGo8qLZgrTupTtXaA/XaYBOl0LMPKoAVVXgmc5Itwr1sGuWlSWSZ0C6zNMEdLK8qDb85CdlBVAJNaqSXN9BEAXzyFncNct8j8PvqeH9MZnCZiQs8Y+UDVOsPXwSAEVRrJ2v+4SWtus9pfC3BmU3DgUUj0R39AsxeiIjHv8nM7l1Iv+pBWTG8dp7OpXIgGiz/yTxuX+w/2YvNKhTqWYSrag8hBZPzuj0NB8WeD7I6u7STJ4ynJKRV2KAmdBKqStXqD1dfPIfV2q0T2yU+lP7gUrlw/5V55cIu756hFhsP0prJs9tH3MeA3GR+2tEBdJ+ojqu/ykhGjcUr5OWErmTn5/QVktq5e+iLcnDWFe7dUniyMq9J98STDVaAZ59zrIFrFeHwfJLcMUmnHKzdDmTpDz1ZF/5oZDJ7w5NfG8ozm75a+LPFYnpZlCU8qBFZyskY8kVCeN6HqG3LrGMJSZk6oBlGhJTmzpsUWQFcszk76sXh4w+k7Svr2Uyhz2vzu9YrbHpc62Z4=</encrypted>]]>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWzpV1sVzZhe1CnU/fDH9oHVB8LGnm/hCy/7C86ZaSif73ETfdgR5QElLMppF6Y1d3TiOQf+8jr8ja6QOZvHjq51Po1AfXSP29H8cb7wNRojjwmqSc3Wrw5TDOGedYP3vxhU4mHXW4OAJo94wEUYx2JE4dsx28s8UkWgORMHe9xRD</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
