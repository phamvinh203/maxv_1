<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhkh" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="nhóm khách hàng" e="Group"></title>
  <fields>
    <field name="loai_nh" type="Byte" isPrimaryKey="true" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" align="right" allowNulls="false">
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhoiuWzJtZSpRD7nE1KMU06ObNgxHXzzWN31dOE72uQ08l2MvomSAVQUHIhOqiVJmAWmVbACExn5GJfdZ2DfM+w2</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SZZyp3eG0lrCirSQA46Yt+uQOo/gpWL2rwY73DGIALhQlKh9ZEb3a1u2JWzKhD+YGn9K0cB6+NP28t2dpcVsRO4eldaoT0MWZIMIAZYN5sM</encrypted>]]>
      </text>
    </command>
    
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>INgRuFYHyhMH824KaPK/iZDIal79hpCVbGvw3jhbNroHxJr1zKCtX0f/RL/zc1Do5gr+eLHRXg5L3Ol12GUB0QbaCz8mF2DBC/Lsmqvwh1+5C/3zpNL2Hayt9U1RqALP+dAJV7ZaYMFPqJKHrzLr6vhUGwI2WjZraxmirNiw5HEKGNdOGBmyHE99GOjanMiZqlLLuQuz3frApwforK1nFWEtw38sZShXJyN+t0r7FMrkGUUNDowEvlsnqBzzX4UjW5gXkjvd6hSvcGFh8fxkswIAv4dNRS8m6dUk1zCFSsL4gZa++Q/t07Ri7OzdhxfEPQXqVUV1KwW100QjXGo1VgwvuhOuxk8gO3QGnx/+JmaQy1sY2F2m4fDOmsVs4Ifb5UyD7DwhwXTRqfWSNN0bZKMGp0GkqaM/UVBZbvSko1k8m9+adi/uBNCMtqNjeCdLfpsGHfuVpXRnT67Dc3g0FLCfrGqiEvdnx7HHksbrnGjOAN8uzf9dKk3DpP9/KEb8</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>T32BPApSCxU24jE6JVWv8/utCONKYq2naX7XNryBQS7NpY1Anz+rrDxIQmYNl5hEqkXQnOrq0Jw0H7i2vRHlA8RdSQeA4dSWCLEyH3qMBZifw7/HLjO6pAb68KoR4f4YRKUx/Gfek+6SOy2fWHCnOM6cYGq0Gkl0HzkbV8wW5/jLOeZXNp4P4YNyILj8Pi3d0aJSi+3ViOhp/Oio/8qcZLzXhcDhYwIwFNuOLlMippQPOzMPzG02GV7FVmORKfVr+XjK/9RI/bg3USdoqPai9SbsPlOncqtZSSFu6Jr7KMBEFOeT3V2V3e+ncUI1a606</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>uVEk71wWuWZZ1H5BEt3PbVOgKk97EIKEEAUjNjtq7DFcmD5YaW0qQ3UdcJY50rEFoqGdnhPa5Rrn8VXosAeeWJqBIk7K4gMnVzGEhZ4vyLRqZw0rvDS71hQI3sObgWMvdJ5xayWBRKGMxzzwMbSympqZrR8ppLE1ljms/QkYV9cX3Qfyt8CF/6iMyYshunFa2BFuxa/GC2lWf91IgBJpDIA7i1x7JKMU2b/N16SrNvomKYAsuMjDox7bpwfwz4qoZ/LP9vssbAViIZI659xCgboPT1AK3OTHW/E3JdRk3wBG6Lhf2Bmnv/UUj71yQa58dCF3/Aw3adaFqkFwOSnLRD76G7qPoOss3xRFn3D+BRhZpqbF5xI7lZTF2NOYA5jzkurT57x8nPWwRCkzMQwCqA==</encrypted>]]>
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
      <![CDATA[<encrypted>PoMnuoK3kpqCGa6uLBVl4tba29jMl4aSTxCvTBpi/WJeA/cyW9ZgAXrx3tpfR50tafhOMJTxRLO8+veiFtxvqhw57jDOrfXQgXiDUu0RBqlVEb8JE2cuM/vV6PeeZwb170mis7cuioFtW6Egi4oFloi+i93vVF0dJPuJeJsrgfiWdy8OuSxFyc5B0U0yRvXaQ6jRy0h6lhIy7iOoMXkwDxfEaSD4+dSdIm9FnNxHbsDBMDjqnDZHuio/xGVMx7c6AYTsBEVpCZxrwRjBClSyz9H0LBiEKtvloIcJ3iJBNKIfNcX+DH9gt9QoMcEmOIQw66AZKejqD7vUndu7tejT/oAbRtzkBkGDafxF/RVp4zI=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
  
</dir>
