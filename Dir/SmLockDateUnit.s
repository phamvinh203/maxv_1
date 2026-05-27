<?xml version="1.0" encoding="utf-8"?>

<dir table="dmdvcsks" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Khóa số liệu theo đơn vị" e="Unit Locking"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1) and status = '1'" check="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ks" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Khóa số liệu đến ngày" e="Locked Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="130, 100, 100, 230"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11: [ngay_ks].Label, [ngay_ks]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>pAZHT2x8D+rVM79D64c19w+e2fIVPrDQICusQT/7B40gFUKfes0cULMXQtu9u+jia+vSnLk2HwFCbnDSrDNrKSyxCvNOHn1CB6xDp7sQwjG9GJvBVbdzASL6E1KedIc/DXM4TTbX0bukkA+qpea38dqub0I0CYz/hNdLShoW6kWZ1CcFBJwy7K7ROJia5pGMMET/MMDEaKLS65DDEYRAPg34A4hRrVeMC9GZ0Vp4iI1Ini5v9uX5EoleEVat8okJYKCONqQBEW0H/vHrZWxeuQBe4zrjqNeFb4UB1Ix1K8HKN7Foabzd7fC+IX0TUt8g0sLFMLvlDvDCe38yGbNNbjUV5Ipk10R/d0aKcxJZVn9lMMwbnkopkvn2nY5vwtrnRuss1Ayg3UYYzFxss6eJDYA1zaMMAymQHlNQ3g6H7LQ3CvaVnusd5EiXT1mDk7QP</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>ri+364tP+6LHPexV+72EVTT82An0A6Z27ucvzzQmLXzYY4vGLCr6Idye6cSS95g1fNk1X2It4+8Eho8BqqLv65ksi0J6t+SsnY49l2MZ2hw9uNkzBWG85NijExmjMTX/ESClQqaAmoZNMshjClI0rM+eROB5cTEOhz/Tj2Z+E/WowM+o6ERfPTPtzsvqPqZIu4OzdDq5bNqaD0ebornGUDiFhsKMFKEMVJDH0f4dvFqGzplGXUzTNTjsILP9EU3R</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>NEh/Mw9XFRiLB1xrhxVPcSDHafmz/pFDLCQ9CI2Qiv13ehf7WIgQ8k4qGFgRYR5Je+wOjmr41YdnrrZnxFZgYDTlG33xgcpoKf7Cwng61nK5Ac58hoa/YsJZh5zsDf381OUK/+g72c37E699ZCn52vaI3rxNzTc7ZU/+1YEVGsYYF+W+6P/V9vcjz9kvEL0bqZAoHHMgs3Q8i6HltqLIOHYKSw122+GG0e9B/sogeDWFLmt9vuwchKgghvO+hP4E8H4yKkRsaEYRuvdCgx0H3NEQq4VxqVTXAIwGToMMDKA=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILa2gYGqoxcbBHy6ZIjY0Zkd9+sLu3RLc8o6RU5UcXiIT</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>
