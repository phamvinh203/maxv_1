<?xml version="1.0" encoding="utf-8"?>

<dir table="userinfo2" code="name, id" order="name, id" database="Sys" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Phân quyền truy cập" e="User Right"></title>
  <fields>
    <field name="name" isPrimaryKey="true" hidden="true" readOnly="true" dataFormatString="@upperCaseFormat">
      <header v="Người sử dụng" e="User"></header>
      <footer v="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;" e="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;"></footer>
      <items style="Mask"></items>
    </field>
    <field name="id" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="flag" external="true" defaultValue="0" allowContain="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="r1" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r2" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r3" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r4" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r5" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r6" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r7" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r8" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r9" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="r10" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0, 0, 0, 0, 0"/>
      <item value="10000111: [name].Description, [name], [id], [flag]"/>
      <item value="1111111111: [r1], [r2], [r3], [r4], [r5], [r6], [r7], [r8], [r9], [r10]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>8XszP8t95AlMwwuJ2GLfsUxjwKhuAtNJ7lkdBZRKOdw7AhSw0SRMxO4iGb+8pJCxjwOA2jZiH72PueYw0fIBu0eXsaRarUB8SZ60SSa0b/oCua2amWvZHSbvuswKhgtcHSoMit8F8bm2cxBZIa39XfG4QcCU5+S01EjrQUmbUb7w0ItOMh72ViJxbGjJIVtGd6onW/2ngvROMOk96u+KWw==</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VOpfgOoiGWLcrOkxAyj9FfZVDi7wg/PWMFLUK3ii1zbTEnGNwcTU+aJjMscFHmefP5OfDEJCCjadWt1m5VV8FE=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>DNTwoKU2pyktHt/qJ8IiajM37Fgv0mGdeZjOe5to/hZr0Ub79mo4AhQMhrcBVLR5NDm27yuSBMtgpxeJNabbUdFPoE2b1rfc7Brf+W1aPNB+SntH91ren4CmTYtHVH3SKM1MFXKymkX5KpPe1JuGjtSf/rrzmnTwwSFA3mPp0zyEqnlS1VF7CjIjGzDhiJqQiIN/qNaVG6/6l5T4d06/W1C/LYej+wOtGOD0qVyboNneOYyDnKVIaa+RWK8pfOWASmSFnJ5BKZKx17m4bY/KCg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>1OW3ApQa65zo0D+WiP+Yx03dAGcTJO3GgsZwwOZH8X6iL02bwnS/sUUqjea9JnA22kNdBYF+CmRI2nMZMBVpGnjPz6b7YNK8SLQkY7eYRlf06HuKb5chpUP/BSwSTlO90TWZQi07TCh8SGsr+2KopOlV5m3KBVVsuWiI7Dze6BDqn8BMR1CxwFYTE5Iib19Mx8+jTYT7O/N0UjWmGB4HYye8TGcI8RgTH+23A5iF4nqFZy+XCAJLZlVQe94lmtN4z9HiJvMOzV5My2gOripB+J/fWGkmn2IYEPGv0tNO96T/JeRnb+nxni72WBXeiFd8Td+vwbmS5OJW8N39jCkbmcguFhB+sBLtHyIyBzm0tIZwHrnD16D+npltP+6HzfVn4YtxDnrBi+TpMbo2RqG9NnuBJkD2SekNxntwN8QTRXwuaoXSou4dBmLM63XE/BkG8eeorYeX8GsDBH2i502m3LFKSiZv25gAgORyf+SXYU4RUPkwHU51CJpVdsnzV3Zh9IMXhCcnfrqZ3anMBszy1SukHu6fUtKM+7NeUG+ByUQT/plOBk7AllKQaKTqfwzoDUMXcnfJG+7JA9ioyQfItQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>rpSZitoD6d9o9/XXyeCDDaPoS20IB9/UUVnF7tZYoKA=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>xihtMDYFyDjTRdIUPn6S+wwk/34gDiGcOJqYW6fdiwQdlQoAO/1Elfcz999iyOcO1zPfuRxKdtcxeSnqJE3anAv40mpdM0ff/nYBwWwLvFk/Z5HqrnBLdaDnQi6NKnDGsKJRigRBSB7M1be7jpnzWCgCfuQziH1YTXTYMn9x2EKrOQm5wlbonybxosvGjwL09sCExk3HMeNp24M8L3u8GK1zEL5ajNkfRCkd+XQPxNrYscxuOsigdOccdevVesL3DPCZXn41uZM+TfITgNb0hG+o3Rq4RrusiA22CfUowQz9z+H1o/Bu5nOq10PQW+LS14Emr5uALSrYmIZxff7Vwg3vkAeRPZtqRVpkoCuQjKYcn+X7JV8cnLLIe8W4d1SqBU4Z74dZ9Pt4fKlNzWUxcEasNj6OlVr9dap/RvJmjGOYchPI2LIXTOGNLTBnukQE/y9AgLT9CxVVU1howDbmGubZXi8ESz/fAMsJLiBh4tfHrURAnA4ngl6jHwP8ZJS5iMhb9Wm5T04oYB3/IoShUjL2HiNG5OQZYY6AAg1tR4DIOKCDrHKgThYo/OzELfcFGMF+RnFT1ZUSKSliRwAkXSoE3KI1wLrxLv8NVlRUCon0gc5TN7xbuNp7dCYBZ/v7AbJcPpoAufljv386SCfb/Ma31ci3GJEsKDXfDpNheFSvAlZw/lMFMPsojLanmY//RhZtu52HjKfQNsmFdeSk2Q==</encrypted>]]>
    </text>
  </script>


</dir>
