<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A01119\ReportCircularTypeField.xml">
  <!ENTITY Form "TAXVATDT">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-maxv-com:data-dir">
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
    <field name="tk_thue" clientDefault="133, 3331">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="Lookup" controller="Account" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tk_du">
      <header v="Tài khoản đối ứng" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and tk_cn &lt;&gt; 0 and status = '1'" check="loai_tk = 1 and tk_cn &lt;&gt; 0"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh2%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_vv">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Phòng ban" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""/>
    </field>		
    <field name="loai_bc" clientDefault="3">
      <header v="Loại báo cáo" e="Report Form"></header>
      <items style="Lookup" controller="ReportForm3" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tc_thue" clientDefault="3">
      <header v="Tính chất thuế" e="Property Tax"></header>
      <items style="Lookup" controller="TaxType" key="status = '1'" check="1 = 1"/>
    </field>

    <field name="ct_goc" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kèm chứng từ gốc" e="Original Documents"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="sap_xep" dataFormatString="1, 2, 3, 4" clientDefault="1" align="right">
      <header v="Sắp xếp theo" e="Order by"></header>
      <footer v="1 - Ngày ct gốc, 2 - Ngày, 3 - T.suất và ngày ct gốc, 4 - T.suất và ngày" e="1 - BVC Date, 2 - Date, 3 - Tax and BVC Date, 4 - Tax and Date"></footer>
      <items style="Mask"/>
    </field>
    <field name="phan_loai" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Nhóm theo" e="Group by"></header>
      <footer v="1 - Ký hiệu, số hđ, thuế suất, ngày và mã số thuế, 0 - Không nhóm" e="1 - Series Number, Invoice No., Tax, Invoice Date and Tax Code, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

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
      <item value="120, 45, 60, 100, 100, 130, 0"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>

      <item value="110: [thue_suat].Label, [thue_suat]"/>

      <item value="11000: [tk_thue].Label, [tk_thue]"/>
      <item value="110100: [tk_du].Label, [tk_du], [ten_tk_du%l]"/>

      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>     
	  <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>   	  
	  <item value="110100: [ma_kh2].Label, [ma_kh2], [ten_kh2%l]"/>


      <item value="110: [loai_bc].Label, [loai_bc]"/>
      <item value="11000: [tc_thue].Label, [tc_thue]"/>

      <item value="111000: [ct_goc].Label, [ct_goc], [ct_goc].Description"/>
      <item value="111000: [sap_xep].Label, [sap_xep], [sap_xep].Description"/>
      <item value="111000: [phan_loai].Label, [phan_loai], [phan_loai].Description"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
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
        <![CDATA[<encrypted>sa+v9QAmscrAcnIXfM2wxMYjaXUcQNJ7Qmbs2oknmmMKsGwp5WajnyIqCudci3Yi4DcSLKfSvFmRCiIfOL7zwNFejytuvRQvhhxKO3OxTpURsKLtJZi4BjZC0uIqee3hDy2Z69aDk7LS1DE2t8Xmro96V83XlCYnlCMwOO4YvaBhvQClSPB4oUcgsa5/t+BdNR0qxfOT8lYF0q/0mvaSs3+7Ci9cDJe00Ch30WfLQqAyquU0Ijcqxcr1xFDlBGfBOOBE/v9Ywtw3Vkvf0/9I83aLBNmHFqhm8916jm4JUpRzucZrKUzhPFmiFwFBqomwfYn0WXAdiFiaHrvZkb5pz48LkxNl0A+vU2zCcm23PxFg1wtvkwKYkLC3pKhNI+KrAUOjNiUgg72iO3WV39vUrlvNwpIilK2r9osRsqWD9Ns=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>jAM+2OWNong2bHD6+883qiq5craR3uQFXlfPA8U/iS51u8HDmx8xPprCE2KnwJd+TUoWPBnBqAtHmE9UmFoinwDzns/DA7u33nGMyrmpTJCN4sO/dH8QP1GFQqhwfEaagaUgfgJeHd09cxcO3b1HEcRysT+gPG8a1ipMXk40f1QpaqtTTvm4maz00iA+hv8pMIUZ8fGgoNiVVjIrOupZ2ZJNHKzS4KrENzP72ePLCe1/avOj4RDSnmBP9Rlme4ylGS5xm/2Xx5puQP3YzS4UeG/mQl5TDehaNcpQZf+KRPVSAX5dzfDIo85YljRYm3qxri8R4ajx9jXav5D/dshx8wKBd3rqDCu/UCQaMDhAu02HjKkEJ7vocCpKQCsnludisZ01AwVReBE05jQX8bwn9H6kPoClbpGeZLz7wl5hsjtbrtGND3fVZn+i6ljVKLOZX4iBoKBm7FetRTm9AyjVk6b1JKITon/qG/UAtoN6hyhbx6B6G+d9xGJH7JPRXVbOAlz7KrjHja1XC7U8qNiw3x1AC33+n5IABIGVtNvc0/PwKRWMVEVQViDeUZNG6nW2WPbo2sQD0DblYZtwlo2V3qLCJjKLRqVNeKDwdWkXR8ehUEomBOVl6zRQ5E6FQ8SzIMl9KqjhB6dvdjajyecXFPpMzXTomeU5QkGxMIH6LaOoshFJnqVhBcJR4K5Qg7axDy5u6/JdOTqZTdkc8+OJpA334kPRhU3l21v8aRr/MnpnKBiF4ohQDwBDRyQ+GDGLuwzx2y4JhxKOWFhkRt+Wh/otRFvrhhuiabzHctHwMZAbPCphZtZxWAG+Byf9BM/ZiLyhHFQT2cZjz/DL3FGvCqYwaOuLgw4cgn1EFsiVv/Wmvsuv++PzxwvQw2yFoJYfro+s303kYEC3lPaBz68TxtoCiUn6T9oyLkumk/zlH/ijB0AYCbcR1jqF5uK1knJfzSVc3bGJ+iPqiW+SyqywvGiLZFZ0FgT6b9wsqql59F4=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>