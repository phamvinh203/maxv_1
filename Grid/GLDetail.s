<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d11$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PK1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c11$000000" prime="d11$" inquiry="i11$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk" width="100" allowNulls="false" aliasName="a">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPNYD1ydL2MzIiRecB1o3petDHJAw9cYvdQidAYgLiRhSA2tvGofrtdIqAED8VMLnJo=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b.ten_tk%l">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>
    <field name="ma_kh" width="100" aliasName="a" allowFilter="true">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_th%l" new="Default"/>
    </field>
    <field name="tk_cn" type="Decimal" readOnly="true" defaultValue="''" external="true" width="0" hidden="true" aliasName="b">
      <header v="Tk cong no" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="c.ten_kh%l">
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
    <field name="nh_dk" defaultValue="'1'" width="80" clientDefault="Default">
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
      <field name="nh_dk"/>
      &XMLUserDefinedViews;

      
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
      <![CDATA[<encrypted>32mitt0uMdhiv2Ix2RqIXt2hsLhl8K9MHHSxgVP4huVkWJvRxMIlnEmvi1E//2Gwm9NjrI9CQiictSDpABBYBpvFXd4zYvPEzFAWGIcSgZ42QiSzHi0PztbX/doB2urnPKwZ8D9lGaDFY5l4Wj/ftA2YvMPapd+whWyQv9PDZHzefzzVcyyB6i71WGp6nV1y2RWdYYivFPMaDzBkh/c0i/61iC0IjRH/I/6dzFKit0RFCffzXkAe/0S3zrKgURGYGQIilLlK3Hnlye/f6XhKdY/ZuPNr3sXYFSGu/elNSQOGqVp+67jb0EswMpVSywCzpyww8jaFXa3Nzw8CpqUJ9ClwhFn1bJZrBe1DILez+IYsyggNY/zTQDLUF1nFi9CUvFDhJPLr7DryiHeTMk2FbA6km7EEnmZXR3ZZMrIN1bpr6HHipraxxrGtS91euQME7msv4/AMcqDA146gqDwTK2oGS/ESaWwJ5qp7a5izDesWLD0HVwIMb3j3BzQQtUYPoApAJ8tWhe1cbOiR17CSteaxXjrj3J4xafkTe0pAylEZwoNTFMJ79dXCrYvR4Z2C/9Xs/5wLxxk4yENmbPR+N135UF+T9KbeyAsooAh4qAP1Lkqcr2dzjS61nI6iQBM2dCRcpMhqzBdL+KwfzUILfGYXHUih7pLjoYn+qMRrDkz6hPK3xUAFTzjZt6ilv2Q0lzbUKwLi98f48l68sBW+vmv5acGTJxXSR4Fe0LDIMPyRfTgVA9YsiIFRoh1L5+xlvPbf5hfRvQA/vteFR51DOTWZadCNgHUO6jNkBQL0GlBKiUC1qDf9KwoD7J31eaIHqCDgULePPh5/Wv6ffF+36G0VavUWZRynj3dR49biGsojtVlF0Jxe8Q0nE2XTjld8hqeBILZdPGMTfAVHO+9AkkRboMUUVxYfLvUJgVxOqz8AbhgBYjgwlhnQibFA/mXVheSz90ehw8ynk4fGA9wImh0ce2d5s92nMj7AN3EGLmvS2Pt0pUnfez1gquxTWSd1nQlS/mAeGOi+wumwCwE52LRQpPeNMwolN5F/Zj6podyrd0Bz13ujO+fv72faRwAQuaFELW9Gq0Wn7TcHmZtVwaqu58HjzJKCdjGI25diBAnRfmsKTOillaVoqNTp9kU5Ep86a7WAQbNk4LeaapiDUaLBBmilXtIYfju/Jt0Guox9vYQwqt20URGL6wqjWGZefmCTuLxi2ZgsiTaX2ZAw66xkV4A1nvo1hWci5CBRac7DvsFVcKxNijeEV5nY+HCFjLEXmBnap7rgdNm3xGGZ1V0Y5u0MHxAmOd4gQBkya2Y=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Account">
      <text>
        <![CDATA[<encrypted>LYsQP+xHunF0V4kGFNFbsPhVXR4W1f/upA5we2o9FqmWkvMQ0uz6MZqtqzVnBkXYaFtCBeURE8zGyFwQFNGe4e9Ytqh99NcXP5Q5qpe8zgL3218pQS3lR+ES2YKp64d/O4VsxZZy0Xp11caAynw65g==</encrypted>]]>
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
