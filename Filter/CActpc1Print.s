<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY VoucherCode "PC1">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
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
      <header v="Mã khách" e="Customer"></header>
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
    <field name="ma_nt" filterSource="master" operation="30">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_no" categoryIndex="1" filterSource="detail" operation="10">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="status" dataFormatString="*, 0, 1" clientDefault="*" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="Ký tự &lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Hiện tất cả các trạng thái" e="&lt;span style=&quot;color:#008200;&quot;&gt;[*]&lt;/span&gt; - Show all status information"></footer>
      <items style="Mask"/>
    </field>

    <field name="keys" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="130, 30, 75, 105, 230"/>
      <item value="11011: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [maxLength]"/>
      <item value="11011: [so_ct1].Label, [so_ct1], [so_ct2], [keys]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11010: [tk_no].Label, [tk_no], [ten_tk_no%l]"/>
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
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>KYvPf32UgVu3x8c91qQstRogCnWaajcOtIPndEO2geSHUZmDEROH/aUgZaun8eE5rb7qEEZ9k65ht3V9PJPkvwdTPazgBK6srqliPeiXdeKhX/DYCA17JsC4rX1pgdsEzMYAso23aiXxPHGSb1m7sYq0QOYbOb092GbLkZax/2crDsd3CmZV7UmDcwu8fI3r</encrypted>]]>&VoucherCode;<![CDATA[<encrypted>TALtVcI2m7gbZvXrF83limdgSPtS+ELMW8KtW0yoGPI=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>qf8owdz7/6tdQN2VJGiX8KwC7iKrulPZ7wSaON72rLuMwP7UbvManaY6dxl3A6q7Q8bqRwS5WGlPD3M3x/Mq2vrj2lYDWoazATKwAaqbGthxI8Uo6rc9zFbncwT/zjP/WcHRHfd2VE+8yYkYcOfXGW8ZpvAOX5RAxfHiSs6C1K1kjO8HEEzSY24Z2oIpLmXj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>6lpbYpJb3udGDXyjqRewzWi8jhwXWe3bwhqc+zxoJAlLH0o18tNiy5igw4D9iU0bhDGXBhwi3hm598QhPRuM7PZPN1GY1sbLMc7BflkY2DHVHrM/m//nPW1q6HgAkf7C6DgmUVb/g58ZOnHFSnVvnNQwA/VdpFYdG+aras1pIAxzKKrfde68kfGA7+pYuH7xdSs6I9OV41X/8PEalvFlUGZruIL0RfS5+OMYNxMLJ3XxVOgi8rm7C19onC/QWL1FqQL1emxQIGyXtD8sh7jrzomwwiOYnIxFjApzZYHwF/cW3RlY4SRGrNDwCfhudAqwMrNtwPlSih5/wHRfS4HimKvnLBqhTlhqySSMQ70MBrTq7osxSkNeyaAY8XTtdcG3HdFb1j8pMap2oSvJaL43zijJdqWQS/y3MdXTIkAjHAouUxxZ3mXm0LxVH3cH9Sl9yKX4UxZe6J/HPX6pFRcyFalfW0fz/Nq+v/CHQTrnoO6G1ww3+y4CphE21/KwKgGJtMuCPTCxeZyr/jQJm9nr26vTCtxEQos4BHwIVjhjCz0=</encrypted>]]>
    </text>
  </script>
</dir>
