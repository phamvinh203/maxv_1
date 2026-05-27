<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\ExternalDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
]>

<grid table="d56$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="2" id="BN1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c56$000000" prime="d56$" inquiry="i56$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_no" width="100" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_tk">
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>

    <field name="so_hd" width="100" align="right" maxLength="-100" external="true" defaultValue="''" aliasName="rtrim(isnull(d.so_ct, ''))" allowContain="true">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="CDInvoiceLookup" reference="stt_rec_tt" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or (stt_rec in (select stt_rec_tt from cttt30 where stt_rec = '{[$stt_rec]}' and loai_tt = 1)))" information="so_ct$cttt30.stt_rec"/>
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
    <field name="ten_kh_i%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="isnull(c.ten_kh, '')">
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
      <![CDATA[<encrypted>zX5MkZWtFbV9Xa4qGpXmUILua/JSKfIH1Wo6OeutqjkOTuMI0DLjr1+ZWZ8Q8u+9Ih8XatPIrglQBxaEFg1omqzjW+ApotYnMcbwBn2m56IVB2coprpR9FgbBi8ktXXnIqutXoHlbjlES8888C1jDx34xNUjxNL/+382QMgPF50p+f5LXpoTb8lbr8kZTQ1EZ5ZyO9jygmvij47tUWQJlflmWHbUtlnr+9z9NMIvUmasfkTALpHQPkOTPcRruKuoBc8e+OW2KWjI30JdD4RAAzizwsxCpliYvplmMlchU7rBDe1e3vNQoGRJb8oQzL3gjQxw7Ue3F8dPfS2ADhRcbZKOZ7hhveGS5pZAEPkYMCZt0kB8YNmL4ipse2SulrRxoVfEHo5u/HTjdEYJ9R5a1ke6mK/0OvuXf9m08+Cwqpm996hmm0vQ+hLzpYclR+48KKt3GwKUNKiNKcNQ2Z1jIQznzTe2KZYpTFCxSh3uDzbsYRFkBITVHYWwsWj3Kdwpi90YyIkOB5MSI4j7hiez830abgrzr4otvMH5Guy7CvqEZ5ApBDEBvp2N9gsEWs84NJ6Zd1gXw+ov3D/C9qXssAei1vsLKfBC5jV60a9u2wECU74DYsxFeM04uR/+E9+4NNmWR48JBf2oK0kuSP2plIaJSyniSca+knrBzv+dZtpZ3Z2tVeKCEI4op6b8VMrImvBZPYdjBOwIsCsfii6wqAl/UdoZZWmhfSyfKKP7H5KkUzBI0gQotb5AU5W7lkDvxTYXa+pUaRg4ljZKJRolZFnkRiMSYYwnYfKt5N1R1xpjbgU0fV/BpQntFJ/lTbxUVxWqDKePMRDWKwqo/WHtfFfDP2FYa3zONK/05OB2/vHQjEnLfck0UbImXZnZKDwfTD/7fVcPK8Qh3Iq92S9phJ2wCLU696mgIiDpFT2vSQnRsut+cb0mocjB95y7PIVPK32QT1kJR3yJ6ivZXS5xZOfwrmXBOsPvzWDs7+vXzsn9VlZfR9gQK3b5mWG8Da8YdMEiQxJ7ctF2UQpW9c9gSAJY7BIW/hE1j2xB4g/phpaBoupnEdo2jlcOOy1t3qCFcSiCfwFqJ0lwtoXU/Vi5SfVldAMZDyjKObQ6qo+CsJxInE11flmDFWcpeFUf1gBlKFcaxOvZlcRCxg100cwBC5cDwmzB0hWmBocskaKA8MoR+52RMpu3JMM65WxTmHdENHXoW+AqLaR27p0yemTEQkCGbawVmtxiZEACaKz7p9ObZnjEm6TXy2i95Y34fzn0JO9F1TuFDkNpmSM05u+0kmQfqGNZKv1ejzAmoPr8/8RAO3axvfWSOHMXH97cIEiY+QtlEgwSp+TeXDsAIAtwWh+PNDRvn6TWVxgrHKLZYm1hGdQbM5NjzKTfLp7BTMIzcO9mv44Hqh/HsfozrG4FT/O0ArkRziqvn/PlK7pKDJNzOr/tdPCq7PzUFXuuemY3AhWp2rofUkN810NaSV6fxFobCRXe7S8YBOLCBwMGa05UGs9nmomvP+jJifQpIm/HlBssihsLZNi+o4/6jP8ULSZZr91ZEFMyrIpLkRz+O6bm+f2o+vi0ma4Iz0/dGXfGSdqltbiiAo2UandOehs67Nlxb5zNdNCdq0tq971h5n9sWm9K/fPfLXuYhLXPna8QODXHXLbU0ju2L0MXp4TrTeEhEzP+pBtUCK6DjP59J8/Gn3wq6IKN/JOdNlUgfho4mNrrMj8YFcxaSZ0d2lkOC1KhJZgfkLa0XfLMewB+e+sqUl6oknMxZ2xyaMz+KSykOWf+zkROiUhO65s9tKRlD/TiQNyHUSxRt6aNElkRLpw=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>oV5J2cLU0ZrvjDL7YzyihmiwwuUH4epQtrevlDFpnVetzJY6P3CN8rUOq7xgTR8eJ8jOMB6jRtxFjm+NzbXGSg9D80vxC132yer+/Ch1EvIIiXQQWeoUURFR1qmSrCqFjcKYGE26lewkIoDzMpGLddKHKy0aJVMts51XQJApoJpv+40wxn8/IK7OoPxFQB86S+wveXryUnB0tlpGL1bhinXUy7+93iC5YBOWOTA0aeonrSUX39Q/msiYgClOwChxXnI73gUOefmXzxQEdJmZ9vr/dtmRY6t2G9nrF3kcqH1kAjlEkksjYC9uuXHdNJRg</encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="InvoiceNumber">
      <text>
        <![CDATA[<encrypted>uQ3vPK90hAoKxmehRzBXi9RbOTPt6oj4LHd7AVCQoUdY+LD3ratF5DRyYibh/XGtcWGKe05GxKA9KuaAORiC+ISI7jsXQunxpCazC2K3oIGBTdsvVo/6pai6Se/cj9wka3KCUMBSo+1+iNAGejm0QyymIeHfCRRienmTKjxJTsGomFD/DfXAA5eZLuw1ZWyCPsYNk9P0JvjVvxHS5D1nItogDgptQhr1miajFdUbns3bxpmxtRvmKoF2rlhPPrjK1M9UhFCewcK5APhfjQCPN7VuvNlcVvpSTFVKiRT/tTu0msa6S4bdYjvXYLvwpy/71GUNi1xM0/O6iszPQlyrwI1F+eQIw+cLGWtyra5Pa7oX9I8E9fnuRY7IHfugjLz63Macw9xV+D7RfHJaL++T6nsQhp3uDZZZZijZYiszE+aSJHfqhiKHrOU4B1syyCtZc2M/FwWn82NHk6eKyp8OjG6h0n1c3os9dyGXPcIPe/PyBRtHU04DMoVLrh8FfXTP+5zDfZFk35r1IwrIfAhPuDXlvslj2FbjtcRUCog7D0FKuZ3anQbtDRlzUTnFguHIqG9ybhR744MlkIHPaSUzvUlgaXLLuifYBk/5x7qBraIJE4XKbRQmYWvt5aK4YVhhdTiUDPlYLZbI4XT31DxG2hpwM5puxm27C7KrE7BFsnqJTOqegVISRGkhKIt+yN5U</encrypted>]]>
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
