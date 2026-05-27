<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhvt" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="nhóm hàng hóa, vật tư" e="Item Group"></title>
  <fields>
    <field name="loai_nh" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" allowNulls="false" align="right">
      <header v="Loại nhóm" e="Group Type"></header>
      <footer v="Loại nhóm: 1, 2 hoặc 3" e="Group Type: 1, 2 or 3"></footer>
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7TCyZc3mcIeWRnmLSsOSWbgvj7QhGHEt3mhe+yNjwILXSBu0yROj5vDJQU2dI0sptMi1oY+4fq0tBKgsw+sJlns=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7cifIx4hFBcZL8uB8NvC/pt6i3ySv572ZgTUkCMYtL0raCTN4HxivQ+eVv+rldTSDbmE5zixKxcvZOv6sUDzgc4=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>GWRd1121TFZNX+ARJqSpfz9W3Y6VpKU4p6VLDipciupISyo03MkkXhiT4xeen6OfwQXYvWxyPMLl2EA6B46NBkFl6Wfj3XjzjNzWM6rKAJxhzZwVQNcZLGsWvKPbpD/+QPcEx+WqyJztKgGeMl1/B+iKdrEOToil/QjMexAUfYcdkd+LvrCE93J6sMUnB0RVt1ouAb1Z48tg5t1vntcCK7WfriznicYbfW5iTtJFlGyOUukj9jOtv0OcbyLFPD1wyVq11WQKEJnMCga5JGq2lkKgydqtLZzSD/GX+K5uffxvw8C3zSG94ebS6+T+OPSOGRPNl9C5mXzJoP/nZCY6WI5+HzNwS1EY6gjx3fFWK7vUEvLRq9kpTufXh4hgWmBsaYvKk0J7hJWFF8RHotFQ06bpqmfTylNvxVa40hcA7ZBGH4qPUCWlTtxlPqSmBjfjjz0h+wQbe1L/y3tznsEm+7cPFnH6DzsOOHoZqGBw3D/LDyTenS2RNHL48pCi1X6R</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>mP1qogm3s3+c8dQEYGRC9036Tf27bFCAngOJE6UhjLrzQV+VmYx+oheYtltv19LzuhwsCNc8WTangwcS4EvVZXmmH0UbcPuGcaAP88zhNMmCof4Ijh/d59PrTeebyvEZe5B70l9g+GY7mHzvH5SBfWEMlE/J+7J3IyJM/fkYko2xMntk/SkRS/NdAcrgG3d944Z45AINwqxvgPlyo/13UbA/b89QzInQfrMprMTkFhWxdMIfpTWemb1423nIolroUnsAFquezmlXbICjlvaSaKkgbdXv3qHd6X+CS37fvLESwOaQkA4qV5oTDYAr10jp</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>4MGT+UJyjMBcJqrLMeAJT8j3UVR1ehELdPKSp2fcjQJi7aKI3hu063RmPn/KPdf8m7euFB4OzNiOLaLLwsASChJIvw65bZ9KG781ZIyXyVHaq76uBMxiazntxs9CVALGR6htjfy456CICtSK7lI4dSUuCVWx/Zz7wO5DlUjvBCDZhPlruYtaCi0ONE4djDpvmYGztmxWiSL9v+QcJCzaVubXqBPsQPGbHShgCH2vrQc5oYoF7xp/mo0cib/S+yet9CT2U327Fl3MV2TeokU2xWsTUjqOmtNI1L/0vT4OjIcNM2GHVEzQDFub3yqY2mLUU7As8zBo8lifpTqosA+BBJcpQX9sih0ym7kmYReLoDdUtsr12RrdzUODbV67IXLcBV+9XCaYvq33VO4IMM6IiQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>AgbNGaLazSUCHKEN90awqvu4t5LiH/YQJ6EFF/XpO5xYxqnO6X3jrBTxitKDH69urDNIMmqALOmu5k0+KunaSE+bHY4ey6ihxPYeM6Aheu5/XGBjzIq00TOty3VoaKSMRSxhJJoMJjulMVRadxGUOg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>hUFKWCU07fZaE8M4a2p3oiQaOZB0h9JK/ePpMhPDEo2o4vGplsGEVsdsyn3OwSB9SXEReFqcZbNLP3obgoSDQiYdKRKCBQ97JvSjeIxDdbldwTItWfO1lSYYbg5tJDCzPG/ikNydrzVo+8z1lYKoY2ehp4NmyTjOKRr3Mpu/Hm/JJyiCl5Kiqi301tjRMucgnCIJ1BR8mOgvhXgddVPXWhg5AH9JuuUlBguSAJcNIfFk3f/UdVEBEWcwxZqFJwL1zUPZODJu2EwWB/a3LOY6ClSoOU9Hh2rfrD7RFiP5TNkwwqeuvq4Ldvp/+VuwD4rVy2xl3Mj79N0TfaAPw6W9sZ4jqpeoJi+7jnjGoFsIRo8=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
