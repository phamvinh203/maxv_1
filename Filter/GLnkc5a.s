<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC5A">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ngay3" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130"/>
      <item value="111--: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="11---: [ngay3].Label, [ngay3]"/>
      <item value="1100-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>imRbipMYyxbo3FwPToEiouSrB2vk+2PPCvbB9Q73STAIL5wAN6V5sEPPXrYBkVpwAlZcn0HGw88L2eR/pYAk/mwXjvr625VySsg9wPjsBp+9oBHI7CA+42aDA9iR6u0mRDPf3M8fO2cngipHmoukC61hpBgWGx2ZwU0awO3QUts/9oQlY3WtEbC8rqqcyN/xcBxCwZhR/ozqcqd6Nc/zb737dhmw2WBVj5xs1dFlvd4tWAi97PTEF6d8El3P8VQIXeKx4K7uowR7sqnFQo5QzhbP0lT/MHrSXrdaLwIt513ozgwmsI3AwIldF3XMw6nGzv5I91wmJ/f6yF4ZFfsbJCzD4abxwRsR7tA/T5x0oo7RRzaLrTt3kr5RqsaUkLpunxfJdyVrcjDuRz1qO7ubEhhKX1eq+X3blVOKZ2Uqy5usxR8SPITRRHtUNy3zYMg2yY6GAZmhuxLLE3ywNCOQPi/iKRIjwUwdMwwuhORL11Y=</encrypted>]]>&Form;<![CDATA[<encrypted>IiEjoEwauLUaGxYt5epTVyoPS4TiRVU1j5PQwk8/S3bkFF17yERNuw0AsPIudh0TUL+JFTKUJny8izfAid2H0UCjdHDsnlWrVJqOSkq2azx+Y7k/zXagj8HVCrkn8Q+mjKRGCm8/6jiUuilJojO5Y2hktL2QYl6UleSQEayzE4z+1QZHUYsxQvdrvjIZ3A1hWYatoIv+yPpgKYoNlQ7nZaKVoH/UKRaVCvwHPcxz9pWHf+J/FDMQ9ZqCLmtLBmRI09xStWg9cUFzVdG/GW/fEs1SykLTVwEnwlfK/NBg13jTuwFN/H7yYl8ZZGLtJ9qRF5TPIi3r3YhtDHP1QNxvp8PdLxd6EX4J5fg2PH4CNbpT8VOBMiGCdOR99Ae4dHvArsRbdKoONwAT2yBg/bLecsp635dZ9oD4sg67a04/oF4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ssj4jqa7cUMG59gdMjMbyCc2s+ub3qZWOmdRmBprFb4EYzgWb1HXsgyawCIgG9mZvbsRoVw5AzqTkASVacouQlQ7bxwP0NvwPccvJgSFmzYCZKTPw4946omGHzY2F+PK0kAzoNSWk68kI7yjlp5hUQUUi+YZSv5IhwP3/JgMv8b/JQ7o/JVOMp7F6YvizdKDIzaejwtYx1PUHl/UiIF3TW7YvM5Wwmhxph4C/Ts53XIsdwFTwkgjRg4oT1F03ZzPAP7NYZv7226LsuhIk9pBDfpsj77c8qnDgk80caPt6flUI3NTvdciZrAqMFjwzhKxKI8D2iR5bOi4pkbtXZW14BWtncYPJAU1/LACfGJODA04fmLde/TQcJOPzoUsH2D+5ywac/o0/jbVOnDlbJepJMBCcFCEYFcAovl/5CQQM/+WTk5+CXX41K/E+ipUG/hF0TIC4RdqbaRNgHyhvaPRZRp6isOvf7B/kNSOLosf35nFbmxmwxtnb59HRW2omo4Q/ZoLhFPjPH/qYgcg7AKgeHMZfrSOwYV2t2HUuuedh22OTnY/3cwdZQDR3E0grtW7V+Qe792bV/lA6/XEl9DOssKCoC9LFeb7HvgN4W9+ua8HyeTomXrTRf5hvLZhPjJxKecyCMKWhdTZFpjurs9swHsWSBcfY0a2Wh/mS9WqjPV+U4VPbyhVtLuLmroh0zLqHZ+72hOdkSdgtFN5QObTlMmuZNMQveecwPk8cVkDYdA=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
