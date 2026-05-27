<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ctdm" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="DM1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctdm" prime="ctdm" inquiry="ctdm" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="ma_vt" width="100" allowNulls="false" aliasName="a">
      <header v="Mã hàng" e="Item"></header>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="200" aliasName="b.ten_vt">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" width="50" aliasName="a" allowNulls="false" >
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPO5Vu7zotkPNh5UDN2V7J3FvVhxkFLSxLNK45HvA2sFImSqzms1JcVt8xLVy+uouIk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" width="300" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="# ### ##0.0000"  width="0" align="right" hidden="true">
      <header v="Hệ số" e="Coefficient"></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="# ### ##0.0000" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Hiệu lực từ ngày" e="Effective from"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Đến ngày" e="Effective to"></header>
    </field>
    <field name="tl_hh" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="50">
      <header v="Tỷ lệ hao hụt (%)" e="Scrap Factor(%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_th" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="80" aliasName="a" hidden="true">
      <header v="Thời gian thực hiện" e="Lead Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_pb" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="50" aliasName="a" hidden="true">
      <header v="Tỷ lệ phân bổ (%)" e="Cost Allocation Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai" width="300" clientDefault="Default" aliasName="a" >
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
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
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="so_luong"/>
      <field name="tl_hh"/>
      <field name="ngay_ct1"/>
      <field name="ngay_ct2"/>
      <field name="tg_th"/>
      <field name="tl_pb"/>
      <field name="dien_giai"/>

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
      <![CDATA[<encrypted>W3inZ9kk20TGzJjvi4K0+qNW9aQGybXbgrTkgQx+T02ZTnjbruWtGa666oLsoLykjvLdv1bU6o4k+P0A3D2jCoCVhG5YtFtYokLhZQMrlKVNJCjB+n2YXDuOpVK+Xn4KdRw3/p5EjXfysWM9Pride4JD3FCKoLw56wxurO/e1vWGZ5squykozV3WrQkOXCr8RDP+sZbHWr7UGlV+0OKTfypE10q7LwRjd1cVbhrPaTUKBudkFA4AmaZajVN+A14j1FvU4u4rHqMO2J5kRHvx5OB8ZUJIUpF0a3+uxeNa++ieakc4clPqs6cf8n5hxNnfetj5yC3af3rag0hLlsWayNG5RZMq3dv0p5hAo2y2M/Z1KGUqVtbUCrMqB0U2S86GRiso2CLIaaQkrLur/9+FUq5S0yZbvnN9jPEbZimyTMO0cJnKvfQcQmHG6e5Qu0Qi1NON6SanxrNCGFgqwR1G9XBiTFP590+QM0+u6BIWZyE3Ge+IBU/F7KAcJF4E1zayPZzrwfZVlB0hlygrI3mNQmFFU+NZ4vfx3CyALN7saYWIZFJDwRSoN+U+Fw6V6dvBcHrkHg5M3MKcSOqRqiZSSkjdevjgmWiwWFKtbBfIw8iMlnJQsSCqiT9xGcVItxfjxSBLejbcmpkfjPXyZvTpje7K12BPX65L+diTjFT92zvP1alM2G0FfaDspFSEWWTgdFDAM4XXqDUDVTTDlzuFk4JIJxSQ8/qUbP0N3yyB5qXhdFZrZ0QaqV44SFNgjXsOq+GTA9jhPOcEkac8xCJB5oiaT7UvpGrhelSRj8q7As3Z1QgV4rGi/Aj6Jb5sf5/sZ2JjaPgUWNV+mtFqZeQw2HnLPQVwPoLcTu2Cs3aA2UgPRbJ2ZCTpZBfaUKVUa0ZfXsmQMKP7HFaMDgSNaWtIz+4SCjMShv6F6mu0J0x9upE=</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<encrypted>u1Sp1XFGPGILHX1z6aEgPbN6CHfTqte+QdOFqvYgSxUIn5mqL98YVmZDAmteA5tTjTxB7OkDV2frxk657ZRUKCZWDUdSJZACx16sOp0AqCi6FKp2x8VECBTVxD4R71iCXUYUuKZ382JG2PUDghdqGQ==</encrypted>]]>
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

  &XMLStandardDetailToolbar;
</grid>
