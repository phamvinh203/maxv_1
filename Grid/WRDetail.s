<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\ExternalDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d44$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PT9" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c44$000000" prime="d44$" inquiry="i44$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="so_hd" width="100" align="right" maxLength="-100" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="ARInvoice" reference="stt_rec_hd" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or (stt_rec in (select stt_rec_tt from cttt20 where stt_rec = '{[$stt_rec]}' and loai_tt = 1)))" information="so_ct$cttt20.stt_rec"/>
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
      <header v="Đã thanh toán" e="Received"></header>
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
      <![CDATA[<encrypted>z92xncwMceLZLzqLl8/xf/j9AoC4l6apNHToAddDXNYa1P+0RMQZnCHFHDRRlA+IkMHDY6T8mcO7SFiixHGfuDzLVeRPolxmHXHP67j4nfdpA+PAlcmL6eh/8uyyHNlvG57kY1gtFWtjCh/FljXEad6M9LKlG+OLvAQr7zxGOn/7eKuLe1tA/1oj/T6seFo447MLmOvfXzfBZOChVUXWz8vyjvkZ8im9QsGefLKw8wqiXJm7wA9OckwepUINa9n6AktaZqOmMZH8Hg4voJFFVrdIJeA/fLRPcIvVMeEZQulWCfMXKmoItLiVx5FaWifJFC3TVj0g8crFZVpFhunStm/cNJN4u7yo90ITYy5FY4g2KNlx2/Eh9q6VJ4gw9H3vyya+gMDbA7zEKRyWAAF8nVQASELPNVvCY0wJacvH/xbDguX5IN/qRQg2ymql3gEl8jmRIFoC6Zm41FN/qHi8Zb2CVB0EVeXMg50HUNwgPW0Nx2uSIZlYBxxh2AV6DNTRs/eVeF9heeBtw34pYKD0UAJqj2fE0YvnaaX/4Gb1MFaS33uQxKuBxOBxuu0Ny6evl6UQ5t1Ck5FMdKOrmzLvffF5WWpzOiLjLBim3UiEXUv52gnihLUnFyKhc/5OhKOLHkhuwY6RqBDPO4gycOWb6uqOYThyAaUEBqLys34JJir11/cMwX+Mkd6gI/pXrjkUylqa3oBfEHZLrlynX8cUqIOLNcXERb6OuKi9UrDtu9k41CeajRyRUxv8egOzVSkphw/3s7g4v8UBOy4gjjDwGvgzRGtIrW2ehufn3w/EqTkfvaKwDpLQI2TNZceRcyRukUM3J/AMvkTzkIDfDv7Crn3VuCZkkmbZNWnx8WNAZN9vw6Iq2N7ESaGrKDJ9a1xq6JY7x1I1o+YM9vDpwwxw52rFQsvumsfTFg8ZWtiVqEI=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>fXPK2VbH0baTGNtugo9ZJ46wAVz4ZnXmVcRaevd/87h5bycPf+7iHSKEVYSECingwJwDSmoD49OBRm+qetz6T2eM5bHkaSjUhDd5hLfEFAYo8NfNgDoOmOSZJSfMQw9R+rp/88ndHYgAy1QZNOMIhA==</encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="InvoiceNumber">
      <text>
        <![CDATA[<encrypted>wZpsgbcgkTU1wdxCtWiogFGHqRKvEXaqsJgLlHqJfcESAEfCZWC6B7JWVsCale9344DpMm0/Av1j+JKQvcF744sCY+a2wtpBCyiJf69bOE6wxZHe4KDh7u3BgKLn9vhh6VgBdA8jlHC6yZ/DEe3RBL6b4kaq7zIHZ73+jcg21am5UbKSwPf6BezkuTb2aSOLwLWa97ADXc8b3+o5HR1blmFfMH/6LcIyV2DscNXCHWwQr647TpWWmxHmWCGe0fDrtsQ39gTQFkYaBcz8tdHsMV+buim8oBigxOG+U5Lde1QmZSwWsDYPDeJ3+YqfksEDg6LIaRi/4GK6Cbxsp75OZ0jUQyRS4XxUpJfDFiV5A7TeWdaYxrBD06U4IIZDeGkPEXgk6YI8RW6Bae8KmrbllqJBx5ApsonRzCkL3r7cgZMu5mPxw9mX94jx902PsRoVwuexjyCM7SInwbS4ScedgF3vw8yUuw5rFCyvJvJr2U1GZTEpZn08zBGQMGNP0vmgVg69aeyXsLbQPlP7qZSAw+Sl/A8wpMm8yMH+YzAAmvd3hTLiLS2el0lZf5d7qBWBjc0/ZFDRvjuCKQ8n2Nw6e9iwTbNHPamjsQStRAon90NZaP4E7+OqOSqWuwNocoYi</encrypted>]]>
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
