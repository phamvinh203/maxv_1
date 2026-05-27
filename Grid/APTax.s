<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLTaxFields SYSTEM "..\Include\XML\TaxFields.txt">
  <!ENTITY XMLTaxViews SYSTEM "..\Include\XML\TaxViews.txt">
  <!ENTITY XMLTaxResponse SYSTEM "..\Include\XML\TaxResponse.txt">
  <!ENTITY XMLTaxQuery SYSTEM "..\Include\XML\TaxQuery.xml">
  <!ENTITY XMLWhenTaxLoading SYSTEM "..\Include\XML\WhenTaxLoading.xml">
  <!ENTITY XMLWhenTaxClosing SYSTEM "..\Include\XML\WhenTaxClosing.xml">
  <!ENTITY ScriptTaxInit SYSTEM "..\Include\Javascript\TaxInit.txt">
  <!ENTITY ScriptTaxClose SYSTEM "..\Include\Javascript\TaxClose.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY f ", t_tt: '[t_tt]:=[t_tien]+[t_thue]', t_tt_nt: '[t_tt_nt]:=[t_tien_nt]+[t_thue_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="HM2" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c31$000000" prime="r30$" inquiry="i31$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    &XMLTaxFields;
  </fields>

  <views>
    <view id="Grid">
      &XMLTaxViews;
    </view>
  </views>

  <commands>
    &XMLWhenTaxLoading;
    &XMLWhenTaxClosing;
  </commands>

  <script>
    <text>
      &ScriptTaxInit;&f;&ScriptTaxClose;
      <![CDATA[<encrypted>2njCMH4JfoIFT53EnsiyUsqUV9mTfrETQI1DBKPF9YiXv1JmAyi8A8YJvvwBBbcdk+m0RgyfrHk00CewPSw+xG14Jgk4CMeCYQNnmVbfvOddD4A5K7GEw1DPn4cBb9GGebUIEkp9mK8io4Qwz3iAhkD9+ZiQUGUptqH18NM5QWgkKg55KsJ1eJvSUsRHonVnkmF/5XQdfm6VOzXFDQAUT0bX2IS5HCO9gyEDVrYFbs4EzKVGSpse2oI4oWvAcitLTVe8OGoyOsnx2bqnc0Gmq1LvLokE91b4aIa17pvikec/p/rSYPFvlPqJXGzqg6OW1eyMYEkfbA8Tme0Qxnf9z0eb2b3qd1Yq9d8dd8OQTZAXviUeFBlgJQyvHspGQ7TY9vZoSZh3Hltp449ZziAu8GwOD1iK4wFML34diE4KmF/+utdQC6F3FsdV656u7Q56eW/+SLwjZztfELmHdNRfenUI0PVEa/j4qQAUbTO3c3HvtrI+wChTz6Jh8xE/mpC6xNlVpPgds9utc542I2Z7Sl4tmT3XHxffqqVZx6pnaYc7xixYwKddIPV+i65RLBR00oJHVFIZlHEfPQbLQ/bc+9O3eFRO+F3QUAbAKxBV/OOnY6L9IXa6T0UBBzsjjyLLUhodAKSuUwXqTR0wqx6oZw==</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>
