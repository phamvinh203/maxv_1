<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCINV6">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày tất toán từ" e="Write-off Date from"/>
      <footer v="Ngày tất toán từ/đến" e="Write-off Date from/to"/>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày tất toán đến" e="Write-off Date to"/>
    </field>
    <field name ="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="invoiceNumber">
      <header v="Hóa đơn từ số" e="Invoices No. from"></header>
      <footer v="Hóa đơn từ/đến số" e="Invoices No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name ="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="invoiceNumber">
      <header v="Hóa đơn đến số" e="Invoices No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn=1 or nv_yn=1)" check="(kh_yn=1 or nv_yn=1)"/>
    </field>
    <field name="ten_kh%l" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10">
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
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="">
      <item value="125, 30, 80, 110, 100, 130"/>
      <item value="1101--: [date_from].Description, [date_from], [date_to]"/>
      <item value="1101--: [so_ct1].Description, [so_ct1], [so_ct2]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110001: [mau_bc].Label, [mau_bc], [maxLength]"/>
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
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjPYWN+JsrQzhKGElDAhYbZltdCZ5xYr0c4DLKUygdyKsHPiuc0nnkLbSCYZkGKMsWzvxlONwnr8LajAKBI6h+CEcWRCflUqpEUcYwvPpQRRGLrx7ydcfgSPzTUuk4qWufGs0ckbyaX75gMtXIWnOZUE=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>olaLgH7GIbbjFBPXz1mHvU3OQkIp4oyZu5rnH4FPVke4/JfgyLL+mgjWHMw8Zzkaw1pI7QxKrSO5++ecLWTiQ/ShPjMt+gbuT/byyJhfXzeTaun7YdH8zKjP7EheZS0gznuAgahKwxyrTi3VyCVtUGoOoARcPU5pBwgt6yj9pQgiwAHDIBMf/Fs/zuYhj6FWrg+/YDYCGs0i2u9LrGmmCBDvZdKvXJRGe66d2lmOsRrMybSLS+DrgfvkJjD1w1d1T/GbFon6sedDowIp3kZhVz69l8Zj0/Nl8SevaXFGQjX/QqjPuULjaUDn1zhuosfF8bloLXHCFMR3r8VppTG9tlwGTkrH+dWBZfZdTx8F6AGeS5KdYNrsKL9FiGgt42g3OEU730p+lQUiiCRCkV1oNwruBGsV4f5Womy+U2AN6k8kdChrfb8SDFQrlMcDoHfq9lJ1195kIzZxBs5cA4uCI476fwoNLyMuapmzbPdMrZH20HJxleGNt1ZaKeVEXZz4l8bOhaG4YZTps/9SZcRFqyzQJwO/NuoPJDL40AztKnY5zvnw5w3otR6A48QuvycXla0sp7WcfuxfwCcvdAZY9n1bOAsGHBbYPfq6tAfVtkBE5l199Grr2HqC3I0iRedq5EYkdlTlNN18GRtOwXGhpkLuXypdB1cW86bpoKkHmoqN4JJa99/Z3c+BsAhZZyJugGisACrFuePld4UNE+gbmA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
