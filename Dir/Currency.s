<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnt" code="ma_nt" order="ma_nt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="ngoại tệ" e="Currency"></title>
  <fields>
    <field name="ma_nt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã ngoại tệ" e="Currency Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nt" allowNulls="false">
      <header v="Tên ngoại tệ" e="Currency Name"></header>
    </field>
    <field name="ten_nt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="tk_pscl_no" allowNulls="false">
      <header v="Tk phát sinh cl nợ" e="Realized Loss Acct."></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pscl_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pscl_no%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_pscl_co" allowNulls="false">
      <header v="Tk phát sinh cl có" e="Realized Gain Acct."></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pscl_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pscl_co%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_dgcl_no" allowNulls="false">
      <header v="Tk đánh giá cl nợ" e="Unrealized Loss Acct."></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dgcl_no%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dgcl_no%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_dgcl_co" allowNulls="false">
      <header v="Tk đánh giá cl có" e="Unrealized Gain Acct."></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_dgcl_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dgcl_co%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ra_ndec" dataFormatString="0" clientDefault="0">
      <header v="&lt;span class=&quot;DoubleTab&quot;&gt;Số lẻ&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Scale&lt;/span&gt;"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="ra_1">
      <header v="&lt;span class=&quot;LabelCenter&quot;&gt;[1]&lt;/span&gt;" e="&lt;span class=&quot;LabelCenter&quot;&gt;[1]&lt;/span&gt;"></header>
      <footer v="&lt;div class=&quot;BreakTab&quot;/&gt;" e="&lt;div class=&quot;BreakTab&quot;/&gt;"></footer>
    </field>
    <field name="ra_2">
      <header v="&lt;span class=&quot;LabelCenter&quot;&gt;[2]&lt;/span&gt;" e="&lt;span class=&quot;LabelCenter&quot;&gt;[2]&lt;/span&gt;"></header>
      <footer v="&lt;span class=&quot;Tab&quot;&gt;Đọc tiền: &lt;/span&gt;&lt;span class=&quot;LabelDescription&quot;&gt;[1]__[2].[3]__[4][5]&lt;/span&gt;" e="&lt;span class=&quot;Tab&quot;&gt;Amount Reading: &lt;/span&gt;&lt;span class=&quot;LabelDescription&quot;&gt;[1]__[2].[3]__[4][5]&lt;/span&gt;"></footer>
    </field>
    <field name="ra_3">
      <header v="&lt;span class=&quot;LabelCenter&quot;&gt;[3]&lt;/span&gt;" e="&lt;span class=&quot;LabelCenter&quot;&gt;[3]&lt;/span&gt;"></header>
    </field>
    <field name="ra_4">
      <header v="&lt;span class=&quot;LabelCenter&quot;&gt;[4]&lt;/span&gt;" e="&lt;span class=&quot;LabelCenter&quot;&gt;[4]&lt;/span&gt;"></header>
    </field>
    <field name="ra_5">
      <header v="&lt;span class=&quot;LabelCenter&quot;&gt;[5]&lt;/span&gt;" e="&lt;span class=&quot;LabelCenter&quot;&gt;[5]&lt;/span&gt;"></header>
    </field>
    <field name="ra_12">
      <header v="&lt;span class=&quot;DoubleTab&quot;&gt;Cách đọc&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Reading Rule&lt;/span&gt;"></header>
    </field>
    <field name="ra_22">
      <header v="&lt;span class=&quot;DoubleTab&quot;&gt;Cách đọc khác&lt;/span&gt;" e="&lt;span class=&quot;DoubleTab&quot;&gt;Other Rule&lt;/span&gt;"></header>
    </field>
    <field name="ra_32">
      <header v="" e=""></header>
    </field>
    <field name="ra_42">
      <header v="" e=""></header>
    </field>
    <field name="ra_52">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 40, 70, 70, 70, 80"/>
      <item value="1100: [ma_nt].Label, [ma_nt]"/>
      <item value="110000000: [ten_nt].Label, [ten_nt]"/>
      <item value="110000000: [ten_nt2].Label, [ten_nt2]"/>
      <item value="110010000: [tk_pscl_no].Label, [tk_pscl_no], [ten_tk_pscl_no%l]"/>
      <item value="110010000: [tk_pscl_co].Label, [tk_pscl_co], [ten_tk_pscl_co%l]"/>
      <item value="110010000: [tk_dgcl_no].Label, [tk_dgcl_no], [ten_tk_dgcl_no%l]"/>
      <item value="110010000: [tk_dgcl_co].Label, [tk_dgcl_co], [ten_tk_dgcl_co%l]"/>
      <item value="100000000: [ra_ndec].Description"/>
      <item value="100000000: [ra_2].Description"/>
      <item value="11: [ra_ndec].Label, [ra_ndec]"/>
      <item value="100000000: [ra_1].Description"/>
      <item value="-1010111: [ra_1].Label, [ra_2].Label, [ra_3].Label, [ra_4].Label, [ra_5].Label"/>
      <item value="11010111: [ra_12].Label, [ra_1], [ra_2], [ra_3], [ra_4], [ra_5]"/>
      <item value="11010111: [ra_22].Label, [ra_12], [ra_22], [ra_32], [ra_42], [ra_52]"/>
      <item value="100000000: [ra_ndec].Description"/>
      <item value="111000000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3koe+IB8enosBiZhgZGa5EcEK6QeFhlFbrhinfYJz7a9Aq5OaXq9B336L40PEoteNmuiJim58c2qZBwKhySG5mGE=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SZZyp3eG0lrCirSQA46Yt8jgyUMsPGrkAQDUo8cJU6lRQw28s4hIg0V/nKQPjUq7O100Grlx+lX2Bccrlo8eB0=</encrypted>]]>
      </text>
    </command>
    
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>3XkovI8YwnxgFGTUd3voEO+Ei1lnCSPRQno6yeg5SBLbJ6OG1QZ5eZon0uXkoMmEXHsdUqBpWaLIUo47F0F+54mOyyHEgl3HdjoCkOGssf42sIcsnhiA/aXbejtqIu5Q/pll72h9FYIvd2Q9t0JtwazjMSVtbLXkC2rkN0SgF4WjvcjkUWoXjR1DpBAytDlvMtjwXpZJQuk8aehSHWGviAZQIMeE7X34ZPag9oYGYR9SUtPyMTzNXO57bPdsj/LxbktlOIYy8Uquog7HrR53/T+SK4rNsFKgFiFYDeDoAceDG5awaruLh7YPWAcZK9Is6HiwFRW4Wyd8dJeW9Rmt2x/g6m4x+1JUADgvE3Wrrh3hkZeGKwO0QxOS+dBo/AdcYNAQKFd9n8PEe7CGh6njk+D+Ce3T4Sim6kGDnTsTqd2wyEpZycAEykOaZjMt7yPvtRBpC+9QvW/MTlPhmTX6XniZiV6V1Ui8CffMZ5MhZEbASsS5oysAnJycCaHI1jgmzxJOiOWU+FZCDGAOS++9+KWeaOwGSJF6pKK+q5PF8+k=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>fAZ69NqJ4tFU4eVZAXmOt9KmUob8Ha5ekuRmkFMJ2iD/9bwxq+viP1T5UhNDk+FMODz6xjJlEeEzNn/HvQhEGS7qnDDvJ+skLNrEi64owDBsRsvz6WJYzbTawCYX+vjWh1iB/KD0Ck5scIsnWwFgeR1HvIDrazMc3Z5YSE5PxAf4anmWnFvAtterwaJt64Pge7hnJb+7IRdxgjJl1WI98hbCon0vSOUuPICDYkGagiHKolNgP39wzaBXyh1XG+PbjCZOHD4bdoPCRuB2/w93rg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>AMAogAZ2dit95g+bCyErDBMgpNmHll9WTYmJC+DWqPgX0hOFXKjY8i0wxXjzD/PBS/i3U98WXpJDi2eGLWy1t/yE7QV9IRqXmt7UvujM8JuiF78lx5cNwhkqFv6Ziy3Vs4ORV+pLeobPxZS3HXelu44CrCGwctxbeeU51R2eQNw28cD7nlJvTwWEyj2hhLcj0yG8dX62qnnjr76tiUQycNUmIeGh4KYMfATFIRWkHyVmjN2bO1BW6qkbDv0RtUOhy731ky52vvW42A4pB+RMIJH0HjxNrKbL9coIK23/iDEnUrFnUeyqnh7fAPVEI2YfdO6sXJMohkPydvnFWM5S6YSxNFEWiNkyYLG5jJg8HuZEMc1FIMevrt/f4OyY68SZ1SocaNIAIu9dukjCu3pc+A==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlTKC546DY3RUh5XMHh+IuJZVVFDtToNvMaPHqxnRZWaz</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>00/sklF41mm17XYGVnWGLG2Hpt72q4qvc/EIn+VIRanVV3YV9+hR2nQv8H2lbExeVuQ0MtUXDva0beI/80OTkNgcXAgvVTTkZqQSuqNyADxp7M9tK7uPnxUBTYcPJuNnjXpe0LuCVdhlAT9YgyxAKecHcsk/gvQLg7ZEyQw4kuj0rf+zlF/GJpGyAF68Mm+vdIGyx3is15BeCN9zT2g7CEya2NtWC4GZxzIKHFI2+Cw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>hUFKWCU07fZaE8M4a2p3opkbteIBUewc3L8+5j8Zxy/q0UQvPZsBj2kG+VTIzIN98ruKh5f1KaeHfIcn2c5f8hRu4IjqwGmF0N4794RcwdJ/QgpmSb+Hxs6o9uh17jVET+E7DvyYrboamuWplP7l7+3vBYEgIqQUkI3aRiNgTiD21uWSwDjW3YxE8Ki+SiXoSEJR1M6MQ1X/hhrOKpzGvt25DczonDr0zp0vj2KJwYn3NFe0bu9WTMw5zpjpgrfWpDBeRxNgnE5Wnvwe1ap77hYvyXMxAFwQKBK5WNbrmtQKsdnpMqo2WkJIasDjIF05nNU07lVxcD5aAHnOnNuS48dSeQvC7ImxTeujOFlv4wA=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
  
  <css>
    <text>
      <![CDATA[<encrypted>8Tf2NFGvQyVeyi5q0jLS7sJEXxJJdXMIkREGHZk3grkR2waqSrboGFkWJoNYN+krJ4egAHslPLeGjH9RNwq1b6Slce2It3MIwN/5tQHCjSHb/cUlmIv1plck8oJhkSjV5mO5D3tNIL16ubUYWaNuE3a5oCMA/A52mwDM7+FWkG3LbZr2l967lfqukIOnalNW4AF3iQoSft4LYHSV/ZAhP64bCA2gsqV2R16KjpmE0SD4e6oHS0WtlvzmcG2vPUW0GmeQzjfEs1FPs5Y4tJyxRJXIvzQZb5WZ0rvtvLxW75o=</encrypted>]]>
    </text>
  </css>
</dir>
