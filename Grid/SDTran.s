<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">
  <!ENTITY XMLUserGridMasterFields SYSTEM "..\Include\XML\UserGridMasterFields.txt">
  <!ENTITY XMLUserGridMasterViews SYSTEM "..\Include\XML\UserGridMasterViews.txt">
  <!ENTITY CommandExternalFromClause SYSTEM "..\Include\Command\ExternalFromClause.txt">
]>

<grid table="m22$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="HB6" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Hóa đơn giảm giá hàng hóa - dịch vụ" e="Discount Invoice"></title>
  <subTitle v="Cập nhật hóa đơn giảm giá hàng hóa - dịch vụ (Thêm, sửa, xóa, in, ...)" e="Discount Invoice (Add, Edit, Delete, Print, ...)"></subTitle>
  <partition table="c22$000000" prime="m22$" inquiry="i22$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <header v="Số chứng từ" e="No."></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="280" external="true" aliasName="b" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
	<field name="Dien_giai" width="300" aliasName="a" allowFilter="true">
      <header v="Diễn giải" e="Descriptons"></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" allowFilter="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="60" allowFilter="true">
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
      <field name="t_tt_nt"/>
      <field name="ma_nt"/>
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
  <button command="Clone">
    <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
  </button>
  <button command="Delete">
    <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
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

  <button command="Freeze">
    <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
  </button>
</toolbar>

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
        <![CDATA[<encrypted>bWP9gLYDheuoumM2qDbC9R49n5RdBQm3Ta6a8nlMmmnrXY0sHOwcXqyvKZQ9kmEDHqlkwQ30Mmc5z3X2+TjxqUBGVBFjewp9uGs/yak0GUFxCypKxoqFijC0dKl3zKvb31m0u6/3cv8kjENkMbiKRXViYzUjxHu4sw9zn/lEereXeCVYOUmoamp8zzc66q15f+XrygvXoljTiMFUxmdEiQ==</encrypted>]]>&CommandExternalFromClause; <![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MQx8UPxIaIQTg7/lOjF5Y9fqc71ANnzDzlarFbJpwDVLDdcxSooLhLjiZKxEVoDKs</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>E3rfEHTO4/rDJg4Rr6F1vdJuPaG7ucl1jHdxWQnX8M4bvMD6XoDgrnJg8uqf2hh3mlIr2Yv4twhv/8jiWpbLHVpAjqB0kJ+LJYFZcyMAFf3kciLXSDDhDlbb4wCnW5xQXu0aumHoGcUpb6W1Cw0GHU8jk2YN1tvkkqCnLT64OuZFRJAOZQX5/LxDmQf32PKz33zW8oONmb2LUwQJwHfFJCiyxRpIqdl4GYmodazLprD0I5iQI3t6SD+bZ9rb3iflaVFRbx1iej0H4Ygn4tOKm3StQr5FJ4xWMcEw92YR+ic=</encrypted>]]>&CommandExternalFromClause; <![CDATA[<encrypted>gJcEK3rTDDJLVWTQ65jEfhUodqG8pC/Ovjjj+L+pEgv6iaDeenWtXKBw2zir7T7MbBNB9R7jWqBIKvkFj517eYvHricvsjG48CLVXQG47Uw00La4kTTnpHKdddXOOgo+TMPExj49JTwxGXxcMq++aPOimuQMMhWJfQJn+EzKeMk=</encrypted>]]>
      </text>
    </query>
  </queries>
</grid>
