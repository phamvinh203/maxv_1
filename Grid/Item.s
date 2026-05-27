<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Item">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Item.xlsx', @description = N'Danh mục hàng hóa - vật tư'
else select @filename = 'Item2.xlsx', @description = N'Item List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmvt" code="ma_vt" order="ma_vt" xmlns="urn:schemas-maxv-com:data-grid">

  <title v="Danh mục hàng hóa - vật tư" e="Item List"></title>
  <subTitle v="Cập nhật hàng hóa, vật tư (Thêm, sửa, xóa...) " e="Item (Add, Edit, Delete, ...)"></subTitle>

  <fields>
    <field name="ma_vt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Description"></header>
    </field>

    <field name="dvt2" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt 2" e="UOM *"></header>
    </field>

    <field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="he_so" type="Decimal" width="80" allowSorting="true" allowFilter="true" dataFormatString="@baseCurrencyAmountViewFormat">
      <header v="Hệ số" e="He so"></header>
    </field>
	<field name="loai_vt" width="60" allowSorting="true" allowFilter="true">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="gia_ton" type="Byte" width="80" allowSorting="true" allowFilter="true">
      <header v="PP tính giá" e="Valuation Method"></header>
    </field>
    <field name="tk_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk kho" e="Account"></header>
    </field>
	<field name="tk_dt" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk dt" e="Revenue Acc"></header>
    </field>
	<field name="tk_dtnb" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk dtnb" e="Internal Sales Account"></header>
    </field>
	<field name="tk_gv" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk gv" e="COGS Acc"></header>
    </field>
	<field name="tk_tl" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk h.bán trả lại" e="Sales Return Account"></header>
    </field>
	<field name="tk_cpbh" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk chi phí KM" e="Promotion Account"></header>
    </field>
	<field name="tk_spdd" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk sp dở dang" e="WIP Account"></header>
    </field>
	<field name="tk_cl_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk CL giá vốn" e="Cost Difference Acct."></header>
    </field>
	<field name="nh_vt1" width="80" allowSorting="true" allowFilter="true">
      <header v="Nhóm 1" e="Group I"></header>
    </field>
	<field name="nh_vt2" width="80" allowSorting="true" allowFilter="true">
      <header v="Nhóm 2" e="Group II"></header>
    </field>
	<field name="nh_vt3" width="80" allowSorting="true" allowFilter="true">
      <header v="Nhóm 3" e="Group II"></header>
    </field>
	
	
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt2"/>
      <field name="dvt"/>
	  <field name="he_so"/>
	  <field name="loai_vt"/>
      <field name="gia_ton"/>
      <field name="tk_vt"/>
	  <field name="tk_dt"/>
	  <field name="tk_dtnb"/>
	  <field name="tk_tl"/>
	  <field name="tk_gv"/>
	  <field name="tk_cpbh"/>
	  <field name="tk_spdd"/>
	  <field name="tk_cl_vt"/>
	  <field name="Nh_vt1"/>
	  <field name="Nh_vt2"/>
	  <field name="Nh_vt3"/>
	
	  
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>KG+xSAesnIkTANpvesda0m6ryp3pPT1mdwmo9+PGySxiZtY8jlCh6V3nws+uLuyH17+4eHQTCjl36LVy0Qo2jyg21ePmhsUdOvo+OXwtjiZVEig1RwFvPcSSEImicQI7h8yTJrNfo8zRKZM0IbC0p38XMwwDMfwzgxIsD7NlEas5fzNxhZWzj3h2wfXwC0FWNJpcLtjvpuo4/5yfp3n+Awcqa5VmXIiDsQN0jVNafaCgIYyoEfdXzdrN/RpWs22A</encrypted>]]>
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
      <![CDATA[<encrypted>638nGhZwZwOUOazVspzh5Gpu+n2x3abnIAzuGMEfYLNKlCuYq6RUf2O/fp4nIMoYm8C98GomR+wRbgyy7sbX98P1WA3GnLv+NVtOpgZJJ1xsmBTGV3oW5QdAi4CD8+TWnIlyZeO3whDWfM4FGNSSq6p4ybAkdIsRvsPfBbhu8v5unFmhN2riZuAGchRcQMoum2qyfwL718cGWPTgUFZ8y95JiIKFDkp17VDx5bJlqhgOZgNRtmELSAkq76Lh0SyXbTfIseELQWjRItC1VTr0cQKmEKH1neUdEmfVPVXQDMOagNSZqq/OIU5tTiY5+SZqr+8htUerSfe9R7hGayv2EboxunFt342tfxp3qNEMcMpixueDcEUP4xQ4fFLYI6DovKCYTiy6q9HydgtUAQRarv71U88AkCSYqMpNqfgtXesELkSEmmJOUBn+IpRU9/sp22uoRsQBiJXhzSc+O2WjLkspPTKIBPzkVQu8PWELTc0OVb/SqTOY7knlkinwpRkEZxAGi9NJmk8WUzQfvZWLJLGgnlNyeCF+9qMH/WzwViGa0etkPpadOujbF47PysewDKJy5hOoXyPW28e+Yb0kUA==</encrypted>]]>
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
