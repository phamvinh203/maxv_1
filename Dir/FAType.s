<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmplts" code="ma_loai" order="ma_loai" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="loại tài sản" e="Fixed Asset Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" allowSorting="true">
      <header v="Mã loại" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai2">
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
      <item value="110: [ma_loai].Label, [ma_loai]"/>
      <item value="1100: [ten_loai].Label, [ten_loai]"/>
      <item value="1100: [ten_loai2].Label, [ten_loai2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhqUh1gxKTeE3CL5Jjq00zThXN5xm5Y6eeyqVawfXc6qgjUveC0LNbghYcBRo0rFbVQ=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7cscm7y4mD0HhTX/4tZNMLyY0pdhejw+3Bm3W0Hjw4yskJE3OPQZddp9e0ExcZT/itYrCBq0b9tnQi/xQg+7ziw=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>zCprCv9pwvw0XLA0r+tEWKo3vldRFUxl1+LnaD+D0dqNsg403rcjDQQm2aZijOJhOh2pMWPXETbI1iG1HfHXO+fXGaZD6prMbVQsOclpfvCNU2GKUwc7mPsJjJNO8BfNw+vZVzrXKy7KHJaNwSLasGG0KpF6KUNmNeAl0YUzaBATDXlIxLJ6CKF4RWTiVp081jF5ic+EuNDKHvgrdoC4nZT8/HBzYUMyoJzstArBn6B5IncTBPBMSS0YRWmw3PnFfg1r1Uh0Ezlr0gLE9wT3rzE6ZnTd6/1M9il3sBRAaLnDHJvkSL6in6Unozmrt+oUgXK9K4GWXw2qOvOTaQT1MxHU38z5PGJ2dIxJEEyTz6qDLhn6mTunGDf5Jtfkd2Koa4rA8qFfdkEjke7aFABhZkgSHmi45M9/eRci7NSCxpMYHCUf6OWNg62f02iwyCL0m1+Wc/TUsJCqwyP1SNqWbhCI0X3CbUdno0RFQEVC3lRIPOAhRsCFvHKsi+SJFxMWr8skFAJyDffKuDedVp38AuSubKWxCBj4CBcvR3oky6ACNihNirBkVd11tLx5UvAhOcCZyZyAaHe5aS3u9/8zWQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>aRp2UMpnHwesoqAVI37aHK9uPGKMSK+oRTwB541lLpSBRmcEMT4aWF8pFpffv+sz2uJD/MxrygLAOe0iLBuoQIQdcCSW9YkDbhwh6FH6M+zPuc36cn8SCizf7AwCO0gJ42c+zs2sEzEyI/fu5mjGoR8YwIoMiBE9IA34lZf1kdyvs4Q3bPjQP3NVPu/pV4+MmZf/7utJGK2hNcfVBSDOStyudTmV20LC7h9iXOk7skDfIeqN2kVxhk2wULDYx82H/uIFT9MxkkzU404kOtwyQg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>oaVPD2VRkBq+lPE33nEgbLq/S6bCDvN1WxljTntiHJUy4GNueFrz+KZUf9EnaoY31plKs042tdVgBcHI1p+Qu3Oma8pMGAr1zuPUOtg4ykr0aPmJVeuJkV8qUwL2AlQyqkvJ0oXqvLElGQkvz17GQrXAvXj5cm9oD13onp68dJXjxVyPoqXvx2/p1DGtws4tzWbrHfJvJPv+E5Ms/lF54M3H9lqZ1shpTzHWvbG2e4EKp56MKyY2lOlik3Ppp8swxUKpwz4coMDLvTbFA/xSYOkKzC4thUPB+MkSRCr82uefuFDyeE1kWlVvBaHp7RAZQ0STBEShQEpxvcHwAIGZqg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILdj6MneZsyPO6CzityBdRSuuJDGTzTOVFChrXRW9ZFp+</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>qhZb6CvBmTjG8RvQwwnRxRevd1qfFbu/ob9AsJvRCkSH/t7/orLCuvygcl+2KOhksAG7THFdkStWDiTc/QGgeNqyQVk6UG2mGL9fI3iPT2iTFugZhEKvm8yu+B1uTkB41QH6M5jchjswrsrdKqStV5zy03oUu2QogehskZ6XdrwsEUKnxrqM10mPyjJcCO6zXBDPCk67kDznFyUXvQ12woyPgEtdNeVLlZTl8yiu1XbfCiwz0STPCJi244Jbuv2MaKARIU8ChBgT7sli8m8gxgLWuvcdQjYYIi5zot6vlDyG4vbblxnZ06bmHK3Dv/GY3yA+6ZQGw4VbnAy46XFcD1GmIzmHihKqslSMmCXjk6g=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
