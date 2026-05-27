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

  <!ENTITY f ", t_tt: '[t_tt]:=[t_thue]+[t_cp]', t_tt_nt: '[t_tt_nt]:=[t_thue_nt]+[t_cp_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="HMC" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c73$000000" prime="r30$" inquiry="i73$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      &ScriptTaxInit;&f;<![CDATA[<encrypted>Wd8ijrATJAqbsuPPHIYgKYLmi8enDm8dKb/5OcpI1It2k7PF94YkBvpuvaqbh9NxlECPCuhsI2v8jUjnniMYZQ==</encrypted>]]>
      <![CDATA[<encrypted>7G1eVHPFvmAcekFYSShh2PegRH9m/Gqpfs7RPQSqn31PtXHCXjU5E297JLC3Psk5dsa9UM5IunDaXCM2a16+6bBs2e0bGSIPRWbDmlta45nEfYs9TF84V44z7T6Z/LQh5bAfOJzYQR0M3YybcjwPAMXSiviLUeMtymxbph7uixyQfDdf6qYRhxPqINEa6yuvpp+TZKzvgzOH1wydJtmjMMktDRxTjEAsDmeYMdWu8Ic4QvYDeGCn7JEjynl+lZcrVHR5gOzdBXq1YirchVYvsi9WzVOrD76HRr/Cmsyf8XYjBOBtrFoRKgd4TgfYEZO2j2p/qhTFVKB3L9UfwODbJnRbrTiZ66hii9AcOjlNmCtw9pLZUhjznVVMFhWqsPKjUp0nhRqY/Pb8gJjHlTK1T4UG24Jte3/lCO+VjNiMgmVZDNcvO2xnVhfZpQEwPwLEsGQKtroWNn/3i78FnRRHATXhREz92a4tz4RY3lSDwqQ1ZmnQbxeA8XMW9xGdgkUJT4mgrogSR0J/Ovk1gZ6h1r1+MYAE2BkAmMa4WolHKsgK0B4PlwooK+t0wBaGa8MZxcqezNKJBI9K2r3OLmveKjq1utF+CD4GDFDhTLtKpfXVIC5FBzGEHnOCNt/GRWXqFK8NOX1qdz3rEUyaZ1fvJw==</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>
