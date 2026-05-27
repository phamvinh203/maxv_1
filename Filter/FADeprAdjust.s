<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vctkhts2" code="so_the_ts, ma_nv, ky, nam, ma_bp" order="so_the_ts, ma_nv, ky, nam, ma_bp" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11---: [ky].Label, [ky]"/>
      <item value="11---: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;


  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>XF3o8X7xLMsPzfS4yzI//f1TpLpjj5pyJxAo4K4WcjplkloefpFvfTWodOoVFhy3+9Xmi3hCpaX931ohDl7sM5TJEt5b0wfM++6Kkltc4MDo2o4P6aP+Yhf0/8hJ+/wOa73AYHGyuAr2HRPLyLGBeLChKoMOAthIBYCw6k7Pvf8/Mk8SfgdxhcSADD9KlTFVfq48Q84DdZV9H44nNrlPInbqgu35EY2eqsTVE5c1UhMrDuu+s3JnnCuuVA/T9Dg+XZ7eB/NFTDxV4oJ6YhnyF72vIqvY4xprH02dd3ZPvRZ5iW8KLbuC76t+Ke9r+ENt4Xc2wjpPfMk1v2c7/GOVoVkrvno7hHHP1MTSt+zj9mtmExhK/MNKYRmSWdTuFMQtGH2fiNFga3N6/ndqRJWreUvjfW1rR+URpcA7M1UafwpSGOWst7yqYIcWGnqfvnvQVAqXv0qEhP8eP2BVlM/q3sKBoNPNoYOf7jJvbxRrY0DGjL9zjZy8xqXXqgGPwTBcoqh+Jmd9OdVrcA0yQ0ENtHCc6KsnK+xp9a1Vgawmucc=</encrypted>]]>
    </text>
  </script>

</dir>
