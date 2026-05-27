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
  <!ENTITY TransferID "CBTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'CBMaster.xlsx', @description = N'Giấy báo có'
else select @filename = 'CBMaster2.xlsx', @description = N'Bank Credit Advice'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
  ]>

<grid table="m46$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="BC1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Giấy báo có" e="Bank Credit Advice"></title>
  <subTitle v="Cập nhật giấy báo có (Thêm, sửa, xóa, in, ...)" e="Credit Advice (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c46$000000" prime="m46$" inquiry="i46$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100"  allowFilter="true">
      <header v="Ngày hạch toán" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right"  allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a"  allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="250" external="true" aliasName="b"  allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
	<field name="Dien_giai" width="320" aliasName="a"  allowFilter="true">
      <header v="Diễn giải" e="Descriptions"></header>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0"  allowFilter="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="80"  allowFilter="true">
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
        <![CDATA[<encrypted>wXmaJyxSIu6MwMh5Npy7ehwlkTkSzkY8vVr4Pu0fYX7QwR9e0x0/BOdsgZ7YdYJ7yfbN8UGv7lWiuSDrRPBPWwJZJIQ0NuwMISTv4rNndmXMhbwLmjPsV0M6gdX5tTHKV5IutiqJS+jK/OFzkRCM217zP22Mq1dkKlo0/Vpo1QTEBwBRf58gpEOhu6+7+5gRry2KqalpNMVKeJ7z9Mv3lWjlicsqzTzeKi8ReWghWs8=</encrypted>]]>
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
      <![CDATA[<encrypted>YqsqwfkynBZfvEgTok6lkJ/elyyzUAlQKiKPtfgFnFlWceUqYxiSVEABAnjNX9p+tW9oDiSrnh40xS2cvkqGimfMZz+9Di6OBSYPgcqcpBrbNZHn/WtUQKzwjcRqQKCOT88i+YZFCrhf1WI2CYIB8Mkk+lE2a608eKAJHCETKKWtrCLLJFilJ8Lk3Afi66gLPWSQPpKQbDE+/dnccIJgO8lo5joJZoTsm1nIqEs/5MO/j544RjkRpfo8B2IKpcMF9LXK3PP3Itx7c+R7WVkCqOYgnrLX8dxt1cZtceKf2xzcwsUnRFBV45MPHHu6aY3oMXGf2qsPb4rcZyIjiEt25t0aVgCnxkacCitvIW7AoHPagjD1f8LCKyOCvIDt0XikMJHh7OcJ6+9xZarpYL61vaU7SvCtgV21SA9ppXXFZkpk5/3OOQU0+DwGIS/6qgQhLj52spEpQpPWYwL/EATDHKH3MelXEBKNduqyy4bttjGDjV8Oh77sXHisSPotCtVSXMb5YnEYbXZyyJYwRbLs0L+l8S9YAOJbr8M76HtV5Ys/vbvUcX2wv06RCBnqteZDEmy0cCgSN46zNfvMzFnBpGRXzrU1fMhxI3Un+IzqwcU=</encrypted>]]>
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
        <![CDATA[<encrypted>bWP9gLYDheuoumM2qDbC9R49n5RdBQm3Ta6a8nlMmmnrXY0sHOwcXqyvKZQ9kmEDHqlkwQ30Mmc5z3X2+TjxqUBGVBFjewp9uGs/yak0GUFxCypKxoqFijC0dKl3zKvb31m0u6/3cv8kjENkMbiKRXViYzUjxHu4sw9zn/lEereXeCVYOUmoamp8zzc66q15f+XrygvXoljTiMFUxmdEiQ==</encrypted>]]>&CommandExternalFromClause; <![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MQx8UPxIaIQTg7/lOjF5Y9fqc71ANnzDzlarFbJpwDVLDdcxSooLhLjiZKxEVoDKs</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>E3rfEHTO4/rDJg4Rr6F1vdJuPaG7ucl1jHdxWQnX8M4bvMD6XoDgrnJg8uqf2hh3mlIr2Yv4twhv/8jiWpbLHVpAjqB0kJ+LJYFZcyMAFf3kciLXSDDhDlbb4wCnW5xQXu0aumHoGcUpb6W1Cw0GHU8jk2YN1tvkkqCnLT64OuZFRJAOZQX5/LxDmQf32PKz33zW8oONmb2LUwQJwHfFJCiyxRpIqdl4GYmodazLprD0I5iQI3t6SD+bZ9rb3iflaVFRbx1iej0H4Ygn4tOKm3StQr5FJ4xWMcEw92YR+ic=</encrypted>]]>&CommandExternalFromClause; <![CDATA[<encrypted>ZDxZoGFjo3TV2pliaDMWkZefSvzBCfxcjq7g6QoNptW3SnQefz/yRWQS+p+qut3GwCG3M8L+3JyJu+rPNY+jbrUYLZa4c0bmz3XxhNXoj7jdpoR/6IF58QHAjYn9IKWHJAlpv/oErEuueWi9M+TQ80rrZ6EaZNdIRqt5UHSX9iE=</encrypted>]]>
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
