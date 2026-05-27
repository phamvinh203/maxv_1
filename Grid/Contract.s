<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Contract">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Contract.xlsx', @description = N'Danh mục hợp đồng'
else select @filename = 'Contract2.xlsx', @description = N'Customer List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="vdmhd" code="ma_hd" order="ma_hd" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục hợp đồng" e="Contract List"></title>
  <subTitle v="Cập nhật danh mục hợp đồng (Thêm, sửa, xóa, ....)" e="Contract (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="ma_hd" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd%l" width="280" allowSorting="true" allowFilter="true">
      <header v="Tên hợp đồng" e="Description"></header>
    </field>
	<field name="so_hd" width="110" allowSorting="true" allowFilter="true">
      <header v="Số hợp đồng" e="Contract ID"></header>
    </field>
    <field name="ngay_hd" type="DateTime" width="90" allowSorting="true" allowFilter="true" dataFormatString="@datetimeFormat">
      <header v="Ngày ký" e=" Date Signed"></header>
    </field>
    <field name="ngay_hd1" type="DateTime" width="90" allowSorting="true" allowFilter="true" dataFormatString="@datetimeFormat">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_hd2" type="DateTime" width="100" allowSorting="true" allowFilter="true" dataFormatString="@datetimeFormat">
      <header v="Ngày kết thúc" e="Finish Date"></header>
    </field>
	<field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
	
	<field name="ten_kh%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên khách hàng" e="Customer ID"></header>
    </field>
	
	<field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Phòng ban" e="Dept ID"></header>
    </field>
	<field name="ma_nvbh" width="100" allowSorting="true" allowFilter="true">
      <header v="NV bán hàng" e="Sales ID"></header>
    </field>
	<field name="ten_nvbh%l" width="100" allowSorting="true" allowFilter="true">
      <header v="Tên NV bán hàng" e="Sales ID"></header>
    </field>
	<field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Loại tiền" e="Currency ID"></header>
    </field>
	<field name="tien_nt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" clientDefault="0" width="100" aggregate="Sum">
      <header v="Giá trị nt" e="FC"></header>
      <items style="Numeric"/>
    </field>
	<field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" clientDefault="0" width="100" aggregate="Sum">
      <header v="Giá trị" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_hd"/>
      <field name="ten_hd%l"/>
	  <field name="so_hd"/>
      <field name="ngay_hd"/>
      <field name="ngay_hd1"/>
      <field name="ngay_hd2"/>
	  
	  <field name="ma_nt"/>
	  <field name="tien_nt"/>
	  <field name="tien"/>
	  
	  <field name="ma_kh"/>
	  <field name="ten_kh%l"/>
	  <field name="ma_nvbh"/>
	  <field name="ten_nvbh%l"/>
	  <field name="ma_bp"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>6y7mM6tQ/lG5MdMZ37WL74UStMhrVrT3wWTEfGjEyzWf4at7Rdrd4Eik+vdeMnToOlXP6gWMTsgV5VPv2W8WfET8UqTNsxWFk1ZJ6b+xOZxiPDgsSsWLFHFmYLKRHWTHinBQxrchTZr+bp5YHlPNTxTzF7XAW4c/43Uuy88Ek9Fhnss7vala5NMYC2z5zywm4A+0T3N3sULKeUTMOEXIPzr/AwSUGBviyjUmORvFmwqIiHOZl0cK7KgjvwT28XUz</encrypted>]]>
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
      <![CDATA[<encrypted>YqsqwfkynBZfvEgTok6lkHkuylXMMsYZcW7r6oezT+E/UKRj5GvVoPWSfSGPWSOi1hDIhX4PyV1B9s+r2GR00BxbsQCs+Vd67ycgkQE3S0OGUhNUC2oXkzoCF4zL+yS3h2OpSfgKrTwdNdKUcCV9nfLX68YIaZcsY3KIg8UP3H+kEXyIeri3hxnPDUVkQUCzPZBPjB+J9pGw8aL9N7kkMI9RE0qbkcWrJdzQvCtv+ghVR1mliHarC5p4Jsk8moVGke6ywZuK2/BCT7gBOFDRWnwScsHQv51+veCqDgWUithnfRXJj/jwH+S4/GwkZH8I31BVgIAuD/ZEm+q6vWDlznkqAz0265JgZNi7VJQh7oJYe8oOmy+elFZP4cCfzPLlZWUjpj6YTYQ78YGdw+e6Bf9PbsfrTSA75rXejCQ+Z3G/700hZ/EHu0sW6KIem/9DlGW7PNQ6zzEo8mRFd9VAZkLadi3tmXduH1acFkKDsG/bMpPLFvHvoaMptV6lAUOCociEFkshYKjFORSIW0QCt4O4+8c1yu8O3K1oUyHk2Wi0Pu+pUyGhLOaZmKIk00jsOPlJsuYlpDihPrMgj1IjryZY1AE0fmc+HYWW0uCoMpQ=</encrypted>]]>
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
</grid>



