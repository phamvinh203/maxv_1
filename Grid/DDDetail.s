<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\ExternalDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d53$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PT0" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c53$000000" prime="d53$" inquiry="i53$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="so_phieu" width="100" align="right" maxLength="-100" allowNulls="false">
      <header v="Số phiếu" e="Voucher No."></header>
      <items style="AutoComplete" controller="DDTran" reference="stt_rec_phieu" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and (da_pb = 0 or stt_rec_pb = '{[$stt_rec]}')" information="so_ct$cttt60.stt_rec"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPPqzL13hLDfHMwyG0ENMYpMAJqpQVhsMhiwziPj0vsULA3oGhPuP/rRkU6AtNh/Hqc=</encrypted>]]></clientScript>
    </field>
    <field name="ngay_phieu" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" inactivate="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true"  inactivate="true">
      <header v="Tiền chi" e="Disbursement Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="50" inactivate="true" readOnly="true" aliasName="a">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true"  aliasName="a">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk" width="100" allowNulls="false" readOnly="true" inactivate="true" hidden="true"  aliasName="a">
      <header v="Tk" e="Account"></header>
    </field>

    <field name="so_hd" width="100" align="right" maxLength="-100" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="DDInvoiceLookup" reference="stt_rec_hd" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or (stt_rec in (select stt_rec_tt from cttt30 where stt_rec in (select distinct stt_rec from cttt60 where stt_rec_pb = '{[$stt_rec]}') and loai_tt = 1)))" information="so_ct$cttt30.stt_rec"/>
      <clientScript><![CDATA[<encrypted>sc0qyuXjd5aL+EIDnlnT7ufbL0kfMsrpaLG5pDafKn5WzhXQDu0CWUYJDxtqrcZSPXH0gpzoai2ePSzkFQ7JjDUVyvUeSatwKQn8j+TGv60WOgBnfw3PugE4FBBokiRP</encrypted>]]></clientScript>
    </field>
    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" inactivate="true">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>

    <field name="tien_hd_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end">
      <header v="Tiền trên hóa đơn" e="Invoice Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end">
      <header v="Đã thanh toán" e="Paid"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="110" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - (d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end)">
      <header v="Còn phải thanh toán" e="Payable"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_du" width="100" allowNulls="false" readOnly="true" inactivate="true">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>

    <field name="tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Thanh toán nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tt_qd" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="110" aliasName="a">
      <header v="Thanh toán quy đổi" e="Payment Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt_hd" width="80" readOnly="true" inactivate="true" defaultValue="''">
      <header v="Ngoại tệ hóa đơn" e="Invoice Currency"></header>
    </field>
    <field name="ty_gia_hd" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true" hidden="true">
      <header v="Tỷ giá hóa đơn" e="Invoice Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Thanh toán" e="Amount"></header>
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
    <field name="stt_rec_phieu" readOnly="true" defaultValue="''" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" readOnly="true" defaultValue="''" hidden="true" width="0" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="so_phieu"/>
      <field name="ngay_phieu"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="tk"/>

      <field name="so_hd"/>
      <field name="ngay_hd"/>

      <field name="tien_hd_nt"/>
      <field name="da_tt_nt"/>
      <field name="cl_nt"/>

      <field name="tk_du"/>
      <field name="tt_nt"/>
      <field name="tt_qd"/>
      <field name="ma_nt_hd"/>
      <field name="ty_gia_hd"/>
      <field name="tt"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_phieu"/>
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
      <![CDATA[<encrypted>i1pW2gtGLtQiMTeRNFw9cHaq1G3d9BR3fnwwd8kvX1EoD0zQbWSQHDPJPOPnuoZUCUJvzP4i9clFZoUehHwsrtRG8ZT3Di9zaDlmuQ5i6CpUWLNcW0ZP3pa9OPN9vDcEpETFkmsp9E8f55jbtGAMyqJK5kZn1dqQBZZn/ZX2t7Kvs4xYBtB6d0tIOSJWTV0AKSt4USBcNfa+6YBdJqV92ECyMZTuYwykaqUzHmqXli8z178OySBigp6Dm6FT1UMoKvbgcNvaBRuqAnW8G2cUIldGdvNr5vkC0DBUlYWcZg56zbJlhpn/w8xYeKPLGuUzMfpjYJ49nbci3SaXB6j2jH1FcqHkClVIXauv7NMTbMCCR3ZD+BzM6+b2pxstukRNGa1EwiZSIXD2+HmwD1KxB8O0JmcWPfpKN2dRkWiRay/2LPxOgyLmrk4l2BQbk2NAo2dyq5Srd6Ix9ijaZhFSWfm+alZRgQxsg3KyVlnRbEUopfpT1A3Y+nTKLvihQF57RRQPIvrR2a33ABC5Mak9aTlTh9ALTFG0WR9du5l3LvqiXjqGNUlTvMDRAXhozJhZAzqQDEKB8ROTczUdy0gfK0mzsnZe2FoOz51S8xbA+HG3NfdNSfeb3FYt2k9WdXo7xz2w1ARltEmLi5JlOB2g99BCmX0celWa2G30L2OXo+VanlIAHQEU45Nfrk/CTVaa0qPiCITZYsIORL3bnQUhoW9rpzqHf0uOoNo3UR6xYjNofAtKDeIIZjNp5lj77FZdpHDxlDNTov73sCT+Pq5XG3kMneeGxpuDD/aZKX1qil82AkLEj2ykTtUikmsq7dN+DLhGazIWZA9PSzMWb5v0Jwk+I40jq4GN8WsSKynWbooJ8Ujo0vKvCI8tGysbflPvL2VmdIDtXCq4lYisIOoEQhCSVnIxwIumyyg6GI+6eh2MtRvQimnq/uEQNWkn33/lKsolzCx45pc7tlgpMazoq5gDr9dlUWohWKpviVWwmpxkPaO5Ee7vqXCGdSbY0RSwASoW8NKaM4L8zXTpCm9Wo6RPClPuB9aH2Dog43Nt4NVB2mHorxN9llqb0KNcb2wSlUYhW06mMnosTc7IWoSSOLjpdT0MPuA6qhePmDx8xGgRHSnnXomKGIZGq2aU/En6+uhjgh1g3E/UgtnUJzczPT5NXfQGGcYW03Jtsm2VP2wknvsYlU5BD2uvrcYuJsoLwMYn04+6ijNtXsYtDtag2+oXG9mnwcaxRrMNnrWKc045aHRzj9wMfa2zbsrAQIL0xqJSBrG8UPPsclYqDYywpLIxzBudGzrZXSrSjHlsNKg9S47mx5qthwXjA/jwd/FuJHdAQugdXV6eKIGI4zfnpSM/QO3SQ2QNol4H36MDBFJ/dqcQM9WbWMQYvTwlcvAzBwQwLPlsymI8qcPPPnQs7spdooYXAYaUyJRVrc4HYfyp0p803pdQEFaDC1Bz8KZzC4OVV14BRML9aoU8iXbCobcd7cUElv6thk65gEr7ZU2MqyQZfo8ZZk8Q7+xkYnk0mQDCILGWSAsl79eFgHGptRUyqckD9osmPnlQX3qx1Iz2xttTWYXkHy0Wzab01EEk</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>GWHXIgdX8ubb3ZquVWcjL8lb07bao1cbQubXeMzIENADPXgdbCY+RU4jTzozNls1ZeZQBpHn5Gg+k0FtVoPYkxYoLVTIhCst13Zl3HkjlSpffTerpIIghA+yneQ/gPkaE36684Qk4hPG0IZ11kk6lGHN9Wu+N3Na5+nP2rQB876KSRhWMexoMBhPXKBxUDd0qa08U9gZANeATAYhXAlksBUCq3jj+5TlTgpnd7+BgkWdnw2diyxeYecHD4Lhlhkn2yo4ai/39tgK9scWaD6TAg==</encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="VoucherNumber">
      <text>
        <![CDATA[<encrypted>c63hGbTmsvcAnNRj9I/8+kSBUzxHROU4n3/1+thY6OFkLkz8ZFyDOT8Xy2q/sye5gBAkaoivQ/wZ5luWAR40BO44bN4FSbpSQbUTbYLhiSJU8aizEaBCtuLib5ZIvTQ8yAkKFeRnFfiiDdIGmnjVvV9Wvgy+sNYdUaOE3gghVyGbL7aWbUy5QTiKlS3VBw6yFBI7mnDTCl2wI41XlKp5HGfznqDqeBhBca1uOPU+Z3wdwikOwc8fS0eVgGGAJk/OcXFK30oqlsBmSYya434KoT9HvWkxol4NRmV1/c8l2b4ZfKkPzjTxASXXgYsS4L4sEejZrQIsyDJG/o3io2mX8uv5iz3CwJ5wJpuLSd35rpuXUaXD0TLA4BDRVbH2E4Q12At2FGKW8QF1Za3VNBTZwTpmNdB8vZgU/0D4yONvlE3SXWg/6/J7FMhBajhygJvZy5oadcywrx0pGHxDGMq/m3F/zxnZRglRdMu6W4trzQXiZBh43KRhRikngPJvcS3ofyn7/6AAsfAsVRudpqBKaBEYO1QXWCzDOiKgQUaK55Y=</encrypted>]]>
      </text>
    </action>

    <action id="InvoiceNumber">
      <text>
        <![CDATA[<encrypted>TYBUZON2/CSPNjVYRtvQeKGxcEHZEM2pYCeFWtgwIldgQW+UFe9ZFDrwROQjlwGY6+8hXzVcCU212Nvt7mcOAS9mMPcr82iGAgKVuN2uhl10dlh/7z3nJPufzoGQ+IAYH8QWtAHZt9/2tOrIM1FWc6AWAgFgoW5DpgAIVeqbH9ppqzjO5bjopqNDnIkwsHQgQAMBCDsOZcXy7TZFWDOjZcRDEGhzPUZy5Vm4TjAhGeF2gluOaOaA2rfIoXSOoLWf5SfO5G8dYzKbOv/yWCC3MIJijwobzCuyJS1WLswmTqurZ/Wl8Loan614PIjax+rWOJnqveXctyCEKM9dBRq69yLHKQU4on/BqTnTJ6qP1C++QAb2OeeryW3Tq2lDevrwqCPmglop109zO5rZEGand1IC3vXz9AQIDKbNC0x3SmbYlVZ3nulvl7GM+nkWI1nsw6xct9Z7IOwUSzI8UxG6UEIYbIht/4LhfMJA0UQglKNus16OXo6Z64Hy6x+PAp6SyqEdWBLndur41SxSBI/3pCnRRz7VQ4hTll2EQcPLZE13lmWtbWBVOl5LlQgqrbUV6rwiUk4sKG7vkcq5a58oxwFa8YXAfDjrskz5xnaZ11QtXL5hiangrkX5WZv41npnQN8oXwVHKQJqBtPuv49PBzDAygRNDsuBHxlwpdrzQ66exmHQ9idGWLL2cJGKTMeBQ3/kkhMvV3eGmj+/NdJAc6xDKMQioB2GCDc73gPWKSOkUPHLZPNo8LpTh9xPNOlLSk1VIC0/Rx43k8lq2EsbsdguVoIBxSKCjTzeH/vENsxted5MSeZ5pUw0pfDhWR7XO0RHOFvJB25O8VsD5xCwsZyB9Lb1Blcewa1PAh++c9qeNS8cOzffya+4owpCiyA7wUxXiP1t1dLMBjdlWQuGlXPaHRmj9T6t1q+NvhqcMKA=</encrypted>]]>
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
