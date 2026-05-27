<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir" id="PND">
  <title v="Khóa số liệu" e="Data Closing"></title>
  <fields>
    <field name="ngay_ks" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" align="left">
      <header v="Khóa số liệu đến ngày" e="Closing Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="130, 100, 330"/>
      <item value="11: [ngay_ks].Label, [ngay_ks]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>/1wQmrVmMEy9qnnDdWaPeL9F3ZFpKtsGMyho5OdCOd8vL0QfA+KIEf28GY51/MClIF97kScfUN9TGjRxWyXO0z6UQm3nSxOXI6/peamjleEiiyAR/Rysya02T9afEOjF2CwE4jegoEcnSd4XkW8Rtwj9Hooq8vm1d+wqucPXK5fCUH1qnyKNlLshJI9Q6A5AgNme07b/Fx5GTm54/IYZYY4uZ97oAEI0FC+EishuS0omo2l8rkN1tfIv0V3RmvDsLesI78k6vcaReKQLIK2NcMVIgW1z1ksCV7KglnV2M/5h9Is40S1wsnGCQe/sqcoTtZOjk++NuV4qk4LbjTtE4w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZutSk0WGdoidDVAYKTBmS0xy4ZxntrlllPEQ6grjAi5wv6N+ocnEgsd7cF9whkop1gmywc39Wgdr7YR0TMJHEOL6CC8Rzvom2pnJO9A1MVzl</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW48+AvvjUJfq+lCHunHYcSJj4l6Gea5O2FViFqzuQLMBKsy23ZH5V2msqiE9Pshv14I9ZdpS3k2X1WVylQWAAJzGQgOw54u0EUKVttVbzXEoUo2A3cDPzMqirIFBteVVTjW79+A3Yj80L5ZxMGULS/Q=</encrypted>]]>
    </text>
  </script>

</dir>
