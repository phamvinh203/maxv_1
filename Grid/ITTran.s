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
  <!ENTITY TransferID "ITTran">
  <!ENTITY TransferID2 "ISTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ITMaster.xlsx', @description = N'Phiếu xuất điều chuyển'
else select @filename = 'ITMaster2.xlsx', @description = N'Stock Transfer'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m85$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PX2" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Phiếu xuất điều chuyển" e="Stock Transfer"></title>
  <subTitle v="Cập nhật phiếu xuất điều chuyển (Thêm, sửa, xóa, in, ...)" e="Stock Transfer (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c85$000000" prime="m85$" inquiry="i85$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true" >
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100"  allowFilter="true">
      <header v="Ngày hạch toán" e="GL Date"></header>
    </field>
    <field name="so_ct" width="100" align="right"  allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kho" width="100" allowFilter="true">
      <header v="Kho xuất" e="Source Site"></header>
    </field>
    <field name="ma_khon" width="100"  allowFilter="true">
      <header v="Kho nhập" e="Destination Site"></header>
    </field>
    <field name="dien_giai" width="300"  allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowFilter="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="50"  allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    &XMLUserGridMasterFields;
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kho"/>
      <field name="ma_khon"/>
      <field name="dien_giai"/>
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
        <![CDATA[<encrypted>wXmaJyxSIu6MwMh5Npy7erdFhRkl2ZLpOqkse/YyunqJ0kpd93G7gIy1Kd2Aj2IJfywbotsYxfsTVlh2FDFDGfvK1SGBbz6MvtWjasgLoaTv6d4ACVTmQ8j3IzQeHZFvhfxx9CS4xYE7EuAwICLEBPrnW5IjItFNi5f0uKNEnoehEwhXHbIr/L32JdQon7j+EfKsLeZsqyEDM1IpTr3XejHfjMStAjd0n6Wel4u5YGI=</encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
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
      <![CDATA[<encrypted>KqkCztDzUBDDVO1WlKO0HrRNdNNjf169ZAQiYlV5FeCYMrNh8iORiX8tyPAfk7pLlaZOY/wVkP3FZ6SBE+8wZB0Tstu/76DjETXcg7vpMo7EhpWd4FaXGvP/ltIMgDWA6pJr4OHD9/ob5AwJiZFlTFVnfSnLnO7qP2Ouny5+eNdiEebhhkqePc0X8HKxR165lvT9QT6Z0SXsWy/C7llHjY8bKhzMwmU76pZEfDrWdgST4ZomTh4VEvvIVnz9M+eQWKuS29UXTSpwBmBpekz1Vx3xDl5i7bpZTswb4sxzQbp70hwekDPID7iGppsMHllP4FLgyb5OZ4CmcTYcihQsjSqobGastDhXHcT1jSdF8Snd0j6Z9GJjztzZ9Bk/vTbYdGGjsbUqZ/3Zo4VALtCQNaaU940Bv37wanilgkVNEkpSs2ffB21ZbzClyuDLVC+eGbA3294n2Twz+KgI3SIpIST20tNogAg50MlFTFwM/PgKM8JCpgMIi8eWZeswtvglMBCczrEMLdbVO5tfbLN6hqnd4KwC/D0PcVkREyUleSNOeAEMiU0s4DTYt7Sx9d5evLtAi3/ofI89sIMb3NmMcXdATQNQgKcKkl70r7NBAqZB3X16s6WpKeOoDGg+m8sglWaaQu6YHyABxSuL3r+DJzZ9wsdbmFaPkGksN8Q7g9390ZjTJaCR5x0m/+sIz1p+</encrypted>]]>&TransferID2;<![CDATA[<encrypted>35XmVAlHQDvNlywknBYyHFh9LjNNwktHkp4xqcE5dSNQxGWwW1WQGRFJnRqKVqSqL/YyrGjqq6q62oUL8DtVGdFCJ3XsYBDLRnpvT9Jx7IPm/yeuXrDUEAjwg0WYJs4EahIZqM08hI09jpmq58I0wIR+lmUoFq4xw4gjhqOspbFrEgnmcUhj8QeeNyoGPAf4X5WP/FLf+Yt+/Y9eL1fRSeZjIPMAiL26cE800JDB6is4rJ06m60OzgiigIwq624+</encrypted>]]>
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
        <![CDATA[<encrypted>lmiLE6AU8L8AiWxaVTggsYbXB4/IMLIOWtuJ5NEhfUw5CHM2xfnEEf70lirYw9jxl+W0aoQkfuIQQxzRFYkxt71r2rCNWTCkzL+eQ3b0rFNIwWZGLfFZAHRgYBLvkBb3m9IetavhqBvF2kR4vk9wMEjW93gNHX24bc0Gy+WARTT9rBRDpI1U7rR4JIUF4thr</encrypted>]]>&CommandExternalFromClause;<![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MQx8UPxIaIQTg7/lOjF5Y9fqc71ANnzDzlarFbJpwDVLDdcxSooLhLjiZKxEVoDKs</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>2+8+NnUZ2R2U38xMbzNPh8oo87BtoqTIP23a8GmJ9iKuy48Hmm+NXRwS1xoby+GXEXe4gza4AbkgP2j8UDMl2LzQywdl1QT2V3/DZOa3c1omptroe40v51Cc4EzstH4TMadMysAvlvui+neX9RQL7DxkDhBqe4JV0kRadoOCzCVRYD0Rs9KwVUwcz+BCc+sdgzeNsmrJ7hP9cFuIAfnQX+MmqIAwOwqf1YJqqflHXSQHPuV7ep7bPqfvi33wuEZX0kiuPOtoMzszhfxNDQuVqA==</encrypted>]]>&CommandExternalFromClause;<![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MbBNB9R7jWqBIKvkFj517eYvHricvsjG48CLVXQG47Uw00La4kTTnpHKdddXOOgo+TMPExj49JTwxGXxcMq++aPOimuQMMhWJfQJn+EzKeMk=</encrypted>]]>
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
