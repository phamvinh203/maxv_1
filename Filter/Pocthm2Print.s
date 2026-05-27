<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY VoucherCode "HM2">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Date From"></header>
      <footer v="Ngày chứng từ từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Số chứng từ từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_kh">
      <header v="Mã nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_vt" categoryIndex="1">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="status" dataFormatString="*, 0, 1, 2" clientDefault="*" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information"></footer>
      <items style="Mask"/>
    </field>
    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="130, 30, 75, 105, 230, 0"/>
      <item value="1101-1: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [keys]"/>
      <item value="1101-1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>

      <item value="11010: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>

      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>
      <item value="11100: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 230">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Initialize">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/62IDVWnWSs6JEKAA7VTZryve2zFFm7+5bUMsrp4L3kLL2EiJ5tV3T80MGabBYJvx8Vo2zwESg43NrqG84PJlzXl28J3NxuUAIhffT3Fqn9/+Ng0JWGQeSyxBTZWpJEPMFw==</encrypted>]]>&VoucherCode;<![CDATA[<encrypted>TL3OHnYNdEMc+sk/V7PeuhGeuqDAVrUXL/KA26n9A4ph918sMSnaAOqbmhA828mdgWQ4wlqnbBkhFeE6eYPAgi0nNlswk44MXNplyYpG1xkcIOchbtu7KtCpGvtqAtJ+eV1AdZGNIjlyfwoGCdI/QS4ViPuVBlnf6jabXh3vkRw/9XuH04fhRLwtgQQj88r+lK17UYuF1SmFdIrlzFduSQ==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7aKcie1BCE2VvhhFSnQV2ktj8/+XxPoj1ESMgLMaKXiaUf8ZCNA3ZjfS/SFs2YiGlp2Aj2TfQiBPWzofN0zBlWctE50IBvAiCu9uG1AuvA/b</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>fXGnazYVX1Km6zjdWyHtcWiOWZCwQYoGjizO/LgvR+EllMy9LcZPw5oiHOsau/GKxuX6xd1tW/dvlM5NBdwIvik8i5ceFPVF0uUKRFzf8sG6W6FJL7weL8qLjRfEU+fJNJ5/8aXSOmiG0Qybzkfz6i18aP1t45Ucj1wMb/vCZPpGZb0uth/igIn4iGQ1mc9v</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>VZm7idYgzoq0oBL+7RvhOGsiNn8o7/w6Ul35e6rV7Swu48DDp259A4n/iCzyyZMFb6SodsMOIoYgTj7lAb9lWZ79jpaf983YmyLe8TUyEAw9eEn4GU80cgaEEL0lZw5utxvmOJ2qd/aBD/ctC5I091tlfFHWCU/Bh9mgG08bqbfCHDYFZ10mXxDOHBBk3x45BqQrhtSkeFYU2Chp94CODyw1Ux+pSXUjerlWxzKOH07cM1dahKl1UZunQNX7borVz37d8JZVbsdMMnl8mB3uEeJUWZOPpN1DhpO9sCmPKspwydqJUCF+6J0t4Fpi6QNwU4s0/NaXOjYYZHT5aG+FZF/QbkUwR5cW7N3Ss2fOPOWupG9jKbchwSpexIFS6IklvMl+PFADT2fivjLqmxhx29P5ngwA25gMuSnrHx5m7MBipdAF2btWppV93cWPWu+zRerQJI2OGvlk3ZWWt5578zsRidlGdSnZkpJiTPZAwxtb1IbI4aiX/cMll8wwwqsD/hlPGW4fNQ4fGJUoSLgUX1SDvee0dRmrLUeAOlQN+rwMj2sjzT8cda8Bd2L8RRzXFPQrl48P7yBVZczCCldqSUlz4sG2XBm0tDsnNApi6hMAqy58ikLMR+6IInb6wnaE</encrypted>]]>
    </text>
  </script>
</dir>