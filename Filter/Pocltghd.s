<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Đánh giá chênh lệch tỷ giá cho các hóa đơn" e="Invoice Exchange Rate Difference Revaluation"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4/n0PM6kd7qaRMH8kd9DMjhvyPRYy3YROCdvbUP45Hni+Dr5AXVD5FdWaAmzfooFZg==</encrypted>]]></clientScript>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4/n0PM6kd7qaRMH8kd9DMjhvyPRYy3YROCdvbUP45Hni+Dr5AXVD5FdWaAmzfooFZg==</encrypted>]]></clientScript>
    </field>
    <field name="ma_nt" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0') and status = '1'" check="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0')" information="ma_nt$dmnt.ten_nt%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4/n0PM6kd7qaRMH8kd9DMjhvyPRYy3YROCdvbUP45Hni+Dr5AXVD5FdWaAmzfooFZg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="0">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="type" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Đánh giá, 0 - Xóa đánh giá" e="1 - Evaluate, 0 - Delete Evaluation"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110: [ty_gia].Label, [ty_gia]"/>
      <item value="111000: [type].Label, [type], [type].Description"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>oj1ajBxe1IHADCyYvQzHCCVuDobuhBvgUK14JlEZsXmnTMq4bGAbHSH8Iu9uq5XLZnQIugdRJLDvaVYdobdLxzEEsqnwaAcod23KHn5n1P3gQgQVX1xqzJptF89TvI8P3bVciRrQsSJBwMmzUBfzjw==</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>GSMdpm8Ak8DNJvdr9t0bo0MKiQ6GuoeYJSb9uyMvmabVWNaGLjwMLCLtEmR9hxmYOtz4dTCGjqtxxAsBTqw6jZ5bhv42K3hRbZet2wONSXsmC+3NSBvpte5SzMlER3wgYagmKffRCHEZlvG3rfy25JTBK8GPFxVxg+fCbb2de5+tgfuWIEHnDmL+kzltAPS7D13HcSzwqAFtmPGHWlsMBrIWJo0nwy9a2SIygltD7jcff3a1UDOzKnkVW3eZccAMGqnC/MmfyIGT1zOqnfaRltE6BjLlfX94Bi0qD2gtl5wQlh8z6Wmhe35e0PU/mhg5QxjIi94o4/wQsGD2ypbPYqkB5c2DfjsF8PHkrmqdF5I8yAvjO5UlngdIt7MPbChQioIDFtXiovvT7iaVuJTVEZVV6zA8zOSlOScvXbfFuzJO/QSM0WXfKcYLNl/vQr7X</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetExchangeRate">
      <text>
        <![CDATA[<encrypted>+A9Uit9+5+dsuRx8MoBRFQ+7ubP/S44UZkajV8X0g9M7myy2kwnkKCaHHbATXCpo6qeDaV7SojGxiU5+TVOlFw3LxqjcJDTkVko8baUOooW7SYvGK0NtoA3qIxBPbmKRc1Mqh8pzZvLi9bx7pmo+rRVuA/UMuQTwAlakYi8dw00tk9OC+xt0yONXy19LzOuCVFbMwajnvUp/Pwva1Iy78SfDbutrMXKP5kypJbiGth2IfH/MWYRnPc9XlZTADDlROL8iAj2TbkQbJlLnQgWJ1C7I30az30u+R20VFSG54BAYcwBOyjIAML0eksif3t6TnQpU/P7EJjbCYIfQLXBtti1H+Z+wnCOHlf2uwmkxg+tUJ4EeUAZnOhvD7Qb12c+vofg+P5/9S8ONMXneowZAJyfSxdcq48HUZCJWduG80G0vMVfdXS/yFWCb2WURt2Qh5bOOqmHCcAmA3eNRIrXerg==</encrypted>]]>
      </text>
    </action>

  </response>
</dir>
