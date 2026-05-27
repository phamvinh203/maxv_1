<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="tax0128_luu" code="ma_dvcs, ma_so, ky, nam" order="ma_dvcs, ma_so, ky, nam" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>8E1McYxu5F16bWrD/bv/T6e4KbBYWi+u2xFenWZK4fJw4l1ocrghLswFFAVjzBPbCGPvV7uzrdh01aUSXMSpDmPjZ3RwDtl5PdQunXpU0iVrD7APJ2dWmCU1ssTjW820n1qXVHlxzTG43WIK23UCd/q6o+zl+TzGMz0shmjukPFT17rwvyANKutZpkZkHbuClCnkmMbVS0QiZltsbC55rZwls/lsej8UeKzMvZw9p+o9Mh+LlN41TZBm2dmKk5VE/NJdldAzmGYRd3CEJ2FejjuhOf1dKiEOmQA334mDkIwynzV25O/7/ciNKSbKRbJjhtTCf75o7UpxMaGAP5xpVrDJnwDdAp3sjIRh2e4atkIFc+V+05jI+kpeRzkyPiK3Z/u0eAoy8mVPalq6F+HK6t1qyrH1LlQVPek5R0GR5fpaU3QxZgiQpIeDUAA4yF751yKBUhGIh/UowyT10brOrwryFyHV20BFPinQuaJfSRh6DnHPDTbFu9Wv5LcKt7FvOOSHwfWZPAuOkX1XLZJpnTj+SaORwQT0QJiFYhSRvFQTE2YwPV52pt+axp040+73DyLp5jFChW9wk5CWkeqbKX/OYwhNmmc9BNFnYnE4D4jDDAzxaZSdXMzNrglfdgmM</encrypted>]]>
    </text>
  </script>
</dir>
