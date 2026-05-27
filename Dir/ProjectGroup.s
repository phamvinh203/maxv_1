<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhvv" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="nhóm dự án, công trình" e="Project Group"></title>
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
      <item value="120, 30, 70, 100, 230"/>
      <item value="11100: [loai_nh].Label, [loai_nh], [loai_nh].Description"/>
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="11000: [ten_nh].Label, [ten_nh]"/>
      <item value="11000: [ten_nh2].Label, [ten_nh2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7TCyZc3mcIeWRnmLSsOSWbhn1FW2UXNjbjVcZdPe1e8dpG1vfDNOtFODX8AYyewRnqFtFUQo1ZdfGQv1nteTNaU=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7TcsEoMgaaFaAWMqR9e2ptJCgMRicEOYNpXZiHtrgp+ItI9+r+Bzj1Pnbp4qS2+Psow4R+92NZABoE0+5yb3elI=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>eE3dAgXwyhMdXArveGJggQ+vDyAT8IPiCxuObiVZY2fwfOgpOfkUBRg/JFWKm5ZJkhbTVRRPWxLrJp00nBBrqqWyVb80OQApvC+g4duIYGo3gYzUsakeI77uxwAcBMhwbFZVHHk6etRvgex14R3+ilezBrF5mChpIq7j91BR3uhTl+g6vzzy9RhouzSd6QFmb1Gg0Fnv/E2KrdxTyvRCedD7OKULG9LAh6VLh5F5w0aNPCrw6xzRY2eGFZczSAWfy4jbSHMWc2JE9kZhdCwoQ7rdvYikFvSMHcJLzceTGTGo5tzIVGTYlkZ3Vy1xEzJ7ge4ybLJ+sNsgY0OD8BZoy3uy5nF1ulcddaDcDnSs1XMJRqfjUz4Yc+R+FOXJ8LUk1DU87UQKax12mZJ7cKMC3rktk8Wv4wtG0eG3HwJl0UWF3bYMLO06cDETcZrkbg5Jt6x3xNamI1LHHlgcDXve2EZTdH9CGlf1H+iV181OzBEEMKqufAl1GkDfASYLp6qV</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>OcyD5WOveLWE7C6cu9SsgFp0mlwdSj6pErW0KE89u0sfwbw/YgkLIJAyqjKlByzBRaBUMbt8K6l67Cl0ArAwdMB70OsZoU9m3Q7WrQmXRfzLx5zgLQaSEcNPNznehoRidv99O9UdxRP8kaegVRSbIY8vpUemkqMN6y97IbNNY/6IFnKs9USepJ0+QHNmNA/lXyCKlF7zbqipMoWoK7aRIFpxwOhcUnsz9ZhSE4dm/ifRg1ldVQqzezryxWVLbR/u4bGX6Y1N7rO6R40/G/yBZDRXxSJGftROVkQr/abU/JTzBhGdFwG2I+5K25G9XIJH</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>uVEk71wWuWZZ1H5BEt3PbSbX3m9ROlEr8UKM6xinSESN9tJWGo+O7ZztSX6lbyMfDdcBceRWTl0iDkClBxfWuU4i1Ed1656/GulI3nWIYiaxqU1ulo5eAJIZ+SSdZYohA3uUKRfCl/uZsSpEeOMcNIJxo7OCnQ+CKzVgRtdylSrovydnjMrBisAQPo5zzr6SI0/PptkWoYtNAoDi3YLEacsS7nDNIX5mmqvQytlXxmEEdBhVDjiSrJeqifw3SYZv64UUOkYRdLVq8OaoEgMCUus1Vs9cLkYFa+KgKqPJir7P4i9Pn0kAUryVpZbzq17xvouvkZXToF3FYiTyb2uxVEdKshwePDGQLfDQEAFTPopZYhj2XcprueyyL/9rYSr14fXVtKxAi0kqADG2Fos9jw==</encrypted>]]>
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
      <![CDATA[<encrypted>hUFKWCU07fZaE8M4a2p3oo+JJ1QWahRkEOXV18VS1aEl3/7vsz9nJI5tuP4sNvUQvsPZ6XW7IkOBcG7a/VXv91RUVWYAV0+OSURfPIghqyol5GwOaKPcBt50v7g7g9NkwSoxUoYKjnJqwolYXbFhfcQPFXEOBETP7DwjJl8JLe/j6Gwn0RlQAaODLvp9+stQ4asfC1r0Eo2DRsPm60ErE7CffrXIUZdIHU07CfdNcYj4Ikl2Ws2Vm6as6offHPb1TV++X10JO+9Nrqn/ybqRydN2MBEJH4ju5At9s7GIrLB4BwfwK3UB4K6aT7T0C+TU7rYxaaoIKz0rsp7MiMqiCPJTuHe04sIEsycIm+OiNz0=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
