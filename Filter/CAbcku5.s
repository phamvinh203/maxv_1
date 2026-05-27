<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeFieldUOM SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CABCKU5">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày vay từ" e="Loan Date from"/>
      <footer v="Ngày vay từ/đến" e="Loan Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày vay đến" e="Loan Date to"/>
    </field>
    <field name="tk">
      <header v="Tài khoản vay" e="Loan Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="loai_ku" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại khế ước" e="Contract Type"></header>
      <footer v="1 - Đi vay, 2 - Cho vay" e=" 1 - Borrow, 2 - Lend"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa42YL7jlXo0ShoGODsFToUQ3own4aR87ci4INT1PLCyFsDZoc+IU1A7tT/V4Zjg8TLA==</encrypted>]]></clientScript>
    </field>
    <field name="ma_ku" onDemand="true">
      <header v="Khế ước" e="Loan Contract Code"></header>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="loai_ku = '{$%c[loai_ku]}' and status = '1'" check="loai_ku = '{$%c[loai_ku]}'"/>
    </field>
    <field name="ten_ku%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Dự án" e="Job"/>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_hd">
      <header v="Hợp đồng" e="Contract"/>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true">
      <header v="" e=""/>
    </field>


    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
      <item value="110, 30, 75, 105, 100, 130, 0"/>
      <item value="1101---: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
	  <item value="111000: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
      <item value="110100-: [tk].Label, [tk], [ten_tk%l]"/>
      
      <item value="110100-: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="110100-: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100-: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>lVvjMoBnUCPIiwPzmPLGJeUpWRo9THJOxX4TLexBZxOeMMaberDhVdXzJGwZbH8rheEKGYW1OqOBiBNx+9IyfCgcqG8Sz4wsG2JqzZrglSGX9hn3OVA6RgNsjAwoAUrEjlFifIQSd3T4pwvj7NA30/VKyX4yT+BH+aYkQyATozLSuUju9Xdzd1U/jAsXaLdHT+vWtg8Gp2jT8rE+5dI1wtIjjg4+P/PtljuN3WjyS/a0bVtnW8Z3AXv62MgZwlUMBgX61WjazLsOLOtJYnB9Xsyp34kEuD0JhxEAQobYh1K/BmZi/r5D46flv0ZFRP0MeR2srGa0rCz5mcZdf8moS6a61RunGoWXIMPlW/gUo4c=</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWDG4Hlc7/nU3ozWMr4ep6lgEgDuqqD8qD228JSFGH+peFqG4E3lY0J/eQgbMJG8P2rz6BBjlUEwcbbOeXXz4uroFXjUDGFk1qj+6/GDalqGBzn+h9RkKZ0HNlf/rTSuRs7htl1Z+YhPAFj5dy8VuGrUyKZjYA77fXJW8iNc3lGlD88chmMviCyRBX9ppqbVVuXU558V7LYzCQcY3c2hcklVG9ZCt5KhxiwYHE2vc56gP2hEzFOMNF53R3jx6y7p3jKh4xeyG+EtKwjy4oqBk/Sgr8/thbPQ8aofCsKkiCDPY0LowPrjkFiqIQARIa6fbaTyUCWamLl3KoCVavuBKTGig/ChT+0oYyn9eVDxxaoQchSWfq5dngVWtrJ/3FFXib6wz+ePTmPojOaEboNogkpZHze2ZVBy+CCK7S5WW+vcPD7DLiItRQx3vQWQNonNRwbxtKsKfg36bOLIHSxPtI5oy6RZa4xjFmAlKhYEi5lD6teH+lHLRiaQN5Zrri9yP1mJNFNacC7VYyNBo103uD0EvmznbXEmXBuNtVQINnfi7A6xAqthjYAAhnrRe4in7KBjpErRG+xOy6NApEuWPUde21hbBRw5pR/jnFuE5sZ10z+n6QpeTJkD6Hi5hi+1VbK1lzle51EZFyiUGEI6vCWQu1jDlOWoTCWuQH077gzi1mdNnOcgJEg4XhWb5CidRKeiRF8T+3so8rCihe5ZDTEsQVG+9x3bY4zvLWKd9x3e7wHAHl8LlYMae44KRWAPsBVEIFpj4aejlARB40e9zQ1fna8uxho8tlbBjF+bR1X3hDUjgM27f4rhRGXUxCzFIXw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
