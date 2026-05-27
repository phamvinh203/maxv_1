<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
   <!ENTITY Form "TAXVATBK3">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky1" allowNulls="false" type="Decimal" dataFormatString="#0" aliasName="Period1" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ tháng" e="From Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" allowNulls="false" type="Decimal" dataFormatString="#0" aliasName="Period2" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến tháng" e="To Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" allowNulls="false" type="Decimal" dataFormatString="###0" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="thue_suat" align="right">
      <header v="Thuế suất" e="Tax Rate"></header>
    </field>
    <field name="tk_thue" clientDefault="133">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="status = '1'" check="1 = 1" row="1"/>
    </field>
    <field name="ten_tk_thue%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and tk_cn &lt;&gt; 0 and status = '1'" check="loai_tk = 1 and tk_cn &lt;&gt; 0"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="sap_xep" dataFormatString="1, 2, 3, 4" clientDefault="1" align="right">
      <header v="Sắp xếp theo" e="Order By"></header>
      <footer v="1 - Ngày ct gốc, 2 - Ngày ct, 3 - Ts và ngày ct gốc, 4 - Thuế suất và ngày ct" e="1 - BVC Date, 2 - Date, 3 - Tax and BVC Date, 4 - Tax and Date"></footer>
      <items style="Mask"/>
    </field>
    <field name="nhom" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Nhóm theo" e="Group by"></header>
      <footer v="1 - Nhóm theo ký hiệu, số hđ, thuế suất, ngày hđ, mã số thuế, 0 - Không" e="1 - Group by Series Number, Invoice No., Tax, Invoice Date, Tax Code, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10"  >
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
      <item value="120, 45, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>

      <item value="110: [thue_suat].Label, [thue_suat]"/>
      <item value="110100: [tk_thue].Label, [tk_thue], [ten_tk_thue%l]"/>
      <item value="110100: [tk_du].Label, [tk_du], [ten_tk_du%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>


      <item value="111000: [sap_xep].Label, [sap_xep], [sap_xep].Description"/>
      <item value="111000: [nhom].Label, [nhom], [nhom].Description"/>
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
    &XMLCheckProcess;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>ZG5pkurjR7FrS8AgfqU6Pf57/bZQ5OgktHMp5X1Mf1xAytqTeUhO6cfJC1kp/HyB/XBh9Wk9Z4nb/BBDDZRilQPwv+H3vnTn/XXJE/Px0kY0jH1v804nMnOPVD0vmkaGb77pgP87wIc2jHZ3ERcaGr4gLAFqVJiGQ9fiULlp+Ai2WaLwgDWlTwn7UMBqaD8yrYFWTG1X1AWjTVX0pIhl4+vVeJYw0OoHnMR3Y2gT1kLkp5dEiihgswrP68yBWZgIlp/ICC0K8IRbvHa7bgtxUASqkNtOfbJZq/UEaS+ITY65bidLwv23PisRbV76M5HH</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>olaLgH7GIbbjFBPXz1mHvZQryYIZbxdsk0sI0hRnJCI7xwTTto377Fk2Ze9POzcuQhVSwXqSjOm1//fT40qLNw9M6Qmpm2Sq+jhqZXheuhVx0NGAYahw442Ehz0Mur4Wj83ekYDlpr14GBQgkh2b/XOHH2wjI175wpBd2DkZ9XhnM5UtX/6+c4DNbHmbNVR2Hci9gSudhxGcDpjcnjqtiJ+DGShNjtdsFS6hg8ey46t0He18uD6spWXsl2iWY4RbfnCV6fFgrIvhpOVw2SO0paaAqWV9AGNkGFN2wOkq7KCMkLoXk7wDaAb4nniuYob/3bZVNaCGkUhf6+c8L7/0xDQ/iTmuFrabxLPE5l5eavEy38aV+5nmgjDeSV9JE7uxeun61Emn2sULR2tOcXdKeB0CQVygKFItWKbVWrIRaiGbb7X1X5kDNpVF5t16jK8Ci7mZN+xz8FL75FhqPTPRqF9Loq0cSnYeiDcFrFihp0Qz+Woo4EayOGW0fXMW3eomQCD4FCwKYBIwlWSR5r1yYB3tZG8lctppq4zIdElpl9whQanDskNKtChpBZiDSMER7aKZ7oTc8efs455zS/mpXwMEoQ3MNu9UU6afCx4gL6rypHL056m20HFA71O1CJ7helLdWr5lhyD8s7XqJhBxJzQxL31fM2+cjok8iuMVsiAilRrk7fYv/UG0qmDe11cMfij+OfjSGKIIJc1Oy14+JvgVK5dushfAa9yEROe0OVZSmVg0cD4PS9uC6fhfXkaO2oqNJ384n5C/HX82Sh/1a5mubCRRMK/qdirEc2rTg/s=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
