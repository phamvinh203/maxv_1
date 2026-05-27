<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="xdmnhyt" code="ma_nh" order="ma_nh" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="nhóm yếu tố" e="Cost Factor Group"></title>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="" allowNulls="false">
      <header v="Mã nhóm" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_nh2" >
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
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhrAIfC7SbbLpZWKvXDhRviMGy3nb7ja0fuYIPcMKhYfc0Kp7gV8RPJ2qcSGYzISLpU=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Y8kSdEtoK8a4pN6gdTJ2X1kSdjojTsoqt+Y+UAzb4V3ujf2+DJ94YVhizCB2aiIE6AMZ2GPcnGU4DoAWxXCe9U71DVOiKPrxDR8ytaVdEmC</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>UYPhZlPG8kgNm7801JptbDsM2J3OqNeNuNKeB4Lt0C4LmKaw/M0n5dkFLiBxtU2nf89+OAAqqRI+vMQFetQiocEeiVbCiRX5Xh5ckm3u9kCDgjVUVjn5DkzgECRnr5iGLUK4dEtdRtrvaMVnV4iOkeTgQbN/KjDOeDypHAINjhZl46guxNarVVL4kCnSeWsUa6m63oGEt9mjq60MchsJa1O8YdxT38NcFq76YUdpiLtxhnRphXw9zJoRFQawid6xy4BM9F0GuNvGl/cCCR/Yxho3XObp+WHwvAiGQSm/QraCCyAp0aluZt+UskWOu4InmU0nJDOstXwweDmQ9bmpjiWN8cHmM5b+/OjhEkBkGcge8zhamxB1377tD178NzoMmqui+AuwcBvRv6WhQ66KgZUwoMWOFRJn55pXrBCb4MSLMvfWIhImx7DDqL3euRKj7Aa4lHza5itlNkhdzWy0gq7TQYRbZv+PssUpxGErPzlNykEWZSxk0gLH0fEkXlfjMNTdBX6H/T61/tedW0yAMEXGdp2KO3/xKlU3SsNB4lSrr+nPTtVGc4+IFOsEO/7N</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>xlxEjLmrZaKBqUbrJkH8rUo7HXrqoAp6GEsHJcUmy7+NhsYXoygfiq28NupMF3AFTVSJ2FzidJBTpWlWydKzJ5jHM1e0TIjQ0tt9NQoTlYtzSUeqF78LwB5ZxLoW7xFj3HrWgGSjDfYf27HDYBzMUMvtKhlayCSm50/vsVWclbWwT8+yrX7flbTPfDQB/Z1VBroF2roXM0t7Ynrhn2EQgDWKwWVZRblq7JCyEJajMFT9uc9/VphNGhI/TnhCoWBot5muxxz32T+vrTD2YV0Qkw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>6JgV622O1QkxRdVn3np0Ql/nT0OiVtD1Yjw3a7LSOZ6ScjP5pVEInz1YHbtJYIwffYmbJrmTPQpd7laDCp1JimMLg0CFGOrjK6XaR0jgj2tPHJ1PZzdyWktMnN+JXunQLMkFOlqwE64yIEIQfLjxWedqYbq8Kx7P5tkhTjVnjedPgLrv5/1/TbcoEUuFj6PNuTTyfWmHFyFwtqyYSw0aLc8pYhAqqU7A2fmwRhLRUt0Y7SsowjollMTtXa+1plTptb3QcWlIrB93CPhhadHnq4s8PuKJTEPP8WNfndd75IyPWS67SfkikGnoI6gcnA+7</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILdxi7oII1IKnphIMnWOkKoMzKzszIdyKvSirU2h593FP</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>Qccl/fgvFgQ90b2KLoHQlj13/DDlYbFdXD1mobPey3rfZx6jY4zy6UEWtjZLaZu1DdPKriil2zGEQjT6dHBqRztOTu0wvtKPJESqtWqAtg1OtPcwPp3wP+cDPvNHY/g+uzgdSnIBih1yYXQ762rqZyEqRZOc/hduF2DorhqJOXgeMGZilSZIgM2s7isQrE8O/MH2olgIiSB7rSS9wMPCB4gk0HrcO4xlQRp8R/eEAk4PaeKUvabFyEVQWl5N4nU3bWT3L82iI46Cw/HkbrUCxn9dt5Pko3bsjyu41ABeSKqgcUvvTk1kDKPLLwdMcnyuIJmirz0Haen35zL/i6JGNeAD0Ta5Py3BiSkgn5EaZ7s=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
