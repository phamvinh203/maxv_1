<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 390"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjKtDQnUK7JKdZgDEj/mPYkekFZQh5FgQB9ZUW9JvXPk1ioTXi/9zOGX0hBREkRWaD50AFSEPLdJ588YMVPXn/ho=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>0mcylnoqEJwNJSPAnMaPoJmD5sL2JwDc+HJh21CYJgdV4qPRn9aC+rPi/rndIj5XskTIe6SUi+v+xwdgQdbrXTz5eot6iy+sODVrwvjIVOeQdjSnGPYVRpPKTWZYAqry5r7aKKyQehi7Hyq9xk2FFvCvbWgtU/rZPP5skks23dzGziAWXQZX6A1at9rApr9XGEmlNQvy7r3vFLSlwuf9vgXbRUpUDT3Cwd4lhyTBTWARYr9EfbibDgtUNzven+HGCNE8rZoDCJmYdxsfrnJTRLjryLvna+6H4m8IoIkKdWFDBItmOANH2kJHfGh/8ZkDJOwPyi65+arQJ840sYkzNDzUbwE9OtPSQ3AhIc5m/m/coru6rw7yaMgwqiMZOrVmApj08Q0ImB0IS41U9cMgoi6sQI9V245yrFxyNehZRbS8vJWWqEsR0iBXkQ/dhoO8A8mvK4U22CbKVP7WnvXKA5DGEFsNVLS2KkMkLvV/cp0=</encrypted>]]>
    </text>
  </script>
</dir>
