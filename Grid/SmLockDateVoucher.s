<?xml version="1.0" encoding="utf-8"?>

<grid table="vdmct2ks" code="ma_ct"  order="ma_ct" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Khóa số liệu theo chứng từ" e="Voucher Locking"></title>
  <subTitle v="Cập nhật khóa số liệu theo chứng từ" e="Edit Voucher Locking. Voucher Code"></subTitle>

  <fields>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="ten_ct%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Voucher Name"></header>
    </field>
    <field name="ngay_ks" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true" align="center">
      <header v="Ngày khóa sổ" e="Locked Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="ngay_ks"/>
    </view>
  </views>

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
  </toolbar>
</grid>
