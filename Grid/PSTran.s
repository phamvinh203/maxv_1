<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">
  <!ENTITY XMLUserGridMasterFields SYSTEM "..\Include\XML\UserGridMasterFields.txt">
  <!ENTITY XMLUserGridMasterViews SYSTEM "..\Include\XML\UserGridMasterViews.txt">
  <!ENTITY CommandExternalFromClause SYSTEM "..\Include\Command\ExternalFromClause.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "PSTran">
  <!ENTITY TransferID2 "ISTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'PSMaster.xlsx', @description = N'Phiếu xuất trả lại NCC'
else select @filename = 'PSMaster2.xlsx', @description = N'Return to Supplier'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m86$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HM3" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Phiếu xuất trả lại nhà cung cấp" e="Return to Supplier"></title>
  <subTitle v="Cập nhật phiếu xuất trả lại nhà cung cấp (Thêm, sửa, xóa, in, ...)" e="Return to Supplier (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c86$000000" prime="m86$" inquiry="i86$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90" allowFilter="true">
      <header v="Ngày hạch toán" e="GL Date"></header>
    </field>
    <field name="so_ct" width="90" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="250" external="true" aliasName="b" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
	<field name="Dien_giai" width="250" aliasName="a" allowFilter="true">
      <header v="Diễn giải" e="Descriptions"></header>
    </field>
	<field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowFilter="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
	<field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowFilter="true">
      <header v="Tiền thuế" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowFilter="true">
      <header v="Tổng thanh toán" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="60" allowFilter="true">
      <header v="Mã nt" e="Currency Code"></header>
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
	  <field name="t_tien_nt"/>
	  <field name="t_thue_nt"/>
      <field name="t_tt_nt"/>
      <field name="ma_nt"/>
      &XMLUserGridMasterViews;
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
	    &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        &CommandWhenVoucherBeforeAddNew;
		<![CDATA[<encrypted>iEKxtUKjDK6snFgVRIwRl0xu6/KtxLjLCBkpBNNIGxd3jbrluMVL/pfBZMEYIsaBfBL4zTO1S4Fs92VCtzhWEECtZUvHtF/d1ofC6Jine0ROdAmwfacwoOk0ihSliwudNToQ5bORy46xvfdIJByYaDLgsv15QflRXI5ZKSC2Fm+1fihaxprNnrq9lshrhs6fL4wmvt03MTrqHbO3bIhdbsOtYaKb1DsttE8uqm5fsBU=</encrypted>]]>
        &CommandWhenVoucherAfterInit;
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
      <![CDATA[<encrypted>sB4FeXtwnrZEnRomc10IbDI9dwc5LnABS+ybL26SlqMIWrWeidClvUyneO+f8pRVzGQufiR4zTmyqxtbGMKTLqaIbVqzc75evKen2g0n+luwrid1K6ItEfLKVUvoPURhOY4Bd1k/fB+GREt45dnZcfgNGMX1rDAUTna+KLE0ZGv/ylHIOArOuemkQApqh4LWkfM0EyRYw2MeEvCYNwHqIr8aUtpPwzs2/VnRe6+CgmUjDDryXYWSyQWQpXcyQ7bx1IQz+eu5uc8yYbcKNSfls7bBnAfoyvUEoo8t40Dqq53EyWTrLmkkFl8ZrH/ur96xOkHT/0WP7KWfox8tpqHWYx11R2MJPIEBevgJ2C5diQX4cIAqNnXUSRj21iqETr1GSXtcMjhImZiWTLqur3b8XoiC+DO1h9XFbZMCqcs0aKffCiLpipg0l6GW1a4zoPhZKmh/h1p+lKxLspUGhlGTCdzrrGckp7rz++2tythBvBE88+wglUSdS5wHeewtwqYvjQbkcPGSBgI1td3Lag6/P2cPpCf1FV59n4SBaelhCYvMGxljml0ylFX3OS6U6btSSKn7zgmRfLVhhH1ActOo3glA8LoYPOukj7ChQ0FLj5E1p4OtA4kyh7X6b83mELX+S7P6sJxBHUaUq40wiYB1/PIH7mlQ0CDFf2VK5HwWS6IP7xIYA7Tf1U2STFyxidJe</encrypted>]]>&TransferID2;<![CDATA[<encrypted>9wcEF7GUBP6W6lkCTpDR5JnueB8dBeBjw5LSR2MC0VuJOdjFRB4syAbCgnKbaprCYb3rX03xI97+AujdYJZA+Pop+Vf8UEd+0//RukqfRydILkjMqYECUXuXqPiGAShcz/nZIr4HYutavnANxVoLcz0MwzHEIXrxbCimq4Ms6wveX2bW9AAWUfQb8vujqH1Q6giu/ICMh2YpqHKGGfUUXHyguEFhtjsUOg+MePdAHy1LqH7yos+9atMqD/ftaPyT</encrypted>]]>

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
      <![CDATA[<encrypted>RoekE4VYVpEb9dqkhVA/Gy5d+QzgKXZarcue2/IZAh/td0ljMGmFYjsxlmpSugxS/IEbOg8F1Exubbummf7TNR+vwmKA+KDIwCBHdxnnFg5L6M86M2EtBJlOIJYJmkumjzT3ybTk2RV+K1vOHahDwtJyr/9TPXGIOVueOAT/VLZTwWee/cxODPf+zvIATCeUxhQIWsKKeQsBmfW9GP9smKOGrfizXEqWxLULIdny7qM=</encrypted>]]>
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
