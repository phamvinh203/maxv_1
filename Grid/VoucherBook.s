<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "VoucherBook">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'VoucherBook.xlsx', @description = N'Danh quyển chứng từ'
else select @filename = 'VoucherBook2.xlsx', @description = N'Voucher Book List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="v20dmnk" code="ma_nk" order="ma_nk" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Danh mục quyển chứng từ" e="Voucher Book List"></title>
  <subTitle v="Cập nhật quyển chứng từ (Thêm, sửa, xóa, ...)" e="Voucher Book Update (Add, Edit, Delete, ...)"></subTitle>
  <fields>
  	<field name="Ma_dvcs" width="80" align="right" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit code"></header>
    </field>
    <field name="ma_nk" isPrimaryKey="true" width="110" allowSorting="true" allowFilter="true">
      <header v="Mã quyển" e="Book Code"></header>
    </field>
    <field name="ten_nk%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Tên quyển" e="Book Name"></header>
    </field>
	<field name="loai_hddt" width="100" allowSorting="true" allowFilter="true">
      <header v="Loại hóa đơn" e="Kind invoice"></header>
    </field>
	<field name="mau_hddt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mẫu hóa đơn" e="Form"></header>
    </field>
	<field name="so_seri" width="100" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu hóa đơn" e="Seri No."></header>
    </field>	
	<field name="so_ct1" width="100" allowSorting="true" allowFilter="true">
      <header v="Số bắt đầu" e="Start Number"></header>
    </field>
	<field name="so_ct2" width="100" allowSorting="true" allowFilter="true">
      <header v="Số kết thúc" e="End Number"></header>
    </field>
	<field name="so_ct0" width="100" allowSorting="true" allowFilter="true">
      <header v="Số hiện tại" e="Current Number"></header>
    </field>
	<field name="ngay_ph" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày phát hành" e="Issuing Date"></header>
    </field>
	<field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hiệu lực" e="Start date"></header>
    </field>
	<field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày kết thúc" e="End date"></header>
    </field>
    
  </fields>

  <views>
    <view id="Grid">
	  <field name="ma_dvcs"/>
      <field name="ma_nk"/>
      <field name="ten_nk%l"/>
	  <field name="loai_hddt"/>
	  <field name="mau_hddt"/>
	  <field name="so_seri"/>
	  <field name="so_ct1"/>
	  <field name="so_ct2"/>
	  <field name="so_ct0"/>
	  <field name="Ngay_ph"/>
	  <field name="Ngay_hl_tu"/>
	  <field name="Ngay_hl_den"/>
      
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>6y7mM6tQ/lG5MdMZ37WL7/9FmHfRniGuHCyz3PkHn+T2sVG4E9QtKgHZw5KxIwzIUcdlcus2hgrRhUazkhOtjRkjCvfyA4cfjtMUw9jcHryZBfIkYijnXlX1iQCkB1rRQb0e1kCS1SrOMfiRJ6x5PLRJE6tB8/z7ABAUJViRV/044MPcaUJQVW3YhURQVaG7cL1Tk33afbgZeSqgVPxDfNCB/E8zDgMkVy+QGK4U5Nlo6RgagRWNCbOmMTedK32s</encrypted>]]>
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
      <![CDATA[<encrypted>nH+QYZZb4OLv/dSxH+VUcsnGqu9XOVUZDJEntJ8CS18xTXumUJ9GTkfMTiYhvDaa0sIUHj7G+4nHyr8RNdlpQOuIi/eHxhj4fIXKqQZCoSgY/XHD3hEGeZSVoGRPSoBGcP9FoNcRJZ5sBMe3wUpIi7JpactoIzyVqhAGcmJm7KfC1W6WQbDAmx6WiC6w1kuseoxTC3zRKnVFkB2jfQml5Zg0lHBgw+X9QOwn3N6W+w0dI+QyYpsWwRkvHhXPLcC4gPeHmqaJN1hveRceDKbUXcbvstl0Jw9ZIX+jyXsu1vBhRJdGBbcQlnMs1FWBuy5rIYfB2jMxejaW6EgZTmKKkMwxhT/Ht/cTKEUowJpoDYau5eD+Btec0tcc0ypmRPsyrJffUGQ7PdURX0fRITQjdzqOmDCXSiewYdhUp+HtodwIr26flMtWJ3GIUA8czsdMwx7pqC9n5WgEmLAonooMTZqZE07lWdX45G5dyjgU8TQvyp7VwG9boG7xEDaZ7w1HI5qDkH7LoWnarll63uEedLKmyoFxcy+8J5+vJ6ID/LjSxEzoxFumCJlrukX7UkMMsXGn4AldzmLmAgDNmvGtsaeiDKNSmUTBfHvoefZ/4I5ohHM+YWQoHdjM3JH3dh7mByNzBIEcnWhgB/e5+WeFFTwzgraQQnqDlj84pK0sHiPBDcC54zsVE4Ut9emvPZCE</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FlszY+jFcfpMN6+Syqe+kAAiJ5Wg+c8YWyKSfHFRGQ5ki+lCuW6VLXdmvm/zQdZolj4f5otOTy1X8AyobwhsY7+Cf9uNohRfnVvPHcI5LpVSgEaOaYwWyhRXqL3vnN2opZwvh0AftBSwqlYgBy1jmD/1tdA01ilV6LAc1duzh67w3NjerZ4lsOlx6pI/56+JZvQ==</encrypted>]]>
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
