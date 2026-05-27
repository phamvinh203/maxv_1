<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="sysunitrights2" code="ma_dvcs, user_id" order="ma_dvcs, user_id" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc chi tiết theo đơn vị" e="Unit Filter"></title>
  <fields>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1')" check="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID))"/>
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
      <![CDATA[<encrypted>VZm7idYgzoq0oBL+7RvhOJCRm6FTc6pv/aB1Es87yMh+wdRW3E9qSGzrTdonijtICf4OE5xP2XQ+czXIkB2jHWx80osxpcBToCTNMC9amIc6Ke+7EvhctcPOXuihXjZTbwkHZPKXpuCGo7t70LBVi1gjuaP1SlAwj/k7bc6XZjkTpZXS0dT5RoBSD0rSuk92EWH73E3rPXJ5JKMPmwCGPy5SubrzEKH3R7WEpF8AoEeOrRyq4dEaJuAkk6NBG1Fr3Ya4cnfJblPMgvSCQP/Sl5V13znUS7khgIyyFWb7R5ABQvPMziJDWQvSBRI45KlXA0rUMTTWCY3jEKqq5le+vY0xLL+S7SPKgDwcxF8DjqlgUCAzLZq/ciEpBAlKkMAGAX0P7z3BQnUD1AA79D+vQLtId5qy0TSrM+pgUfeowaDLeJ5QlCP6OD5+WsrGIGk4Hu+pt2JO7yVzqxpoBOqLoauHyIt/zbnwC8fptXi5vP8MFVbjTWzIDo77oQGx4/4DIT0uXfrXH8/k/P0GkwaubYI8S35kJcxllo6XRwzji+b7NIR9qwAVjCOmjBmhl5X7</encrypted>]]>
    </text>
  </script>

</dir>
