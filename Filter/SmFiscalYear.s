<?xml version="1.0" encoding="utf-8"?>
<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Khai báo ngày bắt đầu năm tài chính" e="Declare Fiscal Year"></title>
  <fields>
    <field name="ngay_dn2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110--: [ngay_dn2].Label, [ngay_dn2]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>oaVPD2VRkBq+lPE33nEgbPeXeM5EQC/7HKbAJMri3bmzhlBfsuiWnD1H/PejaumdfyIe1+zJ7cT+dfsC3fgORNnQl/DQbQCSEcidSL/afGHaLrWxnTLWuwImAmzpWoSfYdlFkxhNC9xq7lEmsmRB5UD2t2lDWqRQH5K5NHarezI4VjJJ4gQEajutfi36BhD/1cBYrKRKh4eKWjg5k4yO1gmqKDzV6cUIj0/Ay15rDZO2uDmAsW/QY6Cpmhj0FesWSS1A9G14IchGRLTkpP6kVvQhbcxMrGeECP15PLeAyCWZZcREgSS+tHvh2Wd4RGj7tKnUZaJudA+h524tVvTAnN8tnNla7LeM1F1Aof65PRAt0rU1oM9MSgegkn8dMqM9</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBQjCob56tsBoSd8E3/pKx49naKkMB52jucPHLcfN2yrE90KhC0XMtNgV/6f7QQBWTA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW48+AvvjUJfq+lCHunHYcSJj4l6Gea5O2FViFqzuQLMBKsy23ZH5V2msqiE9Pshv1zfvfvvfJ0YL5Bsj/dAfAuhJVziLjfsZa3qKr98P2UXUeME6syfzkxaL93OD+w3hF8Plw+B40Wk0NH4LXHytHh8=</encrypted>]]>
    </text>
  </script>
</dir>
