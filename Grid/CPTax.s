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

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="BN1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c56$000000" prime="r30$" inquiry="i56$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ksRFoK1UQrPPrUSH6QqYi05ni1O1XTMwCYGnY1709AC+IYJr1TgiKmJnUCmTOsP18duiAoIoznXQirUAt+fJe+I=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptTaxInit;&f;<![CDATA[<encrypted>JvJ+VusKtdJ8Q1khIR09maGCg+OZSoGj/fzMJu9jUULNgx8NUWKtgpO1y0XHwCfQL/kzbCQycQeK7+8KivJwUncClulSj223YTQv3y3Mk+HMknTWdcliQrGlcV55yaK1rSmaIOzZBRbwMpoZdbguFzjzW9wcX7cCKdcS6Fp4fEJ70OP9SFvxl2GL91fRcuFJRtjLDxwuA4aKuKssbs9oPDkhD4DtVVSQ/iSrktdsGMnHKizZWAvms9RpZ/krOkGb10bDRTgaA9fqiscCn4cyGlMWzovht5d6uraUo4v+0y4XFC2aFxlfnIpUzqCVXTPr0kLNyDf6MMmh+ubBuCpsz2hmXVmuy6GzzW8UnIrCaDnm2bnjCVk96GALCgnt3jV2BbC1JUa+flj8OGJIuSfLYvzK2MZhlRnP4VHBwKMxU0I8YWrYakb+UJCctHwCNWN3rf9QjJ0ytt/C7sstgrFK8MmaQiKkArn1AMVT+A0cz3mDSZikKc4M7cGGd3j/fLL8zYB71GpjXip2NOjB0grwCkQnRUD++i6Jn3Io2+hs9Qp0zGHFDVYEUNPb7dr49i6YFzmK4ovQ4/ko5gQ0XIpPo/pPllX890qdsThjxxSxSmKkufmx5yjDxgSVfyMQzuzmGgiMQKH+AmOtD1htOtSgvwAaOntliJ0P42dxfviQsR0gZlx3slDGwT6oWGN7yF7xkI9Lba0I1/8aS/3N+5TEpLUUAFSrUx8LcfH5nSPB2KuIVwFMMP7YSoQoTmUcaWfPCEqqq1/yYQO/7inPzDik9Mes0MxFasM412c/MlKpEsszpwkfg87aUlkBL7GOK/WQQX4rfBQkjEdbSP+pIpgSiqx6r7yvY31ooFv/JX3hX3wCOPmQPFTWsaGGHODtC2Pi</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>
