<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY VoucherCode "HB1">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hóa đơn từ ngày" e="Invoice Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hóa đơn đến ngày" e="Invoice Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Số hóa đơn từ/đến" e="Invoice No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" filterSource="master" operation="10">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" readOnly="true" hidden="true" filterSource="master" operation="15">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" categoryIndex="9" filterSource="master" operation="20">
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
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_vt" categoryIndex="1" filterSource="detail" operation="30">
      <header v="Tk vật tư" e="Inventory Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_gv" categoryIndex="1" filterSource="detail" operation="40">
      <header v="Tk giá vốn" e="COGS Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_gv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_gv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_dt" categoryIndex="1" filterSource="detail" operation="50">
      <header v="Tk doanh thu" e="Sales Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_dt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="*, 0, 2" clientDefault="*" align="right" inactivate="true" categoryIndex="9">
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
    <view id="Dir" height="136">
      <item value="120, 30, 75, 105, 200, 30"/>
      <item value="11011-: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [maxLength]"/>
      <item value="11011-: [so_ct1].Label, [so_ct1], [so_ct2], [loai_ct]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110100: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="110100: [tk_gv].Label, [tk_gv], [ten_tk_gv%l]"/>
      <item value="110100: [tk_dt].Label, [tk_dt], [ten_tk_dt%l]"/>

      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>

      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111001: [user_id0].Label, [user_id0], [user_id0].Description, [keys]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 200, 30">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="120, 30, 70, 100, 200, 30">
          <header v="Khác" e="Other"/>
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
        <![CDATA[<encrypted>L8Otg0YMDdX3g1SiDrnwiAlXCoKb7NaZTwMJJYXarq2H8iGxmTVFcH5enO4VarV5r4HI1V3zJ1BF9009/fzhu/yIw+gKmJ9GhOBGSR1IiWpAw5tNmjstoOHYIizlexQIcTIfFqmVPkW3wHT/2UTRKBLxF05D1/DyuGKVaDiS8NLiu1sMwlFx5wiOwYviD3Ep</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>VZm7idYgzoq0oBL+7RvhOP3RXZD8Jqo87VHihQEEqOif/G8mz2BDdMvMhVp1VSOUhfXKhD2ze4bAFbA1tjbabhMbilKZ3OF20l3apK4xe3MI+8K7hgqaKqyl23FQrKh6EPasbvXgg67fkGcvloohZ0DenJ5F/yKP/Ed+EZlSxcKnbd/kZGxr9ZbhWQ49VyHZKHPLEyhGoYj35B4nLGGD3aY9te3QyPRSUKZIUMKl/vFAkH6emgr+uzA4zg0bPCvCBdijtjLleJpeFJZBcvdyQTss6qCz1KCVtEeO8GDvzPhHPZdksyRiEic8sFBZfmoMdmm/jmftE62ReJiPajRWyhGj7IvVeMSj0tLZcNSAJmwuAed+y+GiMAaqYUXTPuDN7l5RYr4waPjK8GNr+GxY3ksua5x2zfJOctn2Cc+igA6IO3W7OStSn/XZK1yaM3A62x3gJmxnrGXvFMaHkq3muwTDIts6HRoYCNxIhC9n1GNn4yDYoiGibOBMZzw0KLevPEIwa2i/X1TMRsbRzejde8wzJeTkd/IJ88ctUd6AK2iglJHzARXq+XRsqoPhwcqHEqlonGGgYTwjBo/aVFSxuzI4BHFn/uQogmHv4tFuLLrXh1V8+s1dZ5KJi6tUBWvLLSRPrAkt6Mkd8KUSEi88vU0xDjCmgzRaaT3vR/cxExM=</encrypted>]]>
    </text>
  </script>
</dir>
