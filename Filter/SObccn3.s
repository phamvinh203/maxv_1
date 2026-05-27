<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "SOBCCN3">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ ngày/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="tk" categoryIndex="1">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l and tk_cn = 1" key="tk_cn = 1" check="1=1" />
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" categoryIndex="1">
      <header v="Khách hàng" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" categoryIndex="1">
      <header v="Nhóm khách" e="Customer Group"></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=1" check="loai_nh=1"/>
    </field>
    <field name="nh_kh2" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=2" check="loai_nh=2"/>
    </field>
    <field name="nh_kh3" categoryIndex="1">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="CustomerGroup" key="status = '1' and loai_nh=3" check="loai_nh=3"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    
    <field name="mau_bc" categoryIndex="1">
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
    <field name="sx_theo" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="0 - Mã khách, 1 - Tên khách" e="0 - Customer ID,  1 - Customer Name"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="137">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [nh_kh1].Label, [nh_kh1], [nh_kh2], [nh_kh3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

      <item value="1111-: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <item value="111000000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 20, 20, 40, 25, 100, 35, 170">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
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
        <![CDATA[<encrypted>ljD5ez67xE01Tx/ZIYH/5NqJor2HErpXNCwTjzTtDS4ELyMbao1nQ4tBu4uoAn7iOvCWs4YcvAi66xQbxnLnkOWaTYcTC6l+ENoAAg0XQhkIjqoh/ODn3QezVGm/6CrlVtrgv0HCIJKILNTHSwv00lVKAJww2PRVodKEihSt5bTRGXhz1XV4TZ8tTuunyt2qGEbMhkMq94RjDKc4Y34na+i/EL7vi6k6Glwt5oww+/MYbhY/z2uCXC3seflSuiJ+ZTkq1VxbXaMTx2O7y9ib/gjcQZ0XSXWc6Q5YBqXRnRWtw8QubqVsp9agW8fKMqK2Y6qCQT+OevxvRaNO1evogFFaAPyWDjg0Cyrnim9P8uqkQxjI7udKz4Raqot8P4tOYo1NTXDVBEBLNXzUIbVojQ==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>0Zq8sdkL1boTULiLfLfNPQjHnCVJpysjHwi3nLJ9+AgFaJ7BNxeEbwXGDQShU+QeycpieZbJLL68OLM3u19YtLQHq0pplYk8cFeACy92TLDKLuSdnEDmOO6r3bC7TFfuSiEZMdHt62fEk2/EA4rvSvTylTT7bLNzFd7OhaR5RtO5wyki4hyseoS/y9jFXly8aQPdhmDjCE7WHk7CvTFw5Jq11Wua9bi+Ghz7bRtKLhS574F6vcU40u+MuI+6xFf99skHdfPKu+JZNT5at5dXSFx866olM5SuJRzO/SGFaq+sdspVn1AvHcJRwTAljNhYnx+UfyIMqtGrSfqqpOfxNAXGTKpAhLhdF9UeB3lr/Nk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWMYCosjZqJHbV1lfwbixZUsT1DqgM+HG0ddHTkGAd92NepnMLkqF12pIiP/D00sy8W5vvpus70ugT/BSmnKXvglUkq4q6eUKguIBEYgnkycBn2vXU1jd2Un13In+YTZ4o4iWfUN2Ej+n2ZzLkKD6/lp5iuAnQsVP/x6AARSX/gMM+fR45vAkasWrn1j4VVDsSnanSZOC7c4zSZsrv+yNZO2ulAIJ+uSvGL5gd3NYSKeGPzBUBKbCH+BkFm4K+lsY6vx4mh59rCLIgZQZDEME9x9yc3vuV59r99kDFgFedVGNo1dlavMOAnn0gBtoe+3sbvtE3PfqIWqDWE8873PdPrss9CtSXveQhUsaxzn9Z+LUzfQDbgs5VARMFwnTpPvM8XP30CRFsTKaMYKSJPtFV5k3t3aeRTFsiwuR26EcRMJPZccBUMJKeEB6zUooAUKRnnlwAmF0jaBZBPZB5ZZqR1PY5gTC99VtuLAinggdw++r6ZSGkIBoMTgAcGyTLxvCH/444QvDvnJkQaJqvQCQEiV/23eIpodswmQV8SNKDVrUxA+Xcv4SA+tnmNcEF822KbX+WMBIrnwl2DnibeJy7rgySZYfFEUi9NOBLju/mzo+jQpUXefNgnJrwEhfwQEBneXmmbq4X4ugN06l++Ibcz1rEcWlsY645f3miNNW6CZ/ivFhvxKcvBeYM+hJHASlU4M5xxQ/qSXmtIOA82vkjYlSzeaEQRyVba/4SjsPva+ca6B+ShnERrfXgAEdKRQ08d3KUUizTfX4CNVDtxgi+CFe/U+rMoN4M00QtPYFinG7jn2R7RHNQSTqec6QOG7BKSXCuFHGKeA8Z/16d6CSBfA=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
