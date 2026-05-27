<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
	<!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

	<!ENTITY TransferID "SalesPrice">
	<!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'SalesPrice.xlsx', @description = N'Cập nhật giá bán'
else select @filename = 'SalesPrice2.xlsx', @description = N'Sales Price List'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vdmgia2" code="ma_vt, ma_nt, ngay_ban" order="ma_vt, ngay_ban desc, ma_nt" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="Cập nhật giá bán" e="Sales Price List"></title>
	<subTitle v="Cập nhật giá bán (Thêm, sửa, xóa, ...)" e="Sales Price (Add, Edit, Delete, ...)"></subTitle>
	<fields>
		<field name="ma_vt" isPrimaryKey="true" width="100" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true">
			<header v="Mã hàng" e="Item Code"></header>
		</field>
		<field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
			<header v="Tên hàng" e="Description"></header>
		</field>
		<field name="ngay_ban" isPrimaryKey="true" width="100" type ="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
			<header v="Ngày hiệu lực" e="Effective Date"></header>
		</field>
		<field name="gia_nt2" type="Decimal" width="120" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true" align="right">
			<header v="Giá bán" e="Sales Price"></header>
		</field>
		<field name="ma_nt" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
			<header v="Loại tiền" e="Currency"></header>
		</field>
	</fields>

	<views>
		<view id="Grid">
			<field name="ma_vt"/>
			<field name="ten_vt%l"/>
			<field name="ngay_ban"/>
			<field name="ma_nt"/>
			<field name="gia_nt2"/>
		</view>
	</views>

	<commands>
		<command event="Loading">
			<text>
				&CreateTicket;<![CDATA[<encrypted>H1U1LnyjfICHDmSHePfU7I7ZSY21+R9Vz+sUOMXklsZYyT/C3sWn0EWvQzAR9bUe21++aCNb6ovH80h4Sf8F0dB6NfQYlyz9ovTiYNu+QVewoSa+Gb10yqQBbtNRTmT2ANVXR8zST0o9boHnm3E7Z19bzXdLUNQDNUI+BtaHZUtWORQTy7UjpvPW/wgt79SKhQSDdw/IyNrIJUV2ttQNhIPH5/L33le8eAM7g3eS5u8Eq9h+9FVnW2uR2gd1biur</encrypted>]]>
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
			<![CDATA[<encrypted>X18OxKZ4S1C9my48RWiM4cQh75zI5DwUV3clJacEV4OcJxKg60vSAQxfPlYgrzjD7DvYU8C+iV8vy1KuSV/YJIX7243nRQ1gT+4x1waChaiT2Yg74BY7jbcASWS7agpJg5qxAP7XoGXVvvVhyOP0v0pGCOzkJFt/ibFHJoYk1d4KjhNPwg7fQMRM2Lkwa8WA8XvwWSDJS96Xxqso5WGlRUmxFIfVeQ8RQgXOqVci2jYcMOf6xBP0MPI22i+g7v0LMjRHUwU7laSh3l2Acl3+UGyyWRMIv03ztesoEjc5q7oeFv8Izmw99e8g2kzF0hQ+t8Esd5ptWicYYlnkk8/G4ypfIgHx+ez8ziPxCBvidcrhow7c2al3hnbJSa9/DgkY3vS4V2mp8KaA2EmlFUuMtyOs8SfTrNija3TK34QvS2C4XX8tKPjI3JLw1IWc8cy2hZKGG6wefVUQCHpb/oIs+XBNhpZo1/ThU00xnrXXtH7RVKgGH07A0IGk91MSv7G1K/uPvMCweRHbViq80q9lInZQs0U2Vt2ymW2FzwWjwmqRcMvCFTcfVrd8Fj3fMrhrAKFNABszuVZckNoprMGWYg==</encrypted>]]>
			&DowloadScript;
		</text>
	</script>

	<css>
		<text>
			<![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FlszY+jFcfpMN6+Syqe+kAAiJ5Wg+c8YWyKSfHFRGQ5ki+lCuW6VLXdmvm/zQdZolj4f5otOTy1X8AyobwhsY7+Cf9uNohRfnVvPHcI5LpVSgikgv8ZZnPSZRvyx6MUGAI4ESx3uIGzorOy6WPffm1UiVECBUGrXfjA05md7FH7EC</encrypted>]]>
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
