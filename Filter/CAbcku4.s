<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CABCKU4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="interest_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày tính lãi từ" e="Interest Date from"></header>
      <footer v="Ngày tính lãi từ/đến" e="Interest Date from/to"></footer>
    </field>
    <field name="interest_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Ngày tính lãi đến" e="Interest Date to"></header>
    </field>
    <field name="loan_from" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vay từ" e="Loan Date from"></header>
      <footer v="Ngày vay từ/đến" e="Loan Date from/to"></footer>
    </field>
    <field name="loan_to" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày vay đến" e="Loan Date to"></header>
    </field>

    <field name="date_pay" dataFormatString="1, 0" clientDefault="0" align="right">
      <header v="Tính cả ngày tt" e="Including Paying Date"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk">
      <header v="Tài khoản vay" e="Loan Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Dự án" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true">
      <header v="" e=""></header>
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
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
      <item value="120, 25, 80, 105, 100, 130"/>
      <item value="1101: [interest_from].Description, [interest_from], [interest_to]"/>
      <item value="1101: [loan_from].Description, [loan_from], [loan_to]"/>
	  <item value="111000: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
	  
      <item value="1110: [date_pay].Label, [date_pay], [date_pay].Description"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
	  <item value="110100: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      
      
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
        <![CDATA[<encrypted>5Nc67thrIxEjo87ltHhHujNoBy2BljlgwleFfT/ugNd/0/xQCOoFm/x5uBeSpQyVKL+5XVFB5otjWHCxZB/eZ+tDPrIJej+CcbcUbcg7OlzoYxMIU0eV2KHVM4TU0a7FRAcO0/0c8VfMaEFNpoY5yo/b/e9reoUW/eCvMOq1Hxa+RApG3bgDttQjBvVf6n0U1G+R+gB6pnn4+lHiSG4zJjCKZdmIA+Rvk6QMH/acCMxLmKFZSamCcZxzXLFf4HDslSYbgb1tTXqeJgApXsZFZSid6y4LqnDeHEcmnd+lh6Q=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>jAM+2OWNong2bHD6+883qqNbHt9kuuoEhS3EScF0zhYC/mOPFsz3RPM8ueJkwffY7lR6liDYrka0xTh5SbIdcANfS81Y3d0bWOF/UdlAzjtsCuVWG3+Vf7hLsJb3W1Z6iuwo/LnFOS++/HKT2Cgkl1nOUfAApzxVq4VlAFBLX3JiqclByQLeDlqrx2DVkn993ypoJEvuMpJWVYaL3rvD7tiIXkC2yCgKE0iI0hY6gZCqJszcniKdXyeULQ4dEyQC2F/Iuc/dVi2PJIbM8lLZswTvPs1An5MOLhPfPUH/pw/AnuRiYKjyGEubyf99pAbNidT+bjxe1qrRjZfdzEQLEtLMnrKpqJR8Ac913Or9IERpolxY1CI0bY21A/6PLsuhD+bjY8KuuAI+TiOcLJY+rYYzTPcNXkqB/9R1dJRP6t4Eywzy2oD/GTKHupa7ZDSD1wDtkUFSJ4XdIWFSoR4fy8Meh3IX148NQUyvzgzNoQzc0vsJORQoKJO0KRH6vHrYRBIs6XkZxvwuaLGbrV0AJaVF0WR6RenBieogkF1yeLciI8VN5RdQQ4hA9oRAlPRPb2zNIcb4IJw5FyLW3/QZFEqjZPM2Hh9Namh4g/AAyVBj2B+Dgq1aNUKz0qZtWwfaX4WqjfwmIBVfF59UCdYncj+GXbJq1STftuyqYjtgi1uK/EqpEQ3KVJK5muaosNLLTeS3+mTvC+wubdrDu4c3SaSBnehAPxa8nydEC868RBl2G9SK100hayFuMfBUSFK5BwMW9WPkwgkerTNwRtBiTUhedLalrGdji4rZLDrtZdTNjPUmqa9/7+xLJ+MPCc07/ySa5LV5YCHHRCQxuYS0Jg==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
