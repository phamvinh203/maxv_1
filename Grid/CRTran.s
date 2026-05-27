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
  <!ENTITY TransferID "CRTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'CRMaster.xlsx', @description = N'Phiếu thu tiền mặt'
else select @filename = 'CRMaster2.xlsx', @description = N'Cash Receipt'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m41$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PT1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Phiếu thu tiền mặt" e="Cash Receipt"></title>
  <subTitle v="Cập nhật phiếu thu tiền mặt (Thêm, sửa, xóa, in, ...)" e="Cash Receipt (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c41$000000" prime="m41$" inquiry="i41$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
	<field name="Dien_giai" width="300" aliasName="a"  allowFilter="true">
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
        <![CDATA[<encrypted>iEKxtUKjDK6snFgVRIwRl6YNOV9wIo2o+G43uPEuUtYR1ETCU4Mkpx46W3n+ZDbOLmZumtL/YnVSiR1xJYrwUbyPwElLnpbxJo5qAAQsjEmCPooDUVAfS6f56fl069JfS0WMjOjQRdq8sA8MzpzqCiDxKqY67ckgXEWg2JTdOmCTrbZTp/iVW8QHX29P4mhdD783fq3LuCIq6dazizo2EfEJpv5e6zUbB1nwueJRvOk=</encrypted>]]>
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>YMke2VQLt41PqjymN6lDC2AkykKN/l5b9ACldxeP6j2oAklv29zqy9v2aEphqdWDtIW1rSMEgRpiepCVpJcz241FSN+jZmGhmKJoTgv0wUA=</encrypted>]]>
      </text>
    </command>
  </commands>
  
  <script>
    <text>
      <![CDATA[<encrypted>MlNG2sycDRRiO5ac7dz45FS9FKj+3ObP9gp7VfxjIcuqnx4HmFZ2ZZucfRsrbQOa/6g9lh4u8e4DxZSsmtM80ddAkcsfaNBueISVs/r/Wkn7NR2V8hIBNIa90Fs2pUx56Mb23pqZaNT2UhwrCSx9X9MO5HXq3uUN77XqOMUoQ+ZBSOEewnuEQchNF2JiFuMuh6faYKsD6H0CxpIA8sIEp91lbokZKiIm0iWWYmqDmhhH7AViLx5ygy8rJyT24NwkjVuaubS+ps9NQCTJqjI751iO0u0TLVqQtQKnC8lHrlvtFIknZPR6APj1qL1dJBmUE8lBwMY9cfVO1spD+ES69s2v61+1oyEcVypDHQv3PgejfV+OUGO66Yp53FZWpCMEeB5/vo+jeqQQBRM2Ny4F6Ki3buOTPI4IyOB8xKwXcK9dDRNzJ3lZ7smXkzDW7pV3+18H9UMuGioMztKTDXZ35yOptBnxQvf9I7NjtAjHiLhGQ2FkjAjSSq+qeXhL9kBkKhpwNmNepZkqU7RswEwOSxr11i5vVKkA+Ejm8WSFPL8CHr/MzWzsL5rk6lM9V+V2oBd/ENULnk2JGHVa+8ryfNrknVMT+l5b1IOR2/WYub0dud2JYFFDAB09GYYEY5X2biF3co6rJcy36hl8DOyszP8WPmnJSmY/npJtHW2iKhhre2mj3cOllDPiiutfd4j9</encrypted>]]>&TransferID;<![CDATA[<encrypted>9wcEF7GUBP6W6lkCTpDR5HSHMa0b3edvYM67W835di0RWomEnOP9YsIUJ6ysFZUcvlqQBdDO47DUGPDTCJSLDjB8fhuc4ZNgxzKyktJOGKkeHE8q76Q7oOlsN110vEkh3iwIB3Qh8WSDiXSOOgi/2jq4doJTwNJ7LqaA8e1Z017TmHm23WHJaGvFar/mALwP9vdTbYbcT6SuCT/+KeEu12W7cVJZeeIog1ZVslmUDlUqdnpK2CdSd2qPKtCelAtg</encrypted>]]>
     
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
        <![CDATA[<encrypted>E3rfEHTO4/rDJg4Rr6F1vdJuPaG7ucl1jHdxWQnX8M4bvMD6XoDgrnJg8uqf2hh3mlIr2Yv4twhv/8jiWpbLHVpAjqB0kJ+LJYFZcyMAFf3kciLXSDDhDlbb4wCnW5xQXu0aumHoGcUpb6W1Cw0GHU8jk2YN1tvkkqCnLT64OuZFRJAOZQX5/LxDmQf32PKz33zW8oONmb2LUwQJwHfFJCiyxRpIqdl4GYmodazLprD0I5iQI3t6SD+bZ9rb3iflaVFRbx1iej0H4Ygn4tOKm3StQr5FJ4xWMcEw92YR+ic=</encrypted>]]>&CommandExternalFromClause;<![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MbBNB9R7jWqBIKvkFj517eYvHricvsjG48CLVXQG47Uw00La4kTTnpHKdddXOOgo+TMPExj49JTwxGXxcMq++aPOimuQMMhWJfQJn+EzKeMk=</encrypted>]]>
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
