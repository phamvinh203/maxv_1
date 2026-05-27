<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Backup số liêu" e="Data Backup"></title>
  <fields>
    <field name="folder" allowNulls="false">
      <header v="Thư mục Backup" e="Folder Backup"/>
  </field>
  <field name="file" allowNulls="false">
      <header v="Tên file Backup" e="File Backup"/>
  </field>
 
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 100, 100, 200, 100"/>
      <item value="110000: [folder].Label, [folder]"/>
	  <item value="110000: [file].Label, [file]"/>
    </view>
  </views>

  <commands>
<command event="Loading">
  <text>
    <![CDATA[<encrypted>Z6O/stytZk/SbG1kZokA1RaE0FziK0j0bihVerv+VZs59ARrfDBeWsByeMdlHDEST+LLE5w7QK1MvUPAfrEXwJZjt3NqqYUjmb01J5QG1Jpm18iT4kXqsKtVteHJVAo6WgW1sCzP4FRtzuueK+7GZ2Wd4xaLtEHC1VQnCtCo2A4IYiH6xEDv8WhG9YBak4PAz9HZ32wVqu/A6OaasXB0wuEjE1cOPCaJIUX2iznwaJNjoWEl+FSDPKVlK+uKk91l32bvk5FR4K44KWgUoldAIWvqL0qY5n+WtEXZAni7QLYFR0SFVoh1/aS9PfrLcGUjMkQJBbw/P/ytWRRiqN10GSGdqUenhhY/zqSMUCSzmqxLVfNZpY70li+NE0A7D32w</encrypted>]]>
  </text>
</command>
   <command event="Inserting">
      <text>
        <![CDATA[<encrypted>xiT03EyBt/QbZxHGRqqTddbK/HpViSVHhu0VsS+L3fPwgVhaASReCyP8wyS1vJIKOVGAilbpvgxShIKB+Oyrxt21HeWgorA2PiAqj6ZXdOY=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW48+AvvjUJfq+lCHunHYcSJj4l6Gea5O2FViFqzuQLMBdQR+QX3GJxR8xsZ9JDVcn6+UtwwmHxDkPi2CP2M6UO7LTWdTSKoueLZlMHd7KlUK/SzQM5Kr2sCLn9REVnoaZQ==</encrypted>]]>
    </text>
  </script>

</dir>
