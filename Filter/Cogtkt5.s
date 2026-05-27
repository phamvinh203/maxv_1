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
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjLQ2ML20lxuyQRn0lao80+I5tLANc4ztNcWqNjlQth3U6S6EkUK4ZSj6e5+iJSvo563ZfMw2VKHflI/bF1yrUOU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>0mcylnoqEJwNJSPAnMaPoEILCBjA9s9u294d8n6JP/MRaglR/0cXlsJlnsg0IYgoBuIfddUqTGPreXOrHrPqsvxhMmKh2UuDmwF8d1l0u+fjvVnfcQGHExYUfAaS6PV71W4xFKInsk4sNBVeJspB6hTtmxRQy1ULt0P51TOiRRfKCNoGoQEHSDbVgcX2hYZ+B5d/bB9IF0fHjgs1X711tanBXaim5u//pKRa2QLwh3TCveUUJvLEZKW5+NWhEHQP5YK0vB13/P6xkW+dWW+SMBa5vnaQo1s5Deci11Qns4vHpv/Q+tZEmGAfH/FpgkK19wlTgbiJxaldx7yGTxnzrwHAFBiwp2H8QcrgSFUKC9EkFPqjndok8KWbNSG01j9LSlSVx4qHS9PU6vuNAaAfSzJVWrWJgrZcrXfbXGtAJAumASy+fLgKJ1XcZpcKp74g+1k/74Q+PflU5OrOtIGZx0ezdN+3blshVWULJ91RM+s=</encrypted>]]>
    </text>
  </script>
</dir>
