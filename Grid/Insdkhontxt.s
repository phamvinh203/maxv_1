<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessSite "(@@admin = 1 or ma_kho in (select ma_kho from dmkho where exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = dmkho.ma_dvcs and r.r_access=1)))">
  <!ENTITY CommandWhenBalanceBeforeInit SYSTEM "..\Include\Command\WhenBalanceBeforeInit.txt">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "Insdkhontxt">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'Insdkhontxt.xlsx', @description = N'Import tồn kho ban đầu NTXT'
else select @filename = 'Insdkhontxt.xlsx', @description = N'Stock Opening Balance'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="vcdntxt" code="nam, stt_rec_nt, stt_rec0" filter="&FilterCheckAccessSite;" order="ngay_ct, so_ct, ma_vt, ma_kho, ma_vi_tri, ma_lo, stt_rec_nt" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Nhập chi tiết tồn kho ban đầu nhập trước xuất trước" e="FIFO Stock Opening Balance"></title>
  <subTitle v="Cập nhật tồn kho nhập trước xuất trước (Thêm, sửa, xóa, ...)" e="FIFO Stock Opening Balance (Add, Edit, Delete, ...)"></subTitle>
  <fields>
    <field name="nam" type="Decimal" width="100" isPrimaryKey="true"  hidden ="true" readOnly ="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_nt"  width="100" isPrimaryKey="true" hidden ="true" readOnly ="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0"  width="100" isPrimaryKey="true" hidden ="true" readOnly ="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" width="100" type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="100" allowSorting="true" allowFilter="true" align ="right">
      <header v="Số" e="Number"></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Item"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="ma_kho" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ma_vi_tri" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ma_lo" width="100"  allowSorting="true" allowFilter="true">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="so_luong" type="Decimal" width="120" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" align ="right" aggregate="Sum">
      <header v="Tồn đầu" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" width="120" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align ="right" aggregate="Sum">
      <header v="Dư đầu" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" width="120" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" align ="right" aggregate="Sum">
      <header v="Dư đầu nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="nam"/>
      <field name="stt_rec_nt"/>
      <field name="stt_rec0"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ma_kho"/>
      <field name="ma_vi_tri"/>
      <field name="ma_lo"/>
      <field name="so_luong"/>
      <field name="tien"/>
      <field name="tien_nt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<encrypted>jmibZF2u6Rldnp1mYUGpNCcejEhJ0u5ZgHG/Yxvlr630LG6B793DjI1QhEiREuU47bj5+TgonLhJ2TlRGHwyCXFvhEstrALiDDMtUgtd3XeRuWfv4s4jpnSjbrLGnTt7wLP2iA/anUNZ6YFpvzitIBIDd5la693layBgMNdBXNh+DvIdpTDqfD3TN9fzhkSgIYzDJ07CjMnoy6cxEUCFJOfWV2eggw7jQwfWEG93o5o9Ew23bXDRmTnR1jLCED8rkhomvBN5DsEu20G1kdJZ48yzrJmZ/ivgbQsvGHRYDsDmU9h5FjCLYZ0cyQds+QOMl7afgFVnppJfMmSODfe/rM6XicMLbvJSgjeuEHUPk4P9SKm4cEB8ju8QJp1q1kMjb7eX1nJ74GkMDvXU6d1kcc++tqrBUFGBr2cs5fKAG8wOXrdYl3jlZ+//aV9TOvTfcIo1hx38s8aGpOIbTKZC2SYxUKBSTqHHL50C8Ijni1tS2mh0W2oEq3vBNzWCFb37XXPzGM8reh93njLEq9q2AF8M4n9vQOtq4KzPDXFtwBnt2smwKtvzF0lc/+F+YQYbL8SSoix1JW8Gor+uIng9PE4zBGelU2zzieYZZuZH3rhqghxI+DoxYeohw2Rm2w+L775H+wYWkM4i2CTJyGISTd2Nq+wsBumxNcMh8vFXmoBQasFqA2FrD0UQPodPWqYVbd+54hUUB1wQzute93i9Og==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>mZpGEsfg1PJP0otF6B9p1Kb1/jnI9Ym8zWjltEG0c8Sc7CGRHF8zFiN8+0HORkLzYSf6N5mfJyHpwKp0rKOwoNWaFYrhghZt/hVDqI1svkE7l1l2mnE6XhsFYpzMsm1JOOsch9EaNsjlNfSfxKDU/FHB10leCimadvByA+N8ChdTj7fCUBtsghgq/gCiDWJor4fANlQSvUJS2zdYgVHjsbHVbxUHURkLkQCT197Lt/as6KGrcawBNx1tgKvGy276Aw3xx5I5fdtK2hW7UTLzh4YoggZynQgChuYAPz5aII5m0G3Px2ysULteRQRhGPc3lRxf191ginU8fEupjh51iSGtG5aiilgS0C3zuIh3CbiLtQQkz67KB0JErATItlnvWUggW9atx1rCav/JmOkiL6/wLXiiwON0Wu3IGoEDugN/OSpMb98KpblsE/VJXONzp3qwRNeEQ2M1enhsiOfvscF/XeM0M2UhEk9pMXACzr4bD/+HqT7bLhpVOkCnIODn5xEJkKVd4YF4slBmPzEF74iPTYs5kmS5GM8x5Nw7US10u1yibjDBzb6iXCh7kKOgXAIgPZmBj1knDkgcP9etJVVaW7HZAgXE4ibV9giTbX8=</encrypted>]]>
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
