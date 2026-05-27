<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\ExternalDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d54$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PC9" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c54$000000" prime="d54$" inquiry="i54$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="so_hd" width="100" align="right" maxLength="-100" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="APInvoice" reference="stt_rec_hd" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or (stt_rec in (select stt_rec_tt from cttt30 where stt_rec = '{[$stt_rec]}' and loai_tt = 1)))" information="so_ct$cttt30.stt_rec"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLzw2t/rYVE4bEk5q2MZp7S+psrY5kaYUbDirYU/2DGQMVq7frlj1DDpkkC1D8BGU=</encrypted>]]></clientScript>
    </field>
    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" inactivate="true">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="tk" width="100" allowNulls="false" readOnly="true" inactivate="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true">
      <header v="Số tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true">
      <header v="Đã thanh toán" e="Paid"></header>
      <items style="Numeric"/>
    </field>
    <field name="con_pt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true">
      <header v="Còn lại" e="Remaining"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt_hd" width="50" readOnly="true" inactivate="true" defaultValue="''" aliasName="case when isnull(a.ma_nt_hd, '') = '' then (select val from options where name = 'm_ma_nt0') else a.ma_nt_hd end">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia_hd" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true" hidden="true">
      <header v="Tỷ giá hóa đơn" e="Invoice Ex. Rate"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" readOnly="true" defaultValue="''" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_hd"/>
      <field name="ngay_hd"/>
      <field name="tk"/>
      <field name="t_tt_nt"/>
      <field name="da_tt_nt"/>
      <field name="con_pt_nt"/>
      <field name="ma_nt_hd"/>
      <field name="ty_gia_hd"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_hd"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXoK2w/YUkJHUY0ZH43sfD4duGnx7Ohbkr4DBDNymWoBwQEGMn/qD8zRnO7G9BYAe/TvwiNYB+shLIE0UZhWfV7Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khX63lKwmzHzjwARyexDzCpOZwlE4lOVaY8k9R24ocGHqr/Y9vn0dleP1J95VH2VAf79ctKpKvXbOok8q6nET2T8O3xDK38OIY9OHxrvW7pj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>z92xncwMceLZLzqLl8/xf/j9AoC4l6apNHToAddDXNYa1P+0RMQZnCHFHDRRlA+IGpL+E5vL+sSOAL8Az7f9MikS5xDmqmcItFm7xFg49sEtaPj8s3jW9pSJ4NXF784kErhnojChD4TyuuI5AE7ewGsX7jN/+M5+jRmBDpGZxJgNUBJjLTMAI5VLWGlmRlRaim2iCZqgFkdiVjgya4uKLGBPVvSk5Ga16ddYjEsrtO7VoNujWe2ZT99LRYsLu8DXZFFyN16IXv8IyI/eC+KUVjToyyVFLi/M4mZaLU6vSDOZN9X/4xVZSx14QLzeUsQHKROdWFbgXfckuimLZnkrGRU7mTybZeF8padFgLvx6/eCE3r3GJes+tGvBJDY62MAgVXDVnpkTIkIiJymTdz0L39a/P8Q38zbpr+TAPd1t1XXUeV1P37YYXn3zE2bfcyIhIkPQQkOz3n2y2W0vU4CRxrLFHDaqYEK6nmoW/IVfNDtkbzQmCwiFqRwuQeG2zSQ7k9dwJWwiut6MxOwYjZJNrs3yl9CB/NMlHCs4VqI3SVYgQJy0n6NydFX2b8bribBlhHqQV82SiUXKaMt7C2yUeh3j8p7GeW4z6plEb0Bn0XlCEYn3aimTCttRZVu3V5bOV02E1RybOzWvElggC3skNVu5kX66EMzWwK8nVTcAtC1Jq8saZ4RVrgf7w0u3VxG7aFJNuPW4f+9dskypr+9jpDDu/WYHPuRcSa5g5zfuaQQxhMZjPGTgAd44n/5IZM00pObsnCUBDgYJHxOfX32dEh4aAFn9Slwh13m46lqfGux6XVGhlIYq+enm50kEphn+UyYjL55AeueM6IIsCk2R/k1al7PrDZwgqkh9aWcjeJfrpmOZsSA7Yjgcx0D0ZcgI185xAKDBL9YrsG/7dXu2X8yY8opoPqCims0K6Po5sI=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>fXPK2VbH0baTGNtugo9ZJ8L8h4FrgA4feGcQMkRRt/F7x1XeWg/UULl03jffrhil5PBhXOHucF5MVdse6VxidzpEIe9PlSehIegtAISW1z8pfC3iplBilNbPNp4eCpgAabuWt3diMAvz1lcoFrQQTg==</encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="InvoiceNumber">
      <text>
        <![CDATA[<encrypted>wZpsgbcgkTU1wdxCtWiogHHFyoMAbWMk88MY+BIPVTP8LlLvHidM25jSNDMp1VTcb87JK5Yd9OY9yBbdE2hB5/wJyM8osb27P2UfbhZuvC2wnr8mW6EkqZ9YbFmMJWs753o+jZqY5kH0LY7JR81/4ygVgtb6ZFfKwTRG8qYi+Spos9tkiZwVS835zn+mEwT1o7m7wBtcZPTi7WBzpKMg7yLP8Ixba4Sj/PBxnucwt/W1ArJA/PiVUy036n8R+9xfHTGT7Ky56JtDKS/2/Rrt4wNzjAqkNdWLmfqw8D3bH8/rk+OatSwt8auIau0CByin4KHFtC9TqJo7fpMKmSXMTe0IM240hnphpZImGQ3yr37K0tUTF5bba/8Pf5sgwzmnUZX5axBXsNvEBkTUUWKHmYGxVoOGzc/gwXSji5S43pdYVqUR2PeSh00/uVFHwNgnOC2xvsn9vRT47VYpfUTgw3PAsdIhFx+9dQiBaZIVRFHI7k4I/aG6hXPKQ/gjGFCN4Sf9wu5VrVXyZODGpJqZRWdxSYjWkL/+VkpDxhtuU6oG48NyRTm22Dk2x0rRAyYGsV/GJEpF7wtA9AXXPWB8Uuf8ftWJ2tqovRWqW8heM9YCATCGyhPgVc6rtx88BI1P</encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
  </toolbar>
</grid>
