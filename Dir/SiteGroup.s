<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnhkho" code="ma_nh" order="ma_nh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="nhóm kho hàng" e="Site Group"></title>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="X" allowNulls="false">
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
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1110:[status].Label, [status], [status].Description"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7aVI1g9c4zb2QFazq/HMUVFznZxtjSZODFVTdcaq+tQ6W2HIMmKjQfH5t/ojRUh4nu2UNqCH8c+KzjtNETAdoFY=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khfGFw8lGdu3upu7OMmfoKeHHCu7PnIzORfxEv+kbIDr/MPpQ0nWIZ2/BzSwc7h5GZp+hzMqGlSmYLkgBHn4odM=</encrypted>]]>
      </text>
    </command>
    
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>JFluNs8SmYDU/1kT7m3wI68KcVc0L0GrypQ1vh6eTetQI4edqgmcxH/htiXtXv9WRGmJUq6tRSrfdLjCWXo/Wd/5swK0+75o+ZQwVvuXYDcXnw4Lqf9RU0Nit6gF2POynBvF5/ST6adNmNBT8u6kZUFDUuEGMy5ArSDqguGXXs4Ml2A+Gqcpey6Mp7BHuxU5PF7MDdIlwaaW0QkLZC563JJ5F+L6RFtLv6x8aDO76765ZZ+j26Ag8kBbxZRnDOQ/Lsql47/1HYcBrkkSYpwC4Bi9E11egjvx1ZC/KDK0GV6M3ZYyLW+sLX9WikAHgvPZw2P6o5PdWXjHE61rT4L+8RKMC40qjr6QhYO90OFpaeKLqvqDeEvBB3NxVg38kbIoWh3jyId+OnqyLYnVqK2F18z5QGT65yN5ZnlcYQkgVBKVbqAtEi1KBoBxcUzQN4h8D5nG3leRdHfeUajWbxoBR/DadZCEKwvI6xz1afScesh5Nc7sLLJP9ixxrLiUAeAhVPfOT9GpmZHKZ4ss33QfGkOAzsINZXZFuofYTKyWsPS8psgrj/mT+noojVnmLvd+</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>xlxEjLmrZaKBqUbrJkH8rUo7HXrqoAp6GEsHJcUmy7+NhsYXoygfiq28NupMF3AFkjVYCH1ASIXAXdKLfBhAeYZ3PYx6ecJn2baa6ghQOkxM+/WRbTx8Cou622c1UNWB6RitrCWBNh/kzItycc24zGZAaaizRjM+92k8Wtrh5gE78JR7Vem/Ky2r7SW0vceq4Ir6kMLktOsFkD60Gk2Fx4iVWuI0mofu0r9uw6cKVHVD8ABihPsrZH7oLcFHeDY74ut07UggY3PyfmHtwML7iA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>6JgV622O1QkxRdVn3np0QiZzysE5SuGkdD9781dU86FGjlIg9jPxVpJJKabDclGppARRVqigklZe1yP1oZRIwZ3ryWVvI3w7Yg32hUOjqgLnNDKlMomTiDRKmMmPdd0Eb9TU1M/GqYwQf2M1zGJxpsFbEq4uh+wEa8kyywkS9Lr6Rl8VaFrDqAHvF0R2ta/BZFpy9AgOY31q8pxXJjUQaUphvnRDskbFIZwVM42Fi16XVKtzo6zBVda6toV7C3AQx643h79yWt39X13x/kZKDRsZGtExXA3gIvpRuzZP1Ezok2Q2Hzpfep7FVkcTGIrb</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlfjg+202ATXzMNe+X5v6SoeCutloIzXTnijXy5k7N9fY</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>hUFKWCU07fZaE8M4a2p3oj2HLCY/cqMqdeIC/LKfOjp1pahxujQNmnpCOrJOXczShclgIlj1IhB0apqqr1vUJYQyBCVb8Zye+CxGt9+GG75ZXnJH5E+TDhvG87aou2QiRuYuYlw65vnAzRWhhXTy2IbD6pvxsktQBgCAPl/Q9L9Pg8OEDWa7PntdK0Kju9CV/8uD3EOd+/if1+EGLDq/zyR99yvxq9MBq/l9K6Z9Vp5OtW0Y3fQ1IvtiJ7Pd5pAiHDl+PoEj5HM+Yjr8fFXqPzP5s4AmBs8XJwvtloKGVLOsVia6FAdMwxwLe5t+iyxxBkZbrUJqsSVBRFto6iwf4cnjdIczbEv6x0BXPNy5guI=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
