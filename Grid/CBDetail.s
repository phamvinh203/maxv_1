<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\ExternalDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d46$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="BC1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c46$000000" prime="d46$" inquiry="i46$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_co" width="100" allowNulls="false" aliasName="a">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>

    <field name="so_hd" width="100" align="right" maxLength="-100" external="true" defaultValue="''" aliasName="rtrim(isnull(d.so_ct, ''))" allowContain="true">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="CRInvoiceLookup" reference="stt_rec_tt" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or (stt_rec in (select stt_rec_tt from cttt20 where stt_rec = '{[$stt_rec]}' and loai_tt = 1)))" information="so_ct$cttt20.stt_rec"/>
      <clientScript><![CDATA[<encrypted>sc0qyuXjd5aL+EIDnlnT7ufbL0kfMsrpaLG5pDafKn5WzhXQDu0CWUYJDxtqrcZSPXH0gpzoai2ePSzkFQ7JjDUVyvUeSatwKQn8j+TGv60WOgBnfw3PugE4FBBokiRP</encrypted>]]></clientScript>
    </field>
    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" external="true" inactivate="true" defaultValue="''" aliasName="d.ngay_ct">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>

    <field name="tien_hd_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end">
      <header v="Tiền trên hóa đơn" e="Invoice Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end">
      <header v="Đã thanh toán" e="Received"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - (d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end)">
      <header v="Còn phải thanh toán" e="Receivable"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nt_i" width="50" readOnly="true" external="true" inactivate="true" defaultValue="''" aliasName="case when isnull(d.ma_nt, '') = '' then (select val from options where name = 'm_ma_nt0') else d.ma_nt end">
      <header v="Ngoại tệ" e="Currency"></header>
    </field>
    <field name="ty_gia_hd" type="Decimal" dataFormatString="@exchangeRateInputFormat" width="0" readOnly="true" external="true" inactivate="true" hidden="true" defaultValue="0" aliasName="isnull(d.ty_gia, 0)">
      <header v="" e=""></header>
    </field>
    <field name="tt_qd" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" aliasName="a">
      <header v="Thanh toán quy đổi" e="Payment Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_kh_i" onDemand="true" width="100" allowNulls="true" aliasName="a">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_i%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh_i%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="isnull(c.ten_kh, '')">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="dien_giai" width="300" clientDefault="Default" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_gia_ht2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Tỷ giá gs" e="Book Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" aliasName="a">
      <header v="Tiền" e="Amount"></header>
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
    <field name="stt_rec_tt" readOnly="true" defaultValue="''" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_hd"/>
      <field name="ngay_hd"/>

      <field name="tien_hd_nt"/>
      <field name="da_tt_nt"/>
      <field name="cl_nt"/>

      <field name="tk_co"/>
      <field name="ten_tk%l"/>
      <field name="ma_kh_i"/>
      <field name="ten_kh_i%l"/>
      <field name="tien_nt"/>
      <field name="tt_qd"/>
      <field name="ma_nt_i"/>
      <field name="ty_gia_hd"/>
      <field name="ty_gia_ht2"/>
      <field name="dien_giai"/>
      <field name="tien"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_tt"/>
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
      <![CDATA[<encrypted>QJZgywI8oF8d65lsot3BIqWp02A2n98dkyUfyOYPcu7ghXl8emGdO9obqHJJEHXRrAZ08k0oe4nLigze0mxUEA158Y4PEEasrs+Ur3/oMiJAv9LhKlOfItDO2rSg/groJf1lmRX/iCDc7YqrU7u+EzCIsMagEcA6YzY2Aez4uOpVwwjiFkaNDMYEsMqfzBOQ22FJxi9sA5zIMlna7mVoTanNk0wtwfnC7Fb9oCE8xeGuZ1HzLg1MzuNM5xRQM251MZc+h9SAaXOqz/DigvC6zTl+I5/PN0WAODItSILOCZXU+nsy95Jzzy4AaftPFWqcTJil7MCWqgArQuCi7hyE5HZMDTC5j9Erk/iNeixBW9gWylkE8aE0+6l0Za1sTAvU6+deCfeeDShGTDsJzUZ46v/QRj22pbumS2wPfwmXMl07DnfgZI7GC0+hClWqupe/GztKRfDknaJ2j6oz5wOBHTobncpkkx2xpgPeMm2klpBkd1+T2INbh0Zop9p/d5TqRJ8WeOobKIewRG9I3RrvRGL5X+5BmK1aFoQzHJQavKwLNcZr0buXV4He5MQWgPqVgg6TxuGvCYg1/QfkYgfzFo99sCyNSTAIJA0TP2D8F02xfkM32mEWL+DoNlH983ZL8l1MlvPoHnnQWtFV9bUUjmcLm5kNjbyYWPVuoUhECCoUqOtRrhw0ULbIJGc9xxaKw2O+xlOiIZdpYrK8v7vbPj5fiyRXW/LxQBxIpksVELNAh+K46WXZRLdQNxeW6TkjYWlWBBNBg5wt+4JTY92B8yErSNRLPEP2exnmnCk1XAf286vuM5BH2NzKl52E1Kx7F7q5y6N+qsNMPn52mEGcD7oC4hJw977DcOMo0I9BhbpdmgjuiCT3FWa6T64vgqvbauNEqQsWDqm+wBQ7RCes/8tP2Unio9RAnYvQngng3lQE9r8R30pyUMAbbMR0/OCc6HqCbVKtzcbYdpnpwx6dtjBjO8j1rSLKWKr6Bh73vCX6MT8nS3ezaUKS8QZq2Ouak66CRkUeYkajuuz2OjTaWkVi2vc7iEgx3V8r80VbUZYk2XvaIR0CKD+r3fqcDsMOBusDOM0dwy1X+pscTJKJFhNlY/StqbJlK5wOk0Y062V7YSdgBfbt4uQTQiMeyuXdUV2uvgGhc9SKs8JQhSfsFgYFaJX715esDWWyemEAioKEE53dJwC2lkHA+EkC0CY1BxpP7EaxPwFDGs33OUoo3L7q/lq3Fzqu1xCYHXLQE/uIxPCNuc1thHv/mFNX5ALX2n0T4b+cI52ayUYskDhZkNkfPewDEHY2byBBtnO/8+ScCQYt243Dtm1/QK45YR9e8ZJvySUvoCKe0l68IqMVcrjwYT1UKqGhvycaB4m6+h4v4THFjxOI20cjzMTqXac7oJWDNTDZ7rLu3Uy1Z0xzr9XokvT+EWDhsPOP3NwVPHeFaIA1oUydIM3Ju/6iL/I2e6gSbnJktBl/S0hTPO6sn7khmNclGePdyozNGXLyt7ILrxzcj+BQeBrhLHlCZUwe99W2wHyKG0nFA0VI70BiaP0TmiKOCS9wU3jJlwiiWGIe6REBo0gdzuk+ysERj71aYkHE/S+4mTCzTATrUqPQfZ+IsUvRjMTN0XH3ttSQvo7WhLukMZAhpewfzm4vJnTrC393nX13Y4YW7GdsDKgat+haDSfmptB9YVDMMLqw7FnJSNqPSaw+d1ITQ6ZViMhe4wDMt3TptiAD9q+xbDK03iXke/OjD7eoqnOghxTwlQEKzO0HIqIZMi8IcG8VHIu1</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>oV5J2cLU0ZrvjDL7YzyihrEeP/meyVeT6VYPEitsr4AG1lcfKfHzVzKKh3DQVoIInDKXaXPKUXA9SW9F226bS9xPfGaWGKPUOtXopRkobPvLgYCV96iOw+qZAEKAi7Jd/J6GXNs8X2UqSg9KaclS7QotKbkq1N1q5VoJyYMZEXUkJwA5U574r+9GebHrJEQnjtzHn3STWQMcz2b360IEEiUks232UluvMolDIyfDtrpmEpc2Y6jfBFg2DLtnqbfkWekHnjwU/mlfWRkJw3uWO/R4gBIJc+sJ3yKqxicfrNGZK8d29YdnXb2ayVZXlh8/</encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="InvoiceNumber">
      <text>
        <![CDATA[<encrypted>pB1ni1lXntkAVFT22Ip3Z+4L8k6HbnPStP/WyXMW7sJeicUpjIpt0p7eXAMovllkfBNQoWXcZHdprv9NUKJrogrywm+4T6QVzosOn3wyujl0XH+teMzbuTrTH2fLaLKVRtoDlM1zPpGQtvzJ9uB2gz2cUT6UXB5KnCz3y9638fRp4tfYot9wSrsbXdKQTq3SnH/hwycyMYS48RAeO31NLVZQXLQhnFSXY9BomzlgT9s/aPFcG3YlD1fXfG7UvJp0wA2WYpQD0g3OddY5n1nQjWazslskNLou8H+YOmoTtshR+LS2NqjVtTMjHk9eBp/A5AMSXbuoegT23B7j5D5FnCmBSLABlefrEHgA9ckx5UbE8c/iH1l/MwTZX9s+i2mQLrqZ0R7gG9OnDty3ix9w98g/WuWiQc2ZeQDtV4IonNIBh7K4VOI4/GzcE+xWR7cFiyJ5XIuOI3IOb5HqyaBUgH/JTTCEjR8r514AL+ok2LXfQ59GLb0DCz4RgIsydVS4AK9i24KP6vWE290oRHd2ektBt9fkUrLUyYgx3HX1tDE/DknVnvNog3rT1452NFXgkNevQTNFqIvjlpJRulfvVaM6KMRsUExDpAYZ28Cg6j41DZRhEy/yS2kWODhZSLMZDW8RqzewbIKBpHK+ynSX/DChJKnLqP7LfQ62ACsPNwZ1WqWh8Edw4k6n9h4ZakUT</encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
  </toolbar>
</grid>
