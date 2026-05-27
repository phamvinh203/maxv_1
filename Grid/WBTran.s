<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">
  <!ENTITY XMLUserGridMasterFields SYSTEM "..\Include\XML\UserGridMasterFields.txt">
  <!ENTITY XMLUserGridMasterViews SYSTEM "..\Include\XML\UserGridMasterViews.txt">
  <!ENTITY CommandExternalFromClause SYSTEM "..\Include\Command\ExternalFromClause.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "WBTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'IRMaster.xlsx', @description = N'Phiếu nhập kho'
else select @filename = 'IRMaster2.xlsx', @description = N'Receipt'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m59$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PN6" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Phiếu nhập kho thực tế" e="Receipt"></title>
  <subTitle v="Cập nhật phiếu nhập kho thực tế (Thêm, sửa, xóa, in, ...)" e="Inventory Receipt (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c59$000000" prime="m59$" inquiry="i59$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90" allowFilter="true">
      <header v="Ngày nhập" e="Date"></header>
    </field>
    <field name="so_ct" width="90" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="250" external="true" aliasName="b" allowFilter="true">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
	<field name="Dien_giai" width="300" aliasName="a">
      <header v="Diễn giải" e="Descriptions"></header>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" width="120" clientDefault="0.00" allowFilter="true">
      <header v="Số lượng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserGridMasterFields;
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
	  <field name="Dien_giai"/>
      <field name="t_so_luong"/>
    
      &XMLUserGridMasterViews;
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenWhenVoucherBeforeInit;
        <![CDATA[<encrypted>wXmaJyxSIu6MwMh5Npy7emqNQKGxHKuR6C8QonpGtzEed4yvRFWno0BsD++NH4BdSdM1Zo8gjo8X4lFkzXsZZayjVhavHWgzl9JzCdJqr3f6Twlp0tpkf9/lmWupw4N1LLUyTve/hRkLu5VENU/A4H5fBhGtcuou7YIv1P/HCAplB6g80ENSNW4xWMLP0bscEbuXn4SKBxsBbInsmHPowU8n56aR8lffGH2B2RWYtmk=</encrypted>]]>
        &CommandWhenWhenVoucherBeforeAddNew;
        &CommandWhenWhenVoucherAfterInit;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7eJqdIhJ+HcJL0wagazhWXv9sIdopPcKP0rqV6mG50ixleEMpAQZYBel0+hEitzl+oi4Dhp80M38zqSo1Q5bhTU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>3lOmd6acovGEOc2cBZsdq54P8kSnVW+EzK6myiYV46EbBPVWcONeEd1Q3q5UUtaalE8Y0pbtjAwbranBZjYetkwr4+zFajKG7HUP/9nv7bH4kRzYDniwaM8CxJ47S7v5J0bsOzFz3ueoeC42eqFmRoyojoh6QOKfYHAP2efxoC1/dp6SHtFuiWqRGdukir1vpaA9QKxOTTFmloPyV6kZa9v3MHTWIyU5GBLm9hVMUpnXvUpSbQam+lGYmTvAlRkKo04IK+PLBudn+h08ByGt+q10aJBhYi5I/lrNGeGGBQaUANbjJjDUfUM4S+IU23hrOhHTU/sQ9pmv/vO8i5yAVOdMoCVjQ2hR8ql2ViDOVj3TNQ+tq51AnH07x+VxV3QMUa35/cUNmPiQyDbzhXNQf5rQHCQ2/J01n+JwiOOltbrT6SDOUTjbDraloQRuhuPmI0HlBmUaa0By8RmEicjjVsmDkeEDFM/jw8surisQNV/jrUGhpyFO9mMeBf92Fh4HNuL7dqBQ+FXxCYEk+hWEVNOW3Kwz+PF5Fud8ue1uTuyVDfq7u/II1zD5PFdsXDcgUxdgtyKpnJs1O6hQ/SAvQCpCAjBwOKeJH/AWpH7gUuY=</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>bWP9gLYDheuoumM2qDbC9R49n5RdBQm3Ta6a8nlMmmnrXY0sHOwcXqyvKZQ9kmEDHqlkwQ30Mmc5z3X2+TjxqUBGVBFjewp9uGs/yak0GUFxCypKxoqFijC0dKl3zKvb31m0u6/3cv8kjENkMbiKRXViYzUjxHu4sw9zn/lEereXeCVYOUmoamp8zzc66q15f+XrygvXoljTiMFUxmdEiQ==</encrypted>]]>&CommandExternalFromClause;<![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MQx8UPxIaIQTg7/lOjF5Y9fqc71ANnzDzlarFbJpwDVLDdcxSooLhLjiZKxEVoDKs</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>E3rfEHTO4/rDJg4Rr6F1vdJuPaG7ucl1jHdxWQnX8M5TK+WV//1DylqBF5STMXuUeAUwG+2OE2vSm80AtUddJZAqVMrqsAIGH+8E93t57ig7oQLgQkMam83FjplErqeO94eHL4GLXWl5j21dHEjWjkuRoCJb4ooc3Csz+L7O0exoFiU2UWfrgF9fJhtFjJsPpBtJy1QXSLVB1jXJ4ZvXSH87DdDKxWZ5+25hVf5kS7HYrJFvpHLLeZl4LV+nHFJ6l3McKYzJt/Hwj2Bclc73m2P1lb610wZJWByvtXlCj2A=</encrypted>]]>&CommandExternalFromClause;<![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MbBNB9R7jWqBIKvkFj517eYvHricvsjG48CLVXQG47Uw00La4kTTnpHKdddXOOgo+TMPExj49JTwxGXxcMq++aPOimuQMMhWJfQJn+EzKeMk=</encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FlszY+jFcfpMN6+Syqe+kAAiJ5Wg+c8YWyKSfHFRGQ5ki+lCuW6VLXdmvm/zQdZolj4f5otOTy1X8AyobwhsY7+Cf9uNohRfnVvPHcI5LpVSgikgv8ZZnPSZRvyx6MUGAI4ESx3uIGzorOy6WPffm1UiVECBUGrXfjA05md7FH7EC</encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>

    <button command="Clone">
      <title v="Toolbar.Copy" e="Toolbar.Copy"></title>
    </button>

    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
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
