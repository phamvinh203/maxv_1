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
  <!ENTITY TransferID "JRTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'JRMaster.xlsx', @description = N'Chứng từ phải thu khác, chứng từ bù trừ công nợ'
else select @filename = 'JRMaster2.xlsx', @description = N'Misc. Receivable Transaction, AR-AP Interface'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="m29$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HB8" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chứng từ bù trừ công nợ" e="Misc. Receivable Transaction, AR-AP Interface"></title>
  <subTitle v="Cập nhật chứng từ bù trừ công nợ (Thêm, sửa, xóa, in, ...) " e="AR-AP Interface (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c29$000000" prime="m29$" inquiry="i29$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày hạch toán" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="dien_giai" width="350" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="t_ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00" allowFilter="true">
      <header v="Tổng phát sinh" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nt" width="80" allowFilter="true">
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
        <![CDATA[<encrypted>iEKxtUKjDK6snFgVRIwRl0PYvdflWeQ0zyNgjI3IvWkQpHQFhhU3jt34SsCe7lxFoAn9aRcXlgr8od/TF3JenIuCzrBJktvf/UA7elUAvgXil59dTNPnBurO+wSxtDKWwvSzZssZWQq0VdehdqLTXPOFPardp91pySrKTCxqfXvTWukYfhP0zsCU2IH9ZVpPn6mLRRRx7gk3HUFfhFSHF0GdLfqJ3zHQsz92+vA7q00=</encrypted>]]>
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>rRU8s1dn2qWW01ggDhogF+nFyef0St95AtqzxYvi53nKuI75ylIvlnNiffleEm0QQCSFpdO8EDZY0T67ZgeuyZK8cY9S125kPMUQECm2mLyQUhgAaCi4TpSJEVAg9W2mSrTltvgqBconP/fAuUR3ZBRxwsxLIMd1+djjevW7ACUedi2J/vY2gxYSXI1AGhvQzF4VgtWnV0EBXJlRb2Slyo4bh50vWGYz8tn5YLEqpV38NLwWXx+6B7AI/HU6OOx7sL+GbFERQJW5S7eMhKp31XaVZhsDldOWtiIUoGYQOV4Qd1ET9xqkKVKpIDg+LnmZAcArXukbT4HBhUS1yw4zzJq5xPGoTiFI+HCmHT67D3vp8/vMbdOajyCFtJ3wevpDOIUmRjj6ZB1ImkCWvIDgj5SuTyn4Wj4YRSL0YfI1FQEcil8+kuOFF5Mbaae/JpKE7jgIYaEmUME3CxmDOOgKHKexR1Xfmv5Q4Np9TgYhXqcmjWOeoutkMBkqn6RumeGWU+m7MFns+H9K3O7YF+8EM9go7tiJjK8lU8cINEGDaBAiUmtRGfzU8fveOJQv439lW5wJEFhVxzfwoMklSKvTGcdyWzerktieN1T1VmpcAp8=</encrypted>]]>
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
