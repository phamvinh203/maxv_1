<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
]>
<dir table="tax0128_luu" code="ma_dvcs, ma_so, ky, nam" order="ma_dvcs, ma_so, ky, nam" xmlns="urn:schemas-moka-com:data-dir">
  <title v="số liệu tờ khai thuế thu nhập doanh nghiệp tạm tính" e="Provisional Corporation Tax Return"></title>

  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID) and status = '1')" check="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID))" information="ma_dvcs$dmdvcs.ten_dvcs%l" row="1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" allowNulls="false" clientDefault="Default" dataFormatString="@upperCaseFormat">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Số tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Số tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" align="right" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1111: [ma_so].Label, [ma_so], [ky], [nam]"/>
      <item value="11: [tien].Label, [tien]"/>
      <item value="111: [tien_nt].Label, [tien_nt], [dv_yn]"/>
    </view>
  </views>

  <commands>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSlawdyDTdFdcBEdhBOE8GEp44GFo7eebeD6fN6LgdQczj5leNwPbiaCeugvxlRBsjpnLxFW4McnJZkKonL9R0HSC1fIw0O/LIXWeTK8SNcBISxt0pO2hOZhfIfq1fYGAAgXPkwOUxbWz6UJEv1Rs6J7rcaVow8MckhbL4Tbw9ylYQHH5yoj8AyC3Z9LtsW1dPabV1DU5F7548yx6Y6laMvBA/BPlA5H9BF5l/fIdM8DjJmhN2yX/FPsBGnGkB4Y8mAoYQ5MvRzbkXkPzm7sLmPsxbPX2cD2moeUKXjZ6cHGQ7xCdpyzVSrhbAvIYRVIyionUi4Ppe6nlFiPhcoo2D8vkf+62q2J4OGQpegtuo/ndABJe1npWtG2/PHsCCh2uufX7n0peCzHYvaf+AFGlht/p/KGxhymsWi0Xn99lHfmJfa6TwpBTIoizaACJdV6Uco9q86ILZ2gfvv20qEt5vXAGyy5LBuXyu7QbqhtBut4umgqDC3C7Dj3dlZ02ChdllKGONUofkBvzr9ScIcbI84+VueZW6Kr3HkqN6LR0Fqq4=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSlawdyDTdFdcBEdhBOE8GEnCTUGyYUZV10mvMpDjdElCrPIkSlJFsPFbeKcfElUZypyn3Fou+T41FzKhoZDwOSRyCD86kkXaXOloMTGP33Ie21T/9yi3BV3Zla1EzTtWJ1CP1OleXSwV/nZbGdVii3A==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSlawdyDTdFdcBEdhBOE8GEnCTUGyYUZV10mvMpDjdElCrPIkSlJFsPFbeKcfElUZypyn3Fou+T41FzKhoZDwOSRyCD86kkXaXOloMTGP33Ie21T/9yi3BV3Zla1EzTtWJ1CP1OleXSwV/nZbGdVii3A==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSyRb5gTwuH2Q5HXM1PyDlTXsbDQrAqVR0uFGDeDtnXA/5Skg8+OM4L3tHboo8KbP5bKNYUaxo7Z7VlHfSGVXRDaRzXtckRGvj9QtGDTR77W3pXWG/zTK8Ci4Ec3IfXhouE99Ssf5P6FsvJ+iAWoppLD28c1MQ/e7IgB5lf7tLYKHsKs3XiPd9BnXOvGZBfMMdwBIzfFuQdyCm4F+sj+R14g==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSyRb5gTwuH2Q5HXM1PyDlTY33Rm6N6dhSquW4XD9jvgdFR21DmWYv/fjm+IlQaWEdEG9f7ve64dpUU29L8TThS6rexPfnV/uTazDQB300lnW/pZLKC1zrxDu3OFtxIe+dkl2XXfryOFBvM6Ps63yPQ41OXrt8d3VJPNHymC39LxcoeY74B3Nf6VPRojiTpRElCzDX6nVTmIXW2EYrYpaLvCX32os1d+KjvwDj5VwUkqThzNXBvI9jp77UG9wUZnaPWAy8447XeOqW6wivk1+4PCEWOd7K65LIQWWd0Fvy1pDFQ872dLzND695pDra2jUi2grHKZDdfjwE1JFVPH6J32dxcM3OYHa5wYuXz5vcT/I=</encrypted>]]>
      </text>
    </command>

    &CheckIrregular;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>xsmpsO67LYmsKEzPhsNg/l+ijThpuMPqrNvsND9s91i5JoYusvYanhJJGR0D0fGNyullnU1I46/GxHfJ0j3uD5w6S0iKKBGjWDtQmr9V0NxCTSMX+3CUEm3D6VooilMSrZXvcKzfKXLFOhh6Bf+QbPJawQjWSgoCjqu+IIWppXOam+ThP22wK/FsllSHi9AwlrBqlT8Pppv3lKd4hJPkGWLia9XctOfRrvRhKfS5R8/O+EUmAaPN5BSgNKkscV1Ylinfk8m4J/fDUWLtI+0we7pmjqgrid7vBli3E9uip6O33iSq6dht0KUBkM7ah5x4</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>