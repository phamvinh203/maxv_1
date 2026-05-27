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

  <!ENTITY f ", t_tt: '[t_ps_no_nt]:=[t_ps_no_nt]', t_tt_nt: '[t_ps_no_nt]:=[t_ps_no_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="PK1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c11$000000" prime="r30$" inquiry="i11$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
		&XMLTaxViews;
    </view>
  </views>

  <commands>
    &XMLWhenTaxLoading;
    &XMLWhenTaxClosing;
  </commands>

  <script>
    <text>
      &ScriptTaxInit;&f;<![CDATA[<encrypted>GX+Bt7tWT9i1cw1POYqNPDCdYOuHKlm+mmYXbUuVwfX6cf1CxC7HIvjBsbVpu4L2vL9u4Ww3dOlktyVU2L8w7B3opSNlvchD+NrhmjqawwY=</encrypted>]]>
      <![CDATA[<encrypted>UQe2qylsY+XNS90rROVObhN6665gK5xlku507dqFFLq5hTxMOp1b9qYo4QBlEkxFAfhEGensJ8rqlihf04YCn+ZBOhYn42dPDSPvi/jKhwuijjDw1re3ymrbQC4W688Rft6jCdEgXfE4W6gJYnSxUoDfYdBFABSPM+XW+MjsiWsBcigEsw7OPkySDRKkl/T48VWeyyr59UbfAYtybDI8ec0mfKBCj0PFHI8xzxpthBOFJj+6GPmrnYYJe7lQ06UslaUBlyGl6fMCwNtQBjcdFAltoAtn5zgOc5603GhPf8u+8TV5txsdGGP/QwtSncfT0EpL8gd+3pMPxGIdIX9EtLuDTYUp4SFbgUOiaXiEZqs0YiQitGYrriPEHm8s6GkTY1oHH8GOKl4T/shRObV9rDC+Re0Wm3d2I2bRVO3J2Kfhx+L5e8ljuHNJaMP1ZdSN</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>
