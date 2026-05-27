<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY CommandWhenVoucherBeforeInit SYSTEM "..\Include\Command\WhenVoucherBeforeInit.txt">
  <!ENTITY CommandWhenVoucherAfterInit SYSTEM "..\Include\Command\WhenVoucherAfterInit.txt">
  <!ENTITY CommandWhenVoucherBeforeAddNew SYSTEM "..\Include\Command\WhenVoucherBeforeAddNew.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">
]>

<grid table="m54$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="PC9" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Tất toán cho các hóa đơn" e="Write-off"></title>
  <subTitle v="Cập nhật tất toán hóa đơn (Thêm, sửa, xóa, ...) " e="Write-off (Add, Edit, Delete, ...)"></subTitle>
  <partition table="c54$000000" prime="m54$" inquiry="i54$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" width="80">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày chứng từ" e="Date"></header>
    </field>
    <field name="so_ct" width="100" align="right">
      <header v="Số chứng từ" e="Number"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b">
      <header v="Tên khách" e="Customer Name"></header>
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
        <![CDATA[<encrypted>534bqHYNXsTn7cvlLYkmeiLYB7umogzYZ1fVMvEVgDpeClWSqTluDyjGRZzbFM6TIajWAFhx2n9oT0lD4oRv0SbSl5YxTF8u074BLN8ubS2absjewTyv1LK55IV1KFmUqkORLWXtP6dZINfixLrGf1cA2p8quom7KQHD/Q6EriuyXsmUrepuo+sjpRMpWSyGvdMlaDgvHQOYQdhsDIkxYcLDl+uLTgiUJYCCOrue2o/chYq6MWl6+K9uwI/6/gCgTIcfGKG2YeRgwh8QqCEtbantYiqXy5vEKxiYfDQjCwSL7MpH6OKUYqD0teSOEs6vRK9HbbfLzHSXuu1GNYPB6Eb4p27+fF7h4fYxzz5WcRuRPNBLTh0657tA24jo0Jij</encrypted>]]>
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
