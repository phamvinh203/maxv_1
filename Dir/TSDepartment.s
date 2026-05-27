<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmbpcc" code="ma_bp" order="ma_bp" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="thông tin bộ phận sử dụng công cụ" e="Tool &#38; Supply Using Department"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã bộ phận" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bp" allowNulls="false">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_bp2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_bp0" dataFormatString="@upperCaseFormat">
      <header v="Bộ phận chi phí" e="Expense Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp0%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp0%l" readOnly="true" defaultValue="''" external="true">
      <header v="" e=""></header>
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
      <item value="110: [ma_bp].Label, [ma_bp]"/>
      <item value="1100: [ten_bp].Label, [ten_bp]"/>
      <item value="1100: [ten_bp2].Label, [ten_bp2]"/>
      <item value="1101: [ma_bp0].Label, [ma_bp0],[ten_bp0%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7aVI1g9c4zb2QFazq/HMUVHTvbbIvsBn4a03WVOfzAxUe5eqPmASyLy376HylLqhKCIoJ2jC1eEC8SIpUAG0upyTKNZK/VuDZJR5ssMm5ouP</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3knTtYvYiJDEx9xCle1lShjaaX9x+iLjvUsmSqVvuPyBG5Snx4dLURgrv624jfwc+n9vADzO6H58LMbp1NPXNmo8=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>d2qWPZSfOMYA5D3be24hG9lHu/GbV/nmUNxEHBcSAc0xwh7oRp8iJT7M7B5uyiqpThGjHBrA7+8hwqAQvNSILmw0kOr9sUtDgc27YOBnga++wCNVhJv6nnp64J3V3u06XBWK7g+8+jfOuOwcDznh4qow60LzSJwoYfuXX4IVCBKvbagMBCD3EkF2/2ciBa3g0kMvqf6XqAf4gD2DH2fBuEWOfoYKYAUVVtfEUJRc79llovan5/mxD9eRD5dVfNWJeTzBIyKiajr9T1QTpWZXsNG5i+VVNJIxYbkYHhvP3S9K1F4r5vlAiZwqtsDAhxCNNzxsNuVxvAPgMJWtPvZAiYH4uqiWSXdmP1WHLL4dalcc499qH+h4nvGf771swskVe+kcg9iB1wx+nLiM1sjJgIvPspvOJynWHF9nmRIC/5uT3NnM47ah8vC1MCvukG0vzay4NtU9DNLiaWwkM7nG0RQ9ncrYP7hSgZr7U38SPXl2037qZsrPOmEjDgOg18KmxM+2OrJAFSMwirXdh+bQ2WnDxh7Pna6pL3panRuOgiPEzEG+seRdOvQBS8T0gj/l76/5mGYnPmGPU/rpqtsx6Q==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>xlxEjLmrZaKBqUbrJkH8rUo7HXrqoAp6GEsHJcUmy78gs2WYhZ05ZUjMVxO2SDmdTNSBQi7/8Psqp607Z1B8xoyZ+6uE0OJXCJsNwMlGYco85VqxTIbZQzI+OKtH+l2URSJmmY1vw6KEPK6jPdOiBIrprvp/O/HQn0rM4OjxIlqwCQiRgir8hiI3cX+jNcoabJzFmH0WEpUgBucw+l6CEm1hTwUYp5bNxUfzehfWBlad2RjjviR6UKyvSxWGBRSLdwEmZ8rSmPGVLSSyoh41JA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>6JgV622O1QkxRdVn3np0Qtr/ywmF6d8/jJ4D9TPbVWbmIyd+SO5qMZN1R9HhXE+ay+o6ktXduD8x7Y1jT7QWta+a57CuPXKqOg1t8nAo9NCYGkPAxDddXpU0gp14H6cSnXn2eENfa2ct8dREl7DuzpzC+v99HcCaeozbkOF/0X5Jzbj9DK15floFUAQVPsXwGUQzfCRcn3Okf/U0ZthmCRsSPc+XK7i3yNRoZ88tk8L+rkW7e4UrR9411VY/QkrkzxKmNIF2TXCI23ybOjay/HI7vN3q7Lt8bNBLC59rjCyZD2+K0YEpo5rfYE34eBGZ</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlVLQp58r/JrPracsNcsCnctnsxYWsyGSvHLk57O9ETpc</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>BRB8bxpT+2S3b+MC1U4Q7dawyXX9faInyqgEXym8SO9F9a6aAjHEk93KwDR5lYRb0C8AoGr1KdtAbnHeuDcILGL+UcBJ272SDl6+ckLsaVNyEhuze2XQlE6WlnfJ8z44kEEJji169i6OuSpv1QjNYy3T45y/Q0r/GkOBEZi+GgD+wHhr8tz/SU7K2Z6B5cAn0Zv52HQo1fVd/dlNFkMXJOR3RK2n4SSMhRug2lCG9A6gfCiFsGGdY67iLeMtGWMLvlBl++qHTP+HDybXnyXoE6vv663+XIDNBuxTGpRp5+GTQpo0l/aHMs7e36CejVRC00wnK2hZ996btiUGE3+JgKKoTWfkx1OBJkDtGJOqSo4=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
