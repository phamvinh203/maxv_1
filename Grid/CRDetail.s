<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\ExternalDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d41$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PT1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c41$000000" prime="d41$" inquiry="i41$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_co" width="100" allowNulls="false" aliasName="a">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="280" aliasName="b">
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

    <field name="ma_kh_i" onDemand="true" width="80" allowNulls="true" aliasName="a">
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
      <![CDATA[<encrypted>UXIgWOvl/XsJZhOo5I0zODynvP1Pjo7HbkgkRc4ej+/i6Edd7P2pdvHhUGAErNQxzpEw7Bub+NLMuwJ11MVeTPESApmponNQkRtJYMvB4wDWiyWCUbzDJCX7MwBPVXJ0K/HAmuYZgvRgJf/mW5YzDFs8Q5WZiwDhowf4QDXXqiJFe3EOjcM6CY/AQNnL/ZEDb7TiJeKhCgLUdTpI0g0c8s9NJT/ENcMOjHWNc+SddB9msXqjxU8Uv/fcKMFsHxjKjsMkDMdzqyxqsv6HJZ5tFsEDDOd19p3pRNoBmmQkVU3fK9IolX8QZV8BgN4UJNhpEv5wsmGMWIfIh37cDm/MJMZWSRhD5LEpt4wTNIm1bTqa29MhIEX7H+MlPIXzTSR1LxtOtIeV03VL1fdv2pTonQLurKa4JiznMYVu5LyOsAovb91soD7eCYdTRxZfHGSlfNwxd27ssrWCl1cgxsyh8YcS6patOm4QbRI4J7wlzaNIjoe/qnEMZ2sqWgSj8lw0Ht80+QhiyywzMN79dRJU2Cq3h3Vutq1S+mLU8E6xsNDnl6cI6KjNxUywu5FxgZsJd/LdyabULvLIegFMQpsqXIoaCoW5phBY7bgBifi0C7tjnmSxhnKDt6G3jbzreS7JerTOtNIwIca7ZOMWl/dbJGML0mWe2Sugj+fPSi3CxCNCZESMC/ylGp9zR0G1a0mQxzF9GGN93A0dSmqVeW24RInMVaoQFtMIuYa24tWFUzXO083Ur5XmoW6CBQl85Tliaxh/60Fi6agP9h+sdWo1S2LDe9YvMa4bf13ny8c1DWUF/GhUpcf3UygPP2dvjzOJCoqtTYheIuPrekkrDZDjhVvEONMsTwtHdTMdS/tXDb+Qh+RBupoUMOJ8/ePCESLcqRTICjlwoAG5hVpUYlOPx25NRGxDcIx7pENnqs++sFoseBry5j5xlkPHc0+Dp0UuO2wsO+J12NPNDFsDp/kEmP/9OkrTozHtcLPVWAmYxQO5vwXRFxqVy6hWmzOkSq+ZzVfO6BQ9vmsXbjCweoe427IcuxCwHyBQjVrzDNurr5SKDeF44rcT2G4WtNbTzk2V1H8ExmVIa5DkLW1rR78zEERtoxU9C20xWNUAWuA8Z+VCo3eiZ0Ca3G7FTeusxpaNnujmcpg3THxgsYkenge6XaE92Y/MDiSkB7TNQTpIHoxHP82yyLCmYjcOJgMcjPoS/2LqMsGe0jp090cUl0gt1cMOETQu6PC4J655Tcqei1j8BSS2U+iL/LHrvQ5gE1mIK30gx8Z61GluV5Zb+kZ//cJjUB1zs6KOl7TkcOhIDD31x2a1iS65Ukm2E8z4TXbncJyHQF6e70JrGdQqegYkbbE0Yo16KWPSU4g6+HhoGWpYBJDWyrAF+13xTMn6hc2Evn/V1rdOi8CTbro6DxPW6UWc7P7VmMwejm/8oOc8E+NqJBOOiYqnSgG60hL+IinJAa3mqlOoEGcdFomDZ1omXrR//p60M8nsb6fFxxXAGlmije8jYRHwUqa4L38gBP0W7OjN4qEoREMbpKdGO5cndisgdZSP0ua28c8Bm7JH7w0hSTmasBL3ffMWCCNkfcCV+mv8njCv4+ptxUdkvpNGXnq5o185ZHty+P3pTIKVxWvoW4XNNo2G2s6hm/TaQXXGzJ5l7Nt2rRSpe+80+o/b/uP06wF6G0VFjvh0RT0kfn8OWz19IWWxpGjGtamC3ZEpdM0VOJk7OJ/PE088NfiyMDgO/PsYPfdyjxVc2hvXI6N/BGXiSsNVTo8Ld3hwmN2v</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>oV5J2cLU0ZrvjDL7YzyihtI6uLQ3i/n7HyfATa6YHd55XPj4omfryr7iOeIVuMINYNXBjJnvI4pqFF8bUwtf+Ob5NqQAxtNm/imzlmmdOwiPYKmtjTIqCVDhLsq2SikHOS2t7/dbryagrO7JourNwW0KUyA639vREIKFXQ92d5XUq66MmdTFaRGrnFvXVjD48kSs0WOjbkVo4IUr9Tl09BOCke/hd2YYohZnOvUvdfefAlwZuJGPuaxtk/83+AtOCri8wfB0FPjC9AosQPoARvKbAotPAL05+zCky1ulX0yAFAEK16GJAyxagYu2ua+z</encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="InvoiceNumber">
      <text>
        <![CDATA[<encrypted>TX3bRkSerO7GXsXkwIvckPxY1ANfMYUvMBKWthISWcxuy9TlPRruUyKSkjkTcJXJtjj557pMP4zolWS/1l8OC2gwFsdPAsH29FzFk81eygJ0HCBSD4EBTz4flaJH6HmPQNT3QzF0098zukFak1gHz5HAvrqjoRjilnKcVLxEQPVqPiDZ5A/aRRoYLwJ1e8Vb78o/caSUpFriKXH+K+/LIYQdqC0hDPyF3BcdHU625PppcFcsY5OGkijcxLkTgONZ+C79S4vyqJ3az4COyswwaimLaTyMlnNFLKLbCzXE3ZS4c0bZoAbs7tuIVNz7tGpomYAB4rP04ooNicoa5MiQlN+3mGKa+eqsjcIVDmsXD3QiNenFhkSWnQFzzRxqWcSrO8bZ8kMtTJEClB/S6xO8DrcqRfNKplLB9hUqa5gEk0rtD7N1l7wN/Q4AitdHUIZHzwkEuH5gqCgIcIR2Fiy5NpJ+xvGf+3I595SWHnnFyk40rmQoJr1IM5F7boaCVdbPFN0jcHjZpYWLpkvZdVtk+lYIJ8pvyffIaFcugslRRJTn3/DtFAV++FAJkq7/xuB2HWDYfD3RZg72NpQhHp4+XOuhuU1g9gpPv1DT2Xxzimt3X9qJ0ZeGxpcYJrnJL6SeZ+eQx042s4jCcQVWrzWc4JV3Hap4bzFUUiMggsESKLV8FpxwQ4sHuni1Boo1WMU2</encrypted>]]>
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
