<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">

  <!ENTITY AutoLotForm "PGLotForm">
  <!ENTITY AutoLotGrid SYSTEM "..\Include\Javascript\AutoLotGrid.txt">
  <!ENTITY ScriptAutoLotSet SYSTEM "..\Include\Javascript\AutoLotSet.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY CssCreateLot SYSTEM "..\Include\Javascript\CssCreateLot.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
]>

<grid table="d78$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HMB" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c78$000000" prime="d78$" inquiry="i78$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="status = '1'" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPO5Vu7zotkPNh5UDN2V7J3FvVhxkFLSxLNK45HvA2sFImSqzms1JcVt8xLVy+uouIk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <!--<field name="ma_kho" allowNulls="false" width="80" clientDefault="Default" aliasName="a">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOsOqCtEJw8sjaJ5AuNCmVB8Q41yuCdKH1zOr5VMa0apGYKxfxKZc1r+KNu1g7NZfk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>-->

    &SiteField;
    
    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt0" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_vt" width="80" aliasName="a" allowNulls="false">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="px_gia_dd" type="Boolean" width="80" defaultValue="1" clientDefault="1">
      <header v="Giá đích danh" e="Specific Cost"></header>
      <handle key="[gia_ton] != 3" field="gia_ton"/>
    </field>
    <field name="ma_nx" width="80" aliasName="a" hidden="true">
      <header v="Mã nx" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMA0ACg+oC1JCH85u5uoCRXjJn3/r998HkfNF7xISWuxXrH6iJyd9q0g8lRt/QuuQc=</encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_cpxt" width="80" allowNulls="false" >
      <header v="Tk nợ 2" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cpxt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cpxt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0" >
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>

    <field name="gia0" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[sua_tk_vt = 1]" field="ma_vt"/>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_dh" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="dh_so" width="80" inactivate="true" readOnly="true" align="right">
      <header v="Đơn hàng" e="Import Purchase Order"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="pn_so" width="80" inactivate="true" readOnly="true" align="right">
      <header v="Phiếu nhập" e="Purchase Receipt"></header>
    </field>
    <field name="pn_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>
      <field name="gia_ton"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>

      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="so_luong"/>
      <field name="gia_nt0"/>
      <field name="tien_nt0"/>

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="px_gia_dd"/>
      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="tk_cpxt"/>
      <field name="ten_tk_cpxt%l"/>

      <field name="gia0"/>
      <field name="tien0"/>

      <field name="dh_so"/>
      <field name="dh_ln"/>
      <field name="pn_so"/>
      <field name="pn_ln"/>

      &XMLUserDefinedViews;

      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>
      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
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
      <![CDATA[<encrypted>R1Kii6uEXf0VUmWJ/52kho5Y4YLjDcDbVXLGAY+vgaUx0ZDLZgpQfug5HozQJ/K8HRW/8MRH8eyuQK05YQhYSUEiEpr4J/JSososnzsaRmDhk3o3iCKfAgFTrPlHCAFPPmz2BtCklSTt+K6k1vo8bhZsEpi38ZX/USixSw0Nz30fIKnTJ0HosGtoe7inH/iHkljRWA5k/7w21ARe1v0vvhwIi6RRQ4EA7a8ZvvYkRz4OBwDnGi5TrvpWBOOWJWxIrd4oz8lwZF6iL9YfO+NEJSUk3NtXSBoS4fSffXbEXPdHqyu3geN7yNjFwmzrwXAP8v+KD0tWPZky5chLCODIHnDanoNIwuaj1SzMvAZqwJEXo1w7OsQgJneRc8OrXwxZUZ2uvZioAqs0ZLJ+3HPKyzo5yNmstr89V1Du5osjR6rbOMC58YXV0qOUt1qlv/541+5Q1GQxhBTd5EdLTFHkwqGm61ZUE9+AE9Xj63Ai9NnlwOqk8Tih/Wu13U5xiBvtmO41RQulddpEoLYDb/IBK7c6gzgE4w6B4OtDBkNm2UvlAzZfwTsp6xt1U9Vv+OgYkUQPhIi8rrI+XEU3NoZxNM67ShmGEjUEOobvmX1m/FNy6KuHwVR3/RUvA2e+blCdONJvkJIgFk0qO5XcBrZ6BmmUNYwJSZYHncltCk6IYb+eaAKRbBF2BLK471Zdon0TcHNhuEowQ32bntrgOvrWRjZz0ld1zVoC9isNFI9/xtdsMCrTLnKaF8jGpP71EnUYZqWgHrOTqEofXZ7LATwCposaarY7z68CfnV+XS7RaEBvS+ez4lU1XfMNZL8OWTW1pjrpk2blOFnaF0TRUv0qxuf3JfkcXe846h8kyfEjQ69+H64L8ryvDjRD3iPuJW68PTnlEW8/2hJC98MRRLGg8PS1roCtcVb00X/ieOG0y7hejP1qJ8WnD5YU8zu6AgLbtL+3Ok2Qjdz8TEF4defwxz89vU5Qz3PN//0o8/Fkn40=</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>DHLWGUD5RdLmOulEorpwWJQL271RAMgkT2a3QyP7U1iGA5Sn6QWPasOUWRbxIx3WdsIIj01Wj6rKPjw2W3fYiy7sX9ttgNL0/qjXrgBYXjmkxv7RCZvQvLqjrQhgrTJBRI/8l3RuWD5cns7FtrKVGnV2hhCAEIqjqge3KLaCWoQUJFwtdHD1Ivefk25jAtg6Gxphcz0azIoKqm9oBK/m5TLiCI9DGBPZw9PDwAKgR1rkWvJ6U+ir7xHGUuQOG62tb87mXI+w8QjezGl0pEDQYKgOrCM6nBcgZqx2JjCjbng7lWOLeppEA02eKN9lOy6l9YmEsBFPXXv707CyqTLRZa0pM+vltUyvmgV6vmLJqk7I0IKQw1LFH3gIqb1JcDOr6EsHsv7kpJ1oepT4bIxR29Ho9dSQWkRbSK4cguu8yN+pq9pYOcHOD8/ZrLiIUfz2j1eL1Ebx6rR83e9QkubknnuKd2yS1fG72xdJyipS6thT7pCfvkHrJbgOfNvISJBflSavKsBtSfE84ZuRrqcnAJncOJARfRT9yV8XYnX0U73sM5h3gFPLJhenT8z+IREhWQIYIR+gkt70ypQ/HQiLV9PIK42y5+IWtn5GoqTNqGMXy+PiXhbeiyNb3oPv3ezru/ndSUd5cN+3e9uGxY1AOw==</encrypted>]]>&AutoLotGrid;<![CDATA[<encrypted>TaHWmecISiWOQhfxpLjPEd4gJxt9SYyF2mZn0nQZuG89y1KnDN+5oCNGyZtI3A4+4t02+/7Ou67h530HI5G20pVzisxR34s7C8qhWVBmoXTC1y1wXVA8E6ErfrbqoYdKgWgYuCaNPpy89dCtSInTyUIyouOOgn1t76mQRFzWvCTkgF0To0K8OweRJmiPmXL4I4kyi1A27+5QTqcqcsxtJOLylqh+1pqVKpMsLgxWZA+iCjN45Snz7qcsV9O7oHGiHpb5f5d67biZC+2iWZPgXrWwbfy2JQacJLqpPeQvWkjGFfErlGXyZwnhC0ax4FhtT1RTvGaG6donc3IoXUc1yArJtYTWNGGZJc/EDkmL1wPQQBtT/YUdnBXFZWNUySQ3mJYpRZfiOpcslWJvC9fbcl37ORhM1YB3Y2b3Bid7zNJmVqS0AxsubXI04BoQ+Irq8QpBjNpmZhJSYUqQ8a7tIh+oTbRFoGQ936vwurNJguIV24TswvKODmfPX99Co6WumQ5m+acEg2Z+WXcNGsrbYxIvKN3MoUnzBy3vfR/o7Oj6kp06t1UTzwWtNAFT31Mhd7c+D2jVA+OVGzN0H4lyRKl35wZE4nbgL5s5KuQt4qCob1zyVJLJoqAvy7DdZdUv4jt+H08mRu9IvE1UiIPyXNBFqBOpKGevf3XPIb2CMOGzsJdR6/AlTyyIp7mb387vO7iBSkLhnxxayzoDMEI2mA==</encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
      &ScriptAutoLotSet;
      &ScriptCheckGridIrregularCode;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;
    &XMLGetReason;

    <action id="Item">
      <text>
        <![CDATA[<encrypted>r4gUa9sEPwJGDZZOLL/HmsQl0fpJ25ZP23p7s3jgDNsoWHQ8vYmPuNR8sEgn1TQv3ORphNQHcMEK1TtfzSFyta7lio2cku/nbCjaN9cAh6bJ0h3H8lJtGaZtx5DbLPfVVMJvKfMm9pxB72B6o5M05Sn1K1YZZaeTA29c122Ui6Z+ZndUGycq/ZEXGUk0N8FFV7KRnvBjWCPe36MYtHKI/s9kc/BfKGNl3KnMePKLzmDcFcwRBGs/gWw+UxyPivkJ</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>dc08hik76x5Apk6GwKudrtvVgnIWz4fYjzyBtvMsbwqMJUcr/JFqfIkuQ6Mg5oIZ++12sKxoI17+WANy3tB3jyPmcIAV7rrKolTbKa7beWNl7u9xQljzGEzjGvizRh87N3NSX0ace7Mhwwth1bd4ozTfoeMTASBwotuKeRpNkBGcBeZOHXpkaFrRWJtXLkAwRcvUngzNU7Mv9c0TyD6nqwLYYAtyNTWxSf7MB8RAS3S0DzIiDPxGIXET8fKYLjqkDt4HKcB3H0IcI7LtJmbMzQ==</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>NmFmPyKX/q85M1zPCqEhFsyTM/catkhT5UzHW7QCf7sPOHtIErMxA9VvbC0GsaZIJDuudxdd2wHqZEL1T+KrNSJk90bgeh/NocRp+gqev1fwD7rfdvw4TW+3tLq+p7mBgAz3wFAgb8TUfBZ51eVhiB45r0yj+B4ErBH9AmV2RI0=</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <!--<button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10" urlImage="../images/Menu/PurchaseOrder.png">
          <header v="Lấy số liệu từ đơn hàng"  e="Extract Data from Purchase Order"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30">
          <header v="Lấy số liệu từ phiếu nhập"  e="Extract Data from Receipt"/>
        </menuItem>
      </menuItems>
    </button>-->

    <button command="Lot">
      <title v="Cập nhật lô" e="Lot Maintenance"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

  &CssCreateLot;
</grid>
