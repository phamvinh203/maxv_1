<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "INBCTK8">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="thang" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="toYear" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kho">
      <header v="Kho hàng" e="Site Code"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_kho%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh">
      <header v="Nhóm kho" e="Site Group"/>
      <items style="AutoComplete" controller="SiteGroup" reference="ten_nhom%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_nhom%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mặt hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt">
      <header v="Nhóm hàng" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="view" readOnly="true" hidden="true" clientDefault="0"></field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 10, 10, 10, 55, 105, 105, 120, 0"/>
      <item value="1100------: [thang].Label, [thang]"/>
      <item value="1100------: [nam].Label, [nam]"/>
      <item value="1100001000: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1100001000: [ma_nh].Label, [ma_nh], [ten_nhom%l]"/>
      <item value="1100001000: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110000111-: [nh_vt].Label, [nh_vt], [nh_vt2], [nh_vt3], [view]"/>
      <item value="11000000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>rh9EcHR3fzZLeBvmtZ3TfK/VibY0tsbfstWAgmiUnjE7O9rq+StWj0Zgf2ipQxPwE/J8fqA6VQviZcJfv0EWgqnMTM+UtNHfFntvl5r+/+DuV36I9uku5bsBwjuOMqLyPc5rC4OlvoUjGxgeUyDHnvNmOc9/rRMfvPHrmsrZ1QOfmee8FSi8q7iIGmfhj1mPGGW72quKOiTmgP1apOM8cCLyo0SHSjzGfSVaJTCYsh9MIfeDcphrvqvZwOoaajDr+LPmP+W3T0kttxvHA7RG+Q==</encrypted>]]>
      </text>
    </command>
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>yTnb2sH3jnej83bAjgZy0ZYJ8y9tGJyIEPYvitQVuYBD1XI/NRYMYEeHGBrpEmKP7XWwiLOjh31ilM0bhs2YhQHeRfOooXN80H7gTgsQhBQDnRRL3bLGJYSHtREBqsFtOGVn9HmKqZIPjJ8zQhyqRC4S5c7GV+Ay5rqp9Wh+Zp1u+0zBalFOzmWSI447dnk8AzeynH/YMGbtHH8miAc32ID/SL6IBxa0HBTHNgjqqSMQC0HZ3uZxtL08Y1otpXhFAs1116uGMG/o5874lvFypakWQelQHCC4wV4M6OfpV0M737yeuPjYpk5JswaLlFCizxXrXW/h0FW4TcwtoeK7m4/0JNF9IIg0KiM832T88VY=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>OSsdJAo0b6K3KQH27zqPkrlXW0TtTrLoGVt8mlOmxn2dZ6cNBvl78XqY8XpWZyNaM/l7eVQAWybByEvlDfo9nH1iwLlGbnNGmODsT1Hm03KGNjVYYlZ9OtNUEXWNgxJyluD5c4S69iR10ILO9ZpEbuSy9qrGVkxV+FUOC4x3/iSs7WDsWO6uGRvfRMxy3X5CjuG+cuTOKo/kuuZr5fO+FYqSZTotxrEkuWZWIEIFvhq0wIVyZPj6N+Ub81ogXl+yGNJb9CIO+IRDZgVuFRsyyYcs6Zcm9jO5beS1Cw/KUGKhYDAiyXhkuoIxfJ9DI4gi2EstJqwNaEzzbtvv79mhP5FLGZTiI47CEuDONc43+8l+TZGlWa3+GS8bDV5IoOMlnJqiKqqpCqnRQDVFmi8ANiPC9yacQNR9wcPROqKz0v1c9Td02LeADZRAzqFcMMaCS4LJSTFJjz2Sd6SgZ32DbblXhx9HBhwz3QlPqObpelbeY7rCMCPwW1yjSkK0sNTKgVY8wUgCrEASixvRh1fjAu/ng4mc/VJs1EhIcdejfH9MZQLvj2hvrBa+v+e3APiI0e6GL17jcP06/AxfqXg8kk+2tpHtoS0R9N9ds09o/rQPlHK4XXdAjvREeCj465cok0ZtJL1zQinr2jWyOISpozsCEAa7doayC8bt4Tl3DfmSDXNXWih7f4BYhRESJY4l255gV/WElFl0bc5FAiYIfHSfpyCCcnm7eVOUh51AlIpa7jAWRnSQoGJ7bB5dUxED4nmXq/sLPk9v499WgoMay2r9nqHNta4inFvCl9qAdxHECBngqFj0+aCxZR2oh9AC++dYYMU46bVQ5VoUcXWRvWLNemGMOx4pkmzxmzmfR+n4M9G/jQ8CV/bBjWUjExEkHWxh+gZW0ivF4ZoCdDuWkd9m7mVJzfiQfTn08KTXHrSk8XTSYkxsiVb3E/H+heoRvDlSAo7LSexSaYcKEUFHbbEr9dAFFJO/tG54LI/Stln0MyjXIHYi/TlZHeiflc2kMlzEgPCd/aixIzhUme94ctXV9H35VKUPY21GhP4rVmNfb0cQJso4q4LrE/baAmw4ivG8pKtdbBSNSK719E8LicsGbwdyFlcTl84L+icJwhNl2dfsYU4kW+XkDo1o76JSzN3rZi6X4qKPnV31JkMCmr1jLQIPzZ8tfEiGHoVHzaW5MEUZSs1hGe4dIEwj0NXbUcjfRKZfzAIejQ2+qUWjfyYUE/NOifTKhO5TksL0XjsIDWAt9rYgoLYSYHIldaYn9/YJSWY2yTlMB9XgdV1GH7Kw8N+S3OmH0EswAKq+Nx0=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
