<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeFieldUOM SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CABCKU6">
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
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1= 1"/>
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
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101---: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100-: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111000: [loai_ku].Label, [loai_ku], [loai_ku].Description"/>
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
        <![CDATA[<encrypted>w2I8nKIceWkcLVOwIcZ5h1bUhl6KBdVDEyeNKeCHLJz466+VOucj9ijg+p7H49ztL0TtntGy2B0qUFlsugDbQ8gl03s8NS11FPTlzc1qQVwBEC6OsneyCPXeaUl9tCjJp617hjyGkbK04PKtsIc7VhuFOF9XAmzCZHYWrUPWKlTpWqWGbS60TvBowuhEzJ2LNg3Xr5oYTjRgQrLQBqcSbxX4FCYH5KPfXWnnLq5UZ6EXQeXaC/NjHl2UhAeO2E1zunsERrWAxHMZGvYj3ufe1N6q/mf6vt/d9MUSCKwRLiMcpgCMKY50VjEzh2E8Aqm2NEvg2MrYkYgUgZim+q/sJrkJpOLPhjPjoi9a0j+rFPw=</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>8E1McYxu5F16bWrD/bv/T97G+cYugSVNIqEalSgwv0DSgafyQ1ZtpGIpvwO1ufVzZVdZdAZorQd3Ns+S5zHycR+Rfs9K9l2g6hD4E4CK33EGmGkBN12D9Sb1mcBCv6Vdohy96Kw+rkOdfJREVSwg3/JRpGR7IW1YxSHWCKFxZbtqH0QvTAPkH8OPXEvXHfCYKE9kt1rfWBzqJWi/3RszVb6/R8ow/LuBqZdCo28uFGpVEhd2LnTN2vrgsTf7r2Lnart2Qh5n5wUdSzHi7uxCTZUy/VRx5FGzrecZ6h9SDfqUgKcopDtFTibCjKQlSJMxo7ECKuEZ++zNAfcRPrhvHWHL6gLQLHXEE/wSHxYJypM9gBQU/ZXImKdxqz/7xtt6gflHuLgOT35j+OtdeMwST3/AvN41PlsMZzmAjJ9EELZeObT/1ClBo4UdPYySvt1ZLv2hBg2dY7B+JKny0+RStZFBFxTR3cY8PoMp0AnmMBlaq8xAn52tSs2/goXqW3I4LRFPbdK7EOaWi0LTuoiu7TvMPIU9QHq/GAyaOAUpSihi1EPLAMx8oy50XBlHAYOD1N0pq4+zyo09zBX+fS9SwVDtYXyI3qcbEilk/Rqle8ye/cmwqi7q/Yg70GjqaXhRVeu8YZpfgCSD8PJU7j6MGsOp2bLEKrrM1oBMKLtRohSQYrmFCVrkYNDjJ49FbFZm7OoXuiC0CePXnebZXlJP4maDlbrCgMOZUvt2FCiRup72G/fpUApnTtJSzXCoTtmJzY9apXqZH8avWtvtZMqf/QkR9FDZ33U3rGgCT0/efLZ2yW6EQSJGLi5y3XtEwNZP9PDaVDhV+QQ7HDUCzbxyuQ==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
