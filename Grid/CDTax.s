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

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="PC1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c51$000000" prime="r30$" inquiry="i51$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      &ScriptTaxInit;&f;<![CDATA[<encrypted>JvJ+VusKtdJ8Q1khIR09mVSxa9LKndz8yrO9gJGtb3qcJF1uuHtUzZLBbAEctU48ec0tvmVla6KGhN5MwncWDXH/viLbmCAB2ImJv4T1niJnQx2YViPUrVBtxk6vUtsKzIonUoa20jskaLlVL0c5z1qPpkz73uLVU5QPobZM73Fuaw2PDvty9dLw2L9r2Y8HGp72u+1abLsg09eijWQwPKNQQY1qP08NrG5ndwzqrUrCrLnMHQNKRGUFAQw1OrOCmX0iSgZt9cDuCA5KiXU9ZHrpuDphiC0fd+Mu9bN4kkeO1NoUuxA+/sLjNiRcCDBE1sCSAe0l6Ol7lcKW6Ixg9NgQjYAxUAqi868KVr4Gjo9gEVYZiLOohUP3UbimjMmKdOhzOiPTIrIym8vMwpOVMcc59GVttDWOrxOdGNKN4Tsv2gcPgyEskOE7bInQR9H3xRVgim4nKKabFaVADLNIev6g7cM6FPdhFKKcLBfupx1aYoAeA5hAMefo7f5IlDmX12yCRL41HHp+q0dcqZOlsBXbdIZ/KxvLTMRv9WX/VlHY2fY3/Sbu+2Ru6RMujvA7Nq1LkhG4ch+E9dVFEI2kPybD4zMK6rfDzi2ZVNoFwkmbQW4/+Mv9Zkfzjx39n/Ve85ikWPkIklGzczdI8GZ6heDuKsuy0Kxg+vQHoZGvBQFwCpYlvxk+NMkpqnt//xcNx8cT+KSrrCna/p5UqBUy7B+jTyuM9QRoip2dBNyUYkn+2/xcifcbE2Ov0tDPZVsXbV4liQeO0yeJ3NcQdx//xZPgN7sk56K/VuZiNmnvE0iLqEzu+lyh+XNwk5xL0Pdhyc+N0jcogB2CoE3Kgn9gn0B/SDyRtAgEv1YS4YxVdAWVNlk+6Ej7fS5JyMJvCkPz</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>
