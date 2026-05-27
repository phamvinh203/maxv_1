<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "LoanContract">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'LoanContract.xlsx', @description = N'Danh mục khế lước'
else select @filename = 'LoanContract2.xlsx', @description = N'Loan Contract List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="vdmku" code="ma_ku" order="ma_ku" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục khế ước" e="Loan Contract List"></title>
  <subTitle v="Cập nhật danh mục khế ước " e="Loan Contract"></subTitle>
 
  <fields>
    <field name="ma_ku" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã khế ước" e="Code"></header>
    </field>
    <field name="so_ku" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số khế ước" e="Contract Number"></header>
    </field>
    <field name="ngay_ku" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày khế ước" e="Date"></header>
    </field>
	<field name="ma_kh" isPrimaryKey="true" width="80" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer"></header>
    </field>
	<field name="ten_kh%l" width="200" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
	
    <field name="ten_ku%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên khế ước" e="Description"></header>
    </field>
	<field name="ngay_ku1" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày vay" e="Loan Date"></header>
    </field>
	<field name="ngay_ku2" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày đáo hạn" e="Due Date"></header>
    </field>
	<field name="ls_td" width="50" align="right" allowSorting="true" allowFilter="true">
      <header v="Lãi suất" e="Max Interest Rate (%)"></header>
    </field>
	
	<field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
	
	<field name="tien_nt" width="100" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true">
      <header v="Tiền vay ngoại tệ" e="Loan Amount"></header>
      <items style="Numeric"/>	  
    </field>
	
	<field name="tien" width="100" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true">
      <header v="Tiền vay" e="Loan Amount"></header>
      <items style="Numeric"/>	  
    </field>
	
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ku"/>
      <field name="so_ku"/>
	  <field name="ten_ku%l"/>
      <field name="ngay_ku"/>
	  <field name="ma_kh"/>
	  <field name="ten_kh"/>
	  <field name="ngay_ku1"/>
	  <field name="ngay_ku2"/>
	  <field name="ls_td"/>
	  <field name="ma_nt"/>
	  <field name="tien"/>
	  <field name="tien_nt"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>Fok558BC6HGYHJW8JHOvWgW6ZcVkiF9dT4DZy4lPlU9OKkkeDy4dmcaAR0BkzOgSaJdfKgpwinzniR3m5pSOMj3diYXpTwfcORxQ5clAAGAqspy0Pt/CMNitgMhFjMciySXP9mBAfwnuTFQbjLJklyXF5sEamMbU34al2tWLYvk0rY70qC4tzJXkzW5J9fTUummj0zG+8LQF56kkvWVRsOK/T2l86xnThZvNA36pdrwEQ27FL4QQcnPqjDhtWWWn</encrypted>]]>
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
      <![CDATA[<encrypted>638nGhZwZwOUOazVspzh5Ad/JsXSYbq5qE9l8DZmkYQu5yd90mEKv4tRZ7XkrQX2TYbJi4rB2tEDikrJZ1y3zzgw9lOmbw9tAjbB+MJy+UX/rvFZ0FqyS6i9EJTz8k41pAi9acR2ddaQF7feDlFyDvMmXvqfwhyjdHL0t5I7X+PXJLjfu3Pgo/06IC9OUGfGjg5CdkMLAx6cBrZwch4OCY3mF6xG1CKnLFim6NBBIMEEVDYhUY3mtR/Y7NaC5+ojOiJs2+ucy4DSCg2ip91h1a5soXec4lQhMcSqkll2dr39UUncji2RjF/9kuU2b+hil2E0nDB4OT/qwJID/CLmxjnkY2tHYMSEnENxpDdgDNUaRHDHshuPE8nHZBAj1cLga7qjQnp9jpOxQhZkWfwwdV050zKFyEveh+HwiPn6aXHaSipJXTQjhYLheRYE6z/Of1mM+TuHHuxmpwSydRHcwqj/RgI4Aw28S3GZ4pJZikIa4WetzWbBShIdDVs3w6xxeFSZx8kEbs+RNETLO34Vt5TC/9Bt9KRJEL0hO58VSWZnwKRMid6sZzKDa7Voe9YQK3OjWvv7/RRVp06bXYWV/BFlD26AXCpN25ur1TAcSS8=</encrypted>]]>
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
