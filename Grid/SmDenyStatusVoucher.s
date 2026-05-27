<?xml version="1.0" encoding="utf-8"?>

<grid table="vsysStatusRight2" code="user_id, ma_ct, status_id" order="name, ma_ct, status_id" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Giới hạn quyền truy cập trạng thái chứng từ" e="Limit Access Right to Voucher Statuses"></title>
  <subTitle v="Cập nhật giới hạn quyền truy cập trạng thái chứng từ: %s1." e="Edit Limit Access Right to Voucher Statuses: %s1."></subTitle>

  <fields>
    <field name="name" width="100" allowSorting="true" allowFilter="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên người sử dụng" e="Full Name"></header>
    </field>
    <field name="ten_ct%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên chứng từ" e="Voucher Name"></header>
    </field>
    <field name="statusname%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="r_edit" type="Boolean" width="80" allowSorting="true" allowFilter="true" align="center">
      <header v="Không sửa" e="No Edit"></header>
    </field>
    <field name="r_del" type="Boolean" width="80" allowSorting="true" allowFilter="true" align="center">
      <header v="Không xóa" e="No Delete"></header>
    </field>

    <field name="user_id" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="status_id" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="name"/>
      <field name="comment%l"/>
      <field name="ma_ct"/>
      <field name="ten_ct%l"/>
      <field name="statusname%l"/>
      <field name="r_edit"/>
      <field name="r_del"/>

      <field name="user_id"/>
      <field name="status_id"/>
    </view>
  </views>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
  </toolbar>
</grid>
