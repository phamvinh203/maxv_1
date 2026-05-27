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
  <!ENTITY TransferID "SRTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'SRMaster.xlsx', @description = N'Phiếu nhập hàng bán trả lại'
else select @filename = 'SRMaster2.xlsx', @description = N'Sales Return'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m76$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HB3" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Phiếu nhập hàng bán bị trả lại" e="Sales Return"></title>
  <subTitle v="Cập nhật phiếu nhập hàng bán trả lại (Thêm, sửa, xóa, in, ...)" e="Sales Return (Add, Edit, Delete, Print, ....)"></subTitle>
  <partition table="c76$000000" prime="m76$" inquiry="i76$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90" allowFilter="true">
      <header v="Ngày chứng từ" e="Date"></header>
    </field>
    <field name="so_ct" width="90" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
	<field name="Dien_giai" width="250" aliasName="a" allowFilter="true">
      <header v="Diễn giải" e="Descriptions"></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" allowFilter="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" allowFilter="true">
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
		<![CDATA[<encrypted>iEKxtUKjDK6snFgVRIwRl8cRMvHE4EiMxSacW+VW0DID5G1js0+kS4j30X5Mc5VhJdb2AzFyFWRLIKZuMxzZ9lGHSOG3pE26uXIfCbw9/3Ew+ZYPL2om+BjQ69dpajl1XAMiW5oscm8vGSKdP6yTsVir+vpbRPod2HkZCwPqO7uIubzTXag0gO5wc2Z/kUezj0RJx7KuPqVQlhD6dVmiU7GkT5yOFG0z11mqVav4sY0=</encrypted>]]>
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
      <![CDATA[<encrypted>sB4FeXtwnrZEnRomc10IbJ3i8fJaFNLYkdIV1NzK0jUiSX7jzRhllW4rgELDdswHmr9Lf/HPCr/cKYSvbMmpoyGPRLssOuXr8o7TaTJYiFYatrXWc43pG2o+V+rGFsM+vxnWqAjvmDm0gQpMq+WTMv0eew5RMHS6NQs4zf55GGCJbSy06ISlRVWziDj5vlFNqKVdQJSF09fXmSxbif0gu6K4JMpTleVbGzhck3phfkRYgrDGTYOpPp0kuWrHgc5a1L4PJpt00PiRbYzteMhHM2t2d0vu3eli6O7TKof4zPbPsWoe352Ng6LF/Ey2VslJ9lq/OiGC+S0NqFaGqMkSNlIp1iCC+ra8E+RhJVDSrfOgVq4DdP+tg8/0xSSF3HvsrIWCrUZEVDuJfnMuoYmI2o8tZYQGbOE6SPiv+sFlhuFe2p7Tewp1lr6JQdIUv9FP+0W9LqRd15Pb4QKoSluS9cBztXCzwAG0JHwvDbcH0KbcR6lxbzmWHCQezEbzLarWXOkVTyv7ExxAzJQcl2D0EVH/vH68vsQURhy02QFu9xFMy9xc2J/5rhyqeZnzGnJO2TO7MiecrNrgXZQapTenNmedk5QZrJlAuBwoH38dFrzcgkTlZytuag+ogYshe3lRQvUAJYYgnRDQGdpGaEE5ZoN+uxKQ/L3SwmJJ2p72MN/Q33DNb3q3bKSyXRLFmqfi</encrypted>]]>&TransferID;<![CDATA[<encrypted>9wcEF7GUBP6W6lkCTpDR5JnueB8dBeBjw5LSR2MC0VuJOdjFRB4syAbCgnKbaprCYb3rX03xI97+AujdYJZA+Pop+Vf8UEd+0//RukqfRydILkjMqYECUXuXqPiGAShcz/nZIr4HYutavnANxVoLcz0MwzHEIXrxbCimq4Ms6wveX2bW9AAWUfQb8vujqH1Q6giu/ICMh2YpqHKGGfUUXHyguEFhtjsUOg+MePdAHy1LqH7yos+9atMqD/ftaPyT</encrypted>]]>

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
