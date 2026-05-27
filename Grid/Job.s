<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Job">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Project.xlsx', @description = N'Danh mục dự án, công trình'
else select @filename = 'Project2.xlsx', @description = N'Project List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vdmvv" code="ma_vv" order="ma_vv" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Danh mục dự án, công trình" e="Project List"></title>
  <subTitle v="Cập nhật dự án (Thêm, sửa, xóa, ...)" e="Project (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ma_vv" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã dự án" e="Project"></header>
    </field>
    <field name="ten_vv%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên dự án" e="Project Name"></header>
    </field>
    <field name="ma_kh" width="100" dataFormatString="X" allowSorting="true" allowFilter="true" aliasName="a">
      <header v="Mã khách hàng" e="Customer Id"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true" aliasName="b">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
	<field name="ngay_vv" type="DateTime" width="100" allowSorting="true" allowFilter="true" dataFormatString="@datetimeFormat">
      <header v="Ngày dự án" e="Project date"></header>
    </field>
	<field name="ma_nt"  width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
	<field name="tien_nt0"  type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="90" allowSorting="true" allowFilter="true">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
	<field name="tien0"  type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Tiền" e=""></header>
    </field>
	<field name="thue_nt"  type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Thuế nt" e="FC Tax Amount"></header>
    </field>
	<field name="thue"  type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Thuế" e="Tax Amount"></header>
    </field>	
	
	<field name="tien_nt"  type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="90" allowSorting="true" allowFilter="true">
      <header v="Tổng tiền nt" e="FC Total Amount"></header>
    </field>
	<field name="tien"  type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="90" allowSorting="true" allowFilter="true">
      <header v="Tổng tiền" e="Total Amount"></header>
    </field>
	<field name="ngay_vv1" type="DateTime" width="100" allowSorting="true" allowFilter="true" dataFormatString="@datetimeFormat">
      <header v="Ngày bắt đầu" e="Start date"></header>
    </field>
	<field name="ngay_vv2" type="DateTime" width="100" allowSorting="true" allowFilter="true" dataFormatString="@datetimeFormat">
      <header v="Ngày kết thúc" e="End date"></header>
    </field>	
	<field name="nh_vv1"  width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm dự án 1" e="Project Group 1"></header>
    </field>
	<field name="nh_vv2"  width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm dự án 2" e="Project Group 2"></header>
    </field>
	<field name="nh_vv3"  width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm dự án 3" e="Project Group 3"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
	  <field name="ngay_vv"/>

	  <field name="tien0"/>
	  <field name="thue"/>
	  <field name="tien"/>
	  
	  <field name="ngay_vv1"/>
	  <field name="ngay_vv2"/>
	  <field name="nh_vv1"/>
	  <field name="nh_vv2"/>
	  <field name="nh_vv3"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VdbcoZSY3xrvXsqyKaKZ92cJi7xCDrv9d7C0UDXq4P9tgBjOKlvnMcGD1EGqCGqPqcDQ+s94/v7aArzKMIdJsjqJ5khy8AAkl+IL6ZowGSWyyQkk1u6BlkiGZ8N0Gvn1g==</encrypted>]]>
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
      <![CDATA[<encrypted>JKSRwuABoXncQJsOIAs23MJVetM7NlPxdgiW92YJzHgeUPo1aM5jE+UtUzK2X5GvPL8qcC6/FO4sUJYavACO/renGCATBzTnN7icLiVPp6+jKAOxdiFosLop9Ys+7Z9of9EQZ5j7JmQLczzmr9MbyccLmhIihxPl70phtt/uRbPbckxA55RScICtW/YmG880cdNCr2uOW7ujKVm3nFVyGlV4ORH8R1e4vkX22pgRjaWD2pROQdkhOLvPul/v8rTbo/OVTgoYkTQ2zd1sDvrCznOFpqeICF7UqXysJFi0QnhLuUiqfo7ANRyT0a8K0QCoDpbA6C3D+AnUb+mGWsnyOJ37rfVBdqgYHm0CPxVIBJfqmLehTk5p8JiQiyCH9VaPY2LlXOUEds5NqwqNco94lRe+fw+w8r3OfLOcApo2HtP5PFZRTOufXKKhiDKeMp2ooENI3lzq+FKCV7TLxD3mrNFcOy1dN39qXFHjkarx0lUATlHAeCa84Q6JUogwK47ULsfkRHwVG0f2W9uOeUjjTLJ1mEcqS4Jk90sRvZbcPQ19xuz9RrosNpaAH7C0fjkaxFJPBVNo7RYNdbbqCVMyhQ==</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FlszY+jFcfpMN6+Syqe+kAAiJ5Wg+c8YWyKSfHFRGQ5ki+lCuW6VLXdmvm/zQdZolj4f5otOTy1X8AyobwhsY7+Cf9uNohRfnVvPHcI5LpVSgikgv8ZZnPSZRvyx6MUGAI4ESx3uIGzorOy6WPffm1UiVECBUGrXfjA05md7FH7EC</encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

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
	<button command="ChangeCode">
      <title v="Đổi mã" e="ChangeCode"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
