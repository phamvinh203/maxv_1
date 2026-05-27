<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY Identity "SObcbh9">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY XMLUserDefinedReportFields SYSTEM "..\Include\XML\UserDefinedReportFields.txt">
	<!ENTITY XMLUserDefinedReportViews SYSTEM "..\Include\XML\UserDefinedReportViews.txt">
	<!ENTITY Form "SOBCBH9">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ ngày" e="Voucher Date from"></header>
      <footer v="Từ ngày/đến ngày" e="Voucher Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến ngày" e="Voucher Date to"></header>
    </field>
    <field name="ngay_dkt" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày đầu kỳ trước" e="Prev. Period Start Date"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ từ số" e="Voucher No. from"></header>
      <footer v="Chứng từ từ/đến số" e="Voucher No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Chứng từ đến số" e="Voucher No. to"></header>
      <items style="Mask"></items>
    </field>
	
	<field name="nh_theo" aliasName="nh_theoSobcbh9" clientDefault="0">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
			<item value="">
				<text v="" e=""/>
			</item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
	

    <field name="ma_nvbh" categoryIndex="1">
      <header v="Nv bán hàng" e="Sales Employee"/>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="tk_dt" categoryIndex="1">
      <header v="Tk doanh thu" e="Revenue Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" categoryIndex="1">
      <header v="Tk vật tư" e="Item Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1= 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm hàng hóa" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
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
    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="ma_gd" clientDefault="" categoryIndex="2">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>
    <field name="ds_ma_ct" hidden="true" readOnly="true" clientDefault="DX1, DX2, DXA, E01, HB1" categoryIndex="2">
      <header v="" e=""/>
    </field>

    <field name="ma_nx" categoryIndex="9">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_nx%l"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <header v="Phòng ban" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
	  &XMLUserDefinedReportFields;	  
  </fields>

  <views>
    <view id="Dir" height="268">
      <item value="120, 30, 80, 110, 110, 130"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110: [ngay_dkt].Label, [ngay_dkt]"/>
      <item value="11011: [so_ct1].Description, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="1100--: [nh_theo].Label, [nh_theo]"/>
	  
      <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>

      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="110000-1: [ma_gd].Label, [ma_gd], [ds_ma_ct]"/>

      <item value="11010: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="11010: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
		&XMLUserDefinedReportViews;
      <categories>
        <category index="1" columns="120, 30, 80, 110, 110, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 125, 100, 130, 0">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="9" columns="120, 20, 90, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>WAx1EIzggWomp7TPxhHO3pTgjy2rJDbdwSEsg6CCv7rwYFeyqkzEnI0Yl0FVlrSnS9ZVMBblDwRjJy/Ih6Sv/cOZlY0kXKEHTSgymdoQTDkgdUBCPV1CE07hm8iGY2FrZzXLx6xfKilgqYibCP6jtHS1YKcYWvvNZK+LMwfCZTBJ3lDc4jUG2msylCtDzX3haq/lg+HPD+kAWODlBwR6E5zgJbHLQLrHvGWIKIT9qG48gCZUGdQ+hp9IHpvJqFlsC73QB9bTK66FMdM87/y4xQ==</encrypted>]]>&Form;<![CDATA[<encrypted>VfAQ9kahSaLQDNcRqzoSWFTYZ1C6AVn4AojxGeeLd3Om2qYrrFHJ2bmMBKSlLlv4s9e5F5KwppS/hbtXiuRgDLeGuy1EZbechg5wjksO2ekBOWVLLRy74OCpOvrE++eIeAvsmFDEdo3apObc22hmVnxj7WExSVXdlIbrMaFv+cRtSSc0XphqIhLhlg/tsbfKmBJZBK2dezHDY1/15JVjDe9MMVrJsN+C0hn/HJ0A3u5hvqMtzu0urzwB8scru9/z</encrypted>]]>&Form;<![CDATA[<encrypted>T7qyw9BdwS/13/WwaJD6f5t3O779mGWUpBDTzcGkThK9/tZUM8SCCBtzsyXwJZk77zl0G47TKB43/oriHk8gR382FPQVN4ISnEEjvYA9s61NuESdSnWIMFXnYnYTFLI0nwsCYdlO8LieaDd2NT1zUrWcR3+J8DaW6S9JIF3UP7L5oljZzSeyD4keqqUT496J2tl13fpVzCD7cSN4tcJI9G4NWBqRidjfJlPCkhZZHg9L5WAMFnnwB01YIo4Pz6uJW0HS9tdTnhX14uxsQ8rQvch6REI9TliUV1NDgjCdVXY=</encrypted>]]>
			</text>
		</command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>Let80D0Zwu9iY9cytyoFKuvKjAC91BPaEGJ50LHifayZ8eKPtx4468PJdSlJAjV6PVcWF2SzxmXH2KfHWpV9Bepm9NO02NEiGuNtsVRqPV83SkYMApqQhYsWTjJEoUkzh+b9Rzs+w5jd2QaW32FEiRm3u26IjkruFX2+FzI1qHQ=</encrypted>]]>&Identity;<![CDATA[<encrypted>BEjp5UfllU288OQIa4Dl1w/Wy3hiH2UtA6M+/npY58pvRI8eNOlul99H1KRpCLbOMRvmV1FPhnO7iv+KxKmnSAkYjwj/wKACOfuY7PzU25yLRIODTeJlxGMGLN7temFbIhlFOXlQvs988NyF4I5z/apdFUovMvDe7qm5qjugIcRFoemGPWR/38WH+/Lx0SA3cc3fG9mNGRcuhUeQJdg/mZ/zuDCQCCJk5bC/3bppvxBP6fmncUW1CXP+SaNLtK8Wg9PMRnI3FCh12jS7vmvlHs9KW1Y0hhx5D/ZCrRPTRg/A04ADyc7gi83rgC2A07rn</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>Yzyn6QcPmCnDTAzUFP3y/mp2ogsjZiU5AT6/kckxkrWgPUkLdVZkiwu0Y9WjYyeP34raM7csiJMzv/TurDN5fSE4KuZEoyFDam3yiMMxfm5a03wpP2kyLOsBjo4Ft0vfxzavCgrbp0ziLc36IdIzbSpVIDubDIluP4WnttIHU7qSve+cH4KFCkFk0VYRwwnNSQDgqzLrJfw7bTMMjYgNqXlPWlnXAmhtVJelCztgXzbK7Q66sWVcl173TdsEXw0DNVukgUbiqKNCYSlfojafQNKuJiFpKSAAQjLNljRl/7Mqrukjqw7JkSPpPAQAMyPHWZ6FHmzy9pQO/kKadLqh8A6a1FqokXIKr2l/V/oRpO0=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>C0WRkDFZxLjYQDNVY8h0Irx0nOQ9vX+txp4C/hLDXo/9siCqRBoI1w0MycJx9j4irsFPChr9o0fXwiXGljlhYOqGxIhTwENBvCNcu65KSngz4gZV43LNI85HdP1fjAL/59a2hpwOUKfDfFxZVppdvnxcxgOp1Y9viYy/BqzmE27KUJo4572bHfZro5himXza1dS3aeg6HU0WIx8Pnf5UtgyyJfZhlpYVCJG0tsycjoat9ioJOeEO2ABhB8hu5bLQOoqgumuYFjOnI/9M8iqZLSYcu3Y3ol/QaDPmEgnfuOb9JuxyDCm+WzEJyElMvDzruv60NXEcJkDuvH7Pc+QkwCqePWrW5WYnpPVhlvTNsFfbA+Lw/4btxqJ6IfRd/QfdOIrLsc0QLx2PNFZb2mp74c+J+CkgXCQOciJ/GTbzQrOsPjT+jb2fSZqwStpc3CgIMRTKSOZe6+MBYazG4TQevCIYmpizkhO7jXPMsWC0hjJu5+701dczG4yrMoEwSDNv5dy/0J6nU6dFgqUS3L5Dh5pY501R6GP5T7H6yU/04EPV1OtuCqfmcROdG60VOSe9rTejeGwBtoZqZzXU37ea1YmxQ0iVGVV6wSKHOIkjF6AIPZHVRF4mu302ZSuLFh/XLjtRM6e0en/wlP0zAT2Ob9PFh1FmpKEdAQ95sneBIa90audOwlo7RJiWw5D6ZeC1ppeGFfUpUc581t3RBRklWGjzIHNC9NoULzzb+JdNOZXh5oA8/82KhWEZ4Gult8i/otbR8J/s35qhNRuaM8gMkFNR6AF0o9IkrbAtlcSDQzAEW3kj2GcQA+W9Jjd1X38K4kM/qKb23p5AmNbxa1mR8jdYE8H8khnQGBgaSDFSwMdHA8WLkOBDSQMUOaeDLGNYmqThLeHNm4XghZ6G57WFkO2ybXhT+iQy5cArTxEPdNaSbwjrSf2GhS6E3ZxA60YaDOmgH1ftBRC+XMpua4X0HpllAx6JW5t0RwuQ85Cp9mTQbj7be7GuCHU7C+icexF658bBZi6e8IDt5Lzc02OtoUuNSpAvBn9gO+qawnnqfjfwpYMloAuMzTtXSDsS5aUufNMJphOJ6AktYqnSBLFht3DFy02M1nAWt0o9PEAL1/Q0SEeH8TGhL6z/qLcL5HF0pYJ4+jsAtXQp/H3dkSBDqWNcD9VHcGOBiRc3DfAsixg4cLLpcl/mKkblqaI7zPznupRRoYhC5lBwXQcUxPt8LexgHUSX/EM37SW1SvNQIWpMHSNwGbKFtaGx5j6KiqIS</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
