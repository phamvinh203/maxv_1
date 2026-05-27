<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "(@@admin = 1 or ma_kho in (select ma_kho from dmkho where exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = dmkho.ma_dvcs and r.r_access=1)))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
  <!ENTITY XMLStandardBalanceToolbar SYSTEM "..\Include\XML\StandardBalanceToolbar.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "Whsdkho">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Whsdkho.xlsx', @description = N'Vào tồn kho đầu kỳ thực tế'
else select @filename = 'Whsdkho2.xlsx', @description = N'Physical Stock Opening Balance'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vcdlo2" code="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" filter="&FilterCheckAccessSite;" order="nam, ma_vt, ma_kho, ma_vi_tri, ma_lo" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Nhập tồn kho thực tế ban đầu hàng hóa, vật tư" e="Physical Stock Opening Balance"></title>
  <subTitle v="Nhập tồn kho thực tế (Thêm, sửa, xóa, ...)" e="Update stock (New, Edit, Delete, ...)"></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã vật tư" e=" Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Description"></header>
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
    <!--field name="du00" width="120" allowSorting="true" type ="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư đầu" e="Amount"></header>
    </field>
    <field name="du_nt00"  width="120" allowSorting="true" type ="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" align="right" aggregate="Sum">
      <header v="Dư đầu nt" e="FC Amount"></header>
    </field>-->
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
      <!--field name="du00"/>
      <field name="du_nt00"/>-->
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<encrypted>BrSYgSOSSJP+lirGYKgvuJE8uXseOFghFUgwYHFSfckTW9+7AkDk1yuFMOTVXBIPTO1AzMu3+kJgTPzfT/F25/1L8nSplPkvToJmo+/iPxNWOdTM6CD+zXWSL8AVMrZC0BYak5mY5YVtZGrkPjHXi1LpoaifaQw4tBapyhg9Uoj4E08onnS988gwP3uHojqyK60jHkAIhvwGh9aAwziJKjnXpE7k9As4A7CjhqShJTIsnoJB9vRE2odEbJYAcdDTT9yUaRErAXk5jH2Ilh/Bn+JMf6n1pvUd4yIS6MEGgY6nsVd6jpKkRuD6KpIyUyaM6UVRfWtvslz5KvajCSdbnCWpVhQ2AQkF4Jl4CReqgMef+RqhWkaAeARSBquDS8ejIN/x/bDyWqdWU53b+yT+i7nGwpq8QlAGfsa1tk0P1GuQHTXCFqEbq+m9a93pvFNXjUxI6M1bml+KxAqEvdBDuIeWet4cvGxl25MtQWvmwA2XWv/H/2EgqcaDFYtA1C5Kt/NwgwdxQEhQIjPCwu+ArR7LsYAocxS9rfSCV8mBo42sUX7Y+viiAa+6vevFmwA8unAsj2SJdvWPkrlHZLZUl1HvO552diSRVrbxpbBogOALAkPYOUGCP/c3A5CzPnNVib3LrUHSsZDHTPMGCzhwboaHK7b18ylNWhdIlmCgaffD4GY1R2/hV8BzDWUCOqra9nnmxPzJeBVyzGP8Mk7ANw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>utjY5Gfh0pnoTnG/OFbyJM0iAhjVZIOzzqDt+gik5CgKeAkB53+QAiZ/Un8b+GfAvjCohyJ2cyMq3LrlzT4z/kBGIm5wmb1EIN9bPTu53KLvfKwto+XoO/WvgMT4PrMAB+CoynNE/10on50+KjFom4NV6+zt/vxPNZ/IADcT3+3p5GRIbPCPz1vyhB6X6hpKwNXCqmkL5kZ3M9wSMEjmTzeiAPBHJdOkFAAr70fCebJQPt4ywS4oRPu6BYaif209MXh3rK3uH1juEDp9BlpgLBwVsKsYfH8oX7h/QHH3NrhU8FhwfNpkJ+o1Pzu/Hka+106Bznj6Nw4Mx4EAiJWgAkrWVrw9p/KhNwsGTdoou6VqovA9jfPq+zCswAHW2X9Ed7m41/8HRAQwi1yVaNwj+Cck49MPoMV1iVy140zaV3rZ07D0dKXWII/jHV8yRVTifziXlUgJFgFTGHCOBatQW6Dm86Kzl6vsij15Rs017BNwrdTgJsY9f8KzGuP7/6ojXGoYQtJR1BUummaEoBxnnZ+6iaGz4kKQbOftIxlBx/2MLyyWGqxxCGk8zmgz/oqntbiNcK51HF2b/o0cxcx9j9Rp4Xj0jUiTHJiUOcbK9yDvhjLKizE3PBha7Xivx2Rw</encrypted>]]>
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
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
	
	 <button command="Clone">
      <title v="Toolbar.Copy" e="Toolbar.Copy"></title>
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
