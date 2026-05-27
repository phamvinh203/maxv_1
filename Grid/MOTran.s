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
<grid table="phsx" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="SX1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Lệnh sản xuất" e="Manufacturing Order"></title>
  <subTitle v="Cập nhật lệnh sản xuất (Thêm, sửa, xóa, ...)" e="Manufacturing Order (Add, Edit, Delete, ...)"></subTitle>
  <partition table="isx" prime="phsx" inquiry="isx" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="60">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày Lsx" e="MO Date"></header>
    </field>
    <field name="so_ct" width="100" align="right">
      <header v="Số Lsx" e="MO Number"></header>
    </field>
    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ngay_th1" type="DateTime" dataFormatString="@datetimeFormat" width="110">
      <header v="Thực hiện từ ngày" e="Actual Start Date"></header>
    </field>
    <field name="ngay_th2" type="DateTime" dataFormatString="@datetimeFormat" width="110">
      <header v="Đến ngày" e="To"></header>
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
      <field name="ngay_th1"/>
      <field name="ngay_th2"/>
      &XMLUserGridMasterViews;
    </view>
  </views>

  &XMLStandardVoucherToolbar;

  <commands>
    <command event="Loading">
      <text>
        &CommandWhenVoucherBeforeInit;
        &CommandWhenVoucherBeforeAddNew;
        &CommandWhenVoucherAfterInit;
      </text>
    </command>
  </commands>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>0GkQThg4UR9WAjrBOaFvIl+ZpVQjG+9aDtf5dqKETQD3uuPthlAKlqSAFvHYubNHmd/KrGpUusSvHPZ26aUcwEVaFaEjSVBqiVjbeiT6DWYAMUc6eRggA3oALMp7Y8J1hlEcb7rHGkRy/om0zXOlS0WMHAPUjhXFXgDEoa72UzCJ3HBju5DaQTr5VlajvBZa</encrypted>]]>&CommandExternalFromClause;<![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MQx8UPxIaIQTg7/lOjF5Y9fqc71ANnzDzlarFbJpwDVLDdcxSooLhLjiZKxEVoDKs</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>2+8+NnUZ2R2U38xMbzNPh8oo87BtoqTIP23a8GmJ9iKuy48Hmm+NXRwS1xoby+GXEXe4gza4AbkgP2j8UDMl2LzQywdl1QT2V3/DZOa3c1omptroe40v51Cc4EzstH4TMadMysAvlvui+neX9RQL7DxkDhBqe4JV0kRadoOCzCVRYD0Rs9KwVUwcz+BCc+sdgzeNsmrJ7hP9cFuIAfnQX+MmqIAwOwqf1YJqqflHXSQHPuV7ep7bPqfvi33wuEZX0kiuPOtoMzszhfxNDQuVqA==</encrypted>]]>&CommandExternalFromClause;<![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MbBNB9R7jWqBIKvkFj517eYvHricvsjG48CLVXQG47Uw00La4kTTnpHKdddXOOgo+TMPExj49JTwxGXxcMq++aPOimuQMMhWJfQJn+EzKeMk=</encrypted>]]>
      </text>
    </query>
  </queries>
</grid>
