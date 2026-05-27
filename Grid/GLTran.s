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
  <!ENTITY TransferID "GLTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'GLMaster.xlsx', @description = N'Phiếu kế toán tổng hợp'
else select @filename = 'GLMaster2.xlsx', @description = N'General Voucher'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m11$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PK1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Phiếu kế toán tổng hợp" e="General Voucher"></title>
  <subTitle v="Cập nhật phiếu kế toán tổng hợp (Thêm, sửa, xóa, in, ....)" e="General Voucher (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c11$000000" prime="m11$" inquiry="i11$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="100" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày hạch toán" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="dien_giai" width="300" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="t_ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00" allowFilter="true">
      <header v="Số tiền" e="Total Amount"></header>
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
      <field name="dien_giai"/>
      <field name="t_ps_no_nt"/>
      <field name="ma_nt"/>
      &XMLUserGridMasterViews;
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        &CommandWhenVoucherBeforeInit;
        <![CDATA[<encrypted>iEKxtUKjDK6snFgVRIwRl+Cx3rPs06DNMR/NEz0sslFWWTd29E2bc7DEkcqz0/tZtEqqvr+Nr8PwMPNPABgUaefBvHow8uJNCkNSXePl48rhyPsIQXavJefmV2jBysnYfaQBpBnY+FAQ27JY/PZPdA5wq7fQo27MfSZUGqhEDtcZCdngzqevBFnxUdGQk2QYrtSJn+aNrYUKCTvOSQFaMswL4PyH7OATz609YeOlpRQ=</encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>jwYajr6NFNfl/vqD+fMigxzyekjoh0+7nM7jNjCbcsHi/+6NRzy5P/O3c7cdpYHqqa6c/c0FEFcHUz/DdC9vdOdl2sGRK8Q8C+XA9tLSCCSpgeOXYMIZmNTNSwdd2FU248btBw7vif6ogFKZyuBOk5bvl2zARM4NdM25Lz53ByKgGB5GVdxsQBXWRe7kUHfze+a4DtkZeNEykENWXE3rWUuqabFtfd75kXdu1wgBlnFNZV4l4KJGNbsEhN9irkzp32DzkRSi1t1seL3nAOL9RLuK2qLfwYKw+W8hyy8XH5/9GjOuhurfydQUNYZKhcvRgFZ9Hg1GJTwG+KCr0UOuH7S17bhliUIQoZ/OazzubWcKz+k7lFSHJihGE8OohasZ1FdIu4Lo3j7gCFvtIjXD+cK//S3+iZFaA/HjznhPMHEx1jufz3AT/x8LmC0JJ9syaBSF7A/jOFJW70x1s/QtFWH2ahVgdXIli/qyBX4hrxBAZ4catYJJMJBZ4FNMmdViJL62gpwxBk2GA+btq8GYaYBr2ZlYhvaS16LqGtyCWopan6xU4GqHY4QbgKPbFq40VHOBvvEMjR8j9Dimp6htG4mNv86Fm4iGtTDTga9jhyuZHRaMk8cZKnBjAYAioKx17SqMoMdqmOkNjfs/jl+nXWZ62SBy6L65jMzwtDzxAYjx1E3yQhyR/JDLXN8JN2ON</encrypted>]]>&TransferID;<![CDATA[<encrypted>9wcEF7GUBP6W6lkCTpDR5CLQczz0Z3jLfbLfGuD397nLJf7EuZb6ZETCS+2wj9QxftL6TwXTlLys8vCL8rfImqifV/mr9u237VkpPsb4me9ZHFCY3ep4sviwJYlhEmaDXj2CVlAQOl4ot7yfiPdOBZKzuUB4qGjsJ4NLWg1PEf+rMcetR6onVq23M5fCeoudcOfp8G2RvXZHmXjiGDPQCDQeZflqe6JkD/sL3H3eaf8e3C+GG3IJ4IZPfPxJQ4EQ</encrypted>]]>

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
        <![CDATA[<encrypted>lmiLE6AU8L8AiWxaVTggsYNvlUv0Iss2/TV/ZdldkPGlwvJp5Dt0oFBxmcOyVfguVhKZcX6UYNAWwTLRol6AnDqspx/J6Kuv/pY9xXwZKgHTHH/TpKbskwzzY17gMxRxo8Lfp78Z2cjU/jUgpv1oQAuSxcmaaimGY7bdjBDkujUhrfzgZH74kvrRK40MiuS3</encrypted>]]> &CommandExternalFromClause;<![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MQx8UPxIaIQTg7/lOjF5Y9fqc71ANnzDzlarFbJpwDVLDdcxSooLhLjiZKxEVoDKs</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>zkzxMMpPSVsvX9p3HACtEa+4aOzqH13Ory91r8UqvcpL/mF0i75wUKrNStS2+u+m/QVAt4biTog7qMfQDquZ2lJhpuOv47bm5Z4t0D31WE5alg/Y/6agf9UHE0OdpQi3LdESD5Z9ZBAE2dyJoEjo9qAH8n3TUvzM+nHL2KqArnFWCsouNI3UMTQrAmf057SmLSqx6IooPKLzp981IJ54cMYc0Q4KcxGEUd8NC1rXvHhIPwTUfIs/Ncge0p/vrlFu264Sh73PxTemHkLXxFdGhg==</encrypted>]]> &CommandExternalFromClause;<![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MbBNB9R7jWqBIKvkFj517eYvHricvsjG48CLVXQG47Uw00La4kTTnpHKdddXOOgo+TMPExj49JTwxGXxcMq++aPOimuQMMhWJfQJn+EzKeMk=</encrypted>]]>
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
