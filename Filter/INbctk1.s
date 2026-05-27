<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY Controller "rptStockCard">
	<!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
	<!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
	<!ENTITY Form "INBCTK1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_kho" allowNulls="false" aliasName="defaultSite">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_kho%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" allowNulls="false" aliasName="defaultItem">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa45ibf3N+UvDBE8G8AYBEYJDWL1abuj2Bz1359JSqQBXF</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="mau_bc" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Thẻ kho" e="Stock Card"/>
        </item>
        <item value="20">
          <text v="Sổ chi tiết vật tư" e="Inventory Item Ledger"/>
        </item>
        <item value="30">
          <text v="Sổ chi tiết vật tư tiền ngoại tệ" e="Inventory Item Ledger in Foreign Currency"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="ten_dvt%l" external="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 75, 105, 100, 120"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="110001: [loai_du_lieu].Label, [loai_du_lieu], [ten_dvt%l]"/>
    </view>
  </views>

  <commands>
 <command event="Showing">
			<text>
				<![CDATA[<encrypted>IAWxH/LFPkZLbC33jgWD5lnXOFMo+Bz3AHsei51KB0q2fRsxW9bRCMiVXuwszIprdEKUNd92g7x6mYxUghs1wMSuExb85pJ8WA0uZkekocmiA18ij0d88qNw0je4nBLFJWkOTcVLm4S5Gzikbq4GR1LagP71ls5avkMx+7Xlxkbxlu4xniNtjbmMLFdDLptn4Q5ZjgzdQuc44I9kJfcLUKLWtQ3zjVtBq4qcfaudXcRJf0Fvd/k99lsG4WQy5KFN</encrypted>]]>&Form;<![CDATA[<encrypted>5Dk18Vsx8RJ/AEkKNXj6inE9H+FbWdGTTq3PfO228aI/cEqVfb0FHxBb9DgKEDsEP++v9Bo+iJuNc4nmvcLZBSSVqocPleMIlUu2/+kZs+ybgkbFN/MVE356TnNoJNpZRXw5V6gp+W5DEffbfjLWdPCn/uTfo71KhvjmMS5IbVEPxaczXWtQ5ym+sSVjbvcnm6ijshw4R0a+ZHeZOIgo9LOLxnuwDShEPlvDCspBy0vkxy1xt8J3BEHiwOHFoZP4</encrypted>]]>
			</text>
		</command>
	  <command event="Loading">
		  <text>
			  <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+NX59xiN/5VfhvPS78jFasDQ//Xr+YmqZbq9oCTxbxGkCifAOzbjPX71WzPRLSDhg=</encrypted>]]>&GetReportFormLimitRight;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fKDsRh16dSWcJklvUputqJ6ZKqOfxuATEAw+ZKMq9sJsyWQUlNGnsYi80D4AzwTnnO1fXkrlLNiUvY3Jn01PVSVbkQuHxkw/SIQ6fD+to6o</encrypted>]]>
		  </text>
	  </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>UdjrW4Rj8QggJFj7ZZUhZIZZSx14r1jLMFvMhl0IQPcl5+mE58cnO2C+Nzu370LH3EQNpJdE6Ua8G1itwp0si1k1Htr1icROZY6no5v4RzBAKXApgCmZ+/0TfI3+2rQxa1RG/yP5OZB/C2vR24X4QjhegG4VZ0FE9/6/Vef3IXhbxN8941lFNCbHjHJZlrM7bfHSGw5f3MORQ0awCcvVHKXClafK1vd89AtVqbBPsILRnNeB05lDLMNMZSERZ4jOtCI7DefusYAweb7BMUh3NwPXX+BZ/i96cDTMHin5S59XW3MuXH400qzwq3Vt8rrhhu/O6Q4ZyfSuu5LwMcwizBo//8m/TPC+s2IbEwoxjgveKu5Di83pJmyy4+ONBwvsyRxCnQCR0A5Sy49dfd+nK29VrCpez6OOWX2Hvezk6/lB63SLuWfGCxhMcE/X3898qGaY3xMeiRvKnhof1q1IqA==</encrypted>]]>&Form;<![CDATA[<encrypted>Ef77VYd7lnW+FCavpV3uv4Fp59Ie1g7X3JeyrL3RC0FUCoZA1Ul10jIEo7j5lkQtDhzKoBkya9ppmXim0CNScrwa5YqMGvvGSKiBPXGQqNlwwLUqxkKaFS69nxWHJvLepImCo/WMXMQB9h7npJkXDGExiaSjal9r41cGxBvsbh+gP6wzB/40hUqpCoPVxNp5tWhRIo/6mmUkOtNBlRUXkjNYK8b+iw8FyHbiqmKaNtbzOXW1soLt40AFDhYq3K8p5ct9a+sgl7vBtvdlBChVJJH/fzvU/LcEgiB0YYh/uLk73cfjxq50I14cid65FTuqY2kE3ypX8S3PzrQU0NOltg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
	  &SetReportFormLimitRight;
      <![CDATA[<encrypted>vBHDLLB+MdCH+9fhsnFG7eAeqdYAjNjhJzCZuoI/g6hiMSm3pFXQc+6Wav0lZhIxn8neN2E/+peXAnMdiLwqifVXyg1mnRos+i22XA4FNBYT8jOXSiQ4V0lMCSSR6sXUvQsMgri1kd6RJ4IAhqe913qNT1UJQkDSs9PCEstm2poBkKd8UxmxuG0SC84B3QjK/t+ZvsYpuEia6Let/jV8V0MnUN5q2Ks2na8Fjt0/Gt4d7eHP6d2+X78QLI6sjYcJ7NMLrgEn/nH37+pOh6U9zgwf/DNFMeh92sUZWM3qoGwFFJIc2lvW3oRtAWwgAstbSjwApAVLot4fxJf/3eqIVKRErM5/2ftVc2lOTgBBcuuSzeYQzfB+s57w+g1OweG/drG+Rn4Ilu50XL6H/jWiOscC02jgKGLMQn1M1/CjFBZvarZngys2TIA5kytG7AcSMNh3uxcQVSLglAGB8/4BkX2ork4qN3aSzum61vgqCuotmJPcWID1SPHBrxC1hT65aGfJ6n1HmgGcfajn/LtwqDj/4GtLMcRH4xhFCnoIuKskAu/rg5T2KWMR5gAhw8PS5dlI5AilFmDcfN5kaQQaYMqMwKyUzZOyscpQVcBzafj6KsdIc5b4CsyA3TrFaPOaAbugcPHcjuBIBxyuhK/vz2ThQyfFD/5ItnZCsKQW6bsP3Ek0d1AY/jLR9VzsnDRrT6Uz4Hu8Dj5qZyesoe92sxvBlJCUWeQaI2WwO8HgB0GUHmA0vyUpd/vJqzY7MlmgpdyQ5vtEmxAp7cipu13O5JKOOHtCCZxJt75kv7kq9fcOEHmek4X0OhqegwMw7JMrEwCDOXoHIMwoFWRBwcrffcEV1ej1B1ouuW2cLHANRly934SpW989or3GdFz4iXabMclLrf3KLfDIS+5lb7IbEPr+cNC2SVmCajB/k4Ap7TnExUbyxKAjhNYHB2MVdTBoRjdu7QTrdyHNYq7fYJNnQkNS6QPoxXr2IcVlE+ZXGSE7l6LD5gBz+xVqjb4kzbXZOZQvYchSiYtiVYaYen6xN4gR5QyVpZUhmUL908+siLU=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>Vp+/QShYf8Z5RlHIS3Pekb7vyP7wpJ+N6lcoD7S+NVEBuq7DqQ2mvi0XAmQPxPOMONsxVS+3e1AnA6HO9Rh4sJnEyUdpUwSutektc/g/ejDmENX5YUVGGIjnzg8s4JEG4D8mPzCgBxfCnng9NWj4id5clmz/nwjDW4wZrg/ylWc0fuVAuFpdT3LetW5LqGSdoIo1+s9VsfinbZSMUoIVkaVOJbIzORvDtXJ8vVdqlsoEv4LK/R29paMU8Dn3QaAp</encrypted>]]>
      </text>
    </action>

    <action id="GetUOMName">
      <text>
        <![CDATA[<encrypted>ibBuqnhhHCQfUTnbpwp96Fh8Eju2vls1OBsAXfZE08zH7rWqvxPpGTr01eDtqY6AZ9L8YCCkSKo95S/KT+EcLHGa9N5i2m8jnKRCa4Vq4x2nvIBDzgbO2ZZSenb3kX/cCVEDCvTzhP3nTlfLGZGNBRnYyg5NP1DWy18xIhLU8pOplOhxGQuEYm6knGbqikG5</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
