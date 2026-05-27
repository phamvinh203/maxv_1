<?xml version="1.0" encoding="utf-8"?>

<grid table="dmpb" code="stt_rec" order="stt" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Khai báo bút toán phân bổ tự động" e="Allocation Transaction Definition"></title>
  <subTitle v="Khai báo bút toán phân bổ (Thêm, sửa, xóa, ...)" e="Allocation Transaction Definition (Add, Edit, Delete, ...)"></subTitle>
  <partition table="dmpb" prime="dmpb" inquiry="" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Int16" width="100" allowFilter="true" align="right">
      <header v="Số thứ tự" e="Ordinal No."></header>
    </field>
    <field name="ten_bt" isPrimaryKey="true" width="300" allowFilter="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="tk" width="100" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="loai_pb" align="right" width="100" allowFilter="true">
      <header v="Loại phân bổ" e="Allocation Type"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="tk"/>
      <field name="loai_pb"/>
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
	
	<button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
	
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
