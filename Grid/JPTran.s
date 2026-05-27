<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\ExternalVoucherToolbar.xml">
  <!ENTITY XMLUserGridMasterFields SYSTEM "..\Include\XML\UserGridMasterFields.txt">
  <!ENTITY XMLUserGridMasterViews SYSTEM "..\Include\XML\UserGridMasterViews.txt">
  <!ENTITY CommandExternalFromClause SYSTEM "..\Include\Command\ExternalFromClause.txt">
]>

<grid table="m39$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HM8" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Chứng từ phải trả khác, chứng từ bù trừ công nợ" e="Misc. Payable Transaction, AP-AR Interface"></title>
  <subTitle v="Cập nhật chứng từ bù trừ công nợ (Thêm, sửa, xóa, in, ...)" e="Misc. Payable Transaction, AP-AR Interface (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c39$000000" prime="m39$" inquiry="i39$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="60"  allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100"  allowFilter="true">
      <header v="Ngày hạch toán" e="GL Date"></header>
    </field>
    <field name="so_ct" width="100" align="right"  allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="dien_giai" width="300"  allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="t_ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0.00"  allowFilter="true">
      <header v="Tổng phát sinh" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="60"  allowFilter="true">
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
        &CommandWhenVoucherBeforeInit;
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  &XMLStandardVoucherToolbar;

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
</grid>
