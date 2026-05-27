<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vxdmvt2x" code="ky, nam, ma_vt, ma_vt0" order="ky, nam, ma_vt, ma_vt0" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Chọn kỳ" e="Select Period"></title>
  <fields>
    <field name="ky" isPrimaryKey="true" allowNulls="false" align="right" type="Decimal" dataFormatString="#0" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" isPrimaryKey="true" allowNulls="false" align="right" type="Decimal" dataFormatString="###0" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="copy" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Sao chép dữ liệu" e="Copy"></header>
      <footer v="1 - Lấy dữ liệu từ kỳ trước, 0 - Không" e="1 - Copy data from previous period, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11100: [copy].Label, [copy], [copy].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>0vD+g4ltZ8/rSrQB0y50IVxuuhYs6fe6E0USomhRBbserm2JmbXnchVQhwI9S/jfr0BsU332cJp7TppKWF3DISndtfqRkSUZpJnryGNsHXZ3olCMMLG0vKLaOE7qnp8rWDuFprXVNXQqUFxNxBPIObKd5AdXu8T++OHKymPGmxsKiMqKrOqkP2YfILzdoH4RwzXMTrZBr/CccifMga6uNxFcH1eFAfozySWhol6Xi3U=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>O/qErHxosgDRl8mB9J7/7lwgNqtg548yLafxWePuBdErNPC/Jz038XIhVuEK3lrLjijjs5MFFDc2wNpawN68n9IX4ysUzum5KhyjjRF7+mrJQWXk5xJkfg4mOpC0b9KJolxfK9ilbbMURMx2YffGi+G5b4TESD4rJ7AzvgNy4wyBT0qsRcS+KKLKH8fJKpWQI0cErflX3ak29fb3uA927mQWhdM5EHO72YsX+GcqRud5n5Jlr9+eqJQ/sySRGNqdzKMKfnKJGjKLHAZLUG+zIWzwral1bB083+0aggJCtbLssockAIV7BWe9QveeOgkyZPnTOFbPYVROfqPWUNbDpBZEQbgni2gvVyQEdQUhRzsFnHvwPvSCWeEtIIG0cWWHVML04GYG/Mj921CleaTCCK72j6VXJUYsS0MUtxmp2f129/2mA1xpFKFImNIsXqR9RRL8H1Vjv+wpOq46S/Vmbch1eUzOTKDBmlx+CziTvzIaePVpHQGJJqD15cz9oeNRXBNsd0pIc7Yg17x6jqUWXwSfdX4DFs3Cp6fQQgn4y6Q=</encrypted>]]>
    </text>
  </script>

</dir>
