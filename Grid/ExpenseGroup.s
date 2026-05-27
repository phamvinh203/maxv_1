<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "ExpenseGroup">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ExpenseGroup.xlsx', @description = N'Danh mục nhóm phí'
else select @filename = 'ExpenseGroup2.xlsx', @description = N'Expense Group List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="dmnhphi" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục nhóm phí" e="Expense Group List"></title>
  <subTitle v="Cập nhật danh mục nhóm phí (Thêm, sửa, xóa, ...)" e="Expense Group (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="loai_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Loại nhóm" e="Group Type"></header>
    </field>
    <field name="ma_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="ten_nh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhóm" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_nh"/>
      <field name="ma_nh"/>
      <field name="ten_nh%l"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>+fpaiwD1Pj9y0oVWEQd1IeYTNEvpw/fKJYG5/9aBkN3X3HpXzCy2eq6QSsy4eXMO+VIflXmdLdoCosBJIz30KuaQeHqTwSamkVQMJFopyC1R2dSYz9P0YttdSRS2ZvAPYpSCERIyDYe8WkrFQvxUd1cjvEJGaO5cvahncP5/O4UeZfdm+8zUM7lNkmyJNCVgfyGh/w6SJZUxLZhKAJBQihNzuszs3O2rza1nYYFUDvugBMNcgSubR6P3o/M98o6V</encrypted>]]>
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
      <![CDATA[<encrypted>TfEHhBrfyVvY48SxUZiFkq8EZn0Y9L3+nZtTMdQ7I/AAde3RFTJJ9U7PW88I2ekcCLTOULTpsXa8218c8bow0nGFVDRGx5x7zAREwLQMValv/3PrS7C2trrlJCYw0SGMpWKJRSkmq3E4MnvZIVZI1bTqHMgQH9OZMjuQ9hlfKl+ATun4cdfftL+S+Ra6HtG5aGktWNbYS46vEzfcQzzNYXQxD0vGvHasHxu5SMenEEsnK5BmWP9EM/8KMHLvuV20fZJEf1ozDr511PsleuxPney6eTmRYb75jPv6HHdVgd2k/YsSd0Rd+jV5MA1ugWRCrbtY4knnGBG8A4kC/VMZBtDKtTSDuoIAB469Vf6Tz6gVsF5+IOltTv/yHCD72Jc8AFbrFWyw0gau7yifXmsDPvGja+qiDNlIQxsuB/yw2zl1x2LPpotknzGS9qlGZGd+0n3cYuL4B6UQS8N5IH8iStZRPDAocjJ6HipoE8P5CY+LSjXmtZFj0O5kODLTyzZIbOvhuQwK7pUPFIYlbJdJPvoko1YQ7J5/nrWmufaslb0e6dv2KmlMhESdqkczTBuv1qC8NsIr8/8jgn6Gl1a2SQ==</encrypted>]]>
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
