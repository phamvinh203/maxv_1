<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
]>

<grid table="m43$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PT0" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Phân bổ thu tiền cho các hóa đơn" e="Cash Receipt Allocation to Invoices"></title>
  <subTitle v="Cập nhật phân bổ thu tiền cho các hóa đơn (Thêm, sửa, xóa, ...)" e="Cash Receipt Allocation (Add, Edit, Delete, ...)"></subTitle>
  <partition table="c43$000000" prime="m43$" inquiry="i43$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="true">
      <header v="Ngày phân bổ" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right" allowFilter="true">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="320" external="true" aliasName="b" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
	<field name="Dien_giai" width="350" aliasName="a" allowFilter="true">
      <header v="Diễn giải" e="Descriptions"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
	  <field name="dien_giai"/>
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

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>kIakSS67FK8NvnnYruwbKadGDzT/Ad6beHdDaWiNN4BA1cJx5uOBYvyLE/0VHJSLcot1o/BRWxRDP8P14GfnFbRakApTVYdktshoMnUgSQlXuvsl7Fx8jsXKQG8/AJ7Be3HYfUXU13C3FE/Zk4TYaFDr4U0J3Jhs81fGSMGs3NYTPckQLaNGLK76OBgWZavwuIuq7dOweMXJQa/NUIKcEwJUo7UpWyGnl4SH6DdDvNKabwMCAzGJFrd3rjpYNs2vfqepkSYQwBQa8gzyRsDdgA==</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>myRHvVjpolcFT+XR8W9lds4wgrV8jQeBWfAyBAPAKnzhaAeNXE0q5wuJA2OxgUihKdgWCD77hHcKpZq34rgE4ZTzmAtr9D5dzKE3/H2mplROj8BU2EGOPpLaIq/buR6CrXtxfmUP597IKFIFVu/wjm1elwHgvpbMLEP4G6AaUps+pQYgNXp675Nho+00yRMqRlVmuH4rakoWI0OyGWcMc+zTrdmMbI+Qj3LADkwszs1O3SN9b1OT3evOX8T6XByxrnKb8dnIQgNyKclfBje9qHKcI20AH7hTV9GU2YSksKbfu9n2WU456kxv+wcVRv+o1R7x0onC14UMl6q+QHakX30cJHuyR0AC89RzdzWkQi1t2xezdJ3gA5s1z2nOMSex</encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<encrypted>ScXOXc/8/M8Ir1wadr0z3cxR0leMWfF/oL/UwflNlTPgWdXEo97MoN52sHjkkYZYkEngnecz2lAFqFyWei3kve5jrvkueG0kAyfuY2vaJ6I=</encrypted>]]>
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
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
