<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnvbh" code="ma_nvbh" order="ma_nvbh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="thông tin nhân viên" e="Employee"></title>
  <fields>
    <field name="ma_nvbh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nvbh" allowNulls="false">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="ten_nvbh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
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
      <item value="110-: [ma_nvbh].Label, [ma_nvbh]"/>
      <item value="1100: [ten_nvbh].Label, [ten_nvbh]"/>
      <item value="1100: [ten_nvbh2].Label, [ten_nvbh2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>

  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7aVI1g9c4zb2QFazq/HMUVH2CUJXbhu32Y30jgV7oHgxFlpJuLLjWsU5Fqx5cz865LyK5WPzXUSYobtoBkZpo0I0m2HZcODfZvCYzX045nvq</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7XgoyYJkVgbM0weC3Ty6Cdf13B0ixnEq6KJRkjxTXK5rkWdU7+VAxAnH94W+Hu/78r0gWvS829PNriNLzfkplxQ2ihYH+1vPB8rDv+Orzxym</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>W31/E/fd7KyszKn+Ox2YAMqUxMJCXqb71LVwjNDYqw47RTCGSAdmHjdrHGmSmY9UpUrV3Imljj+n3EpJNUBK2tDtJCZhruTm2Ss3Kt7iBtiR7KikEX1L6Sj4vSknlClJxCmzggvLpx4hXzR2le1uxSBOmskjrgRqUZEklMnnuOdiR2czLUFqoIMfR1yY95vrelLAhcB6LJzJX0JlFzsiVaTQ7cMdT/NJ5L3EQCwGOYBVroupiacgzqBt/CYuAufiRM2Wr5ffGeS95DIFCpxlQ+q6qx7SfMwZcpK4Swge4OVOklrauVUvHSPSrZFg+1aULpFC+8vp2+CuyAvSV8tyDwbgI3sQMY9wTcC7lfUey4Od8d/GXfxYiQOewz0qvTql1j8MGkKkKkzErqLptii/NUWIamZGfWPgY7dPtA/YcnoezK+ylpafb0ii/krJaCv5PhIhi7prYQ007jZ1vmOjng==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>yrbvJV3+CcNg+Q83dh3OBH7F/GWeewIZ/p+2VFBMFP/3HvdjT33cGuwjqS1p8Tnz7Zk6/2fx4sCa7nro1X8JsfrY+tUQaRG+M9LfuV2SQjhVom/8714Wy/rdkKT4W3lkeRCHjDV1V2xqGvKm71wh566WWI1bwJxe+A3FschgDfWuGKsuIjyFKGTx7agFj/3OJHvLqAyZeIm8EZOcV3b+KZQfsDvhjQv4Tfi0/sbjOPT2W+vIoZbU6NuzHPUOWbboTvN5T16JYsLgSutFUEewIg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>FcU2kBtP0v9NMdKm3+eW6CD6sZKOFADFaCg7hUGc/oAm7xyd/1Xdrlj/e9XDWhJwtJXUi1KNcNDqd9nG4qlhQAEAxjPIZrxDzy09Kgbcw1nYq2a11umMEmj4RkQ9/RNlvGKW+3R3cUUQXoKKGSXmcQGB4bGXnsDbX0Ic517D1yZ5TdpPiSne3ExIjQMdegupLeGyAqyB6k2c9fFxlIYOD60cU7QbFeecim0HcUYe5qgJAZ8XHTMWt4pKIM1tsfAXkiYEtTiwRJKcIop+W4m30OUkRtfTjGbxFAdLzTxxRfFbMnNIPmbvcVH+wLOJQNZ7</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILUL9IvDKWQCfDOwV/13IOs0f3unnqtYCcgRoXylD/Gow</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>hUFKWCU07fZaE8M4a2p3ogrfpK562ANHoNb/Aw0vAKY1Pi2W4+kA0/8LLTPybANweAV4DzSPakvZR0nyDvzmgCc1n1Sn1dJx/0oMz8CpY2zMvTBQaaoYcXpT4L9dE2jSFyN/GkZ8W+Lrd0nZJL9fXkKPIdYUbNXLbrBlfGEPC9OsIZlqkd0wCWdDyIbKaiLTWvYQmAj75CGAy+DzT6UjC/jnkIaf7u8T/mYpPkNIyW86KNApcZH+ZgSR/uZMIzIYldzA0IghjJd/bmcKy7RSg+e0nhlIc1fm114/5+6Po4fdsFOPMiQ9AVqTY64/nWXtkgfnwbATSXjvPfV9x/SA4MMx/otwP+ofL+wQduqomS8=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
