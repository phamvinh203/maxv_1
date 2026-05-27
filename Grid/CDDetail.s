<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\ExternalDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "CDTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'CDDetail.xlsx', @description = N'Phiếu chi tiền mặt'
else select @filename = 'CDDetail2.xlsx', @description = N'Cash Disbursement'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="d51$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="2" id="PC1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c51$000000" prime="d51$" inquiry="i51$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_no" width="100" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="280" aliasName="b.ten_tk%l">
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>

    <field name="so_hd" width="100" align="right" maxLength="-100" external="true" defaultValue="''" aliasName="rtrim(isnull(d.so_ct, ''))" allowContain="true">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="CDInvoiceLookup" reference="stt_rec_tt" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or (stt_rec in (select stt_rec_tt from cttt30 where stt_rec = '{[$stt_rec]}' and loai_tt = 1)))" information="so_ct$cttt30.stt_rec"/>
      <clientScript><![CDATA[<encrypted>sc0qyuXjd5aL+EIDnlnT7ufbL0kfMsrpaLG5pDafKn5WzhXQDu0CWUYJDxtqrcZSPXH0gpzoai2ePSzkFQ7JjGX+Bf6eChjGg84fXehmAH99ocqFafE5vFRaDjTdGgDUk5eEcZQ0mq9oP6+Dte0UZg==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" external="true" inactivate="true" defaultValue="''" aliasName="d.ngay_ct">
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
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - (d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end)">
      <header v="Còn phải thanh toán" e="Payable"></header>
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

    <field name="ma_kh_i" onDemand="true" width="80" allowNulls="true" aliasName="a">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_i%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh_i%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="isnull(c.ten_kh%l, '')">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>

    <field name="dien_giai" clientDefault="Default" width="300" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" aliasName="a">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_gia_ht2" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" width="100" aliasName="a">
      <header v="Tỷ giá gs" e="Book Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" allowContain="true" aliasName="a">
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

      <field name="tk_no"/>
      <field name="ten_tk_no%l"/>
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
        &CreateTicket; <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6iOq7a2FTtpOMAZBFA7KvHn6AZGNb31r0av4UYfyUSu+QT6pu6PDPYv27oR98mW8+qIprg1NXxe67BMlvzVAzrw92epZxPQx9R+aDt4oRsHBGan3zxJq3xFCNGeZgfldJQ=</encrypted>]]>
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
      <![CDATA[<encrypted>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</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>oV5J2cLU0ZrvjDL7YzyihiTNxl9HPUwRHpp0RJOnJaeu97smXg6jy7sUvcS5B5VdCcZAXf0xZVMvWrb24RySsg3KaH8e+p5/VFsmocvuILo440sgnP66MCXCbZjffy8thD6FNIz690E5209dKW+Iw7jnGNpY9y102KTvcRfgVznzw2ycRQY8NmId3qle1NJFI2YD1Rqfgh1BKO8zyYvZ+uoFYrEbOH/OezetX7RL3/XKbD9d78OwOUMnbwFrj8XsNXjTLzz8TsgIfVgkQDNiecDovOfA8L0Y3Nz6T5v+7266nZ0BQobTy+L35ijd7M14</encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="InvoiceNumber">
      <text>
        <![CDATA[<encrypted>TX3bRkSerO7GXsXkwIvckHK7cjBcpqPl6+pwE5HNR3CiR9b6vuslOfy8i/NpaIxNO/urLqQIzHcbDP25fZKN26OatHS2mq1dNaZ+FlIXoMJaMo7e+b0SvZaO+lGQ5NTolfeVswHz1/MkEv3TNWq7/HJefw4+Apq5w2jdeY9FUwksVZ1Qz3krFwpaVSewj41nmeh2mJkX/lNf6Ty3wXhmc66Dq9CWHYvCeW45P7XqjVQaUuek0q0OQne4RJJHzvVFKhiItu3NJKUTI6TNK+w58798SXkhNmokXF/RAerYwFOnKKrl2sV54QA+fODl+sJAny7rZMU0j8h402ZVSjW1TjzJca9wDXQlT6lJlmxINY31bZCO+31ztsChNKAEIn0wJWIZDVtu/oefFNRJMLntwHpcyVZJtyufvLlDd3VmtjWQiR+fgOa/zLVOTS2zrMqr3JriIzhkSlfqAae5EVD9A/VbXLLGpg3Fx8XHR28vZLLr4WIBCCS3j3uA6YHyG7KvXjOBtS3aVzW4nERtj4IrPUgbwzUcrJ4tVWPwGaLKkbWEA75BsHNqdvnjXIHHbEOeZ6APgIRNeamjFiEWri9h/S0I/KmD1tKSNdnGGHHo8rfrn3R1xQVFIJEXz61mDb46pDmjYHtCiiWfIK87U8GpF60dGFnGP3u5E1O2QwpAcV2S4jX2f7BMabmZ74+5km+z</encrypted>]]>
      </text>
    </action>

    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FlszY+jFcfpMN6+Syqe+kAAiJ5Wg+c8YWyKSfHFRGQ5ki+lCuW6VLXdmvm/zQdZolj4f5otOTy1X8AyobwhsY7+Cf9uNohRfnVvPHcI5LpVSgikgv8ZZnPSZRvyx6MUGAI4ESx3uIGzorOy6WPffm1UiVECBUGrXfjA05md7FH7EC</encrypted>]]>
    </text>
  </css>

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

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

  </toolbar>
</grid>
