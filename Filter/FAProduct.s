<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="ctslts" code="so_the_ts, ky, nam" order="so_the_ts, ky, nam" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc sản lượng thực hiện" e="Fixed Asset Production Filter"></title>
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
      <item value="120, 45, 160, 230"/>
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
      <![CDATA[<encrypted>Lj674J2qXr6VG2F2FB3vUPP0RU8BNaQ9zxqDe/jHXJXG5wxdfNzFAZZR2fDDFzNCNdbH1fVes95OVxjXZMpXayk17rzkw8PvVP5U/WYhFCiNCcxzhxYJG/eOFMnMTp1hU8AXyVqZ43Cn+vs+oD7DINZwiLlIalL/H6RSUTdh++6AQKXAcvh7MYohYZ2TYrrk92IgLHikTvgYJfzQN01zj+4V6dR44afLGyBGu7zVPNZ2OM1jnoewOAx+3UHll8KLKFmR8cdzI+ZocdpQzL9vLLx81FQeqzH/QKXNYF+xf1FF4bN4SI8oKoUhEx92S77p8kTkInfwB9LwR9SztDaGd9hDsY28oeqe8SBfwNsV+9A9vbItXpm2KHvEdltRlJ2AFRiziqp/8kP8S6R3CKfye82xW3wpySnFkqOcbWph+Z7ZnzRpNmD1xT/lTb+9hf5KEYQCZw2I/m98GRDdAMiSLJ0yHC3e6pzgdagfmCdzRwbtHEFNa0eYmKQFqjlR6JL6F4kfMWi4tCUWaJXydmUc1DEsyA0JL3pd11h3Zwr4KhxUskJY21IzpKr93KQFtUax</encrypted>]]>
    </text>
  </script>

</dir>
