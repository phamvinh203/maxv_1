<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="xcdloaiytdd" code="ky, nam, loai_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, loai_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc số liệu sản phẩm dở dang cuối kỳ" e=" Closing WIP Data Filter"></title>
  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 160, 230"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>VZm7idYgzoq0oBL+7RvhONMrM8wspVI4c4EbipqvOWpLvya1unkaQaXniZDyr9ZsulEdVhZ/mqaoH1XI9dRWTVqzKbJORbVO1v8D7FCRbkHbCLsLHAcValYI9KVKbO9sE1mumW2KpLi5cjTY0oa2CPmcVI83jwqaSZ6Xctl+T9H01rZCX+yh5dgTU5cpsHb1a4lr5nr9PyDrCkJNOzf29TY9WuArLe5eGqCsDXLbJ17TBcsZjk0l8V3Vf1ElsGsGitJy/FXLIvZwXA3ArH3wbTwn4fQ6lKVhQQcaq+BjnKg74DtvTOb9cZKbBtPxFvmKY4Cl0QFSqrjsBzbK9JvZSy+AZlqaZEt3UHgFQBOfyJnV98yYDo4nK0PwwaqdcQy95jklNQbAxjBeqDaTqFEtLIRut+qZF96EBQ0wMsUKSk1NmC9BTh+7Wp+9wj10ecg1NoImDvZNogCNfK700pqBfhKFBffo8uOThfV1SuGfPL/dxvFB76Se2v+a3BhgLWXsEGLndZ8nrPwJr5R/NxOMPPkPmh9VYSXSVA5H3WhME7xF5J6kKr+HXl9xyo1uRvoo</encrypted>]]>
    </text>
  </script>
</dir>
