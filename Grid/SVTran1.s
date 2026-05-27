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
  <!ENTITY TransferID "SVTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'SVMaster1.xlsx', @description = N'Hóa đơn bán hàng nhiều thuế suất'
else select @filename = 'SVMaster12.xlsx', @description = N'Sales Invoice'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m82$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HB9" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Hóa đơn bán hàng" e="Sales Invoice"></title>
  <subTitle v="Cập nhật hóa đơn bán hàng (Thêm, sửa, xóa, ...)" e="Invoice (Add, Edit, Delete, ....)"></subTitle>
  <partition table="c82$000000" prime="m82$" inquiry="i82$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="60" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="90" allowFilter="true">
      <header v="Ngày hạch toán" e="Date"></header>
    </field>
    <field name="so_ct" width="90" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="180" external="true" aliasName="b" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
	<field name="Dien_giai" width="200" aliasName="a" allowFilter="true">
      <header v="Diễn giải" e="Desriptions"></header>
    </field>
	<field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" clientDefault="0" allowFilter="true">
      <header v="Tiền hàng" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
	<field name="t_Ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="85" clientDefault="0" allowFilter="true">
      <header v="Chiết khấu" e="Discount"></header>
      <items style="Numeric"/>
    </field>
	<field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="90" clientDefault="0" allowFilter="true">
      <header v="Thuế" e="Discount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" clientDefault="0" allowFilter="true">
      <header v="Thanh toán" e="Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="50" allowFilter="true">
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
	  <field name="t_ck_nt"/>
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
        <![CDATA[<encrypted>wXmaJyxSIu6MwMh5Npy7ekNrFepnk7ncrUFLMcWK0JAEpRGgVDUd4eYbdC9BIoTqpt4YmgR3ZhkvPpRiVF6R229Y7oQN0rhMPJ5svZE9vU8d2t+Du20U3poLFbp5E/fT3WUVmoTxUqPc/tpGiGvUsdhyYy/9usR0CKuIvkSreMO+JO/u6cH3OgOVNjx7/xk2ebva5mEFg1d8JjKOflBpL1Xl9tZyvd5HV/3ocSQXjps=</encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>EPZ5xdXxB62mY+Z8X/Tjx7kjRozEOJTudDtglovgFeJb98dilKTvxr7yz8cC7svmf+bq6va8DCKRp6aruA4mFMHg1qQ5T1bbQYsp0nnHDDGl1Lv+TvucYhrZvRS8q9uqQ8NLtshwKulqqNYJdzSQzG7lBvzU2KJd3vK6/cDotN/ww3fX6Ox/vrJbVevHWEHy5PqBBaO/IkqLtIxZ+OynmICbX5TKiuKncw5p83VfGMwHIFgocsHRFRnmZ7SM1sz+oxIdI2rlEGnVVoBUnvh0LNNFojCT5LvSRPWw0Pu9PCzX9lXzPzhnkktSY+pLJ86+ebgbrIG69Im0OhObCak/d5G+7cYzb6HiJcSBOX2sIm3DYP73NOGMMWo9k0E6ruDknD2XGNAhag6SFs4EVEcjeO8CvM6mTwW6QwgGcAH5yKltRp/yR6NVi7oGo8glCEsPWrUGUAQW51LKeGOHvd+bWHoysG9UNm/CYR+9GqbgG1W1ueDtPipl3TfTg9XPH0XP6FjuEEb0bb9larHTgY9TfsLAIrVCZkfRDkOinOka8HcmX6CJKkUZxIcfuFhJ8NKrgTznT/ZHMryZ8vevWcFe+7LkRYHBsszmuSRXKVZlsOk=</encrypted>]]>
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
