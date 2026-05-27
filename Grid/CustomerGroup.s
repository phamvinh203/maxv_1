<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "Customer">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'CustomerGroup.xlsx', @description = N'Danh mục nhóm khách hàng'
else select @filename = 'CustomerGroup2.xlsx', @description = N'Customer Group List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>
<grid table="dmnhkh" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-maxv-com:data-grid">
  
  <title v="Danh mục nhóm khách hàng" e="Customer Group List"></title>
  <subTitle v="Cập nhật nhóm khách hàng (Thêm, sửa, xóa, ...)" e="Customer Group List (Add, Edit, Delete, ...)"></subTitle>
 
  <fields>
    <field name="loai_nh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" align = "right">
      <header v="Loại nhóm" e="Group Type"></header>
    </field>
    <field name="ma_nh" isPrimaryKey="true" width="110" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group Code"></header>
    </field>
    <field name="ten_nh%l" width="350" allowSorting="true" allowFilter="true">
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
        &CreateTicket;<![CDATA[<encrypted>l4K3c8hxpxKTUZTm3LuULWGSqrlhd71I9Lnkfw7+v8NtnX3/h4mAINSzcWgNk5Ec22TtOWBfukpHeHciWrAYum+R32Wvwh/LusaeVIm8oUWvqzYwA2TWng9k7fXuMAzm9egQDcGXJsANIp8lepY+46S7DzLdbutfl3xEoiFMAq8lcS+Zqs0TiPsGaedtHDF3akQjSA/Vuh/zwDS83Jb2WWYU77iai7BuObXPQED6yVoy7wHq78N846vjzpg/AFuC</encrypted>]]>
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
      <![CDATA[<encrypted>TfEHhBrfyVvY48SxUZiFkq8EZn0Y9L3+nZtTMdQ7I/A7Wn4QGNNDpyab1rHdtmB23p/4kSHEkd4jbTQRGHRNxE9EF8f0vTJHnEj4k9cJ6O40VfRTaQE4n6LNnF3Tu7akmOI5YSW5+B0ZuOmFCk3VR7L7vIspWdY3dL9/TCNEjawSydS+92SDx1ThQANZUr7U2gM/O2lELPFKXpoYW9E+bv+PYeVfRilUNS6rptNs+3brUuMtWBhao7KRfVGbAgvyn740F8b2mEb7YQypn5igYZPC5nolRqewayJa3MrVjkkZlh28QthxfN9mTANDDpXCQKWzZAMKro47eer6OsFs+v9OvV866ShXRazaV1Ob1fRGMxK7XMEgyvuPfrsUst0O6wUD9Q3PD5Fqmt7laM4/ZNTntpSSn/HwlNrhX7416K4+kdchnwv+yQ/n/AOeQUanasD4thUWtSPZANAM49z9dn33jSKmBtIfR6DF7YlsXcHR6zoyHF+NwuiY5a4FC793bIlLEiamhHsYFCkhTMcMtXdX5mWMY0vsSXaegoH+ivE64UHqAWYks9s9uU6/1kmUfke1qs/Bx0wmUSDViP+j5Q==</encrypted>]]>
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
