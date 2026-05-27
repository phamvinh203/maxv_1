<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">
  <!ENTITY XMLUserGridMasterFields SYSTEM "..\Include\XML\UserGridMasterFields.txt">
  <!ENTITY XMLUserGridMasterViews SYSTEM "..\Include\XML\UserGridMasterViews.txt">
  <!ENTITY CommandExternalFromClause SYSTEM "..\Include\Command\ExternalFromClause.txt">
  
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "PMTran">
  <!ENTITY TransferID2 "CPTran">

  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'PMMaster.xlsx', @description = N'Hóa đơn mua hàng nhập khẩu'
else select @filename = 'PMMaster.xlsx', @description = N'Import Purchase Invoice'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m72$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HMA" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Hóa đơn mua hàng nhập khẩu" e="Import Purchase Invoice"></title>
  <subTitle v="Cập nhật hóa đơn mua hàng nhập khẩu (Thêm, sửa, xóa, in, ...)" e="Import Purchase Invoice (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c72$000000" prime="m72$" inquiry="i72$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90"  allowFilter="true">
      <header v="Ngày hạch toán" e="GL Date"></header>
    </field>
    <field name="so_ct" width="100" align="right"  allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a"  allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="280" external="true" aliasName="b"  allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="dien_giai" width="300" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" clientDefault="0"  allowFilter="true">
      <header v="Tổng thanh toán" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="60"  allowFilter="true">
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
      <field name="dien_giai"/>
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
		<![CDATA[<encrypted>iEKxtUKjDK6snFgVRIwRlwFm6eUOwlRgLxmcJJxGp757VVx4igxXhTxqinC8l1ESQ6FOjZqtKP/f0S2bHkaIHFPpFdNvNA51UxLx9cAKL1rH040AcLi6GsbNYu5z6hUaxGnbB067M5R8nhwyOW7MHUtJpgnyzD6/jCG66DgQf0u7LkEU0RtFuXCEytP+/u0EBH9FreS/FgmNUJmsQTkZFJl5fjJicW+sdlMBu4V3/RQ=</encrypted>]]>
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
      <![CDATA[<encrypted>jwYajr6NFNfl/vqD+fMigzC5NwDqAH/O+51krsFSL4jQCQOEPkLiHRaiZBnBmhwUCiQH0+701qmFS5x5B6uMisyJ+is4co1F1bgOp229MzebA5LuCjf4MXlM93NKzP2E8ix4nFBR4cHUqhLQVAuqHjZCbMShDd6zfPTXaal8Z+7VOsPAk3ySiCdb3fenzru63VStC4bcOKqOXTe5c81f/5pJtusJ6+AWo0SRjKOYCVgAGZ9F9rkMOV9giAFbTksZyx5b4MxDhypB5US7XAm1iYYkM1p4LdWEwPT+Hhwsiw8IjOWOazF8ID/Q5VchIHO6ag3Tk0W45N6jwj0pkzxYiuhBe48/0Y7ZkSyyrFhw/81ltBgMZH/PUGlT4pokNGGtqDsFqVuLCX4haobasXx2KaBxCMY4dOr2/rbj+4Duzu/CGbIjfx/8JxwI1m3919N8C0ThfXnZSZO0fMeFDeDlGrsgE+11ruPHVLnX2e0GoQeCzS01dOtM9T/IPMmZjJxSp2rICUve4IDtR6g7gtGbUeDz6UmEsaBtAy7+v8QVWBlaS8KUocVVxA/HfsE+0ifQ3UbswSq+BtFTWq1HE+CFe+goyHarBKZ6H7xzes3fNgInazlCIOHs4ICQrBya4GIGPIRv9g5SS1lzf2YkxvUqOLG3ZjIVWet0X6NhCAOxx8XUywuoVFmzofS+TmkZ+Q3EDYzG0pKmt+DjI2W5sUFpxw==</encrypted>]]>&TransferID2;<![CDATA[<encrypted>otxseMm7OU+2KH0Fmt7FR7qfUfozom9DnGfBGqTS5plmeOrbt1bEtp363lsmp6kjlgN7tTf94toSXWbasjPmf6UUL1DV15fZ4V6ECGebwk16wnGPaBqLsgy9ebPXUD6rajM9T5c85xaKs/6/5GQEihO0fvScUcQyT422BKwPxINtBb5mMPciWFaEyJTYbXN4I9amzZcS97jN/0APN/Rinf1e1KSu5k+dVJ6mk8DaVPWaUpBSnnovwo5pDb9AtcqOl5xxVl/20dN1OsSYi6VxLw==</encrypted>]]>
  

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

