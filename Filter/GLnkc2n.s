<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC2N">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ngay_mo_so" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="nhom_tk" dataFormatString="1, 0" clientDefault="0" align="right" categoryIndex="1">
      <header v="Nhóm theo tk đối ứng" e="Group by Ref. Acct."></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10" categoryIndex="1">
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

    <field name="tk_so_cai" type="Boolean" clientDefault="1" categoryIndex="2">
      <header v="Xem tk số cái" e="View GL Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<encrypted>lmFWPI/nVNslkmRSbZ7p+OP2hUnwsjQ6UDvFZJmwB/aH6UZ09Qdbz0oIwjg4Dr8RtQwgnnzqN0zM7O1Os3+Mag==</encrypted>]]></clientScript>
    </field>
    <field name="so_cai_yn" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2">
      <header v="" e=""></header>
      <footer v="0 - Xem tất, 1 - Chỉ xem tk sổ cái" e="0 - All, 1 - GL Account"/>
      <items style="Mask"></items>
    </field>
    <field name="tk" type="Boolean" categoryIndex="2">
      <header v="Xem tài khoản" e="Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<encrypted>lmFWPI/nVNslkmRSbZ7p+OP2hUnwsjQ6UDvFZJmwB/aH6UZ09Qdbz0oIwjg4Dr8RtQwgnnzqN0zM7O1Os3+Mag==</encrypted>]]></clientScript>
    </field>
    <field name="tk_1" categoryIndex="2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_bac" type="Boolean" categoryIndex="2">
      <header v="Xem tk có bậc &lt;=" e="Level &lt;="></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<encrypted>lmFWPI/nVNslkmRSbZ7p+OP2hUnwsjQ6UDvFZJmwB/aH6UZ09Qdbz0oIwjg4Dr8RtQwgnnzqN0zM7O1Os3+Mag==</encrypted>]]></clientScript>
    </field>
    <field name="tk_bac_1" dataFormatString="###" maxLength="3" clientDefault="99" categoryIndex="2">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="xem_tat" type="Boolean" categoryIndex="2">
      <header v="Xem tất" e="All"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<encrypted>lmFWPI/nVNslkmRSbZ7p+OP2hUnwsjQ6UDvFZJmwB/aH6UZ09Qdbz0oIwjg4Dr8RtQwgnnzqN0zM7O1Os3+Mag==</encrypted>]]></clientScript>
    </field>
    <field name="tk_chi_tiet" type="Boolean" categoryIndex="2">
      <header v="Chỉ xem tài khoản chi tiết" e="Only Detail Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<encrypted>lmFWPI/nVNslkmRSbZ7p+OP2hUnwsjQ6UDvFZJmwB/aH6UZ09Qdbz0oIwjg4Dr8RtQwgnnzqN0zM7O1Os3+Mag==</encrypted>]]></clientScript>
    </field>

    <field name="keys" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="112">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110: [ngay_mo_so].Label, [ngay_mo_so]"/>

      <item value="1110: [nhom_tk].Label, [nhom_tk], [nhom_tk].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-1: [mau_bc].Label, [mau_bc], [keys]"/>

      <item value="11001101: [tk_so_cai], [tk_so_cai].Label, [so_cai_yn],[so_cai_yn].Description, [keys]"/>
      <item value="110010100: [tk], [tk].Label, [tk_1], [ten_tk%l]"/>
      <item value="110010: [tk_bac], [tk_bac].Label, [tk_bac_1]"/>
      <item value="--111100-: [xem_tat], [xem_tat].Label, [tk_chi_tiet], [tk_chi_tiet].Label"/>

      <categories>
        <category index="1" columns="120, 20, 80, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="20, 30, 20, 50, 20, 80, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>Z1uNJj3ALDtGeYpMvP7XopOMGlE3agtrsfTvjf3OZYhdjX6Oo/YbYa/Hnky0aKyN5PpGTdYVcC6RRKxsKoQylGzL1fnIwycDIU75Ko2FOheuIn39t8h8Ju/f2bd/YA3ktJXGESfOKtZd2gPsQHGBriHbg9Nm4ylGMip3lROSY6fs9cZyOHhjhn7WZdNj3+vY+OvjVSvkU9UB86CVj6HjjnMaWnwz2tXpAVVJSXlOA1NY+S5/TqFaOr+B84bCOLYa</encrypted>]]>
			</text>
		</command>
		
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>mrT634qhuAk8YVAUIIdUmlW6j93eotxzWaf+9U2i/yHhlf1r2D+//4+wi1eMJ6kobRaKluULTAhlFamKzKeBr8wAABXkH7hjvq8mVKMNeASM11S7wIpQYHUo0UMnjTieNVBVjWre86zkNouNfJfmF9/edoC/+TV4oG/g7PW4fyz9hVhS7tQSxnpSFrcmqcFc0lASpSphzB7v2GQ4XAmmVLyb9NXbGtgVrWjsuGE6JnNhmCo3HL8z2TltBqqpuybuiSVnw3APAIOPI6EOq2MinO4QUisT4Ebd9eMTRLVkqpqo/S9UEwdQzMYwZrkM1ieU</encrypted>]]>&Form;<![CDATA[<encrypted>DC6cXz+LqBiMtFaB+AUj/qCIywLu6Gr8QEEi7z2LxAqG3A9vWBJbhSvrABokIC4pyTPzz3HS2Fjgh9bC/wTM9eiHGR5HyAoeGgYQB6LDeoWIlYEuN6CTN13KheoQ+TCrNXpxqxdetkgLbeoH6ImfCGJN7IMihnocTX/kLpHLNEjjaAHJxZV50G5OImpJarwgNTT1z3wWa9pcdPolYU2dKwUwY94U+vCctvskDSb3X1DjOAGX9Dy7mF6+QgOtieW1f/wH5L7yhBCANidLvB+lFqKRNHsYQAw1VKWMQd80YdQkkAzl4KXrKuDugH2ByYX4f0I93XvFbUGlTt5VHWkYFIFMdbAf4MnQDIKF2cuE344=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>JJ1cTEWTdNeSYZCqno8trni+GAg9I7QEnTFYigxr8pNTk07bM32gfXWtTEsEilJHZhqjhm2W6I+574u9S8lwViFa9pMnjwacehaFh0Cb9Py0qbkaq1Mp8lwYQrD9UkM/xO3N0UVIIe9kTpcOqd4rEs+la6yrLpm52rSdk13CZ1/Tee7LtPotj98uXl2eN12VfWhKjZfRluL7s1wWkiSpedOx64d8Gy8GMom2nAhHUVK2RrAtgtDwUwpjNZGscLIQcQNMRreZGMRZaO2B7uogtZtvEMI2G89xnZW+5cDfMM4+1ozgZgmxEBZTW42SnEXQyXp5xEQuWaYWLAFSIxog/ptWIpJc9CuRh2n8LFH7+t17sj86W/JwoXU1rjvdng4TY2Da1lk03MNDNdpWPT6u6KtZs/sZHPc44d2UXltegD4LIPATMYObo45xFNhKXDUtWdsSpvQ4XQ5dlGXZqUiH/RqnXAR+daTEmd0E05QGa/FtyUVZLHCFQ4oftPhPBEr/GzwWEWY0tEGtXs5b3BzzeootE7nuCvcJowAvnJoQZEzULvSunLlhUACbelZ2ycOYguaLLmpA+9AF5sMuFDUxT5RnWwtW9Mal8S3YKIJCk6UCIDN2wdxzW5nZTwSOdrK2dvEEeBJtxD8tX975CiPYVu8KQVZIwzPA3buqYWlEVD6xtFmD1CGtr3Q6UDEuD2DiI5+30VQ9Uwu/FMZTisCIbsjO4PHfFGITkVAhz73iTAGeV38aKAUAYKUcGRbNIFyUW+wDRXuJDd470G5PWLOBVclzpe1JQ5FnRTMQHBsGr+9Rl7P7VT3dFGbHofFCnTE7vs2DxATuLSqvRO/6waAyaxGtweUllp40bJkL++KEvQ+BVSig/nInuo9fg1tvMH8BYbMF5C1FDXInnABjN/MGaZT/mq7u3CiYYd+yFex20+FbdKWb/dN2Fx6w/yq7Cqdej3boql6zJ1mB7jUqsFDWwDAKS8UjNRSjiNPhC48kdgqp9YATKYogkXG1wAXWDiMlwzmG1Zxw4fajsOUv4EG4ZpfBPDij3H4Neki+UG8jinYPeShC507lB8Sd/IikUbXgsXa4mx1RKiZG8bcKVZvN7VAU+iLZJKa1oFHLGcpuYJcfhbqilFyzknH81FhXeITLnYS3bXyNh4ToFzIgSPN7Rz/N0XqvExqu7S+4fIwVi3pVjvaBVzKbILIGMfoJEgUR1lcfkJZcp1Vr31jPPvdLq421IEa2edKfbd1EgMkl7EYCZf2LqmYi8WQ3V64qFkuYSXPOVA2a1efNiEX8GiKAWIiH7Hw/rRh4yH22ng/qekKonE3dCUDdeKvsU+6z9HV2kguyARxGKnlyV1THu3vpRpblf6FjeqUYEMayWrcN05XMIr4BHvuXevvV2fUwrKqRELiSYa3ahfqTDJpR4BjbnAYFIR2wbvbLeVmQOcwLd4gmQuwhVliZBEUjRqgYynbbtZmLjEK1WsyTGPjg/uqknQ==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
