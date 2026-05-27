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
  <!ENTITY TransferID "PGTran">
  <!ENTITY TransferID2 "IRTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'PGMaster.xlsx', @description = N'Hóa đơn nhập mua xuất thẳng'
else select @filename = 'PGMaster2.xlsx', @description = N'Purchase Receipt - Direct Issue Invoice'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">

]>

<grid table="m78$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HMB" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Hóa đơn nhập mua - xuất thẳng" e="Purchase Receipt - Direct Issue Invoice"></title>
  <subTitle v="Cập nhật hóa đơn nhập mua - xuất thẳng (Thêm, sửa, xóa, in, ...)" e="Purchase Receipt - Direct Issue Invoice (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c78$000000" prime="m78$" inquiry="i78$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80"  allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="80" align="right"  allowFilter="true">
      <header v="Số" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a"  allowFilter="true">
      <header v="Mã khách" e="Supplier ID"></header>
    </field>
    <field name="ten_kh%l" width="220" external="true" aliasName="b"  allowFilter="true">
      <header v="Tên khách" e="Supplier Name"></header>
    </field>
	<field name="Dien_giai" width="220" aliasName="a" allowFilter="true">
      <header v="Diễn giải" e="Descriptions"></header>
    </field>
	<field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00" allowFilter="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
	<field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" clientDefault="0.00" allowFilter="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00" allowFilter="true">
      <header v="Tiền TT" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="70" aliasName="a"  allowFilter="true">
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
        &CommandWhenVoucherBeforeAddNew;
		<![CDATA[<encrypted>iEKxtUKjDK6snFgVRIwRlwFm6eUOwlRgLxmcJJxGp757VVx4igxXhTxqinC8l1ESQ6FOjZqtKP/f0S2bHkaIHFPpFdNvNA51UxLx9cAKL1rH040AcLi6GsbNYu5z6hUaxGnbB067M5R8nhwyOW7MHS4HB4LU3gsCOAC/dZsSVzHZfh7C/KrYXqtoj8zrmce3ugqWxPf8/JSbRrATqD9ao0xbiFtm4SY4N++tAdztcUs=</encrypted>]]>
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
      <![CDATA[<encrypted>MlNG2sycDRRiO5ac7dz45AxRxl6OgDyEb+Vdjl/rVsGJvXgvSu8Q7bSjaklLuNNCapFUkis/kMPa46KsiaX+v5wxaX7TaKs0Ay6OzVBn80GV70+buA3nTtmiZpDfoXugmWhPRtDVHmuMq4KRFIRprYnXCOrqqoRnJLKuY5qYv6g1Y20kIK2avfFXPCV7bAlxhG0HFr3ztUDS7MtUfbE2E4qCEc5QgAu8ziFnOt148DU7BSWzLPIK0Uote8gU6fXcQOQ1mOj9aczUMdypYxJy7TN6msQbWSufEUKLSfMhY27jl1UTTThOoP10VePh+XzUePlNwyXGf4xNnB40sS/eEN+c1lU8lk5wjzgGFxYK0UbAht7I2Fj6jtFzH+cqEuYeGTsj071tYT0S7tDC0RMF8pPq+RUjnFAV/Ni54aZuO9N0asJviRh4WtwYPJBLncQIkgeqmm8QfnxH/018DCUU3EQ7+KxNp2k1RItWW9cx2X1ckfRLAGSopQfnufmzehVUOegfWMmUjgBilSU6j8j0vUDt7SY8ufUT/LKSJ86OCm6mTq90SCvLst1xZfcH0XQsMCAS7sDB3W0jrG/wZfDOv7Ah8xIZgt+vh7i4XxNCJYs19a1gU3DT7Z7chERWYegRu7waSQjadPQPwoGsLHZSUWygTv0mW/yvYMHmwnDo5X+YZvYJtrz67PYybU7BYdW2</encrypted>]]>&TransferID2;<![CDATA[<encrypted>9wcEF7GUBP6W6lkCTpDR5JnueB8dBeBjw5LSR2MC0VuJOdjFRB4syAbCgnKbaprCYb3rX03xI97+AujdYJZA+Pop+Vf8UEd+0//RukqfRydILkjMqYECUXuXqPiGAShcz/nZIr4HYutavnANxVoLcz0MwzHEIXrxbCimq4Ms6wveX2bW9AAWUfQb8vujqH1Q6giu/ICMh2YpqHKGGfUUXHyguEFhtjsUOg+MePdAHy1LqH7yos+9atMqD/ftaPyT</encrypted>]]>

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
        <![CDATA[<encrypted>bWP9gLYDheuoumM2qDbC9R49n5RdBQm3Ta6a8nlMmmnrXY0sHOwcXqyvKZQ9kmEDHqlkwQ30Mmc5z3X2+TjxqUBGVBFjewp9uGs/yak0GUFxCypKxoqFijC0dKl3zKvb31m0u6/3cv8kjENkMbiKRXViYzUjxHu4sw9zn/lEereXeCVYOUmoamp8zzc66q15f+XrygvXoljTiMFUxmdEiQ==</encrypted>]]>&CommandExternalFromClause; <![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MQx8UPxIaIQTg7/lOjF5Y9fqc71ANnzDzlarFbJpwDVLDdcxSooLhLjiZKxEVoDKs</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>E3rfEHTO4/rDJg4Rr6F1vdJuPaG7ucl1jHdxWQnX8M5TK+WV//1DylqBF5STMXuUeAUwG+2OE2vSm80AtUddJZAqVMrqsAIGH+8E93t57ig7oQLgQkMam83FjplErqeO94eHL4GLXWl5j21dHEjWjkuRoCJb4ooc3Csz+L7O0exoFiU2UWfrgF9fJhtFjJsPpBtJy1QXSLVB1jXJ4ZvXSH87DdDKxWZ5+25hVf5kS7HYrJFvpHLLeZl4LV+nHFJ6l3McKYzJt/Hwj2Bclc73m2P1lb610wZJWByvtXlCj2A=</encrypted>]]>&CommandExternalFromClause; <![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MbBNB9R7jWqBIKvkFj517eYvHricvsjG48CLVXQG47Uw00La4kTTnpHKdddXOOgo+TMPExj49JTwxGXxcMq++aPOimuQMMhWJfQJn+EzKeMk=</encrypted>]]>
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
