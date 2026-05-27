<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 and user_yn &lt;&gt; 0 or ((dbo.ff_ExactInlist(name,(select rtrim(name) + ',' + isnull(restrict_users, '') from userinfo2 where id = @@userID)) = 1)))">
]>

<grid table="userinfo2" code="name" order="name, id" filter="&FilterCheckAccessUnit;" database="Sys" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo người sử dụng" e="User Maintenance"></title>
  <subTitle v="Cập nhật thông tin người sử dụng (Thêm, sửa, xóa, ...)" e="User (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="id" type="Int32" align="left" width="80" allowSorting="true" allowFilter="true">
      <header v="ID" e="Id"></header>
    </field>
    <field name="name" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên người sử dụng" e="User Name"></header>
    </field>
	<field name="Dien_thoai" width="200" allowSorting="true" allowFilter="true">
      <header v="Điện thoại" e="Phone"></header>
    </field>
	<field name="e_mail" width="200" allowSorting="true" allowFilter="true">
      <header v="Email" e="Email"></header>
    </field>
	<field name="restrict_users" width="300" allowSorting="true" allowFilter="true">
      <header v="NV cấp dưới" e="Users restrict"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="name"/>
      <field name="comment%l"/>
	  <field name="Dien_thoai"/>
	  <field name="e_mail"/>
	  <field name="restrict_users"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>SMN11ZWLSYd/6NDnh+JdRn1EecLkicbEBcYYDAaFIDcf4L0GGusDjaYZXpsKjZPla3PGItMGE2GyuX9FqYRYYyWVTH046MSdZ8dG87mzwqAGAVY3/J0dTlrnNzZ4KiXmj1RkSib+EfJSZlFH6rnVsTU851Ht6zQtSs2ktf5B7TPORpnRVy2qNf8qC8WBf2gi</encrypted>]]>
      </text>
    </command>
  </commands>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>
