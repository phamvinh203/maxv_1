<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhphi" code="loai_nh, ma_nh" order="loai_nh, ma_nh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="nhóm phí" e="Expense Group"></title>
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhriJF9fScYd54aJLjmpLrxNOD8dcQtDr+u3Ip4itB+NgNfDpXQn4tLE+3JSSHbidIZBJfdVfqexGJjfjyn27OCB</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7dgSrK9Wke/fLQJKRU/iQjg3hdHLIR0MttGv4ptU5i1/QqqccZto3+abO7BwKVbdACLH2Akj2fq6SeIXf5QDKn+61zxk6IByRDjLFjIO9KrS</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>wIKMaryvYGYi3QU4mqPDGNJdri3/4trEeWemmJCHLRJ+sddk+ILYvzQzOAB06EoktfYtJ0IOIGeZY3fifINCaxAabaF0HJmy1jZrPGQ/5j6Sak2wK2qOHOvBje2aafSk6nJFUEqn8UqlAJksX3H+MauDuMYOZ89DeudKoUxM1O5VwfXpqko4F886/GU8lB4q1v1GZzO5rPuHjtgjZD/WQ0aDtMRRyLimNEa3mzOe6SmoiYkbFPCQVzmLbldZIX/u+I60M2nRvPwYgNA2/V7ROuwVbmns2uPmvizAajM+4DznGuvrqYR+NEJe4Q+w2WJZlgdJrU3Y5j2Mhn1FizYXjjK6MA3l2dS1jE1j+2CzPkn6grihvva15WtWX4kg8g3ln0ka5R/3T35cJ5j9u0/ewPP9UM6y14cGfSOdo6vhjIXOuPACfPU6dOhODnT+0oTsj3u8IT7RVQKmLpiZZaAwEJvUCoO0ZwOQKSESyxnhGPM=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>o1ttt5YQHpnlFWlNNtNY0RgTPsXxUuSP48Cx/xXhm+QtENKLb+fTo/t1B12z2fGBHrRRE+0qcOSNXyXg1CLTIYX0RR0xAA4LU5+j4yZh891HG+TXCpkRmqGjj2u/Hv5VfOB24Kf+/wdez91+akx4PwbDNdoHCoqLz1Ohfd7L1tVmtd3zp5Y+cdWuN41FB/RI+mdgFh7ZZ9n4oCIWhkVm+uB5XjMRSE1DEE0QUg+ZowTIYDUYrfzj7os3pMS0NSwS3QVG1lmqtMpgFLRaupfhC0+ELFfNiQO9vJUC5M9e1VgqbDbCx73h6zOb7biMVrI+</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>UtMhk6XesO9nEticrhceSNZ7ZaJWNkoany5CKHd0ZCmQPAvRZOV8zobFDMiXrzW93wAMshd20SFbaMfVt7a7NalCeZxJSC44f7x44SELJTW8bhnBGEyudiMIPSN+y7DT6WWlzS/Nz8eKUmP1XkPwWgxgasvD8rqiXe/0F2tusHUZLvsSQmFyE/hT+huL2AmG2ASepMCPtG6rsaEvLbDacQASMqsQStSmdZrdbkqY1gVJ+VBfIvBEv/LUtV/8V3EgnK7VJqi0znolXKBKUvTXEGq7EENDpi/bHXhLp86+4CZIHUWPXpGqyRVi09xCYVztUCC1DiSYWCVUcZQ7T7XI917/VVfI6cRUtCU8VDvc0h6VQNvkFNhyr+jzpfAdtIm11fkFZAmWW6H2NJlaZTQhHA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILa4xVZ/dAJZGV31V+cxgAv1ujyEBr7n9XSMFiWoxtEPSpSjO6mWnWgpLvq83K1Vb/w==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>hUFKWCU07fZaE8M4a2p3or7jEF47oCrY8XyEtayaPItiLgsLnOqWTLZN/sAk88W7JeSoXoX/Tv/lUKGnDd47U2CWjYYCovEKKSR1V14798b0ZMo0q7KVYOuCEI9uohaLCgvJzD9cbKFVT2vEIMWdySrZqJRi4BQsNCuFjrVTgCaopldhdxve5OantPOU5JDpDMNPMuGKyzzs/WL0LYeKGuun9ADP4IR3ouXup8nVn6DceUyt57ZhqfkI7pPwIqqLwFceCZ0yAXrcbvnkiCKB8aILAsc161mjo4I5SgjRgU44XDV/RwevAwFQvP99cMjQQ5JgJGTDmMruzZ3FtecaRT06JGbcZvGXhNf0TlHF7JY=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
