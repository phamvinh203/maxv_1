<?xml version="1.0" encoding="utf-8"?>

<dir table="dmkcgv" code="stt_rec" order="stt_rec" type="Voucher" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hệ số" e="Coefficient"></title>
  <partition table="dmkcgv" prime="dmkcgv" inquiry="" field="stt_rec" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" allowNulls="false" dataFormatString="##0" disabled="true">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_bt" allowNulls="false" disabled="true">
      <header v="Tên bút toán" e="Description"></header>
      <items style="Mask"/>
    </field>
    <field name="tk_co" allowNulls="false" disabled="true">
      <header v="Tk phân bổ" e="Allocation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pb%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pb%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dmkcgv1" external="true" clientDefault="" rows="242" allowNulls="false" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="GLCtpk8Detail" row="1">
        <item value="ForeignKey">
          <text v ="Decimal: stt_rec, stt_rec" e="Decimal: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>


    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1" disabled="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="302" anchor="7">
      <item value="20, 100, 25, 5, 45, 25, 303, 25, 25, 35, 120, 25"/>
      <item value="10101: [stt].Label, [stt], [stt_rec]"/>
      <item value="101000000000: [ten_bt].Label, [ten_bt]"/>
 
      <item value="101000100000: [tk_co].Label, [tk_co], [ten_tk_pb%l]"/>

      <item value="1: [dmkcgv1]"/>

      <item value="101010000: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="20, 100, 25, 5, 45, 25, 100, 25, 25, 35, 120, 25" anchor="5">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7UA+5MFQy6UD6zb6+t1bGNJ9WotZAYD6hSaRVF0lNqTZ61EEz8iQdV6HYPUJimpMxAJmQCW3WYKSwfn1oqQVT2k=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>VL9wRBs6OqXNsjIjnSXi7o7Dq7P2QiGUMLSBEYwLpIg=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>I+/cy91bjrCZndkMzlheuUgL/U2mU4iF+AQiVVPyeW0KfQZHx9htEpL42+Wjj9eOlCkjCJdQhoL/s8YXpm2i2P5SYsZNAp5IQaq9yalFz/IrLL+q+v+Rxp2ZUf251FnvS/L2pJcdkAK/ezXf3AcILXsyM/yw5iMtMbQ1xdoRQuh+WQaYS6BSrRUEWE2EyR8E9o22ttE6eQV2rUpEWOAuLqYJHqbrZml4S/u0a/4+K5R05GT939r+9FnFx4zlMWTPx/TuyO496byftU6AI8xqZqCBefcnJLZYaZZ4McvbEtD1bCztoBaI9dvImDuOTHTISx5El3zzk1ZcIwLH9W8TG+n32m3LefteMCYcyS1fUiBHQMp80PEQbKHpJaHp19bkpsAIJKTtiR09mY45tXZjIm9IVva67g5y5+aLR8AVZb5QBg/tHtLdtezdi8G5+9oOsavRyHDRp//2NrBXPG9jjQg2RKQUIk1b0lBwnfSZHm0xntrHc3jhovsHZLpwsIll9Kgei49L3pNGi4iO9Y0LCVEddvBnLhYqgCY/AQVSBMoWKL4bb3BatXFQRhyxr8XlgnStdJgTwlJxi/EM+EkMlg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>5vFgmYTBsrRJaM5BLfLw/MR1cnobWE9D/b2pptGGJYL5mJgV/2DeWbIl8grAl1R1RQjM8WV2rV2uXzsjw6mVuU27qBiGT4gZzGK3zu48DNBTPqyyLrvBgdEsP4bgSZKTSV7cmtiGUiem43EeKuxSmR31LyUruzfDxUdvqd+c8ueoRQ2CUtxLQgjVHt3Cv+jMjN6L1E/lyW6ho4Gr3behW1FVntVt/5b90qOQ5aQuu9qxhszKToiMzp/yLOMRXNF0LUD4MMvm5yki58GS5GoR56RL/4WB2ampYcPAXIvNORg=</encrypted>]]>
    </text>
  </script>
</dir>


