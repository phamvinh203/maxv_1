<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "Sosdinv">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Sosdinv.xlsx', @description = N'Cập nhật số dư ban đầu hóa đơn'
else select @filename = 'Sosdinv2.xlsx', @description = N'Invoice Opening Balance'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vxcttt20" code="stt_rec" filter="&FilterCheckAccessUnit;" order="ma_dvcs, ngay_ct, so_ct, ma_kh, stt_rec" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Cập nhật số dư ban đầu hóa đơn" e="Invoice Opening Balance"></title>
  <subTitle v="Cập nhật số dư ban đầu hóa đơn (Thêm, sửa, xóa, ...)" e="Invoice Opening Balance (Add, Edit, Delete, ...)"></subTitle>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày hóa đơn" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowSorting="true" allowFilter="true">
      <header v="Số hóa đơn" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Khách hàng" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" allowSorting="true" allowFilter="true"  aggregate="Sum">
      <header v="Tiền hóa đơn nt" e="FC Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" clientDefault="0" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền hóa đơn" e="Payment"></header>
      <items style="Numeric"/>
    </field>
	
	<field name="t_tt_qd0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" clientDefault="0" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền đã thu" e="Payment"></header>
      <items style="Numeric"/>
    </field>
	<field name="t_cl_nt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" clientDefault="0" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền còn phải thu" e="Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Loại tiền" e="Currency Code"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
	  <field name="ma_nt"/>
      <field name="t_tt_nt"/>
      <field name="t_tt"/>
	  <field name="t_tt_qd0"/>
	  <field name="t_cl_nt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<encrypted>JmIRqq2Bh3VLSaUkxlK9dt4kE/gP4yIPjoF4U4z/Ztm6wihRPOmrcHc6ukS7VBa9ImBl8toSy/J8mqtrv7WPbwyMFl17PRf4XTFMHjFE6FuriuIBvX8LIBCp6RwT1XKCtnGTFKuxvgr0Sxlk7NlyNY+qPqFbJAQcqydGFu2ebX5wcM5gHsANjRhew1YidvQVJ6r3SRWXQdKiNVCu3D9fUBCfTwrm5yNEbwX/lFJs9MrGdYVfa8ED8PUux4dd4EXf3sWBQt4PVnAQXmVlju2DcbsKiPWuarC51QKA70zAOcK51je0pibT8qyiTIZmPNi0sgHKjkwrBkb2/CIcEUNGI2dFcvnC2srSvpi7tgEGiIQkXYoYQ7r2UBsbo3tYOEiEkMTKpir6uIaw1ZkTW8uwG3sz+NxvF5kT960Za+C3WB0c4btHM6nrAv0gjNJzs+8lWI2QnDDQtWbquMNJ2l5mMsNnnyynJhfcfJs4FuRCQBc+/J6VojPJHAo22vrLV/gmLSM6ZdTlr317rQIqLdsXHtXjSjH0ukeZeuHMh9AbS9mCX1fck9G5xdL0ZZsrmjcPUyIly9XWuS5m3ucZ0f2DpRur/7N96LNOdFMWRHhEiizj29/c93/g2mYPovp7zpzI0Y3Enc3uyfKA1phcoV9jL8D42FWEHw5WJltVefxz7ur2Vns95ar9Ku8HJ/FsrLVPUFjRs9DR6B/WC+IL3PAHCw==</encrypted>]]>
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
      <![CDATA[<encrypted>GnxV2EArWX+R4m9txOevuY3TEmcf8BFNZsQQu2l1lZ6OHLVEnut2hBu7Gq0IHm/yAbfveJoV8Ts+vnzPMlpT7otpFYRtXtoCrOBUWix/RDJUgkUHlukFtmggwhfaLKCMDYtPJaq6pkDaiI5Muh05hamZRpPgxv3ntNM+5q4WGU4f06Mf2pDKtglgcO2rPs2x/SPM23djkURNuAYKxwu4AOdNWwzQNqTYgE+GagE1W/PrHPo1ygISymsgjp9O/dphlKiT+cBeQv79MGS3W2kEoRlUsMO7K7TwutVk+L0bCcDJi5or5nQCOR8Tyuhxn3ByQH8YbixjIYVuj8I/fkzRkWuLx7kKPcVzBY6adgtFkaU4PbzM2nKNzCn0MkVhTRcHxVOZ1nAlhyoj68D+Yeje/h+fgkBepMzBASwkS3C4/6o/1i0vEe5x/O21D7gYD7li6I4a8XdCWZ9oy5d/8QbXHFYtBU37p5uykC7ksdPXIngFFAzkwrMB5UXh1v8qV4At8o4Yb+3+FaalNTt0s7R39yvin2ZW0x3ikx6pTTKbleyjvx/04Qur9+ZQH6D5yTQYQ3t91p90R6t5yno1vn0DQ2TzZAWpuIH4sgJTboewHkwtkNRXd3QC0xYRdTi7rLBf</encrypted>]]>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
