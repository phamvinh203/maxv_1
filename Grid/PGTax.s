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

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="HMB" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c78$000000" prime="r30$" inquiry="i78$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <![CDATA[<encrypted>zJekmVjLVcz2hzgPCmdBLSAQ7RESuIM56eh4PWlS+18GGIUl5qZxW6ikkP/k+JSh4MmRn+Ot4XtU9cGJLNIM/y0OR3A9Ps1Ua3QUygZMBVp6SCUndtNo6IR2C1XuSKoVeNHcgmfzhBmujSHi6RfaejTm3Mmxa07y2iu8+TFGgxYL0RXBtLk1oKi+FuYfdASY48nPmb2mkzh2mvueY5csFek8d+oSaSp0PuJ6CfScjwN8/ZnZgc/xnTBXY1Spemdicg7K6oW/NEc/OB1koBmRoH2BM/p2g7eRvwu6tX0jw550I6XOxzQxlkxTZGDhNUchhSF0kt/w+lcqfeNJTMnRjJ3sCqnol53vvU4zZbMe66Uej4+bMniGbAN2maEnBRgxrBZGdcNpUo2veIZ99jItjf0zY2bXqKwt1NcRz7cg1mi3me+vHeNRVYr9s1mm8+6HcMWK5OoFa0UGkNHf5gAcsxOig0l3DX2niVzJNRFNbWl+6L6TGumm3plrKs+JCcpiEloRZUYhqBefQbYzVQrWiixt6juP1P56aJ7ORDe/CV0OeLX+0NuO02NdU4pOKdPtZF7TMj2x2HPFXlbWhqMYsqvPHQ4yNA0m5FS9P/18l3HMqERYrgkmMuYL4Bl6G1Xo</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>
