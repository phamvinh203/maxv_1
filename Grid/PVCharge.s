<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLChargeFields SYSTEM "..\Include\XML\ChargeFields.txt">
  <!ENTITY XMLChargeViews SYSTEM "..\Include\XML\ChargeViews.txt">
  <!ENTITY XMLChargeQuery SYSTEM "..\Include\XML\ChargeQuery.xml">
  <!ENTITY XMLWhenChargeLoading SYSTEM "..\Include\XML\WhenChargeLoading.xml">
  <!ENTITY XMLWhenChargeClosing SYSTEM "..\Include\XML\WhenChargeClosing.xml">
  <!ENTITY ScriptChargeInit SYSTEM "..\Include\Javascript\ChargeInit.txt">
  <!ENTITY ScriptChargeClose SYSTEM "..\Include\Javascript\ChargeClose.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY f ", t_tt: '[t_tt]:=[t_tien0]+[t_thue]+[t_cp]', t_tt_nt: '[t_tt_nt]:=[t_tien_nt0]+[t_thue_nt]+[t_cp_nt]'">
]>

<grid table="r60$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="2" id="HM1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c71$000000" prime="r60$" inquiry="i71$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    &XMLChargeFields;
  </fields>

  <views>
    <view id="Grid">
      &XMLChargeViews;
    </view>
  </views>

  <commands>
    &XMLWhenChargeLoading;
    &XMLWhenChargeClosing;
  </commands>

  <script>
    <text>
      &ScriptChargeInit;&f;&ScriptChargeClose;
    </text>
  </script>

  &XMLChargeQuery;
  &XMLStandardDetailToolbar;
</grid>
