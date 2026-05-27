<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CABCTM1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tk" allowNulls="false" clientDefault="111">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" normal="true" key="status = 1" check="1 = 1" row ="1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="phan_loai" dataFormatString="1, 2, 3" clientDefault="3" align="right">
      <header v="Phân loại" e="Type"/>
      <footer v="1 - Chi tiết, 2 - Nhóm theo tài khoản đối ứng, 3 - Nhóm theo chứng từ " e="1 - Detail, 2 - Group by Reference Account, 3 - Group by Voucher"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="111000: [phan_loai].Label, [phan_loai], [phan_loai].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>M3RnM884NrP3htTCFaYIlDOajmZmDokn0CGCijaLT9FDpwaAlUF+MXyVhpXRxCY/O6YK7Gl2r4eRJVfQb5skFmO9bAc9agmB7Utzkm8Lpt+zzRjlvPG2Tfr6iNABWYj6VONyLmHH2rq+BMHyylDxeMZtstxFBrHbBOa+n78GPFItdmXqOg5kZ3QjAYDYeIpy7ofHRDVM6UWweTNMthFHnmYUejKntN1aruTZTv//cp7ZHBGDtQHNHC/iCR7MLA5oUUxzcejM8XwjOpW52ULzc2puYDn25mUQ3wL9fU8WWwQ=</encrypted>]]>&Form;<![CDATA[<encrypted>HSeRcqVM35lEpApTQ9yekBBXCUG1NSRVwV3HQ0Ce1Wm8fut5dc8WRQZfOEQNZG9ytrWrLJ3GbmMaRdnWM4xK72jO99jZl4KJPCImshJ+JKJP88rGZZRwIGnpTBLNsEQ1HwFmCydY+9svce1jKevhTlBTbyQxo54hFqmQ1VpesTjAJ/d/kL/nni8UfiKtrz7JudqCN3sIuKcvpr+G1YF+Q8grHdXCSaxjzjU7pRO5fyb77l8C+ivMmKIhoIhxcyPbZuRsvF0De4eUupAU76ZXJ+qz5BXx9Ve0Yl+lQSV2gXZ6VfqkPXwuJccSSFPJ0XEB1RjhlQU/gzqBZBzLJGavDPIRQxHAKsnBwH4kl2CfuB6A+OPQjqT32bfzUfwflTU1/yQd7dsX+nYibuSc/vAw1A==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ZM0Yhb1gBE0SIPvcuakKa7yTA/xBN/KU7ifaBGK58l4pD9SuJtosSaedKKne74odaeazXn77p7cUBxmkCrrmYCoAUnbHSKpXEjGLcBZZKKzFVjIkenkDI0zMbCX6PXWjOIPPmZvFOtR5+T8lBkcvS4RgjBnxNcw5bCzzLHs2fWCyN5DcBAxMhNWDyf5HjyByA2zTtG0Oliyq6JuqCn4oQxWRj66RattmYQcYoGBPJEou3c+UG1PMFXCdKb094sw4QIVfZgiXWYffBpBZc5Q19jhqiW+pCmUmStqSBItpAubPHEHaSiCUY0ybj/NwjvlMaoWSe7Uiq+F7p2L2SkrSFWFJvEn2cf7FUk5yg1rqTYmrelIEm+vkSv6jVgHa/bh/2Cki0pL4T5qg0tptSO6AhqTuRhM5v4MKLF7yccLaG4vv2n82Jr3mn56nPGXpGJ3lGAc6OZKi/9Uce7B7wOIyDlwZQF661ZxKe+lzr2RBtVkzYelVnQbmOkwEOyUyia9hvvaKa5g8yOMfIk2JsuJwrCxJksnKRtuWAhGj/GH/w9xDBbYAlhgUHKUl+XJgElvguE+RhF9INr2srtDncVrwgbyrQOL45xQpZTjqD/w1KFmpRxTxauNbU/60StXCpKYS8p5AILRVzm6u2Fgdhq0PJGl+zU8UtMcNghZXkFR5DJSWd7loEV4s8yqcoolFItsqwajLqhdoP1QhV4Yc2VHG7y7q9LRgnc4jQsg9nBWOjP9Opbf3B8k4sSMsL5XAvEdupkhCZoYxmUO8XPwoRf7NKyhtfZilpfiz5uylyFh6D2w=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
