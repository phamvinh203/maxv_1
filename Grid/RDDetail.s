<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\ExternalDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d43$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PT0" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c43$000000" prime="d43$" inquiry="i43$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="so_phieu" width="100" align="right" maxLength="-100" allowNulls="false">
      <header v="Số phiếu thu" e="Voucher No."></header>
      <items style="AutoComplete" controller="RDTran" reference="stt_rec_phieu" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and (da_pb = 0 or stt_rec_pb = '{[$stt_rec]}')" information="so_ct$cttt50.stt_rec"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPPqzL13hLDfHMwyG0ENMYpMAJqpQVhsMhiwziPj0vsULA3oGhPuP/rRkU6AtNh/Hqc=</encrypted>]]></clientScript>
    </field>
    <field name="ngay_phieu" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" inactivate="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" readOnly="true"  inactivate="true">
      <header v="Tiền thu" e="Receipt Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="50" inactivate="true" readOnly="true" aliasName="a">
      <header v="Mã nt" e="FC Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="0" width="100" readOnly="true" inactivate="true" aliasName="a">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk" width="100" allowNulls="false" readOnly="true" inactivate="true" hidden="true" aliasName="a">
      <header v="Tk" e="Account"></header>
    </field>

    <field name="so_hd" width="100" align="right" maxLength="-100" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="AutoComplete" controller="RDInvoiceLookup" reference="stt_rec_hd" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and  ma_kh = '{[$ma_kh]}' and ngay_ct &lt;= '{[$ngay_lct]}' and loai_tt = 0 and (tat_toan = 0 or (stt_rec in (select stt_rec_tt from cttt20 where stt_rec in (select distinct stt_rec from cttt50 where stt_rec_pb = '{[$stt_rec]}') and loai_tt = 1)))" information="so_ct$cttt20.stt_rec"/>
      <clientScript><![CDATA[<encrypted>sc0qyuXjd5aL+EIDnlnT7ufbL0kfMsrpaLG5pDafKn5WzhXQDu0CWUYJDxtqrcZSPXH0gpzoai2ePSzkFQ7JjDUVyvUeSatwKQn8j+TGv60WOgBnfw3PugE4FBBokiRP</encrypted>]]></clientScript>
    </field>
    <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="80" readOnly="true" inactivate="true">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>

    <field name="tien_hd_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end">
      <header v="Tiền hóa đơn" e="Invoice Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="da_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" external="true" readOnly="true" inactivate="true" aliasName="d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end">
      <header v="Đã thanh toán" e="Received"></header>
      <items style="Numeric"/>
    </field>
    <field name="cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="110" external="true" readOnly="true" inactivate="true" aliasName="case when d.ma_nt = '' then d.t_tt else d.t_tt_nt end - (d.t_tt_qd - case when e.status &lt;&gt; '0' then isnull(f.tt_qd, 0) else 0 end)">
      <header v="Còn phải thanh toán" e="Receivable"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_du" width="100" allowNulls="false" readOnly="true" inactivate="true">
      <header v="Tk có" e="Credit Account"></header>
    </field>

    <field name="tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="110" aliasName="a">
      <header v="Thanh toán nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tt_qd" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" aliasName="a">
      <header v="Thanh toán quy đổi" e="Payment Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt_hd" width="70" readOnly="true" inactivate="true" defaultValue="''">
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
      <![CDATA[<encrypted>O0lSixmFWHRUi1hVjAiTXsWmhVFjKxTaDrxz222oTUQWNARYXAqoFl+n5eyYQQ13Jn3EBrsX0xbRkoB/2FJn21AK9Dqt4BPluO36ryQiryKtRPZfDhtdjpq8b4NHUfOp2NoCCsDVRD2kDd2QS2dpdTfiUZRFOUMGmkCfduPHoof2KX5nta98ky1EgHG3ih4JbYDmHvmmu2+aI4OgY8JXTTTwdZPjutSuRipXPiW6tIHu15ZRBV2O4F3Lus9JJebnRTT+tB0Mg8e7FBf/0qaCe5BaaE03f00JT4ljxXc3Cy7WuNwsYg/sg5XH9CP3JEvlE4/wrPyGrHwBSEmWuDRjB7rZWBqCyPw7qf6MN/ciMZ0Kd8GhpW65i0pf8QC2VCVBMXX8Yv01WnDopprnWeX8OdRCETb2PThLUDWMqZIsf/X8M7z+jXk/RYb7F/im1XF413bv5mQt/ONIaspby+jUUMNYwd6t0ZZQkbIx5wRmGAXyrm/Qhl5wubEwmd2cK+JxnNSvevMc9b2Ei5l8NjXF1FVXhHEpNgv8pU7W5IeEwrUon7tDnw3cIztup6VoY/deEb3RI/eZFn8xP4P6eQ91bRjBR1SDUyxVQF3YD9F0ZePd3ktCIBzn3Jxe2OqRkScnYLhQHc5Dqx1iPGLcy01fglT8EF7eXg4Y7Pfq47NarsvEtBa/MUvrK67Tl4ruaQQHznJrXkHDAaJrjeGR1Juq6nKXxWHgUJcWdxqjK7gDR8tpt146nxJvOT76QYORsb0WNnOGqjdSWYpP9IW46eLog2q9dj/cLWDO9Bq30LT3WqJ/LixHi9oE8VNalu6OWKyiju0aOop4FqHc4CyKwqrLLCGkvldK5Xiq9sb0xTE6RE0e24CQ0CaTaKwdcXMTiQGbGGMjmXSc4k7xsEyuo/UC8fgSFClBytkhFarf2Rhgmc8v+7OPMWX5ll0QF8wOUa+gvbmpNp5tjGkDmOv+2pulLOwp8VCf+emNVgFX64iXoMvtmfKL4SfLEaTEWXBnOESA+1KKcfkuxuZ/9jqEeGimSLdInv5N4vNv1Wl2shKctAuL+xgruuWc6DF36dC3vO8ug7HA9CeF56FFlsZocCPVSQmdw/sZo8T57qlaYRmKunJmdC7EEZ1HPREkflteSkd7vPUW0TvH0dnx2CwpsZlma0GUbMWAaeVoIU5XL751OU/iqJlAPdp9x+/JipJzy66S+2GqtwmCBxlfSCXTUjFu08ygvYnBKvJtKF7vuBPUmzUKNNEeT0uSq1aLJT9k2XlGaJwNJkgZrQURhcoJvF4yRqxb8Xax98NgEFKxgWkXl2BXYuZFtcikYAsjy/oq7xNgQLlAqoelG4ZGt25SJOdMdi4mnTYRiDa4jZIhe4Jow5wIG2I8+wZPfvQLXE8ocuY4J8RHXd4XSbMUb77/8S7o/mfjfn1zH3w0JuLDyznN3HIgMHYkmxt0G/mrhaXnFyM/tF6xk9UyVzIVaPYcI16eq52Awzyp/v7Yg9InzKLuOZG4wQiFb/9pauYg49Jhat1zRtsVF2VkhrVeqXK8zAe/iBNVHROuXpgnbuoujnmisl3ZTI0y5rXVkGIExcfyc15yAyc2B23UKqFow8B1YFXu3g==</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>GWHXIgdX8ubb3ZquVWcjLyNsvdS1uBwr4jy3Z1Kj5pSXNFeaARWQOEH0xSSTT2tjH6xzTLwKEBsMBXiA6oE2aiBUDb4rm3Sjta553Yz2ux3wZR3EuVjIjoUjbD0ModDswr+EBh/r0GITATn7LSOU7+WgQh7yYg/KDxyeL62oRYZcNfSdIqImqUKXAyDvfHesvL47jsJY4zBYnHOWwknl/R6LmydRgUHRjvLj6qIcGSDDOCpTEsRfthmIVJeuyYV0Yolcglbx691IFytfoiwSwQ==</encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="VoucherNumber">
      <text>
        <![CDATA[<encrypted>c63hGbTmsvcAnNRj9I/8+mH1YAwvL5GcbGKeLvJbMuWcKYbxs4ztcbFUDvyRC/DY0CflhUO7hOqIkJuckNLySpTr5uC6qe6UMNYsHXikD45saDzQh2oKs/+VS1cS1a0OcVwSCTxeBvvahD8o7/QA1T+LkK4nRYmd2TjPp/93MpCkN4IvoP+GmHPahIWVdymiiIrr1VvOWJMeUccb1Vu8it+D8RKN2ZIiiS5AEtxIiryNBc5Sw3fgoJJ4noxha0pPcOq+t1DLXtwmLU2bRzdufKQPmAAzzlwHvEHb/SdkIpyfichFy1sR5fJT8yCedJBIVrV0b8ZJsm56LJ3rI9uQouhSMUbHMlayPUmW9RvELEUmqJWTorBNxBP1QE1QCxbvJWR9F/XRqBSLJG1+tqsa94WgI29khX8OFJALHDSz+tdWlrFmX0sf3K8I35wxf1N1YdKBNGjUzOaFgBKxhn0uEvxLkPSp2rY9BIndTuMT/rBnPSTpmq5x9b1dOHGwWOgvgg5NR77HK6pdtzE8h1s4Y3X7sijF2IPq84Unrb8kG3s=</encrypted>]]>
      </text>
    </action>

    <action id="InvoiceNumber">
      <text>
        <![CDATA[<encrypted>zAL0/rypiZIA1eDYEjysKzrxOR5gI76lLeu25PuypTB7xXrxbypBHWX7Dm+HQ6Zdtz2VRzbosMbPYiaHS2fWA6cO3WHo2fMFy83bSk50P7q4+wjcubIzD9zf27Sjr01j+0x/pNtxrkB6F7FklhP0CgCQcmTU0nHXQewF6rY82FqQLvAazfitJVqe9ZIbvCy7+KpqPMgfUDP+RJcm050RkL4c4O/Ki9sAaREmVp5/6LF07xceokLhwbMKK9lNKJBHHPcFnrLuu/n16SDOnr/EbQLWnmHsPGr+w7ym7UBfbRhSCFR7Q3tHvobTE3wXeRiA4/mXBPf/jCUUdwoCbGPXgW9bPQkzOderJWKQB0OfFtT7WamaeMQ2/7W9p6CGG/nt7/KVR0Uqsm3BSCn1YRO3TpJ1TyyOV8WMGXtUHk1CIt6TWq7+5LQDedlZ0lkCUovLrCTYuwIMzwV+yXnTUcuq0ARQkXg/ekWPQqUsjmGF1wJrkfHl/KUHOVuzBVdtMTNUsaWIANucfH2N5Z4WndUAL6JWAZtNS32bOV53SkiNryiliiybZGAHFCCup6yFsHsKgNNHyp+9yO7DRuBtsz0f1pKEYSBwONVpFj0kjN2y2C/2PqVdhv5IN/OH05ACvbp/ezpro3QM/hq+PLcxON2k5+6wwvcNzpDngKexgSRtNljfm3+dPUZrtUbi9ZKYNy2aKgsHgRC7F/xoB24UJTKrBAahaKlAwI1OAAi0+zuqxbJcaV/owT4BR5mwbHXi/7hHx0lHyXMlLHu43BFasKJ4cDXKvK5S1Ykj1mfzZbrhFutMzDM9SXUA2eucpgIoaJDFzL4ZdROh0w/IWZBvaj3xuc3WQeWdYQ6ZjKlGIM0lmuyPjk5XiYuck7ecaQAME7WgmqYo1pglZ5E3YwfOfE2vfhA4ou7JpQPJNAOeQTixF0Y=</encrypted>]]>
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
