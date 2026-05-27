<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="ctgt20" code="stt_rec" order="ma_dvcs, ngay_ct, ngay_lct, ma_kh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc chi tiết hóa đơn" e="Invoice Detail Filter"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ/đến" e="Date from/to"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="" e=""></header>
    </field>
    <field name="ten_kh">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="ten_vt">
      <header v="Tên hàng hóa" e="Item Name"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="111-: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2]"/>
      <item value="1100: [ten_kh].Label, [ten_kh]"/>
      <item value="1100: [ten_vt].Label, [ten_vt]"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>piXpuSsn9v6B9DskoVWBqJWKy7UDCD65Fcno6mhABGwmsDLDNMRQ/085mP851JsV2pGyTz5pvotIMxReA7zpLbMG/n8TT1Jvq0h2jhQGkaq+58MXp7NiZG3MjIJzT2q465o+9rnbLjCcqzoacsIxHWPopEouWIRakoEB6ZOhk/t/kdQz6mA+WLcpX22XOOrcPXsPLqLyA0eKUclHSzb6tbdjcf+ZvGNaXUui5bMN+uZ4Z1VtIJ77LOETzWRyf5q4F7UjOcmesOeUKUJI+NqykxFrntHjVlTb9PxioFX7TbV49ZTxrM+aJKM9wGkZJ5tiDh8v2G0wefqb4MRHcSS7RiagvWoWQylpZemyl14wQaTFQL0DeQF/hJvypIjC3gWZgo/Ql7WE6eORWwejna92CjVGVjKyYirmCWEr581KFROY6dIng6Iv+N0b4F7JI7YUhbLxxKFwB0mYAbwwZGfBHx5W9pOQ1bxQY63y7rOlfyZ3AR99ExEKh5R2PDSwv5ftSES9ZcnDVKQjc8/JaBB3jcPZ4FXmDEq7yBDWgKVb/Xk7cTuQ9lVUBmzE+S+B4jqUM/5DFHuoz2FvxH0YtAZ0qA==</encrypted>]]>
    </text>
  </script>
</dir>
