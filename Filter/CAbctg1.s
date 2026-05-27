<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "CABCTG1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tk" allowNulls="false" clientDefault="112">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" normal="true" key="status = 1" check="1 = 1" row ="1"/>
    </field>
    <field name="ten_tk%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>Y5bNTp6HIeBO2PqnFytQuu4UGGFSieHjGxXPmodcPzwOK/Gi2nDtUUYsgUvQV3Oo5GS9vyUQDqTUV3+90uJA9dirHtfQ8tLUxXIlrof9uulUFNeIfiBt9ipbgVL51+GkMYg+YO8zAXLiW8MSZKAz7VFE22MkYPg8pEa3iiruuAIxBE9g5g6uGB3FDnyshDzGet8hTyJLLA9HgLIFRbH58LVFNhaUY5/WW5CW3SMw43wU5zynWQfVUf//0l39Z0sd9pmrGReMN3Vhi05HWklmhSRvUYwWPdHoZY1ndlsMk8DtW3nOwEisijuWYD1XYC0q1KjK5Vk0t/y9IV8JE4E+NA==</encrypted>]]>&Form;<![CDATA[<encrypted>OgTeR4NrLJuGBmnpOyYjogOWDPHwiiVBvgYEBxZvz1lF0WyvyRArWRNQl9vPwzV4by5vW7wdYsWjTrE1LIvIPQ/Esf7/W1+K+BLEZAaw/hN4MwRXa/EmL68qq7wfeVWrQXAku6UPEVBndCHVKxUXDYtYyFepX+dxTl/QSzZEN8iZlE5xhFaefdqNt73lmmrMe4ptO2vmgUvbXxP57LFG4VKSbY80lkHp4WwrjUPxNBDjW1yBljFS6S/yzuXDom/fTQe6vUaVqUBp+jaKQLz9iOe1grvW29rrdCBNKyQ2bRTZjf2hy8toJq3LghM0koPFtEKBdf5gsjSr1KTvHSOuk5yZ2L54JW1WElHGM+FxhFdpOQHVoGjGbnbbM6oHMD+r</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>5Tdyzpq0WbxY95jou9uKLo3acJ2guF/vqVi8gE8gj1XBYvDnJaJ59YQCSp362NNM1BNZ7iDA0ukNmx7UkMGYOoXxOQeg09w2jh9sdfiuV6GrkAESdA1u8HQ8lTPXLUbWoi/DnKYEdINb6s5r+b3QOJy7ZHa8XklCO+Z4Ki8D7fSeLNhb4utlYkviaz7vTpolx6mA0OOOtZip3oO6pcD5I0CPxAqVvr4jLB4KXoe6uJC28ujc7gacRhi7k7LGimOAbS1j3k1tl6H5QfX2gkthEM//HstFZyoJwbXt2kw3QnA+YYR7tgErIp3PYCehqde0YcRFGV+VOU27VXXrbkeGeG94ABH0ZkJ57E1+rK4FdlQqAb9k0UfsNIZQC/tcXEu2IfDlr5w9U4fVkwcnqftdHnKO9wk3qrchQniBhObm7Pc32LmUSl8ZZTQHvhiDNhaVsMQAGJLHAwZHUe48qp6W0/CYN60P8UJe1+gqUK9QiGTuayxPMJ13ahOe22oGRglJokJkkhX5p3P27rr7NSNL2uXAutJhYtXmjfcXQuUxw6uptTJrs5UCm71cKn4j2mK50xzwa8tCx37GP6sAmEh/UJe9/wUP3yX6X5fQkbRilciX95zkmW/HEa+GLdep4gMwvls7W1mum8mykVyFyKv/hmO+OZ/hsjG4PmiTE20oc0N+s0mAypd9hi7UpR8/SMTGEXQ+zs8VhvPgzZ0BPwWDUrTccznKRiPRVPrPOHzFoquSRgimGu3qdQPA92jqf/at</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>