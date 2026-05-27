<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY VoucherCode "PN1">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Date From"></header>
      <footer v="Từ ngày/đến ngày" e="Date from/to"></footer>
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

    <field name="ma_dvcs" categoryIndex="-1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh" filterSource="master" operation="10">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" categoryIndex="9" filterSource="master" operation="20">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = '&VoucherCode;' and status = '1'" check="ma_ct = '&VoucherCode;'" />
    </field>
    <field name="ten_gd%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" categoryIndex="9" filterSource="master" operation="30">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" filterSource="detail" categoryIndex="1" operation="10">
      <header v="Kho hàng" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" filterSource="detail" categoryIndex="1" operation="20">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" filterSource="detail" categoryIndex="1" operation="30">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nx" filterSource="detail" categoryIndex="1" operation="40">
      <header v="Tài khoản có" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_nx%l" key="" check="1 = 1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true" categoryIndex="-1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="*, 0, 1, 3" clientDefault="*" align="right" inactivate="true" categoryIndex="9">
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
    <view id="Dir" height="112">
      <item value="120, 30, 75, 105, 200"/>
      <item value="11011: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [keys]"/>
      <item value="11011: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>

      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11010: [tk_vt].Label, [tk_vt], [ten_tk_vt%l]"/>
      <item value="11010: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>

      <item value="11010: [ma_gd].Label, [ma_gd], [ten_gd%l]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100: [user_id0].Label, [user_id0], [user_id0].Description"/>

      <categories>
        <category index="1" columns="120, 30, 75, 105, 200">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="120, 30, 75, 105, 200">
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
        <![CDATA[<encrypted>pjes3H3PCrih6xvOxthc+GRvqHhftbI1Ra5vqibsHKz9FwXm8ELmxceOUtMgyE0QcOGKWyGQ0gE6T1Q1199Rw111QpHnY3lCqDqOzT48D88Ix+RSDgliZnBfm+gUI0/n4XFmAKqcemQEZnAqjw6cdigvT9a4ZbLlA8ZtgUdRirUR9QM2s6ej/cBl5z0Xe0cl</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>VZm7idYgzoq0oBL+7RvhOP3RXZD8Jqo87VHihQEEqOif/G8mz2BDdMvMhVp1VSOUhfXKhD2ze4bAFbA1tjbabhMbilKZ3OF20l3apK4xe3MI+8K7hgqaKqyl23FQrKh6EPasbvXgg67fkGcvloohZ0DenJ5F/yKP/Ed+EZlSxcLBz+rqjOwLROQ7oF+SGB7ALefFsrUg2WV/lkDfIzWPoVWdF71j2OPbGKn4rfEJG9srfIwhQ0IMuxOUu5bcNtBEci2SVedTZviyUI8JRI0smgttT+EJD5H9XEbXZSNxrX0LjMByOgnX3PEwjcgTnHuqlNUWbUwjfSyRdDqVicGWab8Nm1W1J7FD6100i25v+grOgQwPOv0gakuqWwHUjcMie4n0pSwa/Vp9JFX7Im+FRhSwhU1p0yrQsVXxWXrV727LfXk9Kc9KuRDqZ4bAfHX3tqyZaMvIt38VS164lgx/6V00DMceVI1QPCWNahR4ptoKZ/pDzedSSkPcT2j2oYi3cBTkIwJvHRydxKR9/+198kHtuYU08EcxSZaHRuTh5guJekX6c3TN9GlOMEYY34Dvfvr2s/w5kRtjPqN+1LI1H7HFxkuirHxIU4ig/lRKSANgW8aXkNtzE6LM5RoqWjsct6OaaB0Tf+o1mFPVd5Zfj+92Glc6IN/kO9LAAts7Ddw=</encrypted>]]>
    </text>
  </script>
</dir>
