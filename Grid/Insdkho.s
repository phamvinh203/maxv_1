<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "(@@admin = 1 or ma_kho in (select ma_kho from dmkho where exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = dmkho.ma_dvcs and r.r_access=1)))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "Insdkho">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Insdkho.xlsx', @description = N'Import tồn kho ban đầu hàng hóa, vật tư'
else select @filename = 'Insdkho2.xlsx', @description = N'Stock Opening Balance'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vcdlo" code="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" filter="&FilterCheckAccessSite;" order="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Nhập tồn kho ban đầu hàng hóa, vật tư" e="Stock Opening Balance"></title>
  <subTitle v="Cập nhật tồn kho hàng hóa, vật tư (Thêm, sửa, xóa, ...)" e="Stock Opening Balance (Add, Edit, Delete, ...)"></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã hàng" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Description"></header>
    </field>

    <field name="ma_kho" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ton00" width="120" allowSorting="true" type ="Decimal" dataFormatString="@quantityViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Tồn đầu" e="Quantity"></header>
    </field>
    <field name="du00" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư đầu" e="Amount"></header>
    </field>
    <field name="du_nt00"  width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư đầu nt" e="FC Amount"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="ton00"/>
      <field name="du00"/>
      <field name="du_nt00"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<encrypted>JmIRqq2Bh3VLSaUkxlK9dt4kE/gP4yIPjoF4U4z/Ztn6DKxFZTI6mDh8Mm96L4HDFDEYhCZkDYxTaUXRKh/hQWTnVZGn7k0A7lOEIKEk7PeR315ipV3Sekoi6ZuH38zb9l3xinYW4NSuMT/NEC5trFdAu/+fPaklMJX4oH01M53SDBL3bgYc7WCRdn13mrCQv0sxAoWKXR1lK/i00qw13c3NVLgO+T5Qs2S2tp7vEMuUWmEENQf5tow9Xe6qeKkuFTxdjC5ImrNI2223W/mrlFaPRhXFTMcP2w0Ym9vOX1GEHfNzkWRyBhjGOK4Ik8nYIC6O516b+cBbh1aaRd05YtuCxvT5a+6xAlJtkKuX7uF1eDT9nGbkQCDMNckEBloFNlTRhemeYMH9BwwHToMyqh077wZNL3l5C6O6/hPLZ11MENqU+BYrYWRSu21HtriRhTV2X3U6KcCjXRzTkJ6yksKP38mTCD8d/wur9RVvG1vcQWsQR8dHD7BqxhU2jM7sNd21H+fmiwLhGWD0kJZ1bhbd9p5mwpo0kBVtAbkij7CtE7TML6Cg8YfT/4pQGzrt00jqD2L9gzvuSIOdBDl0YUe9WtGyrkXf0zWN9UMqS40mzoNSFmFv57lTXe99hDt1MHBVXdTDDEetah0XKSPGtTB24R35/MnDRqWgYeAAsZmwZ/ceD05iVB8jyvh7FOixgXcHweuqXl90JkMGxuAJhQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>SoPSVGlUDCO7Xgt3kcJUnKOr5ggp/Ofxkhxn38Knbq7ozDcp+XzjMNmu9zbEdk1dRxEeff18jBcL9AYUYONMoTvheWavPYv2YY/zwR0zHqkbcjmpgjcIoFsUr+rE2LUxdkMF5imZJapfOPbhqqoTJwR/frwaT2Fy9CSUduPpXQyy0nPIxrm7ZWLWdib+QdxIpw0SelxPiibRG2vVPxFbLtz9saTyiaUQWWIQOMzpVQi1XoXwiBPw+qkiB0EgqjyP3mx9WV0wQ2MBa4yqFVziaZJFtX8oqYd0R2GHZ/6mvOvLCwjXamHBbMtAE0LPQjL0aloqHoGhy8p18R5e5r+fpgY8IV+Qr0Qbe6XMyhvLTrMKu2m2YR9DL5YJX2WnQ7FCdLbIfNBUNsA0oT65Xvl1CAD2tmx3h+mwLFLl5GCblMXusgAwFbTZMrjuhc6YNi6OG4BdCPZDAWAkguET+EmnJJoIIf47L7hCqMurTCeWi85pgwQ6bYwcLbWhuy0UbeA9RjNZUsg8xqUpICqvgubiqNf12dPAAwgUh1cm1nFPpQLqdthnlzKyIR+IX0yhW+ARBfmZHhZzejeuIyO+q+qT9N3bjo+5AwL8joJI6686qLA=</encrypted>]]>
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
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
	<button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
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

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>
