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
  <!ENTITY TransferID "SOTran">
 
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'SOMaster.xlsx', @description = N'Đơn hàng bán'
else select @filename = 'SOMaster.xlsx', @description = N'Sales Order'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="SO1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Đơn hàng bán/Hợp đồng" e="Sales Order/Contract"></title>
  <subTitle v="Cập nhật đơn hàng bán/Hợp đồng (Thêm, sửa, xóa, ...)" e="Sales Order/Contract (Add, Edit, Delete, ...)"></subTitle>
  <partition table="c64$000000" prime="m64$" inquiry="i64$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="true">
      <header v="Ngày đơn hàng/HĐ" e="Date"></header>
    </field>
    <field name="so_ct" width="80" align="right" allowFilter="true">
      <header v="Số đơn hàng/HĐ" e="Number"></header>
    </field>
    <field name="ma_kh" width="80" aliasName="a" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="200" external="true" aliasName="b" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
	<field name="Dien_giai" width="180" aliasName="a">
      <header v="Diễn giải" e="Descriptions"></header>
    </field>
    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" clientDefault="0">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
	<field name="t_CK_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" clientDefault="0">
      <header v="Chiết khấu" e="Discount"></header>
      <items style="Numeric"/>
    </field>
	<field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" clientDefault="0">
      <header v="Tiền thuế" e="Tax amonut"></header>
      <items style="Numeric"/>
    </field>
	<field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" clientDefault="0">
      <header v=" Tổng TT" e=" Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="100" allowFilter="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
    <field name="s3" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
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
      <field name="s3"/>
      &XMLUserGridMasterViews;
    </view>
  </views>

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
      <title v="Lấy dữ liệu Excel" e="Import data from Excel"></title>
    </button>
    <button command="Download">
      <title v="Tải mẫu Excel" e="Download Template Excel"/>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

  <commands>
    <command event="Loading">
      <text>
	    &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        &CommandWhenVoucherBeforeAddNew;
        <![CDATA[<encrypted>HuaFcnzJmTT/pVoXjhSRPWANRmae0EWuJrLGXLnm77xj7bXVDvBftWnmlW7szlnOsSq8B9SLOVRXQO5dlWz1Hq5jnvpBw8ZDTX+iRqjzF0MtqRObpFK+kLP71HjAcyVuvkl2GOrmhYaIMoyqVZJcZytJkvqBb9q5TcQas8YGEwQne2nRfrfUXaY60C0HEeQ4Vq2qT0XDCDEO4yEoB6LPAcxRV2x0+u9UgWXgj3KFt2soa8aOGOU1NCu2PTK4B16Ggstxhaj0T2F9kTwLC6wMiAW8fGrWUWh+q96cUC+WXGI=</encrypted>]]>
        &CommandWhenVoucherAfterInit;
      </text>
    </command>

  </commands>
  
  <script>
    <text>
      <![CDATA[<encrypted>EXdh3vVHus4ufR9nm/ers9MbH5elYGRNgRXB5Z9SMz2eFvLc/gYZTFJY2bwaX8AlHpzvRJS0MZlOa8Jc6jKMcRhYSipNkI3YeczPOrGWMP8egascnrnCTaMv5HkYu1V/Wuo+ImTJgNoHJQbO/VtXBu3LDZBHRPvjbn4u7TsxaI8JZG+50Srh9UJsZhIvRvvlfI8cbh8tAhVMbLFKWtME9DrWzeNtBz+sb+0M7NUdn6OV9XFceHPYIHXtHa5cd34BWdFUQH6zDReJxrQFHlotjfowJ86ocfaMwmP6wLnI+MGhHt9eZLaHM+UZ0iIF7s/ihM1O4dWRa1Zh7NQevE6AcEE/XqGfzXYNYSl2Hwz0ZSohMNrQfAEnIjbJ2xoqfb9yHRs/IjrzuByZ3JQip7w/3ymIRwnWt0QfOUEhiQFBpjfoUXpLgN6QUoaVR8TmgAwIKhPkn0aMD3ixf0NHV8254C7ayFPpuQGKoxH8/fu2AzTtaeRp2P4BdJ/WPoUewuxld83L9PabeA3Ndx2HeWfnA1uHas9Qa+39W710oW008GBcPsQAOBL6ifilZB8DwwrqWh7PKIoxGs4j54b7D7SQRcJ5S5vhEtdGAyXKnUOlBIQzCDLw0m9GWgtys6IqIIuMeqqnGzhjX7K4SfQUAkxmYRYefExHg4alWpjE0riyUjDGjzfFekG3OCvtc+e1BQD+ZzFS9FtlSF2e3VjhbA1LekNQcis8XMjf8EYdpNDy+SPehgk8wwkcMZOebv/bIeZNqWdzWfxHhY5CrLEaWaYmraL9j+xPYK3uVtan4kd/7Y30Qfe4H0K56npuNFl1bFtiN5WZsvG7Eyhuoi1v6clYiBS92Sz/K4Z2x+G2AnMyRv8=</encrypted>]]>&TransferID;<![CDATA[<encrypted>35XmVAlHQDvNlywknBYyHFh9LjNNwktHkp4xqcE5dSNQxGWwW1WQGRFJnRqKVqSqXdSChR4zcbC0e5prvuiw1tcUMlhZtqx2DkbbpGSxGl1PN42QIYgmanU2gA7J+O1I4/t2xPnSUQnW3Uiw9V+Lf1fcExb6D8PlKDztyikX7oajRnYiVfqJU/1Lg0WlI84NUpSlGrX4ycvw0Rawqhc7qURwVnyf5KvD/zj2KN9Cm2pT1hAoMB3Z9dtEiQ5bP4YV</encrypted>]]>
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
        <![CDATA[<encrypted>E3rfEHTO4/rDJg4Rr6F1vdJuPaG7ucl1jHdxWQnX8M4bvMD6XoDgrnJg8uqf2hh3mlIr2Yv4twhv/8jiWpbLHVpAjqB0kJ+LJYFZcyMAFf3kciLXSDDhDlbb4wCnW5xQXu0aumHoGcUpb6W1Cw0GHU8jk2YN1tvkkqCnLT64OuZFRJAOZQX5/LxDmQf32PKz33zW8oONmb2LUwQJwHfFJCiyxRpIqdl4GYmodazLprD0I5iQI3t6SD+bZ9rb3iflaVFRbx1iej0H4Ygn4tOKm3StQr5FJ4xWMcEw92YR+ic=</encrypted>]]>&CommandExternalFromClause;<![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MbBNB9R7jWqBIKvkFj517eYvHricvsjG48CLVXQG47Uw00La4kTTnpHKdddXOOgo+TMPExj49JTwxGXxcMq++aPOimuQMMhWJfQJn+EzKeMk=</encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="Upload">
      <text>
        <![CDATA[<encrypted>RtuQ8rhrQBGsfljls+I//UQ2sE4UjvG2xAyYTpbawr/OPfNePdrVZcMPGBkqsdR7b47goJBollYZIp+BDq5WHVueuO2IzNog7DZdx47/irzHdgKSyWAWdcypuiqXfOruqI9wqxdFzrDW7pIlxE98aDwYjRaG8QIYkGMLf7rk7dsOfOOyISjZTNdf8+i1INy1Qfb5RyreQ/2tACzBWzkp5VhK1zkIEcQYnW5BTzhQAJhcxyu30fdW/XfgvIKe2qF1h62mbHoZMLkZedP73l03nDwH+R4bWcOVNfohVpOdxoM=</encrypted>]]>
      </text>
    </action>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

  
  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38Fljud1Xr8sCbuvguF1tuKC1LQYBd7JuGU1lrrdlrvh7QlYxT7cSJlgCzqHAuycLoNiK70grRBov0rmdqfaNbPk7dRjqsnCG/soSgnejuGsYCBlN6vKErchxQ6/yNmQezpY1BKBSSqjC2TurduLPPi0HFHiBg2nudq7goA6WWsmqWZ</encrypted>]]>
    </text>
  </css>
</grid>
