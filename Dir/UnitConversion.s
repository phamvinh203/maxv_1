<?xml version="1.0" encoding="utf-8"?>
<dir table="dmqddvt" code="ma_vt, dvt" order="ma_vt, dvt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="quy đổi đơn vị tính" e="Unit Conversion"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="ItemUOMConversion" reference="ten_vt%l" key="1 = 1" check="1 = 1" information="ma_vt$vdmvtdvt.ten_vt%l" new="Item"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4/pFHSwOnKTRnHYmcQzqKszpFMPqide0JLXFOS0Y+XiWlfzwOn4NMpXOOCJvdCbs7Q==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="### ### ##0.000">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"/>
    </field>
    <field name="dvt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOM" reference="ten_dvt%l" key="status = '1'" check="1 = 1" information="dvt$dmdvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
    <field name="ten_hs" readOnly="true" external="true"  defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="1101: [he_so].Label, [he_so], [ten_hs]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>5g1kLIj/gVBJGG+DSpdLKtX6E1aUOtbq+4DQLUg9JNslJPj1TfR8D6dY8HJSxzyAyHkox6aM7oQazeG51/vnfOAuYiya49F5jtS670ekUs+UnYYrc/EYRgnHzG1kej709GElk3fucAzJ6nDabuv+NClVo48YU2LeIQB0S0krDNmo26iVmSIaoBt9f9zmApL3t7AI4fiQOJ1SwoOZHra+memat53nOTIByIGp5ogp7MnJcN6d4lQcBsSEUEdsf8B2Ghk1HlQNMF0pjj81Tg5d/ahJ9JvCSU4gTbpU3akPAlZVu3bczIMmrq4QXRHZHssiFCshGeSvxWRpDLpRL6xeWJ4V4TfV8M+XQZ7iKJsMOR0j8TWqZd5Rx4q6bnH77qr80Huhoem3On1zbRgYfE0qWRimhl/w2wKfBPw/Ek0DfHY/EgqDw4YCi1w2lEBvZzB4RvV/k0d3OnJFnF0QDiKA5PtMGzEgtQG7kWzH2tDHP+YoTYo/RyLMyhrmWzumYGAs3zys1waFljohO1VLrQ2qd5xY0er35RMgf4KbICOoDnTEYLf/UZ/ey+lGur7rSoBwua5gEQfbRc6IaH0T1jOki/B35IaWUD1conyKAaoK+Ak=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kg0nxF9dXRtynaDldZPmfK4uFblfhMWijxR/OgISZ/E4DeqratVvrYa0/YIafGbCKJQ91xiOSHsgC+dN5DHK/TY=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kg0nxF9dXRtynaDldZPmfK4uFblfhMWijxR/OgISZ/E4DeqratVvrYa0/YIafGbCKJQ91xiOSHsgC+dN5DHK/TY=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>nKQpI7nTSQcql2c2sbx5o+GvTFFUuk6uN8hICNroh96VsFPs+ddmoO6IqY14QE4SibhO+EavwVF8l3hSosuu9Rmm2jjfyv3kwuvmEMQ81IVLOP0A9IMtlnPlW5a4FaLEC4at7rKilVmegt0jrg+1Kv6wj2lmX5fKkLz6eu5Frs4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>CQ9twaeTUMc6JB47YcvSVIrY0arSwM9/D8n5Iy2csgFV1c+h5zzAXw1ZymknSBsFWCYjLIR7UtFZc7D39P7FdhexeywmlKZjKN+kLug5F0Nyy90DzeedGoRnmU1PuFXfVVaT2Ul9PiNPGqPppU7PsilpZfFU0rKBwwv669MgUWp1b1GCnW8hz3scH4XWHGM0DMGEA8JEe/oWJ2B7TDloIK1fSvJNnX+lk90fmr61ljEDzd+V36uteDEw0EG5/yIyex5Clk7PBp3H4cWyEqPS23wjOa32i5uQawBPYPhGDfHKiuSKdRuSRYHZ80RiDJ78</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>wXHXWn2ekrZeuB/IxFyNaP6MORr7TllcB0MgCdI2JH/jfErcycQsEpfO1s4XyLOE+I2LMy6p1CuMd3O3FysjYWH1i+J3T8BpuaaKugscVeNrUnA2jjmeuP+AKPs9jArDQaixvpGemxhCtC4hxR1OLksfod8u8uPV7KjB9wpJWJTIdu5Snsjzf+I/wURrpArgwqGFec0BlkGoOGnDjTWBlD8AK4T8m4YNxcamwLi0ydpmFJkqhAIuEALLg90aot8lrx21Bk5l/IRF/ZUDLzl6x9BfLw6Vzz5prFlRGfIxHR2px0GIwu5gaWpStLw0D6et0XPsB0uGfIKQdUDsuljHLwcy6zXW+8nqoXBzjwmbGY8Le2K2eiX+ABq4IQaJc9sBvgUUafGtc9g91IXSMRSkL+IXwCuB8oO6eH06nAdERl4=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlaOtrd/h1gswuHmZZGE3E8WOzYlSefAg7jwgRNsGenSYdgZ1lCx4JbtXi2qX3G/Q4Q==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>dAmDJkewvm3NN6Ke/0VzUO0t9/WFhX/bPwfwo7wGUYx+5EOgNSR0dokRifSYAh7Y+zMwvw/503sjcaKvyiiP0vocHDaSWut775t/42EwCzXgL4R9nqxsE8qvm3HwaNTQm9xkSCrJufddOz7544h2Kn0p2mRTg+g0oTfG4pHFX3m4ViRIZnbylCvVMJTS5+DmhKiSE67oz3kZfR1g84KlEQ==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>X3G4N9GFON8FUPPzHeC60KIaxdJYmdxOi8v0FxnIMDTE9KzPKV95zYQx9fnp/OileCzvazbhUgnWXsRlm4XghkOmGoXzaqJ+djgSsvo8rD3amSczi5zU/+WtQ9z+sAfxVk13T/moO9jX2nv8JmrHMfO7SxhD0aQavDxDkSIkqtiuX1SScyFSD/qBPodRu3exD04U5vuuBlo2hWehHGg3OgzscTlNJ90Gr++S82iyliXCCsN2qLYT4xKFNa2OzTHbdyYTeVMUTnoEzWa1b30SxnYT8AYVA7m5owIC2eHKkQmfqhwo2ghJTKTuP5llxIrjwiwCT/DLFveBsXVT33h1RzIbXGMQodn8fLiXXzINV54=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUnitConversionItemInformation">
      <text>
        <![CDATA[<encrypted>mRM2AeYgk5loWdQUYIBZcidx3xFSdJv85rfsyIRgx1ESR71nlLnmYORu/kAhcJV7pRyr73+nx5YPUU6P+KQKU8gqbcmjxU8wRh5d4++BucOKyKxsD1Vpg/LlYpk1mwim+hZZOPuoa9Z8TfvxrocMopgdgTanyFeoNPRYZUF64HA=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>
