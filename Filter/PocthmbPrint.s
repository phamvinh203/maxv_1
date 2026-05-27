<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY VoucherCode "HMB">
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
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số chứng từ từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_kh" filterSource="master" operation="10">
      <header v="Mã nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="tk" filterSource="master" operation="20">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" filterSource="master" operation="30" categoryIndex="9">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" categoryIndex="1" filterSource="detail" operation="10">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" categoryIndex="1" filterSource="detail" operation="20">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" categoryIndex="1" filterSource="detail" operation="30">
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
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="*, 0, 1, 2" clientDefault="*" align="right" inactivate="true" categoryIndex="9">
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
    <view id="Dir" height="87">
      <item value="130, 30, 75, 105, 230"/>
      <item value="11011: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [maxLength]"/>
      <item value="11011: [so_ct1].Label, [so_ct1], [so_ct2], [keys]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [tk].Label, [tk], [ten_tk%l]"/>

      <item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11010: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>

      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>

      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 230">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 230">
          <header v="Khác" e="Other"/>
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
        <![CDATA[<encrypted>SzZyHdP5HVK3903A6uVrqM3JDLlawYgTGO9ye8Q3KlinYwhCN3YGnRUqI9ck035inGLK01PN7TcdWKje6hoEit0Z+JVXMQ+44LOAJ3SL6T7b7Mw580i1P7K1l/cadihlShSyTlIuxjZCic2PPzqRJSWwuQIGJyTt6HnrBPAajMv8S4cehJaTFE/+hAJj3+uB</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>O6bpwnv247fOv1n1Mis7xqKLu/0h8WH0gy7YjHFlxWQjqxAk0eNFxWMAyabmKCK/0kTIJtK+VVRH0vR5HAH8GbTyOARhZjwI+CcgeBQn7/raYjtQfuC8WvLSs97gIXf/zSybqj3Hkka1Ge1yAg7w0jQvk7JhFyo/nKOBeZSx7CNOWaQChIOHKV6BbrdSYYeA2hwLZk4h6lENdF+b6dlg3kJCQOFtp0JesYt5nYXivgNvIhfSmN9vNsmC07XMztPWcAnYDCqsM1VkE0ijjlyJcYn45XuFuClDFvKEc5ImMyEiWa7bD+1U3tOLAwbPqSrlLp2f+RDub4xqtItFkFPM7DYCXW1+yQXA9LWbjlX3rfyj20fmjgCzecWB6QHEk70vY3INTJuakpKPdWfT7JmQ7Q8p6uTUPFV6eSHKgyKVjsscg2jsefMaNL0NLUZhuZgZ2AICR48Tc9YxQ0p6lhqbJWHAbfbC9ao+RNzB0D/LNVb5MtU1ULt89NqJi7QRApIMk9IYYTIK20d8nPbkXEQaP4qdpzb1pCSIq/0IJki0TvtAYNICDbpCHies1JpbarOQX7vpTkGotv05S+GOHJwI4MOvvu2X2NlVbiGOPJ4tvjxfUn0cbEt2Kv4SE1qnMMn6</encrypted>]]>
    </text>
  </script>
</dir>