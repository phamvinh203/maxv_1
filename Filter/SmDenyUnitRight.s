<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="sysunitlimits2" code="ma_dvcs, user_id" order="ma_dvcs, user_id" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc đơn vị" e="Unit Filter"></title>
  <fields>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitlimits2 where user_id = @@userID) and status = '1')" check="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitlimits2 where user_id = @@userID))"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>gcJ+6zEMjWuzEObnymya/kKIDQqYtGaB2HGa6vKA7sNNyoldEEFo5t6uvzxNHH+Jbvr2MUzV9w3arIX9LBKH7E13HVoePLaY3Z2R9Rv9bXOmP+3mmiYRDkOb82ho1NqFnnFup9pW3/i6yn1dcXaVArg/iJW6Mozuj0WN6XX/4DiDoxJEqwx4x180pkVyed9pChLbSsR0Ug3b1HXCn9dL0ofqrR7D9Sh2we0lN4u95jo27qLFuuBloayyIrhLKh5F9A4LmD90CKiDbQYe2yQakQeM3VzZYf3Baz3pSUAIuBkBm+eL2zaA2yn8EnxQ6vsHmVzV5mL569ZmLAEPuA8q5lMj3LJcQSSPjBGZWFtbTQFsCrIZTNW+rOsh8DgwS4rWiqRWsqom055iWI9cFPV1OnKGVEoHWa4Q3VPZUkWy2sajAfP/9djm5jw0EfUYHJFz0+HsgAsz8FFr6lEnhIaUQ4x5VEl52EHGVbYDsdkrcGBIJjfy54nj4tdvC/me0G8O3LcVhiicMe3w3/QmBaYJ3DHN2aENb9V32x65jenGoZVlveJGHPLDRthZDjPqnBBq</encrypted>]]>
    </text>
  </script>

</dir>
