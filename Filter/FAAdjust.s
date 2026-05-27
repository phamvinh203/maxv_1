<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vctdmts1" code="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" order="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc số liệu" e="Data Filter"></title>
  <fields>
    <field name="so_the_ts" allowNulls="true">
      <header v="Số thẻ tài sản" e="FA Code"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="ma_dvcs = @@unit"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ts" allowNulls="true">
      <header v="Loại tài sản" e="FA Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai_ts%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_ts%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date From"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date To"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="111: [loai_ts].Label, [loai_ts], [ten_loai_ts%l]"/>
      <item value="11-: [ngay_ct1].Label, [ngay_ct1]"/>
      <item value="11-: [ngay_ct2].Label, [ngay_ct2]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>NwoDsFm+vMmbDYJwVUApSjB91MHrEMYKPgd3o/bE11oNr6YXJTbnigfCkyiu7QdDjEjreqZETRwHa6wcphvBvQCyfTTaxVuGrPZiAdLIOrQK+8ET+Bz7Ji7Bc66iQlOsuN53owLXZudJ8a9kSCRLr2n8RwetcQHupkGegxseu+Z42JV9BQVG8pXnTos0oiIyXHzUfB2VuSxUFtPDaye314tBSujlu0SPZk7cObJJCHaR22wcucWyRTWzop7dmzHRMouIMxXJL4UnYZVNWElCynUKjyL4qg+ghMFdDnZFTHW/zVuLSPh/IHhy6fke7P65w1NyTnO7nsVhYq7JQBiqeTeHernO0hY/7n7BZveBcTP94xpNLiZUCmS/dVp4M96dB5PYHc4CsdaumnTczo0dvhGxJ/nFIeowuZ84r2/sT8DmgnaJfDXfjjkEpscvtvN0mWo/wGDc/U1SHjoQV6Zi8PpY3SED6pzvZ31v55qn2U0v+d3YHjJkn2TVAJldt5kzqtJyLrTiMvFPWTFIVWibPIY6kqDF0XpHfqJBAxWK9gdWOHKIwD94FnnXVK/Jx/3U7GctuHCA+2DkpwzTagS7eMuf8D118N6vdzB5Q7nA3Pg=</encrypted>]]>
    </text>
  </script>
</dir>
