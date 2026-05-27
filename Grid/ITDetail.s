<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d85$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PX2" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c85$000000" prime="d85$" inquiry="i85$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt] == 1" field="nhieu_dvt"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPO5Vu7zotkPNh5UDN2V7J3FvVhxkFLSxLNK45HvA2sFImSqzms1JcVt8xLVy+uouIk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_vi_tri" width="80" aliasName="a" clientDefault="Default">
      <header v="Mã vị trí" e="Source Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="((ma_kho = '{[$ma_kho]}')) and status = '1'" check="ma_kho = '{[$ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_trin" width="80" aliasName="a" clientDefault="Default">
      <header v="Đến vị trí" e="Destination Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_trin%l" key="((ma_kho = '{[$ma_khon]}')) and status = '1'" check="ma_kho = '{[$ma_khon]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_trin%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80">
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
    <field name="px_gia_dd" type="Boolean" width="80" aliasName="a">
      <header v="Giá đích danh" e="Specific Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
      <items style="Numeric"/>
    </field>

    <field name="ma_nx" width="80" allowNulls="false">
      <header v="Mã nx" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOWXgUu3RdbOz9dgAGCqElgtlkOdLdSGcnwMpAOQX4VisTLVpcwj5LRQ4eCLYTcPX0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" width="80" allowNulls="false" inactivate="true" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]" field="ma_vt"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
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

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="ten_dvt%l"/>
      <field name="dvt"/>

      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_vi_trin"/>
      <field name="ten_vi_trin%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="he_so"/>
      <field name="gia_ton"/>

      <field name="so_luong"/>
      <field name="px_gia_dd"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="tk_du"/>
      <field name="ten_tk_du%l"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>

      <field name="gia"/>
      <field name="tien"/>

      &XMLUserDefinedViews;

      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
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
      <![CDATA[<encrypted>pYrrfEfR+ZLEH0oAKWxaiKvXaFDSQ+Q/WvWl1dpNInVof3mC7/bqd3j37E75agrketdEvO1fGimx5+S0pYlsAyh3VU2BlUWCO9sMpH2VFt+25n48HitsQtgCyhYTKAFPa/yA1faT3ocfMUjxYAiGGQXa5wLXYdE97toaxx2a5vuuAGvR0dMnjLeflQRf7kt0Y9shsJaZc/fqrh2PEkykSpYIZsNN+ni9KLnFdiEDvizzUzQDGouHlvmIYsoqsldYf2HQh/f01rWEf5EO8hRwop4gEUoG7XpWBJffWsXFQpVQdowJ2TUNxGnYCx9vyORacb66KS5t0/rZrvfEvdazyvt/S/2im667O+Kw2o+Dl6TgdOMWB5J4ScGGOIeGehKkTJJfAKFayej4X6QBCZBqP+WnID2x5YWW6DCISDVHVcoTAcNsxYHOidhDNEYgESIkvsKTLrWaU2hv0b8yvmLm2e/+PzYCKV1YsBK2AFeCqcIgb1jmo4KpL7dtcuWoeAMeWcDgFctR3xf1w2LLDFkqMoa7Bmb3vwVUOh5uOJCJP3Wf45LeK79yldc1TAEFP0opj9344SSxsK0ZfMbr/h09fqblzffv/iMUYA4uA2iAOn/JX8jJRCHdtZpniKz+AnncSK3jWyaey5NxanLA7kS+pt0wgHBNgB0NtyMX6gxAii62GBwrExarjJfZVBBhtub1XaxGeX+0h1QeiBgcQzzsZ+QXAPqzcEn+ySVlXgMHmZGvFQprpZ1zzeEvxfIiUlGiN9sLY0m/CjaCY3o+yVq7J1YNNpABKk5BPRZRE09hr2GPn8rcz+byNYjeDvtPUbIiK8pWVhA4fl+fCfCc20cls9uUN6U41b1qGd+nzd78x87/ttYQaAyuaQtpo+Uep0Fx1bdsmoZeGrpKZ4jxDMltLhJJ6TRUBqpvJkTgHydgKeJnSotlphJhO6lw4rT/ytu2hFflr7h4INgokGx/zOoM1iW4u8mTyNh2vhiRAsPIHYjSVO2RcMWqd+4nIxTNT11hN+yzJ3Mt+GMnwYOgDB2uRuECC0O+2/JgoUzp/4KM729zmnnFrHdL2l+A1foMEX4MWmOfThg4M2xbMP5Xseq7BzgVFbjXfhgxHuOosRr9xp2ZgjAda4BpXw7octCEJ7G9ni0AaAYF6uQzDYmbL+DhOzWJukv0DV5lR1bgOsHan3QAwtfvWMAY4VyPDSJ2WuJ4Axa01SBfnOoL79iNp8hxUnH1okM24cmwW7QEz4Eg1YHKuiaOJW2NybO9eJFv3c6jxS+bM4lS34/1RJ9l49WtbfSt6GBYGTbo0wecNCmYg+3ohJSAHg9rJgXKNIAWeMMvoeAjr+AVi9rYhR2qv3cL9VorsRMVXdG7/HyD5isxSvq1QikRUgMu6oIUdPa30cNrbE4KXKEtS+uESYMVydFASfU2W48Qt0LfDneTP5V2lk/x/rmQEFRm7PcO/tdZRStqr859jG59to/XDDVwXa3W7YuRwsqFDJvl06bhKxHOAN57uTGrTkf6JeqqzyMwrK0x+Av993TG9kbG0tAd3ntvjKUV4O50VKYwjG5rHoUBbcH5Zl09kaRYTq4qCvFlcCPbijZMWmjJQwXXhokpQtLV9b2pVGep2ulhdYTSfF4perHBmIuA/FKO3W+/pP9EITxLNR5/mR9NKeB07aP6STiqClJ+kDRBKnsK5bYinP6ySAzhQg4JQwkRMYseBvLZUCR7WP1r8VTrDYC9gTfqnKtFAXN8JPH/ZjDsj7IB4lWP01bgbWtlaYPjSp/PsTPmVXOKUFSw+9EhBHWT4lfaE+0SOF4DhK6c0kRlv1sSPuevfjChHovr0jiivkWGHRDkcwmV</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;
    &XMLGetReason;

    <action id="Item">
      <text>
        <![CDATA[<encrypted>b1nXhVk0Kx5OU68CGbmEDxJzGdavqaFPtSCbx+CbiUqeFfxHEurpQP2allnnen2EJiHJNtHd026YyuCKfre+geXbr1W1A8A4LsQR6+lXfvm4BxobCyefLaSjdNSzS08uoL9PyZktndxzloIJq2FMhtL+F9X30Pp86h5ocpbQSbBJIBvReVbNINlwTp2EZFeSn8j0J2OC6hUWR/Zshn0iGf5JLC13fXT5/ZKp8jWSp16wuxtvFZ2riZXkpSO0NDsh</encrypted>]]>
      </text>
    </action>

  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>PIMwMHcDQTnS1pN0VxlCw1DMTFI30cte4yHGuipTUfzN6EH5hjcv5GMi6hUk0KtvRAZUnOzyMoUSJeOn2NvsN65MJpqez8OgZHvMtXDMsEBAl+81XHxMflCcdzGa/IEHzxF3dLxByfGScUDRhR9jWgdoXVqNngutcewuqmcN388szv9mhW8VBOwg6cy7d5L7</encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FllC+E9Ib1pTnjfNFwSw0tqLw+izgIKpk9uUQ4EOt0Juf+GeQWaSaZpqlc1OwdnSYoeGbjKgHH7LRv7TmmKpfWj+tVJkc8EZGjWKaGCKqMsUbYwB1yUPw9r9uILi+17NPIQ==</encrypted>]]>
    </text>
  </css>

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

    <button command="Lookup">
      <title v="Xem phiếu nhập" e="Lookup"></title>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
