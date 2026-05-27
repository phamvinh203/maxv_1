<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY Identity "SObcbh8">
  <!ENTITY Form "SOBCBH8">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="bc_theo">
      <header v="Báo cáo theo" e="Report by"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Mặt hàng" e="Item Code"/>
        </item>
        <item value="2">
          <text v="Nhóm hàng hóa 1" e="Item Group 1"/>
        </item>
        <item value="3">
          <text v="Nhóm hàng hóa 2" e="Item Group 2"/>
        </item>
        <item value="4">
          <text v="Nhóm hàng hóa 3" e="Item Group 3"/>
        </item>
        <item value="5">
          <text v="Nhóm giá hàng hóa" e="Item Price Class"/>
        </item>
        <item value="6">
          <text v="Khách hàng" e="Customer ID"/>
        </item>
        <item value="7">
          <text v="Nhóm khách hàng 1" e="Customer Group 1"/>
        </item>
        <item value="8">
          <text v="Nhóm khách hàng 2" e="Customer Group 2"/>
        </item>
        <item value="9">
          <text v="Nhóm khách hàng 3" e="Customer Group 3"/>
        </item>
        <item value="10">
          <text v="Nhóm giá khách hàng" e="Customer Price Class"/>
        </item>
        <item value="11">
          <text v="Nv bán hàng" e="Sales Employee"/>
        </item>
        <item value="12">
          <text v="Đơn vị" e="Unit"/>
        </item>
        <item value="13">
          <text v="Mã kho" e="Site Code"/>
        </item>
        <item value="14">
          <text v="Phòng ban" e="Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="nhom_theo">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Mặt hàng" e="Item Code"/>
        </item>
        <item value="2">
          <text v="Nhóm hàng hóa 1" e="Item Group 1"/>
        </item>
        <item value="3">
          <text v="Nhóm hàng hóa 2" e="Item Group 2"/>
        </item>
        <item value="4">
          <text v="Nhóm hàng hóa 3" e="Item Group 3"/>
        </item>
        <item value="5">
          <text v="Nhóm giá hàng hóa" e="Item Price Class"/>
        </item>
        <item value="6">
          <text v="Khách hàng" e="Customer ID"/>
        </item>
        <item value="7">
          <text v="Nhóm khách hàng 1" e="Customer Group 1"/>
        </item>
        <item value="8">
          <text v="Nhóm khách hàng 2" e="Customer Group 2"/>
        </item>
        <item value="9">
          <text v="Nhóm khách hàng 3" e="Customer Group 3"/>
        </item>
        <item value="10">
          <text v="Nhóm giá khách hàng" e="Customer Price Class"/>
        </item>
        <item value="11">
          <text v="Nv bán hàng" e="Sales Employee"/>
        </item>
        <item value="12">
          <text v="Đơn vị" e="Unit"/>
        </item>
        <item value="13">
          <text v="Mã kho" e="Site Code"/>
        </item>
        <item value="14">
          <text v="Phòng ban" e="Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="xoay_theo" clientDefault="6">
      <header v="Xoay theo" e="Pivot by"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Mặt hàng" e="Item Code"/>
        </item>
        <item value="2">
          <text v="Nhóm hàng hóa 1" e="Item Group 1"/>
        </item>
        <item value="3">
          <text v="Nhóm hàng hóa 2" e="Item Group 2"/>
        </item>
        <item value="4">
          <text v="Nhóm hàng hóa 3" e="Item Group 3"/>
        </item>
        <item value="5">
          <text v="Nhóm giá vật tư" e="Item Price Class"/>
        </item>
        <item value="6">
          <text v="Khách hàng" e="Customer ID"/>
        </item>
        <item value="7">
          <text v="Nhóm khách hàng 1" e="Customer Group 1"/>
        </item>
        <item value="8">
          <text v="Nhóm khách hàng 2" e="Customer Group 2"/>
        </item>
        <item value="9">
          <text v="Nhóm khách hàng 3" e="Customer Group 3"/>
        </item>
        <item value="10">
          <text v="Nhóm giá khách hàng" e="Customer Price Class"/>
        </item>
        <item value="11">
          <text v="Nv bán hàng" e="Sales Employee"/>
        </item>
        <item value="12">
          <text v="Đơn vị" e="Unit"/>
        </item>
        <item value="13">
          <text v="Mã kho" e="Site Code"/>
        </item>
        <item value="14">
          <text v="Phong ban" e="Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="phan_loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="By Turnover/Discount"/>
      <footer v="1 - Doanh số, 2 - Chiết khấu" e="1 - Turnover, 2 - Discount"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_dt" categoryIndex="1">
      <header v="Tk doanh thu" e="Revenue Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1 "/>
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
    &ReportDataTypeField;
    <field name="ds_ma_ct" clientDefault="HB1" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11000-: [bc_theo].Label, [bc_theo]"/>
      <item value="11000-: [nhom_theo].Label, [nhom_theo]"/>
      <item value="11000-: [xoay_theo].Label, [xoay_theo]"/>
      <item value="111000: [phan_loai].Label, [phan_loai], [phan_loai].Description"/>
      <item value="110100: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-1: [loai_du_lieu].Label, [loai_du_lieu], [ds_ma_ct]"/>
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
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKvUVNBXDDKosuvJqBVaY10jSRODsw+t2L1ivibC+IJBBpRDWmRNl0JH2TZFRBKxObV7idltLFvk41t+9VbnoyvzoHKwk1WEaoRcwndbSgQ7pBP5PP8N7V7v7T0/x73rnLbbx6MussXAItJhiKy6HQwE=</encrypted>]]>&Identity;<![CDATA[<encrypted>6ELx2C8BbPsIuxeV3XwNmSjNJvSH7gzgiyPyucfpd1iTwpo6LwRr7dv0H7kh9osL6Zaishi/hy3Ie/ZgVr0tl9GqqcVCZh91v0p691QLovDflrxMXxKrhiLMffWuhsgu379eCayqOak1oSZwTlVyLA+ghsyD23dDkOACCLXv0FLc7QJlABTTt3yS4u2i5D4jQSKdBp+tRinBrj4OUqSvO+ggmXezLOeQ039ixSrXnLFyns5zbUDH0giuhE1ayT60YZ0gJkFJDLIFiHWyLhCuDkE7GVKqv1ycyWHy2eoS8NhoziUUJBY5JpbRw1D9KF8XhSz4yukbFus4ycIM41DbC/TFDCOgE2p+vdYPdSwyYauk0s1z+yTjHcYTkm64CvcTcoE35EFWapoovePAfyRn1w1LHDemLFd3Mjet1Iw/YTXtPgsn7beIIrNYCf1wrwy/QHT8ZoHpPBJpzMgcDZX9BQLAY+26M3vx0FOE/3rYuuc8j9mc9pi4lUowbqjKqiww4Q0AVMZonnyxiIlVTAAJPR8jNvQpvuc1+sxJplLWdbPESkjdgFCwT59+NSEq9QE5NW3g524Oj69XLZOIzUen8XSgnP59ysWB3wuv/3pOsmo=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>tgMklpUYoNaWxEcuj6c2/1bwRmbBF1tF/14G+sNShigzts+VawSOnnczY3eBQJ8PFb1QqBDCq/UA3LFmj8NiXa3DxqzK+WnsKwHpp0K3OsBiuQbiku7D2IHlwLgGwPGbODLNChfkrkYQ+JsQAkmRMS0GrVjqbAoaIapsMw5LBHNFkArhUa+cc9LcHjqV5h+jwWz8R2dNRdtC9AYpFqJxuna9eP+9OgkW3vYf9iSA105w3z3yvQV+BvNT8I6cPEBOVBFmtSSmolAb16o8ugJa7nhOlDgcLn3iNPZUs+myXSbrJguMd1idtZUZs/dX6mn9Zd+ZYcIY4cgFIwgGB2agHkbd0GNrY+TkWG2J3HEgZgK/hHHKlK7yVyrALTyUHoZBhTIYyzbVoPuzfuCCwNgYcB3a5lR1bNiRuWZMDd7BAUBNJE+5Qz95XKf8fR57EeKLxG6BhcagMBI7NZrvvkkL6LV0NGoir6tzElmoLFvo2i057ypNrtXwS6L/62l+WVaUOoXD8PSsJWNnP6PbrWLQeif89zkNp0IbWfrXaphADgVsNiAI5s5LDxPjdvKE5PXFgu2PEsQ/J3Q8A8Py2z3UDPqXV+DJfk2EHiP1+syB/UjTHKq2GdjLi82FdChdq4LXU2QlxiXX2m/Y/qsnndxTynkyQFL0luuteikgxHnwZ1PDy1qSpoEgKaScF1jligjxK86z22rWCjZFTqUHUjhbxdAJ1cVqgHFbzs6j14D2k1s=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
