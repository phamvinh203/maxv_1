<?xml version="1.0" encoding="utf-8"?>

<dir table="userinfo2" code="name, id" order="name, id" database="Sys" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="giới hạn quyền truy cập" e="Access Right to Users"></title>
  <fields>
    <field name="name" isPrimaryKey="true" hidden="true" readOnly="true" dataFormatString="@upperCaseFormat">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;" e="&lt;div id=&quot;treeviewPanel&quot; style=&quot;width: 542px; height: 480px;&quot; &gt;&lt;/div&gt;"></footer>
      <items style="Mask"></items>
    </field>
    <field name="id" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="flag" external="true" defaultValue="0" allowContain="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="l1" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l2" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l3" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l4" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l5" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l6" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l7" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l8" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l9" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
    <field name="l10" external="true" defaultValue="''" allowContain="true" hidden="true" readOnly="true" filterSource="Encoding">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0, 0, 0, 0, 0"/>
      <item value="10000111: [name].Description, [name], [id], [flag]"/>
      <item value="1111111111: [l1], [l2], [l3], [l4], [l5], [l6], [l7], [l8], [l9], [l10]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>Fgqnyrh3U7wAswv6hQniEEgq/z+349SZMdp9sU5wlQgCSTdwoq5JAAzDCrvZhDglMKstdfcAu54edWjlYYBluuQ6Y0ceng6M00U3XR3J89nVTNj4LUBTmwOAE+Esql9zajG41fA/3a01/iL0hqoroCrg0MpdX5j6b25xe5m+Bj9qjByxd8y3qHvwfksLxcc54PvbxePIv7FTvx26GbPPIQ==</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VOpfgOoiGWLcrOkxAyj9FfZVDi7wg/PWMFLUK3ii1zbG1N8hpbGx+c/UxuXTuN1CfWk9R7FX23sFn8Cd0dbDKk=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>DNTwoKU2pyktHt/qJ8IiajX6/QUUFv+s9gaR6It/im3QXXHJvodKl3+j8IbS38t1UuHlMfv/0F360WxJ/m8VDtMrampy6mOhhMWIZie/Fucswsy295mRPSxD2zXRmayqirZJyp21AX+uX5LDh0UMxlzgOiFnXIdwXrvVpnxHUoTMe2oh01+wksUHJ/5qyIU6SMemC009LoixBe9d4tCVtHSZREdScZj3y36ds+ePosaZkCYtWTvTxby55TysJCO3</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>ezv1yxXEcFbSm2ScR11xeoKvjwkI+Jn13tVC/kH4VhCeagyNitadGHcAJAlDN9425BuDbEmwecc9YHURVG1AgCvm6HtK1KdBG4df9IzQXYYZDEXphI3moCVbHUbMnWj5hGCtkjv3K2Up9xyc54iW+NEiQstgrvkcsSIlvyJ0me1zRkssMMR8XGLBq+FJ4lUW8bHUrSXsGiDs+XXIJDB6LCrbysKpyQm9xpOSqfoXitkvxEMlW2Ai0pVab2Tfl1Rq3BGA6r124cAfaHDD0BvAcQVYSYaCV1gZiKwoy/mKtMi5C+hf1s4awUPaSeuSQlr3Lj4ugAmoOtC3o+Q2jfuTc/OyGd2N9XCAr54amxvnqRT/0eqPVLt1jr9Pd41xQPy4nCaeibX2dn/Kcz/SJmaMNdnikLtKN7OawzaEOIUkmZ8=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>T1WLNCP/NHHJGyFiiCfeY746en/44bprIKxFNBnvuBk=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>vYzuPSx+Qv8mEj9lvtfzf+OAoHltuif6Wb4eLLJkDSrAqcDurnjLKcs+HZAPQUo9Cwr7GcDsJidCT2dnYOUzLEMIUGT9r9hvmg/0aN2gEY/xv6Q0Qs9O7d3h5hO7QMMFEWd8Dqx+YocqYpl3YDBGY0xfWvIEsm+VslN0cTDxQ6omrsp5uM4RMwr1LaMYVnjj0v2hDqMY2Akacfxqv8qo9C5hwpMDOWZa9hPbshlEVIbCRmNaqpCCAKi5IK/mpJP+b1fWVq2PRhUElvDILsKI5WFcUlt2rJSzx4gqrM5jGe8+jG44T1ZJeTnSoYcFhpdqHsoiI0dSDvidbY426huCnPE8onzsZt0rXvHlauXR52SwLRVGPHBIteCLOulW7W+1BQWP1iTOSRYyN3cHsTipbGnun3b9ANu+eBAjqiSLuTH4nD2a95c4jNXLqo8AZPF/IAgBtpnCwIvbip8Wiuy2s2GWy40I6WS7ocgk4wFwy974qB0WioSHz6cwUv/3rKlkbmxBcNRjmVY8WtpD4BXAJVJMdozFlzkpxOCrMbTTlgrJ7LsrVFcoFI2h5vC3MBRYZB5Rse84HcR6LpxEzB25LM6n1TzGadwYWuZGyE2pp6RjUF9dR2yVR9DHAYNqgRqq3S5FKDAfQPGUfq231OsCvjRIIKkQu67HpXEpQBVuUeCID/E1Bb8VDAz/d3U/5RdI6BiyVSP666XeVvsrWHjPKQ==</encrypted>]]>
    </text>
  </script>

</dir>
