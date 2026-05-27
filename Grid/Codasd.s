<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "Codasd">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Codasd.xlsx', @description = N'Import số dư ban đầu dự án, công trình'
else select @filename = 'Codasd2.xlsx', @description = N'Job Opening Balance'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">
]>
<grid table="vcdvv" code="ma_dvcs, tk, nam, ma_vv, ma_kh" filter="&FilterCheckAccessUnit;" order="ma_dvcs, tk, nam, ma_vv, ma_kh" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Nhập số dư ban đầu dự án, công trình" e="Project Opening Balance"></title>
  <subTitle v="Cập nhật số dư dự án, công trình (Thêm, sửa, xóa, ...)" e="Project Opening Balance"></subTitle>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" hidden ="true" allowSorting="true" allowFilter="true" >
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" >
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" >
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="ten_vv%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên dự án" e="Project Name"></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Khách hàng" e="Customer"></header>
    </field>
    <field name="ten_kh%l" width="250" allowSorting="true" allowFilter="true" aliasName="e">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="du_no00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư nợ" e="Debit Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="du_co00" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư có" e="Credit Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="du_no_nt00" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư nợ nt" e="FC Dr. Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="du_co_nt00" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư có nt" e="FC Cr. Balance"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="tk"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ma_vv"/>
      <field name="ten_vv%l"/>      
      <field name="du_no00"/>
      <field name="du_co00"/>
      <field name="du_no_nt00"/>
      <field name="du_co_nt00"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>sIzvbt9R8C+VXwRre052ts3eDN5EA+jH8KM9xnRWoFaw5VmVR3MmIeCNEyUzWj9Dkz32ubVGEh0E5+sZ09wobtYI148r7sbhghEt1LttmdEq9J88VPZdgG69RpoTXINY4UoRtrDyXB1hgr5lMqRlaLq8IoDEs0UemUwFcgCEP2G7fNx2G8fARzzgnAe2rBg4BnuZxAx9fRDiNzWvA8qn4j1dqOd3oYxxWj0Dg3DZJl2+PI4/qrSPDbK3RV9eLGf0aF/w8CcrmyHrCiiYhdzDqtneNT1f9FIYXMKOljN1d0962QfoE6SiA99xDY01bNxUbG8+qCEEM2Si0hPxciLK0/T/q4196k8LJFyyQbzsL+JuB86q3r1GiYlsjWeFWMyAJxvIC32Qqb7bkOywTBEnyyStJht5emHhf1IoTROS6/0d7brHhBjEQ7WxReAnezAxQ7+VeGCmueuMPaVpqlaTvDPNlfK4WahleaX0THl38SuoFwAw+Ga9HMMb6aCrHKy0NnVj5IVs4s1DNa+jbE+cjB/GeSN0do97WZ4Tmjizie+C+E83KNQseFftLpqN4VleZmiTSSwg10YOoERM4t+qnOJaNX1EZcIB2KyyQnpgrQmeulXXgO17Pn6YvXuAUTnI0wgeais+qgOCRihqdbEd6D/4cx030pokzDd9c2I2FpjSkN7kylgj9RaxMVABLE0v26MV0ejRWMAowBH9WRUBag==</encrypted>]]>
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
      <![CDATA[<encrypted>SoPSVGlUDCO7Xgt3kcJUnMpiUzi360TSEAEU2L2wlu7iZHvaBPycZAK8nPXC5GQA3ZBkKINKXf8HMlsHEW8QwwOjFPzvMb3jOQ52Ms8ZkF00rUf/AyR2IwJc0rf1pgz/rrjSdWkezdH6GrpePXbgsVGFKfzDnIJn3AUoW1tQLBhEJ/iEpi5ZWttM/r/upo/QpJqQQ5qs3wxoTXox5FvpGsGKWP1Kz11c7kvFjlgjYGL2kcTDJF+dJIdIfZtWfeZs1H3nc6GuwPxD2cxSPDNw1rWyibijFmjieqwHrIynxvaBuDPsywg1inRGkRTPRSTUbTwQczCCVEtYNdq+pjZn+GKGu1BEWhaBPoLsiN7aze3shNvDbxvR7FdpFlzqdUMfAuB0znciZBceYFEaA5kFL4IGbSXX6kQA6rPnXhIT2fSVmJWwaq2y+ZB/IaFerpWW8KGiOcfnBs+J5suTSQPsgEVSDZy+PbNDJhowNEw/WSkj+OisUfUJ/5Tk90yuNUahCLZ9el1gEStTIdgPi99DubaFgkFMl/3QNjBBS7pciZLMCCXmvbQ6MBNNXNSyrDaym3UT6RJQEmWYKbbCohmTVg9FKyX6WJVJ9Wqgq6nJpns=</encrypted>]]>
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
