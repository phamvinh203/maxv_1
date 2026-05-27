<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "GLNKC2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="date_open" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="group" dataFormatString="1, 0" clientDefault="0" align="right">
      <header v="Nhóm theo tk đối ứng" e="Group by Ref. Acct."></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 36, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="110: [date_open].Label, [date_open]"/>
      <item value="1110: [group].Label, [group], [group].Description"/>
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
        <![CDATA[<encrypted>mKH+Jte12osMt9uVdl38fEJg0dlKnaCCbN8kxOiPliO+9JLF+xZW4Es9sYHRBuEGV8faN/yWPdheqh4BsZPpHzXJn0zOR6uO0MZm18YFUc9g0TIEmcY7xUqb2kQky750l1aagqo+h9ZxYpUfGI6d0j+ZqNeFAvgDqQVFRT9+F9y4AwTgO0PBlC5qZKH++BgoqCzjVz8jWOfH0ErfOmbYgJNKjo4MgOLbVWGBZu9dp/lCmmqNOVMIDnyqaA/fI8+yPBxexQ6p1Ukai7o6sy11MA==</encrypted>]]>&Form;<![CDATA[<encrypted>mlxcVooN7Qyt9QiSRiWebzr2DOn5ew1knutvTzf7dv9lIpGUyPwhqjAAH+dEv0mu0wyzfZiDA9tlQpCZN2PgZWgwzPq36k+jigH1PFU3IAAClAbl5kRB5c9sWWsWhntOCwFMXILN+fi8/976x+XpyylA1Ea/WXJleZQs+725qlwBZ8RyiqQxLQsBm/1EwKbnL+D1PYRVHYh/QFqAGdH9Id/fdTxdSZzfV2jBtQr1TeaVOnwE5f6+KxVN3OH9ZKvgmFUJhWrI4ejgGlpIvy2jOQ9XsRY62bKaG1SV3GFKECiH9mOPAs6vzPaQPyYpYbcg3ogQBbWu4pYHmX1b9xJsva5d8aS56U9E4QPd+XQCRaI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>xki/WNwebbNuQ9wFtTDKjXEoz1ALIUV3uRN3PBbdULDYJXh8i0HgSd+cECVh9OInUKk0m7VGwepWow2lp5mDXXMLZ2Z/nqdekWvTljiJoxe6SuOslWc3BYDF8OuZXMfPliEdeAHWWq3aP0HUCVPEceX+PvfglOYNWGBAusPE2g1ZqWBUlqCdpymi/+eyLVB+W+VL3YSGDD7aumlJ/LBKEPcuDshpzrNxffZGxxgL+HE87XNZqCzEmx4BbBOZsPgvPeqiA7BkLu5G7z0DpKvnbSDZmLTGwgAmI1/d/MSP+Xx1Qv1FAuQFVgtowjyEa+A58BzFmJrONUSMrFvZgw1UkJ960q1OtzCxlXtqjDUM/lwv6E3Um+RErfelfkEkY0g6tMqONFDrT2jLn1ssywMGTa3tedqNi6qLlJDPLw2zDO9TRyFH0n48E/X5fcQDj+GtmZhbWiKHX3pVDG55uk0c6o0Z0CLZT4ECXu4QRZKBQUn84LQAUW+dAkOeDFKr2u1Bbbj1vRe1/cyc5j4EH/Mm9txOsgJNBEgfktkJAdjPVUlvgMsSyHNoq5E/g9dQu7pzPKyszAzjd7F/1mxVqKeSskdzOqAyyqFFhQHK8svWSqmImJnaFg6y2GrO9i5BveNa593P6PksMShk5NmnaM8EfXcHF6okC9Pz5bwgdCsAdyGZQWLz02ndjILj1T+UCj/HQPIg5azFBIPwkux3Bny6mi+3Vj+zrCCcXg+8GZ/CUzRFeQDJOwKtUkpY4W6L5f5P1Vvm05DrjP0tYonmQgOqthkgmQvlBtZF6z6DoyXgOzjO7ULm6QyiugdI8n8HDHKFT9d/z0VJxHFXsPkw140F2lS96LjrvOpJDAcO+VZxgWtapS0FYsk/izCE8vSQSIi1</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<encrypted>8HDYmxrt5lmM5WqJ2VZ/jMAExMycWEQ5IjD1g2hfMngspqKY1L+hEVxvlorELloJ6erhw1DakIDqgtVVhiihZkPQykKizKMYFVfmFTQZfXLWyh1LM0kw83km1qYLifimjlPaRpmpVOIzWNvncPJ2OMoSeoGt8f3InjWWZNYgkRk=</encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>
