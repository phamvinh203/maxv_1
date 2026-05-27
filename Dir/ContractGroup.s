<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhhd" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="nhóm hợp đồng" e="Contract Group"></title>
  <fields>
    <field name="loai_nh" type="Byte" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" align="right" allowNulls="false">
      <header v="Loại nhóm" e="Group Type"></header>
      <footer v="Loại nhóm: 1, 2 hoặc 3" e="Group Type:1, 2 or 3"></footer>
      <items style="Mask"/>
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
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ksX2Gc6XdnqyboKX/VFmQxjEDO98mJ0Rg5mwckKF7ugHg8ePdf0V+Tq809rQl8kJY8sePzyhS9GhNVkcKUxtJYw=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kvjl8rlddVoRBYxgigDGtggJ122AekSblDi3RobgRPlOr/GeeAIkRrLh2xYanuhTKuNbEh97LCyeeAUwc37l/FdMkU1K1KRVsy8F1MRaj/yP</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>3Ep0uybeO70tE6LRtOu4jbjbDDZwsr+io9Sp/RbAA6njvxCth7VFLIu9pddkKRNaHvbQYdvQj4WQLMllCln7bffX/Xye3bcxIScOorw7hBSA8jFGyO+Bv2EwaNQ/wcru9Po3q7oxTEQSNHhf+QCGrOTNDBcrFyfzGxb03VHN6qn/l2y40VK6jsaI49qzf8LRGCErcYUzTtgSo8BmVJtZ8StHgevbGXzwCrPrlB6aT4+MVrAJgL3IrEYJEL/vmLjNdz7CSxaGUN2y3OHOSQ5mUT6LMiXwiiDfUD3W4SCkiWSHoLXhW2aQ1TBQsmcYhrgJWa3VnRmnvptj1mVVTpj4ftz8pAjvKTigaJ2H8vQs1Q6tkms0IaJNzcQjVZ+T8aIQhOxpvh8VpJw74VQn0AT/9Edsfbu/qxDLluzd3XBRcFBiwCyynk2ingooXBCM8XRGZqrwyokorweo6fTBuBB5/t9n2FUvmZIO/fQ6bSvxGqE=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>mP1qogm3s3+c8dQEYGRC94Uf5yMQrraH7BRJPhjpyfAvCjRUtSUFA9yfXLKJgYIez0gm8yHh6bCZYb3/M3czzDQrcRa/YIkll7hEzcGh0frCEce/LVjeMa/otvpla6Zm97WhhU4j47b8mQF0agBbJ2pMt1cdL6mE3mAv/M9rh4L3g5oJmWPPTUiut/FBgb+yTQ73zNmJoWTTLS/sYtPPjDkN0cEKBloTlvvCwJXV0EUmUVHk7E1hE6LVzfRbiMNUWO2/vbPjAsTfljUfjP3eRazlhjEyMHb8LQEOrFZ7gst0e76QYnve/qfDfuDoDjh/</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>koxXceVCmdIYIBK2R4MDJjVKWo9aFREWXOA4/XjGzXejWlVrmuuQ+UY0YaEyfg8KiSJAFsijBOrHG/iErIMZCKnspH3yrom6lIj9iCN+kKJ1zXL5I+3v9lK5FarPY6ZH6BbjFQCZXAU90MWIcw6KvT/iTo1TySQ7bMgAAgi9Y+p0l/pDJXYVJwOETKeNxxORpFJ8LgjPJ7ovfIVGmQYHImEywHS6pO1v7xkJF83hnoZftb/3XNvvNZ4IdXJaLYKiX1Ck56bYW5RDehF4/et5OfD+GANSdOyu9OT6WmWbFBMLRg/8SNHrVH7iu84b69V6Kk3rX4K6w2+imly+ifOGy/eTbdNJlAq/dcMqG9cgY/5YBYK1ij9YpQv5XRDxyOmvXujK2aA9wB/Qf1VhuMhdng==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>LYUI0y+nWGW68y63OUG40v8gMEDqvJEpTd1iFznDWuKMcn2zLQ4k3Et8RfPfVleiRVb1CsR42T58RoUdxl05vfIDuEVGuj+IRec47oXWTrY1VUVbXMlkfoEq8O/6HD5m7twy6EuehXJ8wpuOPQvfrQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>hUFKWCU07fZaE8M4a2p3ojls9oWEFGptGsDI1FnpkBw/lG2wV06y9zmsAJpuwm4EXwlTWtLxE3AVH60HHGfqbc5VvvoaOCTmbrdGXee0zeBSbHkRyvFz3JljAlZN4FlBwJDqNqzy/X8H+oXGVJUOXO+THkjjE38taz9A+XDVHSJmo/4KqEZzuizUzz4i+KiXjJ6UemZPVl5+UfWGs+BuHz6aCnXM5m02nuOUyfyVMMIhA7KtYNHMRhL7+g9RTzZsZYVSxoDexYAdb9LB4uHgpCq7nvMPFiHJ+K9LhIJgBCf+gF8u7kvyNBMS78Qq2VodF/duha0KqGvZBgRMfeIBCFo7wu7Htwm3we3YLhz4I0M=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
