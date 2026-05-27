<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY Identity "SObcbh11">
  <!ENTITY Form "SOBCBH11">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
    </field>
    <field name="kieu_bc" dataFormatString="1, 2, 3, 4" clientDefault="1" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tháng, 2 - Quý, 3 - Nửa năm, 4 - Năm" e="1 - Month, 2 - Quarter, 3 - Half a Year, 4 - Year"></footer>
      <items style="Mask"/>
    </field>
    <field name="ky_bc" allowNulls="false" type="Decimal" dataFormatString="##0" aliasName="ky_bcSobcbh11"  clientDefault="3">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+/4dwG53iHUSMMLzkLaHEKzz1Zqf7gA48xY8snHOJqzwVfuv6Z/eF3CzOxRCRsL8w==</encrypted>]]></clientScript>
    </field>
    <field name="sKy_bc" readOnly="true" external="true" hidden="true" clientDefault="3">
      <header v="" e=""></header>
    </field>
    <field name="bc_theo" clientDefault="1" aliasName="bc_theoSobcbh11">
      <header v="Báo cáo theo" e="Report by"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Mã hàng" e="Item Code"/>
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
          <text v="Kho hàng" e="Site Code"/>
        </item>
        <item value="14">
          <text v="Phòng ban" e="Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="nhom_theo" clientDefault="0" aliasName="nh_theoSobcbh11">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="0">
          <text v="Không nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Mã hàng" e="Item Code"/>
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
          <text v="Kho hàng" e="Site Code"/>
        </item>
        <item value="14">
          <text v="Phòng ban" e="Department"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="phan_loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Theo ds/ck" e="By Turnover/Discount"/>
      <footer v="1 - Doanh số, 2 - Chiết khấu" e="1 - Turnover, 2 - Discount"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_dt" categoryIndex="1">
      <header v="Tài khoản doanh thu" e="Revenue Account"></header>
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
    <field name="ds_ma_ct" clientDefault="HB1, E01, DX1" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110----: [tu_ngay].Label, [tu_ngay]"/>
      <item value="1110000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11---1-: [ky_bc].Label, [ky_bc], [sKy_bc]"/>
      <item value="11000--: [bc_theo].Label, [bc_theo]"/>
      <item value="11000--: [nhom_theo].Label, [nhom_theo]"/>
      <item value="1110000: [phan_loai].Label, [phan_loai], [phan_loai].Description"/>
      <item value="1101000: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="11000--: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000--: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKuvKjAC91BPaEGJ50LHifayZ8eKPtx4468PJdSlJAjV6PVcWF2SzxmXH2KfHWpV9Bepm9NO02NEiGuNtsVRqPV83SkYMApqQhYsWTjJEoUkzh+b9Rzs+w5jd2QaW32FEiRm3u26IjkruFX2+FzI1qHQ=</encrypted>]]>&Identity;<![CDATA[<encrypted>U+8wREa88WtOKHxcEC56a/iSbYKliFN3qJ8mrMSVAzQCX7mlCOY1YQxwpORjjhUX3BPjbMh9yGpgBSHw94EQoR5xM09aqmRjtI3m6SIKry7Zc9kpjOMxRzH9m7lkC4OBDKWLHCWpog7ipG5gtW7Z/7Smovx1TA2Tl6u42iM9iEW9Lw1b2P+9Rw+e2IbqCt0QeRI0uqGr1X9qgsx1oAfyej7Hf/Ssntymo/4bB855d14mSKBTOp4XBhl8TJ4zIFc5Mu5UrALn2r49ke+rhdiOE1Lmq70gnhogYaiW6nzWVKnczpeg828rrFkE0cfjaVN9Z1qnLQHe2xVnCopFZcrju9kCwxj/56nKRkr+MG1JY05O63+1GrjMtkAbzReeuNDVa7i7GPDDWW0MBXOhoG1x1i3KfL/t4f3vbu2POarsH3W94Nb5Y+nEP04495FAHGxxJNEX5zxD3/KLPoicfyoyotrzbTR0hKnX8f9AqZhePNsS9M8gwjsd0nUznKvMenjoK+TGbWfUhT517sVt6JvGj7qhIgKMrwoTXPkue34j3nQjf5L2qggbV0SNpzNAjk5z1ImnCIX0QMaIO/rnuR+HwmUww5KRORLZLrDNgkV7r/rnnYY8VDauu+AzwDfZPNUQwdOy0u8iVmAE8ZAjSvOQquHUs4VueYZTNV8yXcAe27G6dS3pRqe+MGBrql4aflqL+7X9qoaJMtWW9MMzFUx2/g==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>SGbVwdBrHSskx3fiGWp+MoYFE/GSOlS/6WD5x//Ly1dPL6DKKWtLGNllaZT2aYtbHBdUfgeCUrIaBDXkfGOcs5evThLW78zUKFB6rLLaHKtN0iVfHmOuSD6J/ixZGORjpCwo+2lkfLw+oM3JN7OX+xIaKiBb6WNdENUXQqB8utJzljVQe3KYqIb2K7hehzEDB5pOeo5n9PkExY8oQ48e3jNs44d1gD6R/pMlKHFFjUDpYpDYSIQl1/EAH5aq8Gu5Gu4oVVXXoH3as2axZUpk8vJjk+C3s7FH5InchQFwSBY+rxAXo3cr7gShZsys/p6xHH8yE0Nk5ziREHpTIQWEvlfMZmOWxQEDkdbPsUFErJn/squHh+k1XN37AdxYZVa1nUV6KxFGzsQ3w5VtMTfxvaOEuhwpZBQ5p3gzdcEG9egqj9PK/8is8vqRVrXDU0RLFhSXm4ieJv5bscxlVnJMAPrmHRgLCOxo0P2PAOFmmymrE8KPljO1e86BHlyK/QevOY4bUTdzCdVi7nWvtNLhOOT8PQLXWfUsFSxaRz591wnc6VfcSIZgC0BF9HWWwa9JAI9tZ+swMPJiJ2TfEjR9SA3B9BglQs9DH1YsPqI2iSlgj7CsBgSZ0Npk1bTblZCxHqKaBsWEyJEAeD1joAXq/NpAQZ2caJk7/MKmbZmQ0+FSv8aWpRF8AcUlKHj0zQVSJFyx8G1VJSd1QR2es/4hNexR5xi6qqrHq+cmfeLD0w5ZFN79f46Tx7T4pEdQmsAArjf0TvyIrdaBndFRiEdr1HcOTyiaTaynFH1JhWP7cpPDrStD60waDrcGgHmUQZT3nw7R2xX07r+8rWb9DFMX2xNcDP3YgtuAztN7fADa6wmq1JRc7ZQ/1tAd2DnGeV7xkIrFn9BVXLLAUSjxhxgXFDefjmivQYhacqtGqIi31+3XmDZcgTm0VZNVd8yln/vBGYbqvKjUs2HRLlbJTYZSsgvfob4fca8WneUmuKZOgnWe0q8/IoKovqL/XJVcYx4oGj7Nsodn2W+Tx8VTD7wjy62y9WCEXUmliv7+wakghbuHsV6zNGd+N2dpU1jDz07pKaJ7rIqzScJdOahdhWX8YfbnYwOCoGZTVALEMqOHpiM=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
