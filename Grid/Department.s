<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Department">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Department.xlsx', @description = N'Danh bộ phòng ban'
else select @filename = 'Department2.xlsx', @description = N'Department List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="dmbp" code="ma_bp" order="ma_bp" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Danh mục phòng ban" e="Department List"></title>
  <subTitle v="Cập nhật danh mục phòng ban (Thêm, sửa, xóa, ...) " e="Department (Add, Edit, Delete, ...)"></subTitle>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" width="110" allowSorting="true" allowFilter="true" >
      <header v="Mã phòng ban" e="Code"></header>
    </field>
    <field name="ten_bp%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Tên phòng ban" e="Name"></header>
    </field>
    <field name="dia_chi" width="350" allowSorting="true" allowFilter="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
     <field name="ma_td1" width="110" allowSorting="true" allowFilter="true">
      <header v="Tk chi phí" e="Material Account"></header>
    </field>
    <field name="dien_thoai" width="120" allowSorting="true" allowFilter="true">
      <header v="Điện thoại" e="Phone"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_bp"/>
      <field name="ten_bp%l"/>
	  <field name="dia_chi"/>
	  <field name="Dien_thoai"/>
	  <field name="ma_td1"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>X4feCOTwOBN/Cf7SZ3pV6zXqQKUkuZw9GX8GISKuylrhh8mjLIKG9XGYRdg7ZwjQCPFYwAOparzfJEyANN33Y4mTdDCCiEvIjsYh4Eb9SEPRTCMlC/9VLdPMa2wQIW7HDuzID9G+liBW8GE/5HHIsYuzeZEBISgQIB4+iEAWafrjM8GWXFdwLkdE2OI4a5QoG0poM1sxom1dD7Pr2PuQHHbXoUCzMYVwBC1OBzomPoh/Ubv51Ue65zdrae4bGAg7</encrypted>]]>
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
      <![CDATA[<encrypted>638nGhZwZwOUOazVspzh5HSPIaDHnlwSq/oaxqGearDvPb0okaEmxkF7Ccvgv6JtUPvUQc1kDtTOF8uSU1hXUEw4U7aHjpF9R2ZpLcivp6mh/UTCuNPOO8qKiF9FZusC7Bx1SgyLOEKa2BOibC6VtIE8+khNIKFr4D1J9teBIQFr33Bju5VdWYxiqyWGHKxRRv6C4zVEsvrwfTo0Op3YVzKQFRnjBGKuJJ8DK303oULw1HVn2WzuumZRnVZ+3IDTH/COIe0hwfR63pKUOIyyqQks6tChHuwYz1fLRq+cNw0u54gTw61bjgvqNt8eYKdtq4CYwDOf6tlqGbotFc4GvpdnScKTNikvcb8Po2Ywl7dJb9Irht+Hvd9t2BbfoiSDjIWIvu6jbTVeYaTtYy4cL6iXk8aZcUj9KrliIEDYTB8mmbGEsuSonSqfIdG/CvAHeHZXF54rE0q2xNwdC2+zKtS/1Op55FVos78znVW8uHloP20QDB8iBFJYptZ1+TkTeV829koul/TuxKTaI7rizjjvgq46cgoaEwT/eOwQUCN0DvYMqiUxNjBcQlMSxy+4JIWs6LigNyaBZIIuKtDDt+WiUAQ29jamqTkCSJ533Z0=</encrypted>]]>
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
  <css>
    <text>
      <![CDATA[<encrypted>EbYG0wcERw7ky2NXvdiMXrH1oCeFO1wl5HbbzLH5vkLHTvlfsO9XCnsFGN3NFMfcJv6nkG9fwmYtK3JSm2Z55PZXLqAYA8hU0nDYs1YWrZtVPmx9WfLDc58HwImU+q8fTVQh79Ie8AtH5ZNEA/86bg==</encrypted>]]>
    </text>
  </css>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3krmtkDJycT6IxjWd406oDjSg/UJhuDAeSKkPmgiM3+GXqBKsDacGsbaxQXGukPL8Av3rallYOFLM00DxbLiPeuM=</encrypted>]]>
      </text>
    </command>
  </commands>
</grid>
