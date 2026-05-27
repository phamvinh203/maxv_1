<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY VoucherCode "HB2">
]> 

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hóa đơn từ ngày" e="Invoice Date From"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hóa đơn đến ngày" e="Invoice Date To"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số hóa đơn từ/đến" e="Invoice No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_kh" filterSource="master" operation="10">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" filterSource="master" operation="20">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tk" filterSource="master" operation="30">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_dt" filterSource="detail" operation="10" categoryIndex="1">
      <header v="Tk doanh thu" e="Sales Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_thue" filterSource="detail" operation="20" categoryIndex="1">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l" row="1"/>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="*, 0, 1, 2" clientDefault="*" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information"></footer>
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
    <view id="Dir" height="64">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11011: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [maxLength]"/>
      <item value="11011: [so_ct1].Label, [so_ct1], [so_ct2], [keys]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>

      <item value="11010: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>
      <item value="11010: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>

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
        <![CDATA[<encrypted>u+H6IsPeRNbR4EH0Up/j+HA6HthG4gJW54Wr0q1b0HWyt74WEV/9m4xmHf8xcyGvwBNd2CZz3Sw48nT3+uVUB3GDkIZGNETUwMwe1+8r0bWwlLLQpzIOjO0o2KTVO64Bf7slxUWFOV6FKtKQ0pd7EHV/973KsrligJyHWVy4HPxwhJ0vIJ6heDmglcEPmP/Q</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>iByiCIK4vN+2pDY0j24LOnD1TGImbLiYOMMGm7FoDyLW3d8HR8VT2tGud+k+UhMjZJhu5jU+mdTnfDfw86IJ1C1jvmlxlzo5PGPXPFYUAeF68MnSmPrCI0rD7uHUIDEvXpf3a4Gl6c5NltFiwngvhryxIFgfdBZFR4YN2NuchRxNIMWTgB88Aho0NFkpZiyLo6MIb9QvuSC6fyMFyrqqhzMLkMoURDZOVEyTLpcaNHNAXUETSGHLaJmy7lYZDR95F4G5e2au2OFF4WBSeLaEepDv+UowxHqm5WN6eU9zotuyhhOYu0goaqZ5HSa3N2TDjdAfzPyeypw2PHpZoqXdMu3M2KejIyzy6qHTe7CohURv0SMfyMzFKO9xFL8ET4B7suzO9M+KgYuqkQmwyWxJJ6O7cSPLqMeolBbGfbpCb1uxLJT8KlPKjW4POdV0MddDdFGB2lpM9eMzWJ6x8zbcq0h9/tTOdMa35HvNrb5zqvE=</encrypted>]]>
    </text>
  </script>
</dir>