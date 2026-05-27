<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhts" code="ma_nh" order="loai_nh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="nhóm tài sản" e="Fixed Asset Group"></title>
  <fields>
    <field name="loai_nh" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="Default" align="right" allowNulls="false">
      <header v="Loại nhóm" e="Group Type" />
      <footer v="Loại nhóm: 1, 2 hoặc 3" e="Group Type:1, 2 or 3" />
      <items style="Mask" />
    </field>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhóm" e="Group Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_nh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1110: [loai_nh].Label, [loai_nh], [loai_nh].Description"/>
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhqHuKjEItIIo02oP3tdo1MitzHmYaa5YyNyAoYCO1e/kFvess4WO37NjYVS5KBfT9I=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7cscm7y4mD0HhTX/4tZNMLynokjEjYyDSGOw5DpvlxWIa3TchuNvQ+FBDu+xTQQQfjcUfNqmSC46Uf2VX0TB8eM=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>3Ep0uybeO70tE6LRtOu4jVo07RwDinq/qqT74GPeDJSqCpNBvAp/00EqQHi9atMEA2hOAlZ4fGkW7nRL4RQaUiwVFtxudqmKlB2rhSSIk4vG55ZMAbLJpORH9PwhM1Ik7ol3SEGAxlWQZI83MEqC1VTluQtqj9iOtS181u2gEzsS+tzIBnHQhf6YHwub6rL/diLEeNjNNOlJ8OLf68HNjPVx6sc/Uk4fjh3vrev7cjS2wqNF1iJzr9+Q080o/KckESQlO0ItB1FVsXJVEnIa8cKCKowJLk930P0NREuguUoTQHlO1WF/wKD4BnTijOZzc874aSOkUXRQ0ygE+mOZSb+1iEftyDzSyJK7Jq4VIMWr4Et0gYbTmMFwcaDPcuJjFTb8bde5RnPPdIPmA+zvA+qDY3o0hKsVDgBOvnRQLB8k+NlugyK00OlVEcRHsz6na4Cv1/9nvvhdFY9QKvSvd+428VgFTbufuysXGfzPC2nkjv81bkrbfUInK5TPwNDL</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>OcyD5WOveLWE7C6cu9SsgFp0mlwdSj6pErW0KE89u0sfwbw/YgkLIJAyqjKlByzBRaBUMbt8K6l67Cl0ArAwdMB70OsZoU9m3Q7WrQmXRfzLx5zgLQaSEcNPNznehoRidv99O9UdxRP8kaegVRSbIY8vpUemkqMN6y97IbNNY/6IFnKs9USepJ0+QHNmNA/lXyCKlF7zbqipMoWoK7aRIFpxwOhcUnsz9ZhSE4dm/ifRg1ldVQqzezryxWVLbR/u4bGX6Y1N7rO6R40/G/yBZDRXxSJGftROVkQr/abU/JTzBhGdFwG2I+5K25G9XIJH</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>koxXceVCmdIYIBK2R4MDJguNil/QVow5LJj5SS1a395xWFqXQXEB9ibq0akX4YRXD3NFhL7uoZxEK+dlBZz2tCoL4EC8AA/7L3l4s/R6FPhi/Yd58cfkuq4/j2LAh31wIYFueXlKslVA/GwmNiqDBd3RmBWb4X0w2IeTaNFjRm4xWfa1wolZrvF4cERIjoWDBEd2VRU22Y+Vv1nrtbAbQuSxXAhKl9iPor0YkwC9L/9Upr5BcUdSqaVTp5ww1dkRBKJqBe2moPpis/tjq98Vt0jR9cUN4DuEAd2gCsIb1+PytEwgyJEdXZ4JlbLzc/MlRDVo4ExUe9MkRmo7VA5si0k3beDTTwNlFq1XvWixy6YD3V1EciytBXw0iSu7b2lCD2fmbfE3bAprOafBbGq3TA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlZKcEHoDdmuYRF/KF0FcIjDjoZ5AtKz5jugRuaPMWY8r</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>hUFKWCU07fZaE8M4a2p3ojEyToGKIg84hO2fbto+syxUjMkqXrWbUeqeCxNMY0KGdgDxSb3/Ro68cCN9OhKE0H4dMYvnnvZWGx3KvdbeWQNSV2Qf6jK385zPn/nyMNqC3FVDRWvJx/eLUDV5a8AhtSw8s058gzQIBJiqC+JGgC7PzL5MTMtXHOS7+m+QXEFumV55topZfQJjOc0ya44qwIvyyhIGb/RUukXkgHzti451TOR99ozgV/JgHXXOYnwlVpOmTuRGFgY6G1aPjBxPD8e6kvqHyTU4pMsOK8ki74tGSe2tq2RKuBm3P5F9W0LPA42Hb2H3IsTOBeXEC3WDrGNYKVshaW+31n3rIuZ8zK4=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
