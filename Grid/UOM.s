<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "UOM">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'UOM.xlsx', @description = N'Danh mục đơn vị tính'
else select @filename = 'UOM2.xlsx', @description = N'Units of Measure'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="dmdvt" code="dvt" order="dvt" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Danh mục đơn vị tính" e="Units of Measure"></title>
  <subTitle v="Cập nhật danh mục đơn vị tính (Thêm, sửa, xóa, ...)" e="Unit of Measure (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="dvt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đvt" e="Description"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
    </view>
  </views>
 <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>KG+xSAesnIkTANpvesda0hD0youBKck6prWmpkszruuyH6+0Ol4b0uS2+FWjVsExzHRDk7Lruln38zcjIRGOhNikaLjCWVYvHJElV0b3Jo2l7XJagocWBAov6bZsgnkuk/7xGB2G/6LLwqh9MVnlAtI7TEmPz9UyYW4oU9sSL2YibhyhgIduNjhBlpwESJcBZo5ecL/i+/l4agpBsxBmRvUmZH1I0EYPr6+GPESmB1J1UHef8VHxILTVlUdtsBlV</encrypted>]]>
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
      <![CDATA[<encrypted>pDfn2BDZKFVRLMe9qUu9csrwEICutL1Dgboxq3p59MCaUeIssJ1ky+NHwuRnTyU28/YHFlDoFA+PYO5YLFecodysh3YibV+4t7/M8ABGXVeqLHmp/E65zQ1MUQTe7qnpDZG0ygRupn2HBW88PRs8osgJoi4sBpO0oqyUwTsPEWgeRMYmtKijgIY6s9bwqQi9LDffFGIo2zhnGoJwEg6rUd43Ex1TdQrt0+gjTeswraeJsw0Blkxka8l6xNlfEI0PaCtyRBAcp8iS6cHXlcgRUN3c0ve7Uv0yMuWFnWbRXIbWu7ANwWyWfvOfbNvrBY2H3a6pvCLR+YsK2zwh96D1NPKChIYdJmBoI0bcdeAiMU5vCRsglj8mzRWZrd/ByZOoCUc4iXZEF4GVzhGf8loAFh7gcqJpxlwx6r07Jix1uHMhuvWA2ZicLbdEUP9ruF0vsuW2kKSwrTLXH2Q/QRcaGlvtrO4R7VRUVJbgMP2TLXOgcSXkVUqL4oksR1yc76HLojD4l3c4YcAw7vkbmpMBuj4/55+C1hf58L5vtk6QnHxhqJHHvZRH/3mnyY+bI8Xi</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

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
