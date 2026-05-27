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
  <!ENTITY TransferID "ARTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ARMaster.xlsx', @description = N'Hóa đơn dịch vụ'
else select @filename = 'ARMaster2.xlsx', @description = N'Service Invoice'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m21$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HB2" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Hóa đơn dịch vụ" e="Service Invoice"></title>
  <subTitle v="Cập nhật hóa đơn dịch vụ (Thêm, sửa, xóa, in, ....)" e="Service Invoice (Add, Edit, Delete, Print, ...) "></subTitle>
  <partition table="c21$000000" prime="m21$" inquiry="i21$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="70" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày hạch toán" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="200" external="true" aliasName="b" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
	<field name="Dien_giai" width="200" aliasName="a" allowFilter="true">
      <header v="Diễn giải" e="Descriptons"></header>
    </field>
	<field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" clientDefault="0" allowFilter="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
	<field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" clientDefault="0" allowFilter="true">
      <header v="Tiền thuế" e="Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" clientDefault="0" allowFilter="true">
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
	  <field name="t_tien_nt2"/>
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
        <![CDATA[<encrypted>iEKxtUKjDK6snFgVRIwRl6fOY/ITdT3cXMXsVTl/tBCps/2CTH8g1v5DaDV7La13dNQypwqTQRY7iXniIYtoDrxd26LgX2TY9m9IokYvdib63av2pCnOaNX5AOnG+V2eMrY1sujOmt660b4zIoujyvLIEAABjobcYbjGYqbYTVlS+UPXlR7WnlkHTi2+UVEvng/FjE++lbglAmN+mMEYtVCbspltWSQlg/VgOX8X9Ig=</encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>SoPSVGlUDCO7Xgt3kcJUnKJ2orI+1zdQ7NGxZRVMCvncr7kHlJOrAujvEUfTQXMNjTrXmAHMnF9nRdZlDfNAGL2KnHPkC3OMmuRWClQ2FYukNBlSMRM4bPx6WUAp1a5gyKbWJDBRDCxDdmJrmIdBmd3AaULrVgz0X+dTDUnqLumUaUeUbZSJg2ID7xvY2b2MP0kg0TWK8pfiHo3Fu8HAVhfJO4aND5O10N/4Y8+XqE1aAGJSM65HnWY4znU5jDG4fpaNGEtd8NPzeRVWqinl4Ja4qOZn1u/fEvEHc4zBYUxJA1XFk/HIakFuvl/4OqsB3RAIDwOYCd//tJDPZR+dMejCi6hhRsQJdmsOqrMov5tqIInu9fbyFP1O9MrCnj7PewWm1Y+Y/+qaztgygFeGlVXeifxzvcu0+fTJpuTpXIq6XO+qI8CDUdUCwvXHpIKK8ijSa05vqx9upFpR1ZFNcaY/qnSCIe1HxiRGojIs/gZK9rk68Sr3XI6STtzacqTxpdMmbyLEDP98tLLheXXWqwx2PtqSqkXDk1K01yG12jM7YjOEb3SPY6wh+BtaOkd7WskCoD1rb4NyrX8yU+C7ynEFLJZiXS9zrg+w09CgiwM=</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

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

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

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
