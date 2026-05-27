<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="d31$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HM2" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c31$000000" prime="d31$" inquiry="i31$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_vt" width="100" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="b.ten_tk%l">
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>

    <field name="dien_giai" clientDefault="Default" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>
	<field name="dvt" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>	
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
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
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>

	
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="dien_giai"/>
	  <field name="gia"/>
      <field name="tien"/>

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
      <![CDATA[<encrypted>V5tY4QFWdb5R1CvjRm87SVOIrKqnKbYnUuPWLkpXvP7J5HtNG1hJqTWggyuANF/ChwMHfWR7WptnZ2u/VeOL0M3fb2RWAHODkUK/4s+zj3+/Jy8iCjsXgni0te4vlmJLAhRIBYM7JgXSFeRuewom1rdeXFbfAhQT8+kZqdAwlC3M/ovbytdOnIIUbwNXeQfOgsTHZXZNdkg0AnkLaahRCQDBROC6cUt++Ol3zCM4MvkbTS8+48W9mI1Cf639cigDTuYSQX4vJimCid6BallXTHwoZqM8aycgy7OQvPh6x5bMtyIcAdpOo9j/xknKzmCoVDduZ+KCvrE+wxqk6TgkcfpaEKcZRw6z4D3GP6CIbcUSbo3ciabO5w4vXwDvHSl0SHNUKQveFJMB2Q+Ikqb12Hq3bmD1LkDnb7kGlBUYSfGgUmnNKZM83xFmmZXbop2mTSkB39X3LpyLRz11tylmK0/ItDCIqV4f0XwMssTq6pCAxRzPAwILZCyrWL2ebF5HS2IbL0fxsS/BISclUt6dRHFWmEdE6xrKnEHGZ7e20RJh1ty58ZbfbsL/1h00QI8ZdgaAJjeKST/dk1lMCnfbZdGfSjqVSUccw/xZ9yMLZSRxR8gfSwWPHrWBiXbAVroEbOHjPYAndfHhBhWbNf20++a/ScgRVWc/ubHW78+BbiwWOXzr98/X2bMpKTN5077LphGL321suOpHKwjymNG2aAEHgkRJb8LcQoES3o5Rdzc9z7d9I7/7zmA8kz2zzMxxJ53mztjIds5/j3bUWyuYO7biKB9tli14UghG3VS2g7fpbd7jYsWELcUPkd+ySUJi8m+JbjhEjevXldtmHPysV838nXehmzAZlRjw1NabyoKq0ZMNEpKC/tVoBdr5UR43jHGPxI/tic0BqHXGVdbYF+IE25gRdovXnzEjBn/b7g9ka2QmiwK7WXttqe8NlwNZwjY+nEApGYrHE80usJYTJ5qmMUt2GQlJiONZh6mq671PEVcD0MGZ14JR4y8qipHZyVza3NE9VwKKRoOYB2/C7qDINoOkqwVLTHrbVoXD/E8ajMqp+86PD8o24EjTj0bG</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>8eTZozuBN2cGSIHGZ+boTqEwDrQFou130BDm/qyZhbcgozNt/x7TZz8kACgBRK6Bm2p8D5cHt8Wpe2KYByR01+3XjLJkdlLVc/wOM2S3o9EM7jY1O4G4FvPzuhOFt2bsBn3vGFFYQ6MtXSCY6t4geICVy4GW7nVRpS2xSsC7VjpKE/IrLSCJoFxt8aC1rYDC</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>
