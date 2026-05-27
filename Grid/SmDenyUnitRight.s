<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "@@admin = 1 or (@@table.id in (select id from @@sysDatabaseName..userinfo2 where dbo.ff_ExactInlist(name, (select restrict_users from @@sysDatabaseName..userinfo2 where id = @@userID and restrict_yn = '1')) = 1))">
]>

<grid table="vsysunitlimits" code="name" order="name, id" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Giới hạn quyền truy cập theo đơn vị" e="Limit Access Right by Unit"></title>
  <subTitle v="Mã đơn vị cơ sở: %s1 - %s2." e="Unit: %s1 - %s2."></subTitle>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="id" width="50" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="user_yn" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="name" width="100" dataFormatString="X" allowFilter="true" allowSorting="true">
      <header v="Người sử dụng" e="User"></header>
    </field>
    <field name="comment" width="300" allowFilter="true" allowSorting="true">
      <header v="Tên người sử dụng" e="Description"></header>
    </field>
    <field name="r_new" type="Boolean" width="100" allowFilter="true" allowSorting="true">
      <header v="Mới" e="New"></header>
    </field>
    <field name="r_edit" type="Boolean" width="100" allowFilter="true" allowSorting="true">
      <header v="Sửa " e="Edit"></header>
    </field>
    <field name="r_del" type="Boolean" width="100" allowFilter="true" allowSorting="true">
      <header v="Xóa" e="Delete"></header>
    </field>
    <field name="r_access" type="Boolean" width="100" allowFilter="true" allowSorting="true">
      <header v="Truy cập" e="Access"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="id"/>
      <field name="user_yn"/>
      <field name="name"/>
      <field name="comment"/>
      <field name="r_new"/>
      <field name="r_edit"/>
      <field name="r_del"/>
      <field name="r_access"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ksHDWCkHEtt+iNpyzh+LEKBKdSHSq2KxZh+kM06qUrCjf0VOcf5QGfSwrPTfWxXDu/kuR50cuFvCXRk3YVxuVus=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ku0s+MPpSw+4BviHGbpGdzmfyHR4o7kMFkgcV8IF788NeGSFsV3oPRikiY+QT/tRUqEgJ7LJBBOv5piVkre9bso=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>bjZaIu7+WNmJy9znkZMhX7uZaBZbhD092GdSh6g/JFQua9PR6K7Oqi2jgaif6Ku05BU68m1S0eMx6/g/mNXd1BTbzYCb74xg3E2hjZ2n3NmKv/zCV6j5V0V0E1zJEA5lHXhYbTIqb3vbYM6BJMojbvjfYiuTre9EW8nlAB5ag/wBPJ82Ek/qaGtbLPtuzaCE0zj4BgMvNtedVWIuf246IBxos4zGX9I6uNk6s7YnU6QP9JF5KIhn7mf+n/ZlYT+jSUhBVcoKSrYNGPi3dozHW47GOzTPlJ0jk7gLZbL1c1a7tF+l2jPi65PRQtnhFAHP0uuPrh00ZS7GxC+38e82bhqPdSdlaXGM81c/QpRDDulEzedKppaiGS/UUosOFlEj</encrypted>]]>
    </text>
  </script>

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
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
