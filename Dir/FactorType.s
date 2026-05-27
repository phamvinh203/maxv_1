<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="xdmloaiyt" code="ma_loai" order="ma_loai" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="loại yếu tố" e="Cost Factor Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="" allowNulls="false">
      <header v="Mã loại" e="Type Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai2" >
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhqAzzsxgaoFCjSBYDHDieSsFKT+ChocAvMLzFoZOcw1ZlmAFNkcsbAL4IeepBZhSlk=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Y8kSdEtoK8a4pN6gdTJ2X0o1ht6Ba4sTdEqBz2d/xnHzEbHp47Q5jDDGSFSW/wq+lBCFd4ENNeeuJ+rRqbZ7Lw=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>r1UdavUCo5KjHJ9RxKN/5WeChAI9eE2Sitvumw6/zNoL27aSqFvBMsoTwB3nj3O0xKdAUCr8BSkNapxwiiSNnEM46J9HtF2uarKT3uVugPyY9G8Gk9hQvjROySVp0qHGvQZWrpHPLJStO7i1QDHbfOETNr4VM64/8d92aP8dSEeRKYLiXG1rvui8iRwBtCsC0xXOw93AKBcZ5kFl5gwp2BGuED+TdX8BBRt5kvX/fcjI+ws6aWAVWJgURYKehstYfV5zTGM66SiZ0zgHSqG8z8O/0It0cGuK9++SgvgFZvFyDAovO49axSljMWcmu/Xqjdtd+j0Lu/0eEy1ytRbLX7/LhIF6ZJ7nSigoF7erXRWicMbvijyYprV4JxR6F8pg1ACewm1wANRb8ZTvfxH5CSIC4mghBNbKtPyX5wMGKbnW0/IyQq9CoKVt2I+CWotFHX6IxCEUh7DuJsyEe5WC1daVr/8DHbBqIWFEnlWLNc1UiAeB+0iKCROHSUbzxH15OXNRDQ8xc19hVzQxPFyMqA2UqlA7sRYgZK5HYKKjHUB6rRYcD1RXk+nsiIYxeM+D</encrypted>]]>
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
      <![CDATA[<encrypted>QwguPl8s40no3DGkbb/ENCf8Wq24dMAB37E378QEyI2K++Yzedku+voboCZTyt74j8+jZ9htrMDUOKs0lN6x6hsPPXx0AVNRh8zzsX72KKjumzjN36wOrjG6Tau9/cLYG4O4HAu+6+yEOuY0P3yjMp36QvLhXDlpkQb5kfQIPUI9mMY6mfZgIXAii4we58ayWhqJTmAjUoB7DEccF6NSVVFuw8kcYxRdzCnT1t6tHC4GHbZJgAzmtphCdnhxGnFgtQKmC5kU9Bclx8soWkKWwY4jG/oisfs7Z5KMvHdzmjW+VCu6nFDjAMmfhuuEhTuWAH4XNc4T3W6VUA/CC5wn4V4ptSVq1mkHcCEdZo5EPgo=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
