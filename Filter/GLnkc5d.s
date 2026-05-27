<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC5D">
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
      <item value="111: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="11: [ngay3].Label, [ngay3]"/>
      <item value="1100: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>afqFQ2amOZlhqRtx8mDy29278af09EwqAoER+OOvismIOiDFdp4xWZfhb1GzI7uq09MQmNf6Mv+3y+AWIFo3KuyrZE6/PH1KuCJjmNfNJFreK5sAtx0M2urMxAKLWrjADD9hUMqylUhlhrFDq2CuU1uZBK9nx569qOlHoPkQSvhFBrIctpQLScMnqszMqy8xheAx/Csba6vafXrU4ezXucfiturPTAs13/SSXzXhF202PCWB33pv8b4SO1lyv7yzaIwRR4sraBi9yAbw/wL+qgUEqmCByzcGULIueNufK8pKfbTcyddVtdpCRZcafIw60q92kE+QpBzvqeZ3pBFz2HhcbWqBcSHKs+YcCLrKrkgKn4UTlgKDhZl5gb2ZIunuEV1p0tB4x8buIY1CYEXufCc9YNJTEfZxQoBp99si26TFbXQKWG5m7NMDdoPRy1xD</encrypted>]]>&Form;<![CDATA[<encrypted>Lr1NteVNwoCCCOYg1Mt9MadLd0jwDkvVt1B/dHgs1OTZ2X9d+hOVVJnT1NPsYQMxmYAXCJvn8T/8G37pSx8+JEEfsj3ZaNhVbxSjanRRCguSRABopKKBgsHAgqkC/gjgsWd3r+Vqmhs3wZASY5COZFT0myUuX/EmwqE2j8UMarVJnRmzYYvCr4KCChr85aDKNPERTV4uQm3sUbxwrB8pAuxHTWuVnXYglGVDaOEU1nKJaEASXJ8gaEk3YXv5YuRCAScnDr6oya8J4MMACqqV+DUiU+Fk0yNzo1D8jzup9lNO5Z30Q4UN+OtzAIMUhkmX4e6vBLaP4VxD/vu8e8zqjlLnG/axHLEOi4di3mY3gh0ZpLZXuVtb9rYSTUR0YLoKpvBEnzy9g5lJvRhVvCa3VQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>ssj4jqa7cUMG59gdMjMbyNMHOuDFx9I0uK51AOyqOkONq9/NjjcFEs10RXwQhqgtZgO/qBAwUyQG8OTbdjfGxUf2e5E8OlUeVG6rODyv1duIvsC7SSucsvxZHlhr/0VpBKDtSyYPRH2fKxNcCDQwEllcn3Qv0b21/JjnRRelPPJ4iM2bCp5ylbWeu8hx1Fhk3cAtsgYAfc5uagoVZM+5wsvsJKwShf4nLcmiOTYW7O+Fi/pDxOsZkjQd01JwsCATWNa6R647zD1svBjcEgojdeMp64aV8Ftmgo9dqNRoiEklyr89TqbwZwcEqm9r+TEZJM6+n/6cR87b/DsW+ri/mx9dwieyJ6nkXrpVgUWzv76raCGCA2NPKIuco52fExJsEzVrAhgO8KREGJfZBGf76QNPkVoLf7gm8GgCrvU5VqGZqPGKosKly7rZBAJIoYPZ+l66KyyPugdaEPqjZABLlAAAODXNRP3EbytyAnjdN97Eqm9ZgzXqN+xHBOc9bvlM2VJGZw/8wqqU/5p0uwrLY9u6mcNbhHmrHPZqEiXThW1oG5jsadr6ilo7RLsqALmI4g97WAHhxLejFHj9rZQo1Rwf6v7MFTR2O7q/Mf1t79t58p1EkZMHcBROM20oxp0yChkcB8joXCX7Vd+z6vb3EoGhGfkBNX/kYby3F7UwQOJWpUNreB4R4FYoVtWsaPc1VsDb36vtAT8iwdiQmVnpHA==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
