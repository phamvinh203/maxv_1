<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "(@@admin = 1)">
]>

<grid table="vsyssiterights" code="name" order="name, id, ma_kho" filter="&FilterCheckAccessSite;" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Cập nhật phân quyền truy cập theo kho" e="Access Right by Site"></title>
  <subTitle v="Cập nhật phân quyền truy cập theo kho" e="Access Right by Site..."></subTitle>
  <fields>
    <field name="id" width="50" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" dataFormatString="@upperCaseFormat" allowFilter="true" allowSorting="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên đầy đủ" e="Description"></header>
    </field>
    <field name="ma_kho" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true">
      <header v="Mã kho" e="Site Code"></header>
    </field>
    <field name="ten_kho%l" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên kho" e="Site Name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="name"/>
      <field name="comment"/>
      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>Xd9JmP6j3Bua9QhmxmcKEHxvwvT5CAyZDfnFe46TShQAQN27TQN7//eJeCOcfheIRFj5klP+NkkcH126hAThMm0rVijly/g9f3SfbQaIdEqKAvWhOh6lg5fqu4cj76ZRNSwar3s4D9D26jr2kLV2XrcSAy7JSkWhpZCzNZZy8jUHIGDt7pHBCNU3KQjWA1Pqg6smJE0SwAGroOFJkQ+q8w==</encrypted>]]>
      </text>
    </command>
  </commands>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
	<button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
