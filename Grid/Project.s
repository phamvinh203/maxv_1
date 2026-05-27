<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Project">
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
      <header v="Loại tiền" e="Currency"></header>
    </field>
	<field name="tien_nt"  type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
	<field name="tien"  type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Tiền" e="FC Amount"></header>
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
	  <field name="ma_nt"/>
	  <field name="tien_nt"/>
	  <field name="tien"/>
	  <field name="nh_vv1"/>
	  <field name="nh_vv2"/>
	  <field name="nh_vv3"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>KG+xSAesnIkTANpvesda0sUXk43y8dnHflDnIwKAGpZIJmvjO8M4vGSIDjp6uD1v9UeZOOWVOxcMMUbNiRR8pjdr5ddwJnInrWTCmw3SK/TB6ckVDyhl8D9396XYf8YcQNe236ByktQ9yxbvxdEKx+pFHDvGdkxWk6wOhWC16FadSHY5Kcn4BSWgUzPEC+aMAkxMVfuSSBWiJDhE3/mWdM+Wpzh52AYeUgbG+1PCT+md1aWtscU6+lbFE4axE6D7</encrypted>]]>
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
      <![CDATA[<encrypted>rerEzsFxguIoNfIHupZEKUuyVKBRF4Tz8Hx3G6HJzQdbIJVr/mtnO8GoBmQ6ZWuNNcXlKrQ6J9WgyJA38vGxIHTelxXa3EweHC7p21p31qugbPxgPzEDcFRs5XbViJ+RekFi4DonFaqhUtXHuknX+VqKzmNt5ZCGWRyZgC3gtzN6GW5Tcm3qXjQ+IiNKhTd4ZiCHZcRJHbvpdxnyZkjffBNKK6n+7ktX1Bix0ZmP9ZJ/6QfFn2tD1iCGn7tQAWuWeZUofaKft10mSH3R81fNRhupRS7UGCpKWwAZfbhoDhOFP1Dqp1J/aA+PPCx2ue3+R3TBC70tVv/nz+NVisXRyl9mj86MvCOKcO3hdcsRPX882nHaHyo5zyQODhu8buE0dae8dZ5+38fFtg74l2ueRc3RZoy/BSoUD0wHJQDoH/lOhdSqdpqkPiCNI+XsNvUP9oes8lenEn42PUvSu+BtydYyXg6iNf6A8Nl8TuV39NhdNCBxC/92PEAgeORRbdSTNdngJw75n16QuidNMTkyDvWO0+lSyutzH7utrnlZngkSO4poXnnKeVmwMCQEoaqZ06ZmyHDIb8YJZ/aji1j7fw==</encrypted>]]>
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
