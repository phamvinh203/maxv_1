<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmmauct" code="ma_mau_ct" order="ma_mau_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="ký hiệu mẫu số hóa đơn" e="Invoice Form"></title>
  <fields>
    <field name="ma_mau_ct" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Mã ký hiệu" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_mau_ct" allowNulls="false">
      <header v="Tên ký hiệu" e="Description"></header>
    </field>
    <field name="ten_mau_ct2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="loai_hd" allowNulls="false" clientDefault="Default">
      <header v="Mã loại hóa đơn" e="Type"></header>
      <items style="AutoComplete" controller="InvoiceType" reference="ten_loai_hd%l" key="1=1" check="1=1" information="loai_hd$dmloaihd2.ten_loai_hd%l"/>
    </field>
    <field name="ten_loai_hd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
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
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [ma_mau_ct].Label, [ma_mau_ct]"/>
      <item value="110000: [ten_mau_ct].Label, [ten_mau_ct]"/>
      <item value="110000: [ten_mau_ct2].Label, [ten_mau_ct2]"/>
      <item value="110100: [loai_hd].Label, [loai_hd], [ten_loai_hd%l]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kkgG8yLJN0PcMQRvXhFs05UxQ82dpi29cqXTPlpFsPh4hWE0QRA9Qd9OVeolGITE+6DSE4xgZLT90PaPrYIkvKwT9TIliAAqoGvWZcC2p3Li</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7UgcmRKcBwlzfRspMq4TAYjeposFJmlZRlusFBvrlQFzWSuOd9p/BW4INWu+zGmLrKrqN+odBIr+7iScUTQ0tZaFIpZBGA/H8dsOrFXXe3Ee</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>F3KwX50ckHcWaEh+Z8zvkVg4+X1QRX2tfZv7aeV8XHeG5HvItYa+9RnRhpgufp1b/ATHGZwq3pFsVst2i60lIPOhDP4RyTSv/5iK3UcwqNzY2JbpEWrtu0sdGB7ie+LjBbnXgVNv0MPJucT94amvwKDvepTJqYBL+UDN1lcH/DZX9TttKLy6T8yKImQ0aM45f9F72qypL23G4NiEFwkmzGJ/4nDcgghk8SGI6CBbmBZ74AxCe1XxW19AUmDueJH0PB4ytBomNXQqyllRXU28RJLDQftnLmGj0ohgTppMq8KhoF/Oh7kGsf16kEM8vfzNPUZ1XWaLiSFTCcKaNqohElNpzDE52HAUt34h+g1rFfkidfHks+Pn5mWb/EhhVsfcfHUvPkhBwlCOiC06lNxH3BWXXkcxJPKFPiDphd58flhFMmZXAaDp1QOlemjmwkdW</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>7prB3M0mBF7TcmDM50U670V6REzeylED/NDqgAFV3IwmV8qjmK5KX8tjtW/eZpCTdlLb+IgvDlIgAfRG6gBOOBZphAj0zoTquHOof1z0G7vqAETXXeWw+f7CuaRi9Rr8BibvRuUHxAHxj6TutClnf2FBhDs301+VYgkjQ9SAMq3XTTWRMc9w2wSqkjeKyNtooTgoS2vzdkg9HSZdqY/1ScKJYp03EQ+zUSwnwQo2PizSwIqOYNCsWtc1PKuYvex+</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>sqrlzE21FRe+8DiJMLxxlUv/6qmVktiouxz2SUwftO3qFLg38mv71W364Z0UphdKg9MVXRRixbOyBNBVdbx/UFomtBw853jTeNZy9eDl1i6myZ0FgNDDaegaL9MWSwcyvXePTtfgEbNgFqgAhBAMv0f+39aO44GdsiT8zErbDMEOoc05zKD8SqM6X7JXqPhBF/6SJds9L2jwE4HBbxk6m9sf4LDLqVpFDhzQ9MosNLkq6rGFnj37eP3/0kTGkbpLRv8bdjoBKR2/+WJS+OMIWZ3xCd1DcZuqpRCCoGsBpWo=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlVWCUFnfszfvOJUHITn3vHDsnbycUSJGpUfV3OjakD9Q</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>NDGrum/J4D4dzn8eTgDkb5WFEUm6ev+8ZIsMHestrfazcWcdPQKpH4YA6AHSvLfuFDzhlZmO0lqQuDIx4Bv1VbqYc4yIu41dKAKASSIy3P4O5/CpKAi8A+2A2FwrQC9d3TOoZQ9r2Wmkojssg+XH2LvzYJ09diZIrs2S5/hbc69SYSbVdXrbGUWqeOgmVB9jGuEtVZ/eivL3Ul4xcEAsSQZeVVcSqVU/QI8V1Smn8CmYJAbBz5fOEMAMR+xKSccL6D2jSpNze/DzXAZzTpbOExfq/J7FZvG/lvLxFNb6XOlX3z1CGFMpzmhkjyz+pX1lmvRn/jTN98o9GAfI1X+B5CgP9yZ9AsUDQB76bmExjETxlh52IdZHBDlK7kQkIcUj+J3FTCdRUd3lPENrfF5AFg==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
