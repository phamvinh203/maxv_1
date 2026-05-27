<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Expense">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Expense.xlsx', @description = N'Danh mục phí'
else select @filename = 'Expense2.xlsx', @description = N'Expense List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="dmphi" code="ma_phi" order="ma_phi" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục phí" e="Expense List"></title>
  <subTitle v="Cập nhật danh mục phí (Thêm, sửa, xóa, ...)" e="Expense (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="ma_phi" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã phí" e="Expense Code"></header>
    </field>
    <field name="ten_phi%l" width="450" allowSorting="true" allowFilter="true">
      <header v="Tên phí" e="Description"></header>
    </field>

	<field name="nh_phi1" width="150" allowSorting="true" allowFilter="true">
      <header v="Nhóm 1" e="Group 1"></header>
    </field>
	<field name="nh_phi2" width="150" allowSorting="true" allowFilter="true">
      <header v="Nhóm 2" e="Group 2"></header>
    </field>
	<field name="nh_phi3" width="150" allowSorting="true" allowFilter="true">
      <header v="Nhóm 3" e="Group 3"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ma_phi"/>
      <field name="ten_phi%l"/>
	  <field name="nh_phi1"/>
	  <field name="nh_phi2"/>
	  <field name="nh_phi3"/>
    </view>
  </views>
 <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>X4feCOTwOBN/Cf7SZ3pV62Jh8xrRaVdIpNBcT0clWgPpIJ/2ZPuBBw1717gLTzbzBpt237Rn2dLeCkIoxy/PJdWEzutcbvrMIHngyhXMDPmak46JtZbCf2WVlx8jZjBV7IvubYzz7sAHO9ksS/NTyN+DeZRYFEYccG+LmmYohfXI3A3G/gFoozoSBJ/VCsCDbscm088AdKCtgBIJMY5164RSTS0YgPI5VyK2tRGy0R+dVrvfTER8nGsHq94IC/QY</encrypted>]]>
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
      <![CDATA[<encrypted>638nGhZwZwOUOazVspzh5HSPIaDHnlwSq/oaxqGearABv0aJWblfTAZN6GV+6JKPQaX/wyXT8Og7luEMFCF4MfK/kEHmczRzLeD90FFshGoCC22/eOUZK4Daowg+3Rxt7XPjBTLrjHpE29GD5g8tUXOf8IE1be+SRSAQ3JsgCEYqd5DvrqZZiLCNgXwsLNdfVlVIWAML31ieMKbkHr0J/mrSCn97z7WSQEDmr14FWUIk0uMrm0X7TgGQoqWL5da3tDaRR4SjJik8jxKuLiPnKohn55Bv3HHjEqs/3fb7upW0bPUosq5vvH5faisxZNd8CW1thhzAA+D+otDlqFtbwFZayIKzxZHgsraEF8XAXeAfoexdIwjh9pjuJFNwRX5w+fUMOUr67JwvRrdu/zPrOzqBVTThmNo1XOaRf9Z46uXyxE8PWNvJJpPW6gVTm7qi7aopHnuS6+7Q6MWl2H+Kp+xMIzjZHd2GISqHcUzN5eQGdlc/YqNIT6dNjbqMsgWoU3P0r+9SwzAEzmbHjZxIDIvwjN/U0ck47CqaS+sW45LaXW44/2yr/6YdobncHwEAY0GFjIeI/2tk8W7sGfZCV/f+x5dym2ufcXwRLM1/fDw=</encrypted>]]>
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
	<button command="ChangeCode">
      <title v="Đổi mã" e="ChangeCode"></title>
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
