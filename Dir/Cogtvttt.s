<?xml version="1.0" encoding="utf-8"?>

<dir table="xdmvt2" code="ky, nam, ma_vt, ma_vt0" order="ky, nam, ma_vt, ma_vt0" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="khai báo vật tư thay thế" e=" Material Replacement Declaration"></title>
  <fields>
    <field name="nam" type="Decimal"  isPrimaryKey="true" dataFormatString="##" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_vt" allowNulls="false" isPrimaryKey="true">
      <header v="Mã vật tư" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt0" allowNulls="false" isPrimaryKey="true">
      <header v="Nhóm thay thế" e="Replacement Group"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt0%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt0%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230,0"/>
      <item value="110101: [ma_vt].Label, [ma_vt], [ten_vt%l], [nam]"/>
      <item value="110101: [ma_vt0].Label, [ma_vt0], [ten_vt0%l], [ky]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ZYm6pq0O4ctdHSgtIkX+kWr1e5Uwjg7Z1zrLEEU0FlJWclYXHsKv/ILr7y6jNwhoRpqPi5FKLm9GbvpuY4iLsw=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VOpfgOoiGWLcrOkxAyj9FfBr+8cqHYVJXxioTxaqynbLeMz7pApiGsvtxMe00SwfquRW3gkXbTEkeMc80SiZ4A=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>UXi4dLVbLA3AUnbna2/Tz4+cWRlHAW0sGoufBZ0aEAABN/CuqYny//rL2fsOoJ3+nSk6YEGoNvwfEY2mV92r3tNkDICD+oM3Bl0SlQD9x/YR+V+CEjbMEgbUdAqVx3nNxltU002OURw7GGkfJgmys+W7wViRU2ippIM7XioUiv0TqGQeiXg7WR42KKaYJNafzuDgoHlNFxbXVYoAp86R2SlgO5BylYza6AjQ84IHZKNuJqVeI2WDyZRFWi6EqMCHrfyyoB6Hk4AoUOwxyLSbvLG5G2Ocwin9bSuNTApuuP+YG4eAp0eHTo69hLg2ERAxqm0bz7/XMrBIRUpferAfAWFn5C0XytskwWvVc7JV2rB08L8ZyLHBjhL5fsVmY0fJrwUi74vlAYvl10EgAyzqwxiW+1NXOACQE8yjE8MGpR7rV+lRueJqVmw3ENl/gbXPosXga38D2v7V0sQQyoH+1GuJ6FS016l+4XxzwBQ3z3g=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>rqaXQJrO1Bq0+v1+ARxWjLCSVT/LaJsld4vo0ub5VcSjmAL2VA07s3vX8wO4AiJhzs0Qe0AcFDOPGLEoCHRLtjheRMeiZ0Jt+hMpbk5WdPOWeFzQKIRMVjoPYCSonawA8pAvAX7jX8YYg4KCxoZyh9fYDREGTH+1HX4tJHjhPfmOPy4fG+gGZWAiRcTO57RnwSWZXs78Vuime9ASpmjUGkmuTH1W2DtVQwTTjWzNnEPft1GSAiZskCJdnXcZbPOQ4/g4vrJCKI+Wq3dUQXXDHKLkfck49facycWjhntq2pXYZ8XZtP6TX9dCMq1DWx2BpHrFS8Q+vTrmORk+t+xDqaaxPILbvtm+ZBgFKuzJsIyfo53TbsNpQHHW6yLyPVxxHpxKMKhTMtP889O4bZieIp2SJqm4fLz6P+8TgItu44Q=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>1Qj7NyZ7B5XexINggfsMYb35FDpuL9+5zoLmyAjWkxaI8iH4TN7evJWDbBE4QDWehw3lxKsYpfT2oRcYUNc2wZromRyAefLJ4AAiyvJeUz16NCHWrPhggZs33elx4EDjUofYWjWLAZ5hO76BO6FldabQYNB+xoRmf7CBKC4IcNAUcEVcT+ZT0eJI7RKq9M1L+jVOYRMffO3wFzFqUWOla+3dAbeVZbrJO8HMpK7rL0938WyCHovrCbMx4X3AYVb+</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>NMzbnqrcgcsD77Cck3Nt6dwc090mUySdYoSS6Z23b3pc24v/3UP4k4r6rTlxckAV977KEnBUvbeGVTSGaYZpTkt/p9Eo9GsU+KpNKNP7m+phsyFs2BrmZuMTx1kBwc6yflOsv+pkSUhPgZZGk1tmuLFYSlhcbD/SMm2rxbXBj5WwLCpEqgXdKbHzAoJKOkQWZQEgYEagGnhB8X6VI2zm6WcMuotMAqkfghCyjL1d8LeT/jHnwBlh4oNmGWe6vusv2K3QJ90HCjokav/DcLxATYajul3GxT0mtAgteWdJ0rd9gpjyvhhGYjL28dWYdllr+r0cUwMKXOhCHyXjJbRKjDJSuAYBknvcXrbMr7b9gYQ=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>Bu/0ZCSpM7BxxVEdQLLnTRc656GUXfzsswhF7uXnR7Sn8GUmI+/gHekHgpso9bgztB/qw/sIixhAk6BuWyhM5/ZvswCjtPake4KM28Z2wiAPg6sbtU0IVRRlvlAgXcNMAjATYTsV3iWNe/bjsNiNUJbN021ouHN2otLX9vTPqEw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>MjtE3UCJVTcY8D0GaO+iGcnkEaFlZZ4a1khjqIHC9hn/SZ1JTdVDOx8JZKVrX+C//jqWTUCUVuht0LtqaNBeDWeByfuVXeiYgkekMVeyHLoREmmDnbGH0eda/V5QPUmb+u5TN+HeRIW61x60BUB6mKJEi0qxyhSnNCy7lry/WSYQ44liQ4vu0PiK3k+c1JuyL5m97oBvSO5XTRecCmAjXZGKNh+VTswuQ9RUrhrz+7V5sV06khcg/rDeh88ANg8fhyIbx6syIuSfaSHv2U3anWsJ0f9hga7O75zDGHsfO1swUDHo/XOG8uEaKbW/Ip7wSCzC6FiXVbuVdaKi8OxI7bxjFRAwueZqsqzC7Z8AK5AtZdl9+AXut4HJMsEBtwaTLPl+pmD3FQRcEkN4Vttr5EGc92C4ohz5A87Ef6rp9KI=</encrypted>]]>
    </text>
  </script>

</dir>
