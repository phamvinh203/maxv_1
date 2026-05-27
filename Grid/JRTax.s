<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLTaxFields SYSTEM "..\Include\XML\TaxFields.txt">
  <!ENTITY XMLTaxResponse SYSTEM "..\Include\XML\TaxResponse.txt">
  <!ENTITY XMLTaxQuery SYSTEM "..\Include\XML\TaxQuery.xml">
  <!ENTITY XMLWhenTaxLoading SYSTEM "..\Include\XML\WhenTaxLoading.xml">
  <!ENTITY XMLWhenTaxClosing SYSTEM "..\Include\XML\WhenTaxClosing.xml">
  <!ENTITY ScriptTaxInit SYSTEM "..\Include\Javascript\TaxInit.txt">
  <!ENTITY ScriptTaxClose SYSTEM "..\Include\Javascript\TaxClose.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY f ", t_tt: '[t_ps_no_nt]:=[t_ps_no_nt]', t_tt_nt: '[t_ps_no_nt]:=[t_ps_no_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="HB8" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c29$000000" prime="r30$" inquiry="i29$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    &XMLTaxFields;
    <field name="tk_du" width="80" aliasName="a" allowNulls="false">
      <header v="Tk đối ứng" e="Corr. Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="mau_bc"/>
      <field name="ten_bc%l"/>
      <field name="ma_tc"/>
      <field name="ten_tc%l"/>

      <field name="so_ct0"/>
      <field name="so_seri0"/>
      <field name="ngay_ct0"/>

      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="dia_chi"/>
      <field name="ma_so_thue"/>
      <field name="ten_vt"/>

      <field name="t_tien_nt"/>
      <field name="ma_thue"/>
      <field name="ten_thue%l"/>
      <field name="thue_suat"/>
      <field name="tk_thue_no"/>
      <field name="ten_tk_thue_no%l"/>
      <field name="tk_du"/>
      <field name="ten_tk_du%l"/>

      <field name="t_thue_nt"/>
      <field name="ma_kh2"/>
      <field name="t_tien"/>
      <field name="t_thue"/>
      <field name="ghi_chu"/>
      <field name="ten_kh2%l"/>
      <field name="tk_cn"/>

      &XMLUserDefinedViews;

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    &XMLWhenTaxLoading;
    &XMLWhenTaxClosing;
  </commands>

  <script>
    <text>
      &ScriptTaxInit;&f;<![CDATA[<encrypted>GX+Bt7tWT9i1cw1POYqNPDCdYOuHKlm+mmYXbUuVwfX6cf1CxC7HIvjBsbVpu4L2vL9u4Ww3dOlktyVU2L8w7B3opSNlvchD+NrhmjqawwY=</encrypted>]]>
      <![CDATA[<encrypted>+DDAcQsoWVjl0twmIuL9+Pndsl0tHCjQ+68aGSlsY+HWVon8qClK7+1PucN2F0Zfvp1lRvMUp0r4Wm9tm7jrsEwHFuFJTZHulZRHOY55bHuZGgkusSdt2AazO4WsUodBnOVkNOEuUQmlootdv/El528O2Snkd2pGQ90KZfIzxDu5DM1QyfNM7I1JWTCF98QXFG9W8NB0l6gQ/8Le60do17dlW2desP2dX0L3h9MDNIzDsDyqeK2M826FeKaH+vhIOCNK/mM09TdnpJaItyGm/wvEHFu7YbjKhp4wYuyPyVGN3vkuytMgB5iPhgiUAtS1dvRh9D+NKZXcSTEzvyO3jDONzPySr7dhgMJNufgqeYvV3Ei2NUGVBPgXnoDMOTZ6qW3IlcKRYPWlMkwiA2VolaVkNEVvNkY455nOsgEuaTU=</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>
