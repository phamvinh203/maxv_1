<?xml version="1.0" encoding="utf-8"?>

<dir table="userallowip" code="user_id, ip_address" order="user_id, ip_address" database="Sys" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="giới hạn địa chỉ truy cập của người sử dụng" e="User IP Address"></title>
  <fields>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true">
      <items style="Numeric"></items>
    </field>
    <field name="name" dataFormatString="X" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="user_yn = 1 and status = '1'" check="user_yn = 1" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4xGLd76Jigh4/O8AQbVQA7YBinRr7G9k8RNctrHZoSJObLhQS3fKH/km4dH1OLWBgw==</encrypted>]]></clientScript>
    </field>
    <field name="comment%l" external="true" defaultValue="''" readOnly="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ip_address" isPrimaryKey="true" allowNulls="false">
      <header v="Địa chỉ truy cập" e="IP Address"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 90, 80, 230, 0"/>
      <item value="110101: [name].Label, [name], [comment%l], [user_id]"/>
      <item value="110: [ip_address].Label, [ip_address]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>HzQtVMnrmzf0JmBDqB54f2VrtNWp6sp2ZbX8TAIRlX7EYjzL3ZhCidxN44uhaZws1b7xXaj9tSBah1Ui9v8tO7ESgbTQGDcrnide/8jA7BhGn6Ps/fnjtPmGGXq7syojLusIxYLWb5dBvMF4b1YKdSfvLYVDmXo+zIYcWRRg2uaQ7fH1JGs5qXei8pkycmgfampxLzRx0S8ViMjTTABrq9aFM3TkWcBBYKhaE3N7lN7C0yXKfF0JG4oAvCiSqRhUhYxjmprpxBSkomy4NK+QN2W6xi9nU/KUchNPCcK+FkKAYKIr4Rcala3E4qwCB89KMYyF1t0+HonLZ6s2FelJ2CyuAkqyEfcR3wZceglF6JoQi1V1oZMUIJU/Am4wvVp/p1NSmf9n7e613sMyo7ZQ8uGnfaHss9A8Ho7LgLaJDaN7xU9IEtDKSmx6LN/MbpOtNdTX/nyFnjHVnvh+UFo5V4z1ONtuPX8UEttTyMus5fg=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>sYClvVuNmNRvch8VqnAtWWbDIjXf9zNZdR0l8V+1RtPU16z4UeN6dvG4th5O6XwZPaTP4THcZnFLTZYUoFw76jB0Q7ailEx+XjaQINBZTzGevZ7BNHIqrNhG22FPtcKt8c0VdyJ4CMDfGhwUT1Zw8k/nuHhCLDgd/208meR9P71doDRVYN9f87aMiMcLuh5iRNmn2nMCHNHMGHNANDljI9UimEBbbdRFDc5hc2ujTbIOzskFnsOKZtRK9HeD3qlaEUwT/QEf1sIhEh/O4fPHqtT0vZJ7VkvXsY6RNAgB2LV+2O32pAQA55oeIJsAh1jmn6n5hFJmUy6KQ7eb+k6FJg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7WAD+WXLuQGjHiHOi85omhjJ5aejPD/HK/2NJ655MqTXr/2ZeOIf2IQDWVHKiqBtXr/32CwhuQoy7o9GOJMnxrFSWDXoFVn6FVyXByMFqzGT</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>f0OVN72dT07ju10sH/PUp5eFVEREq+Jew9lPgDQhUmQSrPAeKwYXEKOp8KVeXEVlKm5wcukrMTYZNej/8cg+33HNhFhgwFhUMKGnZ52RfKYem+5HnGDNmXzpNjLl5/B2+DlmKyHX643KFMH67xBo/GVmloJuioVk5grne20w473lpx9Pa82yquDgf+tx61xIez/BbytbpCRQIzZdNMGsQ3Fo3ONOnEl8cA9M9ncNXVzQqOU6NL1sCooHoSUUQUCM7WYFLfDiGwPZNFQgM9YBfA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>uLgj5vmTqBHwiphgyZQ6ucwRpj48BBzDfAC+DJzUWDn3MrxRB0xQZzaYrqx0ZIo0OAasc2aZAQkwnVtimUICAX8ORZ86TFgB4gMpYRDEWUbkSs3iMlsj9wudeiue98kBytDoe9/N8oj30ouOQLrvMYtlWcdLJsmh0WoC81WaCr8kMiHkKHQ/RlusvO8ICMU0TgvXPum6/L4ETjRSVc5Ux3pEdhuzpuYw3H2vJK6gq0LME3HsLSIb6b3lFTGRe8jLNmBUwIWcprkBedCV1pfMmvcJb9lf4jBWgGJwRkoI7XXrz5fpxrsAEl3z3P7hBdKH0eAg/7qsgblxV1zt/uxwjtEQjB5ea70nkIWMf9AtpsYjB0+FuE5rkbXU29dIGF2v</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9SHMAyozoLM+kTu9YHhx7jjw2awTd91eYPuNEzXXx2jWVsVG0DLJ3VWochecvQfY9V7dv6NTmKFhfe6PyiQKN6N4S8ZKCld6xgENT4/kd1QANP/BNsqMl6WO+KPkccZZuysyvfI+9KrPIL7AsnRlKg==</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>StgpBQ/aePu0OBOTgGQxHDkw8lB9MP8qlmMefUYbIePbCSNFcbcjYL1etNB6eXJsyr2lhrhvE9rusmQlOm/kLyekSEbYPQefMt9t67X+JFKUdP1K3HjNjvgj0+AnmGYU8jI1CrkXOsgAipFeUvDsYKfFaJxNSQ/kWjJd1HRfOkeos7aL0Dke0Jh7xcugBwcDV7dF2gZ56Wtph8jj6xinTfiyp3UK8XYFdpKRrnic74Ql/t0Ybbus1mhCFmYFZQpKwslgzI4/wta27EElNP40mGOUuR9RrgR/Jk3EHpzoshjT5D2Vo2XWvDSAM8t9cNpF1TryhgEAPoYn8904zccbpCmF58IHusxdm7OEx5J/iOGsOYsMBcNN2asyDYExyY2veMTke3Pf0ZBbWoc6OomNMRb/t44R161AI+xVSZoZ/7HmlTXp5gGkeYadRppsPLmvujop1CMKOc/ME9hoVJq2Og==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>Mg6lPTpjhm7Qd7czgfMsDnqxUlXuZ9VAn/9KhMamOODKOwNSTzY+neNgj6vB4KrmqHsXuMSsMKKUGHVeOVNqEeJINWwHm0OItcUMH0fagqaiOB8aeMFh5f7iNKhQZ6KpSIpVfUNBu9nYy75Tp0tCvaOM5c2nmh2Wn5rvP/BHkilRDVcxqz7YHYxU3valNM460/e+qem+Nv1X+Ol8SaU7McBkcRjwQBY9othURUPGM9rudMphwacfy6C6fYIOUSwn0P47nEn6fvNAyl88t067+MV9z3h1HF49VwdQ6N7rACypXHHvtY4ao+0wGQXbRaMgh/G24aB/9y8wjzkbwU2iYQqtEYCWwUwtm7iSQTjoZtsmIINSKaLiHzfupXwAwELYP6SqR4P3tDoTs7tz5dcSdacoB+RrCteXGlwetO4kgRU=</encrypted>]]>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW16fh8nItEe4BRBdsPmp3yDO7Tz14e/40xJkcABd2pMErFTJPNt89uYF2uRzvD7Pu/yk2q9de+VMEXr+Q5dpN6TQ1njSCsbQVtJWT8ZGELX8n9hjg6rb7pliLxkZ+pcNyUmKKKB/6gm2MUYT6bM1xV8L08FvI7gzQGM0OkovBjNa</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>XhcUqY7lLhzK9+KaUUtWtt37O7ErpwcMZHhfBr0ylwD6lE0NSLQCoZRGrAOetk26Pn817naZRYbcuWQtkv6/fqBeMC3u3rI25pMXweXWpYBRRCofbxv+z8UdVD07M6M2UWriDnEzN/YoPoeU1aP4VuwgN0Vh7QhEo7PCLq6MVHhoBS/FJxc6DXewhxEUQ8kIHbXUogXwsWS23cWgV/MQJA==</encrypted>]]>
      </text>
    </action>
  </response>

</dir>
