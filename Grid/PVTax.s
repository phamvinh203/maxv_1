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

  <!ENTITY f ", t_tt: '[t_tt]:=[t_tien0]+[t_thue]+[t_cp]', t_tt_nt: '[t_tt_nt]:=[t_tien_nt0]+[t_thue_nt]+[t_cp_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="HM1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c71$000000" prime="r30$" inquiry="i71$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <![CDATA[<encrypted>D0wR+R5JI8psEn2I5NYY91PQpWhwZKJkq6qAOd/TBuqmCJpXg17m+w5HDa0ImacdthJ1BAsZQhL36h3Mskr2E/ebY59WY5SKmCIsNNhGGcbJOV+fNqzrpqJQGzMLzGxgiHa0F3+gUxR2QMerHuJMzWL5O+p3b1TY7JZAOwlDQk90TULswLd456ISPSP1TKT+uxnxz9VdygDdfMSk3SZ5FhtlF9OXx8cc+4SK54Tq/axREFrF6m4gHkLa1f8O+9tBGdJMg9vSBeKmkTigfP8hjZY1L9DBgI8TR94+k5Qay2pZSTvHnd8JPN7lqEkEjQ1FIwbYzGXvhSBIqC13cU+kh3tojzd6iCtaREPlcf+enIHbRZnV5oh6bcnQtxnMlK19F+okQTu3HyPX2q0gwj++2eXiz9KW0arfBklbPUgorf0NMXAngDKWlbXCk8HQMoKsqp8vGTZYYnqxnw754Vrs/YDuQTnyZLqS9qu2COp+9aMez8Sb/BKIM3L6QAd097duUew/Zfiiwh9JwLs7J8hF2lNvk/LccMs07rwOKdceNRsOVRbBIzITpd4RUOU3WjSoBQIE1UICBZNzecs/kEgxEbqccG8xOwivjsV1WzPkBm0Ivjgsce6BHGF69FjuB8TxWHK3/3kPeHpjA3VSi7uf+w==</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>
