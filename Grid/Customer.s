<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Customer">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Customer.xlsx', @description = N'Danh mục khách hàng'
else select @filename = 'Customer2.xlsx', @description = N'Customer List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmkh" code="ma_kh" order="ma_kh" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Danh mục khách hàng" e="Customer List"></title>
  <subTitle v="Cập nhật danh mục khách hàng (Thêm, sửa, xóa, ...)" e="Customer (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ma_kh" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã khách hàng" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="dia_chi" width="350" allowSorting="true" allowFilter="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
	<field name="dien_thoai" width="150" allowSorting="true" allowFilter="true">
      <header v="Điện thoại" e="Telephone"></header>
    </field>
	<field name="Fax" width="150" allowSorting="true" allowFilter="true">
      <header v="Fax" e="Fax"></header>
    </field>
	<field name="e_mail" width="150" allowSorting="true" allowFilter="true">
      <header v="Email" e="Email"></header>
    </field>

	<field name="home_page" width="150" allowSorting="true" allowFilter="true">
      <header v="Website" e="Website"></header>
    </field>
	<field name="doi_tac" width="150" allowSorting="true" allowFilter="true">
      <header v="Đối tác" e="Contact"></header>
    </field>
	<field name="ngan_hang" width="200" allowSorting="true" allowFilter="true">
      <header v="Ngân hàng" e="Bank"></header>
    </field>
	<field name="tk_nh" width="120" allowSorting="true" allowFilter="true">
      <header v="Số tài khoản" e="Bank Acc"></header>
    </field>
	<field name="tinh_thanh" width="150" allowSorting="true" allowFilter="true">
      <header v="Chi nhánh ngân hàng" e="Province"></header>
    </field>
	<field name="nh_kh1" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm 1" e="Group 1"></header>
    </field>
	<field name="nh_kh2" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm 2" e="Group 2"></header>
    </field>
	<field name="nh_kh3" width="100" allowSorting="true" allowFilter="true">
      <header v="Nhóm 3" e="Group 3"></header>
    </field>
	<field name="ma_nvbh" width="100" allowSorting="true" allowFilter="true">
      <header v="NV bán hàng" e="Sales"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="dia_chi"/>
      <field name="ma_so_thue"/>
	  <field name="doi_tac"/>
	  <field name="dien_thoai"/>
	  <field name="Fax"/>
	  <field name="E_mail"/>
	  <field name="Home_page"/>
	  
	  <field name="Tk_nh"/>
	  <field name="Ngan_hang"/>
	  <field name="tinh_thanh"/>
	  
	  <field name="nh_kh1"/>
	  <field name="nh_kh2"/>
	  <field name="nh_kh3"/>
	  <field name="Ma_nvbh"/>
	  
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>6y7mM6tQ/lG5MdMZ37WL74UStMhrVrT3wWTEfGjEyzUM2Lp0ekRTYfTV9L6iP6ze61Y6mNuYj6yWnjNM5xTa7plrqsR4VerI1umH/N+fDoQkVfDv8vyNokboHeYHutXz9TfU4Q9sVdY/kzG12bp78llA6GCi0xd64tfYFm2JFKK2Pp0X2RjQiQGSeKkJjZX4jF7At6ALOtJ8rlFOm1PX0Ppev0QBdbMNLiKpCGJEI7FkanrTmOOCj79eSNMaiNaP</encrypted>]]>
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
      <![CDATA[<encrypted>GP6eUKUhPzL4FI8Jr0UsJT5yLxoxZbeX4bW6iNXMQkraugJf3hFfai8zIvg72/dIp/sFiKrP7cGK6FmjMPfEYqgiHa3fjQmvkr0POQdsElQN5P/acAjMgzncw9YRRfsU1hixuZn7NzKAEo3m1jMsPqW876t3XNkCOFqAkYZsItFVVfp2BjjZwBDDicd+yA+CovpgAciJnS7xLqYp17UmPWspRKLdPDPqCCVwO0mmkzsNYFrbM6CiskegeSu27BxwU0twYdVUYjGGdD5Djz9mfi4/PmM+fXhvn7uagZan/SFtE8SpoENckAAXQOPQnKNCRugSlmYa5wPK5ZlDUeKcoxCL6qZu2sOY0AORdeKfyhuJC0mnYpWyMLFr5Wg7PY4fXK5eMhAkPvjUOT3Et9i6qeUrkDqeJ4e1e7N/iIeRB/Hsn1JfOd8pnGKHDrca0yLEKXvxvfqwNKAWSHXrNVrxjYZenFWo4ZXLVLHdx2ea90FvYpGgO2oIWbU75tNirN0c+do5U4ipnVpW3Nl+HQKZ0qetwE5hJiPF3PXLZusMdeo67oi1mC3zrz5BPUk8vmy7ygFcxWy7mXpDsW4wbwk8XjimLx9z1jQaIBhsu6NTXiXNeV1Dj0slxkSdN/10fNsK0IrUHPKsO0xI38DqQJVA17GQGZRCetPcZK+O2hy84ADgORgwu6QulbPvSDS08NuJZpEhiQx/OmZv0kSz/vGHAhyvGsEWYgjCKCi4Sq+uQw30Lb4IGWvYa4JsPRxPNAQNoB8LcrE/5/OA31tfKdMXX807DW8Ib02azpnEQscGenouVIzOBjUyU7UqIQhI3yU3</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38Fln00Feo5ezSyQfsGHVvLYWKAOEYB3ayZIvk2UUYewwU1fjcuuDzLai8D/n0FG9BO1oIEr0NPOSlkEev+dq5OkwwIK9KazL0zqKd9DY9RDX4PJYJK4nZ/AbM3N3bsBP68P5D3DC6b8jyXPfRIYE6xjEBFl4ui4kXUhNGRyc3AlELRSg/GmqUHnB3b1xVWg2h6HnFCJH9gg67UOlZ0v7irf4w=</encrypted>]]>
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
