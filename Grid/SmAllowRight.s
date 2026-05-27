<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 and user_yn &lt;&gt; 0 and id not in(select id from @@table where admin = 1) or ((dbo.ff_ExactInlist(name,(select restrict_users from userinfo2 where id = @@userID)) = 1) and exists(select 1 from @@appDatabaseName..sysunitrights where r_access=1)))">
]>

<grid table="userinfo2" code="name, id" order="name, id" filter="&FilterCheckAccessUnit;" database="Sys" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Người sử dụng" e="Users"></title>
  <subTitle v="Cập nhật phân quyền truy cập cho người sử dụng" e="User Right Maintenance"></subTitle>

  <fields>
    <field name="id" type="Int32" align="left" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Id"></header>
    </field>
    <field name="name" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Người sử dụng" e="Name"></header>
    </field>
    <field name="comment%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên người sử dụng" e="Full name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="name"/>
      <field name="comment%l"/>
    </view>
  </views>

  <toolbar>
    <button command="Edit">
      <title v="Phân quyền" e="Edit"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
