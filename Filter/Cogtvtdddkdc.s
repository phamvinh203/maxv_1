<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="xcdvtdd0" code="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc vật tư dở dang đầu kỳ" e="Opening WIP Balance Filter"></title>
  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_yt">
      <header v="Mã yếu tố" e="Cost Factor"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1' and kieu_yt = '1'"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11010: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>8E1McYxu5F16bWrD/bv/T9jm28OHvDN4rVxZyhUYpEdgmI/QrAlVZXLJbJXwrhAWKu+jKS+uQmzZ50yubJJDPOTcbm1nwPjT0EzNej1YQmEPCeL4AckuUoToqBKVyjUMt0iZomMHrcq5r5YXeFFdViTzX++HL1Bu4uElphRNhhF3CnOkMz3NSGITVRPPY14rCB3gt1QGionNFUQeCbgqKup/Ye66duMdTfQfOMHKrgqMOHh7vCMczmAdmmPlnWf4qb2TM3qdP8K/l0I/g4Ko0zz0HU+eK5OunlqV+UMYhlRMzRwvh9h/cVpQTvnhqBJccIjIgerXxJenP57xJ/lSgmHmItDAMjAPbvwEFJ5S3FYNcR0rEQrgeGiuU12Ko67oZSjKXrCKN5Ockq7w73GEyTYPhDyFzRlrwIikOwpVGUmDD3a9Sqc5QspNG/uxEkCEG/reClgg3+upPyBy8sajdJxgyP5K447e/w60PezhJVQsGmDJWWT198QBTy3WiFfQ3Gw/vcqZu9vB7+RHdKpI/bE/uZMmChrCEJubl5xso8N8dH8jVNmNh0A13RJhKFY9udw3Hzk8w75Z7WwtKMvgnY8TFmHfrzgTl7PU/3fSzu4ezKhNoAyk23FkeUi9Civd</encrypted>]]>
    </text>
  </script>
</dir>
