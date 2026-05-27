<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLTaxFields SYSTEM "..\Include\XML\ImportTaxFields.txt">
  <!ENTITY XMLTaxViews SYSTEM "..\Include\XML\ImportTaxViews.txt">
  <!ENTITY XMLTaxResponse SYSTEM "..\Include\XML\ImportTaxResponse.txt">
  <!ENTITY XMLTaxQuery SYSTEM "..\Include\XML\ImportTaxQuery.xml">
  <!ENTITY XMLWhenTaxLoading SYSTEM "..\Include\XML\WhenTaxLoading.xml">
  <!ENTITY XMLWhenTaxClosing SYSTEM "..\Include\XML\WhenTaxClosing.xml">
  <!ENTITY ScriptTaxInit SYSTEM "..\Include\Javascript\ImportTaxInit.txt">
  <!ENTITY ScriptTaxClose SYSTEM "..\Include\Javascript\TaxClose.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY f ", t_tt: '[t_tt]:=[t_tien0] + [t_cp] + [t_nk] + [t_ttdb] + [t_thue]', t_tt_nt: '[t_tt_nt]:=[t_tien_nt0] + [t_cp_nt] + [t_nk_nt] + [t_ttdb_nt] + [t_thue_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="HMA" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c72$000000" prime="r30$" inquiry="i72$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    &XMLTaxFields;
  </fields>

  <views>
    <view id="Grid">
      &XMLTaxViews;
    </view>
  </views>

  <commands>
    <command event="Loading">
	<text>
		<![CDATA[<encrypted>fUuMZdwcfcygKFgKd/fRsWEp6hl5egBerBcLsh8oxFqPN4ZVJxrnmSpb6DoHpELFNg4Afc1xd+6TJXHDWCK01enlcF5qnML+ophw4CyU+uVktn+aSDka2khrK5HbCiCvWRaZii5cSI40bn04Xjb9NTgOxoKE6dldhZeI7URDc+Tj/pljPbbsO40knqpAPw1vejbTX3qgcb4f6BLTocbYQTuv+eX1dB36+g94dESeQQ2DsRPHqC1tdaOGk9xej47u2tRIEmefRcY8w4EVfq7mf2+6nfvgG7Dhhfrn9ZudBn9Q7AuqOk9BoQgyFitt2/oduQ8NOvswLgEhz1VyNB4eCBqj4ykx+Jo5Q5VFwxeEScrcU1O+lpRI9RvliyMoF8O4mgWQJs5lTlKOZxjIjHWPTAa36fNMlhEDi2qUNcjH1Yul/wVFkL4WyUzUVg28G/pyZyXx8Zd71qjXMeENaP2SDqzEAXEKTSPTo4OzpH9R64AdA9SVObs624UNJuCZt2XM</encrypted>]]>
  </text>
</command>
    &XMLWhenTaxClosing;
  </commands>

  <script>
    <text>
      &ScriptTaxInit;&f;&ScriptTaxClose;
      <![CDATA[<encrypted>JaBC3yKWToBRlpUrMKtgtgwRmUDgbxaKEgfKh6MLwMHMKiVO3NQhKpxY4FdX0tgApOqyyLsnugGc1A3yMErcsHWGAlzEphl/7Tkwb5GcGPKBsP8wWpYDeJ5Np7Gt7URj6ZNa4SonRHihlL257wqyy0PsMCnh+sR3poPpSMAG7axk2P+r3fnrvMoEY73v9y7eWN2ae5fWvt6rPFVmph44ulqak3IgkFX+8xjvXbfsgE53eZpRMWtb77auD+/iyatmjk42xVHcFx19h7t+B0QmWp7LvIy//+Jt5LYGH4vPnGTRCpSzRXQvVjcdkKT/rW8lv8n/QphYonv3vny5HUJ4KzxGx0wB2grUXRUi7kXDjx4qeG9XQ/wj5Xf2gAzTEXFL/2YYVwHRvIcbKbNym2AGTqR6yv4lKwQnoS24HDtRgL78psvdu9hE/u1D7PtxT7YxHPLtr+M2nQZ1A7AsfcHwDzCIkoQpp3Wq3LNpvYSyoEtMS5GNVGd/+6XPbk5M/srneQVUjgxuQAYSJRiOJMJo9DPr6YXO+Ybs+kLa0dloQ+u1cnkPn4j94caBTHeHZNZu04n9km4DG2b8rMd7Xh939P5zapWIqx2q/hrsuwa3jd2ge42cbVvWIAjGBBFWWxt39YwsKEwf04lkUV7bwMzQvgIkJXwGEvxtN+KyXiImpqfg6xc5fTYyaTz0Swz5ART5lF+vr9479jQa1kVe2esspB0nmL/E48nu+kjha54Dnt5NLNjzNtdP8ZbJ1Kka/J+NCEp4wMujlqWoe0Ins3o6fpzLOvGjsP0/9YvJWSebQ9ZnFGVAuNkBSyEGjPIP5kfGQb+J4aLIdMs+UMbIdg2VvV7Umc0zieszSc01X81VUbxyoYA09fb62KSoM5Y8Lxv+2RQ5eyvGs5EgYyBdmFzfP5voo2li6PsQ7YWVuvGpuy8NENqA+ndFdbm4PqR+2KyZQLoctpfwEy287ScNRsv1i6CbwelmTYMI2XHlUeHaTe6jccXcJ3UC2hIVTu3ltSBNgWD1G6AO0zLgMXRZ4ILvRDs4N+Pb9EkjNujoCS0cpr9+sc/hdJ+EvC1QzIhoJHfDCiouNdWZtt/f1proP6tVww==</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>
