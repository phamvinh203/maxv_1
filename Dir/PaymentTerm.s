<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmtt" code="ma_tt" order="ma_tt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="thanh toán" e="Payment Term"></title>
  <fields>
    <field name="ma_tt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã thanh toán" e="Payment Term"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_tt" allowNulls="false">
      <header v="Tên thanh toán" e="Description"></header>
    </field>
    <field name="ten_tt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_ngan">
      <header v="Hình thức thanh toán" e="Payment Method"></header>
    </field>
    <field name="ten_ngan2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="han_tt" type="Decimal" dataFormatString="####0" clientDefault="0">
      <header v="Hạn thanh toán" e="Payment Day(s)"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 50, 280"/>
      <item value="11--: [ma_tt].Label, [ma_tt]"/>
      <item value="1100: [ten_tt].Label, [ten_tt]"/>
      <item value="1100: [ten_tt2].Label, [ten_tt2]"/>
      <item value="110-: [ten_ngan].Label, [ten_ngan]"/>
      <item value="110-: [ten_ngan2].Label, [ten_ngan2]"/>
      <item value="11--: [han_tt].Label, [han_tt]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7aVI1g9c4zb2QFazq/HMUVFndQktuDN7l8X0UoL4W+2BVPHkwvJwP2pW3MiZUPg+K5bLjJnu3Q6elOIHMjzClLg=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kncvTnn+K39ffRSJ5VcTXtLQXum5Zwfd55o9KgaIUtCPlmZTBP3VKD0un+zKz0USNpDlTh8o5VPyL3fFZwy2D0k=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>5F4FmYRebB5jyxsOgkNNH0F+GF+waimeIXWB17ORbIuHHRsMtLG4MUlqBOxGdoN+eBnMJmHZDYFaJOMbp5G7SjYiCjvCPr6YKrOXh/82cHMaGkOUG85KS0KsD39tPYEFjL4okKfw1herTz/PAEw5tDdGnuqCrF1iCQ5O+lPIImHtM8jkNYQGphOHCrqypv97KWgZUAX6bwGpRDOwsTZoQA0cXuOHMGfQQJryVKIi9zfdG9bhElrcEiw4UQWefbR6NGj4rUgqcSiNGdlStuJdjCXkI5GnMdfQQsV27wiHyKVnJA1XeKdpZe0g+dNNoBZ5I6faxvjVZh4BxWkwRAjBY4ZykEgXUgCY9Rk4M19kTApV0qOfKUFOaEV7org6hIXgLGlIjLY7EqFqPclx83t9w45Qx1ikuC0jWQt949xMd9uMZCYjWromHLJcrPkoZn6x794J7nlKPEjMSClAhRZVfQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>xlxEjLmrZaKBqUbrJkH8rUo7HXrqoAp6GEsHJcUmy7/DvtyLCQCpf0LGJNWT6PLNYbmkVj5FJiRKpsLtJjw1IvLVzaLde7bN6a5xtvmxhho9jvQ+anjssdyCUfvJ/y8z+n/Lxh5COuLNbJH2/QElgBnIBRVNg0XNGNKW2hKFKZKoyBBA+VNlkImGkFSgCt+nn07mHNXKEECKoJiH1TpKNXYJtJyGodj7+ub7EYuS4Tiincc17WUYfq3szCEFiU0Lmr/6+ofO+TSRvN2/gLbdAA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>6JgV622O1QkxRdVn3np0Qs3uAUmz29Mwrfr5OxF34UzZtHKxbAiDbw01bkM0y7dTnw+lUJeYSldYFmkX5nz2EBXhe3s6q9V9j0wT7kUJ5Vf9lC+kDSHt1p+2RQILXCucy6wenJeF9oLhQ/1oQ5zpJC0EUyW+uRFq+OsvzkdhZuJwjf643kb48/RKZvuDSyyXDjkWmM5oltKfHnTpeQgqSijdct4CEwxhrLixZIJA+A5p4Ng+Lgi6fXpEtJLevq6SNpm/gCC05dP3a/ZLrTaIypmgrDyTBtsKey8UhgdRL7Pxm15SQ9UDFp6EzlbJU9xd</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILY7GiLfwjxE0ccWhuGDiWyaT5zuG4Gq4O8kijulYZGkF</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>F6Rdf8v4khFnkqQfKhWzA3OhCC9i9ce9qYfNVRhYUY0lxWIN4ntFxndWhQGySQcZFT6hzuBIVCmMG4B6+58G5r/cVAEEl0yzzLFmJammy5FuY06FsD4naY1TO/4aVXf+EtH90sWa3nI1VBVlam9VEDSgL6GmoYvd6Et70tDpsWd6ZHlNzuVI3OVrvG/x0DT+NiElLBhmBUWq/0nS4vqctaypVFVnNUs739SB4S9y7Sdq6rKjNYzeN+y/XR9MBnbPp/zMvTlEQnYQExAUnsqXnII/mOSbQVwp5WgLz55ep2zV57t83OFl+EXUBbU63oG4p8g7FqowNmsffmsm/kRBh20dAx5sKMyagRpY9Z5SKWg=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>ZFIqoinXfcqS5qi05Pow0y0YGj/Kwl+WaIj2ljxThAM/sbO3bHD6/sfzDgQbWcYJZpQ6TYJWWS6HHuOd26kjKQ==</encrypted>]]>
    </text>
  </css>
</dir>
