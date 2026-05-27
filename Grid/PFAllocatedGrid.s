<?xml version="1.0" encoding="utf-8"?>

<grid table="d73$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c73$000000" prime="d73$" inquiry="i73$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="' '" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>

    <field name="cp_vc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="100" width="100" allowContain="true">
      <header v="Chi phí vận chuyển nt" e="FC Freight Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_bh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="100" width="100" allowContain="true">
      <header v="Chi phí bảo hiểm nt" e="FC Insurance Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_khac_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="100" width="100" allowContain="true">
      <header v="Chi phí khác nt" e="FC Other Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" hidden="true">
      <header v="Chi phí nt" e="FC Charges"></header>
      <items style="Numeric"/>
    </field>

    <field name="cp_vc" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chi phí vận chuyển" e="Freight Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_bh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chi phí bảo hiểm" e="Insurance Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_khac" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chi phí khác" e="Other Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="0" allowContain="true" hidden="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>

    <field name="volume" type="Int32" dataFormatString ="@quantityViewFormat" clientDefault="0" width="100" readOnly="true" aliasName="b">
      <header v="Thể tích" e="Volume"></header>
      <items style="Numeric"/>
    </field>
    <field name="weight" type="Int32" dataFormatString ="@quantityViewFormat" clientDefault="0" width="100" readOnly="true" aliasName="b">
      <header v="Khối lượng" e="Weight"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80" readOnly="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>

      <field name="cp_vc_nt"/>
      <field name="cp_vc"/>

      <field name="cp_bh_nt"/>
      <field name="cp_bh"/>

      <field name="cp_khac_nt"/>
      <field name="cp_khac"/>

      <field name="cp_nt"/>
      <field name="cp"/>

      <field name="volume"/>
      <field name="weight"/>
      <field name="so_luong"/>
      <field name="tien3"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Wd0dIQ3Wo4nSZEeaT5LWOr1/fRvjuC7k8M8oLjfdAawGmdha1kzqaKEoPRVBicvRBjDXzd1r2tVpqKnRoRZ09g=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7eJqdIhJ+HcJL0wagazhWXsOAchgKRJkAE5SA+BqjE7HEri/IPFnCyLXUVZYPKfaQUKimlNYgxLj6FYhqjLiJitbbpQjDkOkeRIJoQ+pjm2/</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>MZMMBVHgTxVW2AuETJegTtM3OPSDDiH9qzvQGA0M72JesmwuDFOu78Jd9GrlRXhFbhOXO4dcD02dSc6bZ0BElO2p9YRHiftu4We+BxH/2owI4uIfWfdWV1b4Fp+nq4Sb033p+iAR7cvYq7ElA/aoW5Vztd6UXJSq9xBDxM7KAsErYQfAv/WAZ1spavOXYc92I8QpMIldidyE3bDVcKaumNlGK2bvM5MbR9AMeNJDavF+Lb9T+6CQc3U9ZCsV3wQcgKvcXEQ3evN/R8gQIvadQvapR1qZFFy4rIqsAXEZTV7lagwtDAHY6dBJXvWpoV54Npc0zKgAgrpgb9J/ecz2ekQKn40b8czr2Ejqnig97wL1DYKjoKKVqFDP4JWKn87x0v8mQKH/if1LRg+d2CpM63VUyoEtzr3jo4WD2lwrpSUm9+HGizImESl9QcN8HbPRZzSpVKeWjPR35YrnUJQgJQmTI9N3PTB1osS2j+ReUuNBB7a+NIXh+9mxDcltRG9qCyvwn+OqibgegoQrVl6MF9avMcdtq9Buuv+AFFyKfuLyqBRu3Hfb2Gm0s/CQjf54OovNXGBOkfBYdWfVS+r7YBP9SAxklQuzJA2M6hwzr7sGLEitlnIFRvV+vwikMVfrJWmjE68WQuQg4isfkQLrmjs/5cdXjCb06AXaDkQCrgSvYXtI4YTCpRU00eJIooYbcqz+HxUHiWUS72g0t8RL1cYTEqkcSXu3fgFOBsjRKhtQIhSGQdfHP3xE6Ns2eETD/CbTiDYDCsjeoZT0Ax3Zz7VdiIlZToXs8HGyyjInI24+3DkStQwYj6p8RdoqXfttvhHviiTWPGvOvfm6S0MU+MLxEEMck183OjlMXaqrszj8Mpp7gWQPR1gFnA7NoE3YG3IpfEp+eeqHOozlm8XCk1girQDuS52k1Roae1Poze9ekAnigZeFkdnaSMr0k5B5739TkHlcAGThM+S66rpY8mm2vQuPbJobmxfUrSw4Kwo=</encrypted>]]>
    </text>
  </script>


  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>CmWDdXD9cvnJN+g/n2/cFAjjezW3e3WpvKAHIcYKSA6WZirqUSKbGM2hubzXBSvW0tFWd5Wskn+htx40jJCxizv2leJ5ArTG7LOWN/h+TKfPBHvVbsr9F3iUExJzH5V8BhY9QVrdIrfpHZqH8BruuA==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
