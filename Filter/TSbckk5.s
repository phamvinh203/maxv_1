<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "TSBCKK5">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order"></header>
      <items style="Mask"></items>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
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
      <item value="120, 25, 25, 25, 25, 30, 70, 100, 130"/>
      <item value="1100010--: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="110001000: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="110001000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110001000: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="110001000: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="110001000: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="1111-----: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="11000000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>gLz4P0TLHtCQdfWaZWiKgVYZrarhiqIP3vvYbfRsOf59+8M7v98M/ivjNdkwFKx609U7E+2NNXEF4mGBFa0Il2wuzXVDYEClfCsjeo2rgad8kCIO9bzLuJQSrsIu8zr4l8aIAsGzjtz+uXqCAhqcf5YW8api+uzl/GQFWL6ON9U5e91p5DHZ6ZUEDKQrnGlvAZPRVabYniAXdlfq/F8zhVy68z6tccwAVYLaJzqW8cnwrtGdHkXk5uASIELwmXZlF4fth9VsOB2fHsh89vHyUZbWN8U0XodbrsEZrskmgioho0rTy6mUdRKeEfd8op0CsfZ7uqjsvXlCgSy87VZsVLDvcr+lV/ZLRLVBDGRRTEqbxB24t02asezPz8kJ5xw7LrdQOZu2dRwqtHxU48fc5w==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>9XZS5blo6O2J4yFjjf95EbdAItwJgGWfYJNatEaUobyn9/JX0lVRbl2WvE5PTyYT4UVTBVJnbpmhukybrP7L24Qw7+irhM/NIszNp+w6EixhDv1xRiIVM3wUWKuSg37BCkch90659w/5cNktGGI4VNy7ECokXYgI3VsRqD7UUGmj1gratNgHP/7sV/s+02uCRZV0na+ZPGnPIdQFTMgUCiUUYfXiCG39d9FctwRSW0PcgDP5oO2QPNtNyojMmhdJf6w3EQyGKF9+AyVnzAvNarxLGLyA/b0BYOzowEwfhRF3OY5r86T6fS5ULA04PsfkvgEcov2pRYEO8Cw8wrrnuJT+s8rnJB+z+eoL0AvRx8V8qO3qhLc5Gc+57DU/wLDO</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>UVWfvc5sPXZLF+cVsjeCV3Of3xNp7AnGywc4srvkWVUBYbVVDSwLvFg1iL3L1F5xX2Lc69tFXd4o5vis8cP18T20+2SF0Z67omCtFOcN5iYQmJVSyBWscqB0aUhPk4tTBJeTHkU4eFydebyFhgZm/ggyx2HLBmO10gW+UNvvDBbJxlREjjn4TINKYZy7WvNGUcjqgKVP6Tlk9pOulIVNrfs86fUcfJt+UBuh32KWUl5NyLy1CRJ3xSfVlQInvpdpX8H0iZJYWob1s03zNKRUOeVah2bLUobGIs7xNu8QxJinH96mQnJJocvZMPdwmIONrDGn07metoHdXCxlRw2j3kdR69Ez16rFmztUJFlraMkQwlaa4V8N7JyaEhK45IvvxPs70oU5s7FiJIalmq/ZnGAbbpJV6jaBOXLn2RPReI1G51XW8AOGAypLWUY4csItUywmbnezkX7qFvHs6Dbxj+hrwnPzTaNHZ9lt0S0JGOyorFX9+wRjlODybGp0qHsZbP0PiAIt/oZc2eg1J4Q/jwMuh2dIjcCCz5cu7fYQxGkwbnT1NgXTdPBU3CZ1sW4UQCpl5N1gAtul2oTpjkkch6iUtItmnWEQ34CKlgPqYB7lK+VBdsiDFYktDmZiITvp3V0/2ocKwKlBMP9CY6MtFE5AaFuudiGgX01i5WAV74Syh/kYFf+9WZ7SI3C4BBK8j08zC3K9P4IflxujoMF+AA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
