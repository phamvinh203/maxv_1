<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">
]>

<grid table="m44$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PT9" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Tất toán cho các hóa đơn" e="Write-off"></title>
  <subTitle v="Cập nhật tất toán hóa đơn" e="Write-off"></subTitle>
  <partition table="c44$000000" prime="m44$" inquiry="i44$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày hạch toán" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="350" external="true" aliasName="b">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
	<field name="dien_giai" width="350">
      <header v="Diễn giải" e="Description"></header>
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
        <![CDATA[<encrypted>myRHvVjpolcFT+XR8W9lds4wgrV8jQeBWfAyBAPAKnzhaAeNXE0q5wuJA2OxgUihQDH+8FP0SbBrapsT/AHE1XsaTXuE9aG3OOOB/inCJedfIkeVbLA1HB7LuZsdUjmHM3fwnDggtBFFJZ1q5K5yROIds/OtwgNzf2cqokaYWbgxZM0IhV9i2Z4IE9nvKOfqKmLaAmBUqOVNmPlBQe3ctlU4jtopfws/hb1LlVvuNfknnqeM04Ax3Rqv6+yhy/9nT5oNWCSf44LvF1Yt0tdFFVycCNvYJzA4xePFqHLozvu75rIE21PHBGaa7nTYOMtdONFlAwEFOTjll/gQiI0wprdkpU4XGHywb4O4/DqxBWdCdgiKlobZHls4jLbyDF+Y</encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<encrypted>ScXOXc/8/M8Ir1wadr0z3cxR0leMWfF/oL/UwflNlTPgWdXEo97MoN52sHjkkYZYkEngnecz2lAFqFyWei3kve5jrvkueG0kAyfuY2vaJ6I=</encrypted>]]>
    </text>
  </css>

  &XMLStandardVoucherToolbar;
</grid>
