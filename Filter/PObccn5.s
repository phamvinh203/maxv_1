<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "POBCCN5">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultAPAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultAPSupplier">
      <header v="Nhà cung cấp" e="Supplier"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""/>
    </field>

    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hạch toán từ ngày" e="GL Date from"></header>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hạch toán đến ngày" e="GL Date to"></header>
    </field>
    <field name="ngay_hd1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn từ ngày" e="Invoices Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoices Date from/to"></footer>
    </field>
    <field name="ngay_hd2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn đến ngày" e="Invoices Date to"></header>
    </field>

    <field name="tinh_sd" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="1 - Có tính số dư, 0 - Không tính số dư" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc">
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
    <view id="Dir" height="">
      <item value="130, 30, 75, 105, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="1101: [ngay_ht1].Description, [ngay_ht1], [ngay_ht2]"/>
      <item value="1101: [ngay_hd1].Description, [ngay_hd1], [ngay_hd2]"/>

      <item value="111000: [tinh_sd].Label, [tinh_sd], [tinh_sd].Description"/>
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
        <![CDATA[<encrypted>i8xzUWEA4lYFM2kilvgBSGv1bOJ4r8qX80Fu20vA0QAw47UNsNG+RaYXe6TjaKl+H5cm1nT4vF349RpeUL1RdAXDaKMiH/slmyN7CE+GgOCH9qnPVOgzv8aIc82gObS7ey2XZ6AqjkRPMQZ9TFdoKJBrw4K0P7E3JiXWyxiikjdAIXZYqFFCO77FKDXAcMo/2nm3qg0+aNG9sPz61eWKzO64WWz90EFzfMoioDE0g866ay6ig+EFJhDHp2Xv4Gge6MdPEyz6shUsmlaaNH5YxcAkh2SvgMRbEbbZqVXr29wla/XTGfDbunV+hVBXNW0BGNyVLUByx5ciW2/b6/5nH8nNXyKRXo6Q/z05RSQ8lLPMXMoACqjsJ+j61S2Ek2acTvZnI+diTACfINdG4BXgajOy07Tzm2ab2BR2Rb9m9KiHVo/8LA2OCvGAZeNEkEpmrX2pA4YcOKDy6nVQQlKbDRbZU/2d1hjB9/+m/Q0LFjvAg7c3bi7+ALyMEEVh/rmewK+/H6AvP2nWRB0cEECqaK1dAm+nuuTKjZSEywJ15w4=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>3IIG3VvR8liMMNaL8yCXHdyQaiwEOAnzFSc7V2d4FKD+dkvJ+iML0r9SYG88sY6ncuWjmhJracs/rxzmmR/vMiFmHvgc5YF2VmjcjBlClEgILg7w+IQbYOf6M4drMeO9Dy+PRBcKoW9Ij22D+eSneU3pwn16O6xYnE+SR6MRYGqzax3yJuYbtd5hzFJMLZ9X+a4jbi1Z3/uEAaUp98dL/vXmngiuOl8nQQXhxaCLiCw+NWG4gh7j6ptuFcrkt3jXZD+uzREqk14u7Im+ek25qW//+7WnyeHczBYIoaCeD0dVutIOIQlTSJ90bdZrAe+sfqC3n1rxBwRjYRD2iWipAS1PbM3NrEwq4/l+KPSM3gsWZud3yapV9pFbo5aqDzsidyiwf9L+Wr9F+lv1kcbhgBfS+iZHqIOj4ZOPWVhTqOLwZOMrFoue/E4DlrTHAXRj9mBkhYed6aVJJS/gPRyXfqoYlqu33pPEesNAjk3MvAn6iOF8i0sQQbtMt96ylV37+cPGrXovclSJ8YNTJX1fssLfIsPgBbqFU8DKAnGZBAWyFBZIbWaG1u1cls24R8ZbS43ysVN1K0AoXV0EggzY2Zh3ZThAikS3VxIqLlRB4yXXGPfHLh/u+0NhIGVLtxxDj4zaSQiCepHTQAs9g1Nk8TPPQ57F6LFpz57MTV3HTQQgri5J+k975iKP+JmVeSYlY4Gua6Y3WO4gJOzv9eZnO03d4WjwhRiBXMDU4Ve5Wt9B+n0IWZA5VomBWfjSraD+Dk85cUJksXsVpAVeKH9tgXrz93dYOL1feL5gch4ey9tZDsh6DjSi7Z68OJktnhFu9LZAdqg6Nw9Ltk2ATPZR2F3H8DI65OoiqGRa5WD4aX6UmWYP+1r42cqaKBRpzTe2sVjsy/6VXuCEYWkB7Ivj7UC/HsN3jQtC03X3TuQLp0ruXJRawtwpihAhcTDhvf0X</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>2ga57gGKoC4n80lu2Ug7Dr37QvnwA7TqfqEkV/zvfEqBsjnSJd4jtZmWaPeA+CqpjFudaJVqE/MhA40GOJ/FdHM3lgNE1wq21JoLctSaZVCwo42fvIywt89zILro9LZG46klllOmgcEc0sbs5ktnNCmNo9npcHt/xvWaZYYWuRrVBHWLQcimhLWnMD5tzLQMf4URUu+KiNRN9I+X0kswng==</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
