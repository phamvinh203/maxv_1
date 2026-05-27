<?xml version="1.0" encoding="utf-8"?>

<grid table="blacklistip" code="ip_address" order="ip_address" database="Sys" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Giới hạn địa chỉ truy cập" e="Limit IP Address"></title>
  <subTitle v="Cập nhật giới hạn địa chỉ truy cập." e="Edit IP Address."></subTitle>

  <fields>
    <field name="ip_address" isPrimaryKey="true" width="150" allowSorting="true" allowFilter="true">
      <header v="Địa chỉ truy cập" e="IP Address"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ip_address"/>
      <field name="dien_giai"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>0rfkamBO2ukp5VetItuMo4qWzCOxtoYzyOY/UxOVI2ltx7kdDJKe2wD1C/k3QjuBvdBqfwdxWJsX0qSEJgiG6QMn1PMV23mJgzvyTlEAqKZ39b9UcW9pohwuX9L5I/ZJ/ANETNuIYuvH05bnQ6CrdFLVmY7nRryphQOleFaKlbRBT8S/3ph/tCS/J3lcJZa+JiEpQDlsy7g3SQAbTKOo2w==</encrypted>]]>
      </text>
    </command>
  </commands>

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
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
