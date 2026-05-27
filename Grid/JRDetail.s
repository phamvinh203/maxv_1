<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d29$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HB8" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c29$000000" prime="d29$" inquiry="i29$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk" width="90" allowNulls="false" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPNYD1ydL2MzIiRecB1o3petDHJAw9cYvdQidAYgLiRhSA2tvGofrtdIqAED8VMLnJo=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="200" aliasName="b.ten_tk%l">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="tk_cn" type="Decimal" readOnly="true" defaultValue="''" external="true" width="0" hidden="true" aliasName="b">
      <header v="Tk cong no" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="c.ten_kh%l">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="120">
      <header v="Phát sinh nợ nt" e="FC Debit"></header>
      <items style="Numeric"/>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="120">
      <header v="Phát sinh có nt" e="FC Credit"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" width="300" clientDefault="Default">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="120" allowContain="true">
      <header v="Phát sinh nợ" e="Debit"></header>
      <items style="Numeric"/>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="120" allowContain="true">
      <header v="Phát sinh có" e="Credit"></header>
      <items style="Numeric"/>
    </field>
    <field name="nh_dk" defaultValue="'1'" width="90" clientDefault="Default">
      <header v="Nhóm định khoản" e="Group"></header>
    </field>

    &XMLUserDefinedFields;

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tk"/>
      <field name="ten_tk%l"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="tk_cn"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="dien_giai"/>
      <field name="ps_no"/>
      <field name="ps_co"/>

      &XMLUserDefinedViews;

      <field name="nh_dk"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXoK2w/YUkJHUY0ZH43sfD4duGnx7Ohbkr4DBDNymWoBwQEGMn/qD8zRnO7G9BYAe/TvwiNYB+shLIE0UZhWfV7Q==</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khX63lKwmzHzjwARyexDzCpOZwlE4lOVaY8k9R24ocGHqr/Y9vn0dleP1J95VH2VAf79ctKpKvXbOok8q6nET2T8O3xDK38OIY9OHxrvW7pj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>8zcOTvkFbC3gB/X1ct974r7FhtQoXexVV7U27ZjkK3GLwQaV1YRkv5gOSfr0MvDC2uIBS3shNMtSvCcr6qd9Q0fO3Y6Hftbsb2/rID75EjYIdglAzVz2mckFcEl8UaZByjLF7/06OuvJ30KGCiRVsPxybMjM4WTfgBypG7WSv8HFy3frrOv4u1Gbo1Uiw/Z7QTpEhB1jOTy/+ghMF4Zhb54S/fbTtXyCh5jzteJaAJuwYaYdRP0z+opOpc7/0cvTO3uLzLfLMJWBZzS6fCRf1COkZP2jspYOUiUT/hcALdbLXUpPpybLHl3eCBNEVsb0yVO7bjfDEh4FKRG7crSNqh+cola78CZWWmuyEis67sAk8smTGZ5Y54oEeFseKiMLiD64Sw0UfSBdUq69FBI4KeF6sUjaWUGLZi0B3IQG1xOCAFVejoSb2riG8Prmmbgk3BNN+R3sxR6/Zn76hRdJ/iduRVRPSHQgPy1pzq4uxGjG2+hhWZ6Y22xyP8wk+vVEK+DUe9yjUhqJVXp9Rej/H1H+8ItUwyYxqzog4GtH/V1wb4WprSMMgFlOZOuy1K6VgQUoLe+iYF8JdX5j0JSESlmo6vTXGGeyQ7vz/23l43zHErSIIrE9NxckqUbmyPQe/0T29j4ecdtjCLmt0mSvnBVtPDDhCLdoQ8cpY14+2u8bbDqSpC2NQ3x4GsvhHlVObdIFNHSED8ZD1wpiWtLJP+VNPI6XM86n+iXq42frnbhSUam9uaphMWvjJLDJdgBKbgB3BClS9q8aIVECHIQ9g1zMu2PezO4Ur9oXF3bI35yrus2wt0HVn9zw/3h/C4XUn+hjJ9DgoxgltL3jZIzJVjtgSU9wiwrR0w9dRRdr0+OZPWrrhRhDFnAzwEadJ1QVbhMIWBEr7YPMe9AV7cm/u2/mlp8NDj7wHr52jP2/IS9Hd20BwtFiNjiBrtxe3NPpEctv87f+Pf4EhWEniNW2H17TC82JrZKDsbaxIKRQVLgkhO3sWQi7wDpZspz20ZIUkf9QIYan2UxcRsotgrBgWa/cttKszXuIupihVpG0FSz2BWz43ApQ8IIEx1wPa88VwezrEtpGil5vBoiY8uQMbxdrcWARnsYochnTg1ogtv6WZSSF7k4Lfd8y77ypTYzz4+4lIy18ycZanz1QQVqVeTIMd78US3oHuDxFScu01kg11a+foAwCP/DVS6HEJedOhWVjRLTbhLb8QugxOjmUOoHpa2LSfmLB49qGSGWk/uvZR4sjj69VTJqj5tceiklEpO635wahHfjVuORqpXWqNEXcao2gPY5VfNmTjmq4sIk=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Account">
      <text>
        <![CDATA[<encrypted>WkydfocmtQGanh7VOAu3owNy4r33JpI++zSiUcVaoBEk5I5F1fh+uqF2+L+R2bCHVAwWom4sERMWnlPIAo7CFNbvRmQugbVs4QVWUnluq/l6COlDlqcP58wGubhYfC+2IS85qp96GXUCFKAEpXb2mQ==</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>cmF5l//aKKzwvfnCLlufbh/opMnZZibNlj2JeHukxANLAihGKEaxF1Wmg51gTdKnRkAZvs/xTj2czpqf8YOVyn9ChOKlQzQz+qCWY9OjmllUlDtyJbK0MlX8d34k/YV8x32dRcUdkbDMifYIL+7r7ls4J5KX5UjFALqNbLPzq3SGi8YXYD7d6dwAUwwzhdVa</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>
