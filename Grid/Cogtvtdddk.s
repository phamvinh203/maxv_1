<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenInputBeforeInit SYSTEM "..\Include\Command\WhenInputBeforeInit.txt">
]>

<grid table="vxcdvtddx" code="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Cập nhật vật tư dở dang đầu kỳ" e="Opening WIP Balance Input by Item"></title>
  <subTitle v="Cập nhật vật tư dở dang đầu kỳ (Thêm, sửa, xóa, ...)" e="Opening WIP Balance by Item (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" width="0">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" hidden="true" width="0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_yt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã yếu tố" e="Cost Factor"></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>
    <field name="ten_sp%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên sản phẩm" e="Product Name"></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" readOnly="true" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="sl_ck" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum" allowSorting="true" allowFilter="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" aggregate="Sum" allowSorting="true" allowFilter="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" aggregate="Sum" allowSorting="true" allowFilter="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_yt"/>
      <field name="ma_sp"/>
      <field name="ten_sp%l"/>
      <field name="ma_bp"/>
      <field name="so_lsx"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="sl_ck"/>
      <field name="dd_ck_nt"/>
      <field name="dd_ck"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandWhenInputBeforeInit;
        <![CDATA[<encrypted>zvnW+gosrJycbgBF8YOKlmrlGNp5Z9RlblfAHW/xYJsowDLJQt2LydGK8hlmeLJ6CqxCer4HmQIeK6Q4oQ25Vmh4xApCDIA2UutXLsiZoS7VoL0wAtelK1G6EplNsqdq6M/05Ps27UVdugj3cawKV9vqL30qdt7NjsMsI7NikLNBXYA5oTLz8REkSahfdIyY9Vcbt/XeoIj1ifVfqUmkIpY8r+8t7B/xI8Pq9dOAWUfoxhkgMGthI5jW2T0KePpN9xFD1iUMdc9AQ/+CiNKuHQLz7O6kbqWchrYevcLVyJg=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kkpNJziKB2OtvVlSSbmeumR4Ri53j2MJO847XKW7npH4a0QPBrNrTHZDqPRDvKVh2ypD9bFryB2cvHg1hhYsyq4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>64QjOTGAyztopPpKHpBzk5F0Gd/17X4OKkrxW4N/JsR2vO9K1n16EZpRVfkqWrfiMLbABktDCSDJw6BcWaBnCONU/lUPFwsBc7Yn4F/+uz17BNP+C58OhT/+DlmRcR+JnbaDqwMYUTWEHAYrL/9TCZyLKfzRuMqgcGJyhpo7w/def9UtT7XPpv4tf05GhCKIy4NrS1P7gkBJNaQRiN8dEJlTEKK5gq1jYpu11Q5ZfnMU7rgttQoyY5tbQTW4zCUlNsdiTRW/7aTDpIAe+BhUtA==</encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
	<button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
