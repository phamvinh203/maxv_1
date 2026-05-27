<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmdvcs" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="đơn vị" e="Unit"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã đơn vị" e="Unit Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_dvcs" allowNulls="false">
      <header v="Tên đơn vị" e="Description"></header>
    </field>
    <field name="ten_dvcs2">
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
      <item value="110: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [ten_dvcs].Label, [ten_dvcs]"/>
      <item value="11000: [ten_dvcs2].Label, [ten_dvcs2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ko0hGSir/rdR4ujkK6Z4bzhdqSZ3CVXFYv2M8in284AuzDOQMKLioT4Ao4FHqCvzyfR3/dQjeaJ5ukIkjecLehE=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khMcBMe3F6JbbqVLUjeQeWk+pNtbG7LCRjpic0Oov6EnqyrUiximKXS/czS3dpicqAKKJvTnzxzzs8Zxoo12nuk=</encrypted>]]>
      </text>
    </command>
    
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>x+q6vbNN0LgOspwCZKU8z+TkYLqqiB/3UKydDiVgS1YfptCHXo4rCUjYe9kgmj0GPzQ8z+oeCrLMX2aOglDDd8jhhXI1Sh6vy5uCpwi+RXvdDZE4JD5/3e01Kkdu3U0wfDVY2affDIYP68yI+n81vMy2kfzffBlDU06h2D59yrq4eoL5oVZho8ZW1GRAJYEmaKZ3eba2zVHFyirMMwYzLr4EJAUPVjwnurmiT5lGv0YYvxk8EpQ24xIyliVTZarAvGRBcmV4Mqf+1KULclsFOeDoubYp067t5QgoBKYm8IDKHO1xam7ognMITADltMV3qaKEtVO3xbBKsIuKQw59dcU5Izm47jG6igR2tqbik1n3aTnR/LMJCLkdhs60jnTMtI4xdp/V5fjHd9c+BBHhf/fjcxVzFL0bG3X7uCgA8iW0U8n1GsOdIqROI1h8aT2lQDYTX/Z/hTlfVF6uXQ+oU0RFuZCgThB6UweifSoaRGcXeIdagHYI38szBi5l7W69h3q5FmQB1RDeA5iCZeAH0Yum20jtnZL/E3Tv0ca14Spp26O454BGm4LUzFo6jzbL</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>DZG7GEI227+BhsXCUCQqwQwRuSG2Zm3g81d9D9Co1A1s08lrGlOL6Lt+jJQCMPqVF1L+uEP7a7uwWkJafvHiFMKZomQ38LMRsszEPjTGmfLaGzXQwPLmyRtFbWukGGBvIu4u3miBtHuqCCcHdenr0bFwQIXzr7ConsgJoeK5B1eElNdoZp8PKMmwAEZIwoLHKl/0CXIzbvJ9k3d93hBIPXkQwGo/ZfRuaz1crOc3rNhpXIvWFKp04ysbFybg9qsOacQhvqSvOQRnGw7ypAqkyw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>XOZT0+zVEmeP7U9U62uBWUAGgBEU3Za8nFRLbhmu1HnjXrqiRJhEo3AnFhQtFO9qxCB34RIWfDExxUb+Jz/gWs7EhFDCKaNtKc4lr49m+YDKbSvSrKb+OfiBal5a5HtKV6pjiC0AuXMcXlUfcafj8mbE8ndPstLwyM1UJ6m0INMV3RrQ+Am9lpp5H9SZS4S7dekCXFfMbII91B+DGC8b2YUGZneBZi2eGJwSz3UkZuoi6iW3fJPfjKBTgj6Z2BjjLVbR9vpcOGnwv+WoQZ/qOLb7kXB7/gMY/iAHoh/+vWXWZ6ap4PkYZ7HJ0gJx+ff7S5yOCijassAghjveyeouYfLxfNiJ8fAPjOh/DG8RpPi7rp0j2Y8nMLxPCT8k8dF3rBB6ZMJ9XLJqgS4gNrTXSA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlZ5Wuei3fTWON1XPBjRB1i/LdRJanPgahVYkAYiOZt7f</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>os/+BA9uO2SylsmZR52nRFIM2mNZJMQh5J79s2dHs5s6705YB7pqOGas8YSxPUeTfzCYSVWoVkDbTgLp1YlaQ/lwbCgZRxzU3liVgEVXuOxS5NEq2sUGZ0WSLWchBzypvk7k5sDsTUsM9YZYIplCtVROAUzGEg2OJ95c8mB+sVkQimhc9jE7reEROy9rvUgqzzQKs8BsvRu32sTq4Vk/6Pb+uO6wm4nbgYJUZx29Tq8=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>iVRSeQIZ9aviTm93aaom2Ak/tpaRQv8uWw70HKqCQTAfW1GeK0NgfMj6EN1DhG0DkF6ufpR3iRatBB0b8mT6wuJrrsGceaA3aJph/Y6lQ+nS1ekcGKpqL+BxrtZgQK/lPUsLovL/QyYUDgy+VCAHNMFNrUBvHQmZ8NGiQr/anx8e7GeSPnVlj552Wq5werhMokXHuWLngxuDhsoZaoZ8nApZBEqOibl7WMgYC/c5jacBFlzGZIamT0W55my6iY4DnelyZmEdwY5ByIrYw1cBJADuaZgyx25qJVYlTMwEy1eOoPFYU9Oz9AwQTcRNjheD1/q/ZxKLUUXc8wekpIKeu/ptuT6YE+ro3m1k1d5faUE=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
  
</dir>
