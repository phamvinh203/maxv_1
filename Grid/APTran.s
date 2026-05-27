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
  <!ENTITY TransferID "APTran">
  <!ENTITY TransferID2 "ARTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'APMaster.xlsx', @description = N'Hóa đơn mua hàng dịch vụ'
else select @filename = 'APMaster2.xlsx', @description = N'Service Invoice'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m31$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HM2" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Hóa đơn mua dịch vụ" e="Services Purchase Invoice"></title>
  <subTitle v="Cập nhật hóa đơn mua hàng dịch vụ (Thêm, sửa, xóa, in, ...)" e="Services Purchase Invoice (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c31$000000" prime="m31$" inquiry="i31$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="ma_kh" width="80" aliasName="a" allowFilter="true">
      <header v="Mã NCC" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="220" external="true" aliasName="b" allowFilter="true">
      <header v="Tên nhà cung cấp" e="Customer Name"></header>
    </field>
	<field name="Dien_giai" width="220" aliasName="a" allowFilter="true">
      <header v="Diễn giải" e="Descriptions"></header>
    </field>
	<field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" clientDefault="0.00" allowFilter="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
	<field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" clientDefault="0.00" allowFilter="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00" allowFilter="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="50" aliasName="a" allowFilter="true">
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
		<![CDATA[<encrypted>iEKxtUKjDK6snFgVRIwRl6fOY/ITdT3cXMXsVTl/tBCps/2CTH8g1v5DaDV7La13dNQypwqTQRY7iXniIYtoDrxd26LgX2TY9m9IokYvdib63av2pCnOaNX5AOnG+V2eMrY1sujOmt660b4zIoujyvLIEAABjobcYbjGYqbYTVlS+UPXlR7WnlkHTi2+UVEvng/FjE++lbglAmN+mMEYtVCbspltWSQlg/VgOX8X9Ig=</encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>jwYajr6NFNfl/vqD+fMig5263rkn1OeK1VFxKC581MwkmbZwXeMCRm67jy2pYOp7xKyINqoJ7+cmu37xk+fc0ltmrpLPRVEs6kOiViU6z193XRrLAo8GSJWcgfmXVuZJ5Ni9sfjfZXjXzQvwY2AuyU3TEI4MUj9fxSZq95g0x+vGdEPWYcsHK6oa8oScLM7DFVNXo7mlzZWvBFkFVzFvSDl5erFjyebzFZVUBX5l58LNAW57r1eZo7jGgmFzVRKC6Wp0e4Ba5Bhp156esgoa4iwLCGJUxbYQWrPgAHzWHOQra9lsf2BGpypo1oOGmrF6Br/OVp7ApqNWOAnVY16NNdYm3KdG4NY/MvO3uYWuwPew3dSOGigY7Um+l6kyTNrUPtdxtqGgsKPVXsHXp1B1vF/NYurs8AE8SWXMQN6sHcqxWiTUdr0oXGuTzwGW6qYe7ttKiB5rEKeLHj5s1rf6/yJqnfNoO+vOaey/ItlZkqcJVfxvQlkXM/WIWlyCLgGh8BABt5Qifenc6afAW3B8fIDGdsPrYdiQ5pib/YR8dezZoSMx0CrgZFCybkyGXEuV+9xq2AZ3+sH5S7S61jOLhhBe/SiSynLf6pkxneRxiTg8mxdCbcuCbvVu+mm2tg0Hk3JFQQ55jTx3cSdlFLFwk4cu7Oj3th7co+NGBxyQyolH+WtP8zTQeO1FcneyZV3y</encrypted>]]>&TransferID2;<![CDATA[<encrypted>9wcEF7GUBP6W6lkCTpDR5JnueB8dBeBjw5LSR2MC0VuJOdjFRB4syAbCgnKbaprCYb3rX03xI97+AujdYJZA+Pop+Vf8UEd+0//RukqfRydILkjMqYECUXuXqPiGAShcz/nZIr4HYutavnANxVoLcz0MwzHEIXrxbCimq4Ms6wveX2bW9AAWUfQb8vujqH1Q6giu/ICMh2YpqHKGGfUUXHyguEFhtjsUOg+MePdAHy1LqH7yos+9atMqD/ftaPyT</encrypted>]]>

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
