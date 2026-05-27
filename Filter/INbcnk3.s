<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY Identity "rptReceivingReportByTwoCriteria">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "INBCNK3">
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
          <text v="Theo bộ phận" e="By Department"/>
        </item>
        <item value="1">
          <text v="Theo tài khoản đối ứng" e="By Reference Account"/>
        </item>
        <item value="2">
          <text v="Theo khách hàng" e="By Customer"/>
        </item>
        <item value="3">
          <text v="Theo mặt hàng" e="By Item"/>
        </item>
        <item value="4">
          <text v="Theo vụ việc" e="By Job"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="ct_theo" clientDefault="4">
      <header v="Chi tiết theo" e="Detail by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Theo bộ phận" e="By Department"/>
        </item>
        <item value="1">
          <text v="Theo tài khoản đối ứng" e="By Reference Account"/>
        </item>
        <item value="2">
          <text v="Theo khách hàng" e="By Customer"/>
        </item>
        <item value="3">
          <text v="Theo mặt hàng" e="By Item"/>
        </item>
        <item value="4">
          <text v="Theo vụ việc" e="By Job"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1"/>
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
      <item value="120, 30, 75, 100, 100, 120, 0"/>
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
        <category index="1" columns="120, 30, 75, 105, 105, 120">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 125, 100, 120, 0">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="3" columns="120, 105, 100, 100, 120">
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
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKvUVNBXDDKosuvJqBVaY10jSRODsw+t2L1ivibC+IJBBpRDWmRNl0JH2TZFRBKxObV7idltLFvk41t+9VbnoyvzoHKwk1WEaoRcwndbSgQ7pBP5PP8N7V7v7T0/x73rnLbbx6MussXAItJhiKy6HQwE=</encrypted>]]>&Identity;<![CDATA[<encrypted>ds57YJmsuyzVD2tYCHK4ZiLzdIghvFotYbtBH3zRLBF/V+mOjhdW/4JEccmD3wh1gaB2WFiBFwBkBFcel3tvSguVsBwpy0FO2O/7fV5PMY6zSXm6sYyZdrwNDA/FsaK+X6UzcM12zIaJBs/kQtxAzIsScYxhRoYWemopWC/IfQWAfgy4wrILFZb2WF4xN9VpmmOHKYbc2NG96xaZJoPpPE5RKalBvhH6KRIQVMS5j9P60EAmEWLJx8S5dk58znon2GrhkTm9VeG60TY/avkNyc8/kscvcejWyzQ65Rz3MlStRHn6vZwrdhMvdKP5BcuQ8b3NZx4HOxbk9hdlGze7FahfB8g21+lykv/KudiI618+UgOBpihirbjrAx7ihpc2z084BDn9wiPwi2MuFXpsveZvIa4slDVyUs8U/IVxw98=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>O3f1AivE1+9ZzvNpeoV1hrPxpB+mUGxLIkKw58KQ5NYL5X8EbhawU6noKce0CfPpam9HeQDpHXmaokvdFand4scEnf/GS3yzVKnuWyEMk2xRCCHY5n66TRHczbCwBl9iscqU13HtEbg/KjrGgkyz/Up1eNiXSwTnODwT1NdYm0pSVlre2qnVtbX8PceudQYwbPu20K8zHYym/tIgT0itH9BmtJ5tjTG0umrrqilJ8shmMbZtoWuafBm35r6JW67j0Pbq8Oa/z2WrpBYnumUUk/05JvTk4pZI3Z898GEqGeJJLXjEE7GMFLOa+1LTdFZX2fnvNLd5uEiUPxkh7lW6T3InymBzAQZNCu+qG2JppgCZBao6LV/TUbr5wmJD88d/</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>270pMpq5T3cKmRaiBBmITPtIx+x1aG0uFcl0ZILd0edobfusX7lOhOEy/IlxN4ESRztb9YW4Tu8ImMSEkJwgisK2HAGdr8zlLJ3308XavsqvVAI9QojFFejHbYy0XWoLzWSAYlO24ifitRbCH0UvnmtXEGmdj2sHL9FXlg+6r8iQ8qww/VjjVqGobb8vVrVEEhz60XKva3lzRi0bb3HdwX28M5BE7yNoz5kxXXLaipwDYXSGyBCVeMBwvtyubviMwDZp7A+iAURdzS1XWqDv4rMeiUODKMeWgOx7oTEvAibUusmVpi4QVWNkR02Pxx5zj0ARijhkn2UP2+TnxryoYkKrhbxrzkiOJsFkaAQwLeBoK76EYzUIdnKzoLCpqZdPRCWoM/YXO5IS2FCAmQ4UxHaOQi5wgZMm9/rGTjIYkFX90VAU2x2b7AB3XmQTpp8MOxgYIGUO1aAT4lhMAuLnE+A0yt2xhBo3JEyK1bl4cmPjobEbwrZm87uSKQHcbNIzXqHNYCLu++kzxT5JVLYyGW//4/eP3LK0ybi1Favzy/cv9hJHaKj9uQYKptq1q/FH/uDfjZAAjNvi7tk+Xq/ESnC6g6tD7Ff6vNQmheAcMf4vmJhclQRiaMWLeu9HR1xOnXOETFw3p5dWnzRoks+14t0FEMqani3pDh9ZVfsMpPJkyRHBjtTpcars5Cij9XltubMQeJ4TIusixlbEZ1tIEmKUyaVh/mWr64PqPLUVr6dDeTkQyBPo1+2jCNOcgg2xtCfcuF5GRRWDAPI2AFf+JVA+Qg0ZlKvidN3ic06DqY9DEdMYRPfNcmGoxMmbDcBzJqlTZPABy3bvMDSWE3Z7/z+LWcj4NDFGX94TFKWiwe70I7WUSyleTIq7Mkut7pwDSf+DtPmWl/poy54b3XekKttuBQIHUCn1jx8ZpLdsCbXfN8hn1FVK/F86pnJPqzirmdtoUMIFpvwI1iwpcl7/SC4TZ3Zv5fvBFxrU7srxhJetLDm3HFDSVThKn403qVRILgExLuCpVuHWSjCSjKRodQ3TR3TiYAzzFtPw4eUfLBFxmBEaG86wAyu/Nwqk7cg3A6aoHjNzA2x6U9vXW6ZGzw==</encrypted>]]>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWzpV1sVzZhe1CnU/fDH9oHVB8LGnm/hCy/7C86ZaSif73ETfdgR5QElLMppF6Y1d3TiOQf+8jr8ja6QOZvHjq51Po1AfXSP29H8cb7wNRojjwmqSc3Wrw5TDOGedYP3vxhU4mHXW4OAJo94wEUYx2JE4dsx28s8UkWgORMHe9xRD</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
