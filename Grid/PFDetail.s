<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY GetReceiptNumber "
declare @vcNumber varchar(32)
select @vcNumber = so_ct from c71$000000 where stt_rec = @vcID
if isnull(@vcNumber, '') = '' select @vcNumber = so_ct from c72$000000 where stt_rec = @vcID
if isnull(@vcNumber, '') = '' select @vcNumber = so_ct from c78$000000 where stt_rec = @vcID
select @vcNumber = isnull(@vcNumber, '')">
]>

<grid table="d73$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HMC" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c73$000000" prime="d73$" inquiry="i73$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a" readOnly="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="' '" width="300" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kho" allowNulls="false" width="80" aliasName="a" readOnly="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" width="80" aliasName="a" readOnly="true">
      <header v="Mã vị trí" e="Location"></header>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" readOnly="true">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
      <header v="Chi phí nt" e="FC Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_vt" width="80" allowNulls="false" aliasName="a" readOnly="true">
      <header v="Tk nợ" e="Debit Account"></header>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien3" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

    <field name="so_hd" width="80" align="right" external="true" readOnly="true" inactivate="true" defaultValue="@vcNumber">
      <header v="Số phiếu nhập" e="Receipt Number"></header>
    </field>
    <field name="stt_rec_hd" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" readOnly="true" hidden="true">
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

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>
      <field name="so_luong"/>
      <field name="tien0"/>
      <field name="cp_nt"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="tien3"/>
      <field name="cp"/>
      <field name="so_hd"/>

      &XMLUserDefinedFields;

      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>
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

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ktjRZSsAz5fFJclm0HQtJK8eIk4H8H2N0JdEffTs+H7FAMj/H1a1x/IqOoOZUUCYNep7HWWJWu02d3MxoplfjYoubEAe1Y5eJ+Ta/qDTxcFv</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>ky0Gv/EaBiqGB3Soh+tZNfvpZxjJJ7i2oN+GnsocGYgnaGT4FsuV5SbHiHR6QwqO6We39K2PH+MVgbydUyfBV28oNKdXcNCVQ+3G3Vk/uN/YlXzTpMoz60IRKvfauE1NTR78zUtgaXZxYgbDkl8zABJiLQjbzaqh0aHEm+3vdOYRZoDIFzltM1I3XnDiHquHrvSal2cVf/dl7RppyJeA4iwGcqub3wKuka2wctssAAs=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/61tUAdupPBIUVlxMZ0YTEHXZlXuO1me94MoIYMQR79GvyF7vorDbwrcfs0s5/+tgKZl3vHo2+gP+KEbc7oLgw8f5VkM7Pz7i/c/1na/1UQff+dZHyOivO1Jrwf841+S9V+yZIQdYiKfRrbJty6xUfwE=</encrypted>]]>
        &GetReceiptNumber;
        <![CDATA[<encrypted>PIMwMHcDQTnS1pN0VxlCw1DMTFI30cte4yHGuipTUfzN6EH5hjcv5GMi6hUk0KtvRAZUnOzyMoUSJeOn2NvsN65MJpqez8OgZHvMtXDMsEBAl+81XHxMflCcdzGa/IEHzxF3dLxByfGScUDRhR9jWgdoXVqNngutcewuqmcN388szv9mhW8VBOwg6cy7d5L7</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        &GetReceiptNumber;
        <![CDATA[<encrypted>jwfRO/u5u0IXveJITZUW5p67FLSr5MUgBHTXPum94BVW35Xf1oA6qARiLzyGeEpfiVlKNxNrz79FjVApgj/HzXu48mBSnpkt1haRdBmyW19zQIy7wKRW8o++1qQaJZm0SUMGvvpIxAAVndIqLQOJmq/4EkpiNkjeTCUfxt35nTys+fj4Gw2xPHr7je97uzuWlZMnOuWClpXLhcl5BxE+vvkvMfKSErFpLHzrn6TEAbsPHYuuYDoer8F+ID0GTQbH9u0Y/MJ/MGnSGtSgsVpWDSy7RxYZig3rebvscecvNfNgJNqTjPudf+cmDm7QajK7s4GOFpShUy+E/pmaCKWJMfL0+yhlQUWBbm28t2EG3g6TFjc1U3Zl8pGd7BpSuO868WyDjMeH2Fqd7rjtkPkzJtRbQtiq0YEg7qMUg005c4rkiLdae927KJdZmI17JEGNPtMm1y+FpMjdSUWUKLxfTakqz85CJlEnP/sRvqbKCrJLF5536Hv9/iFrr1HuDAgr4iNwajHq/4PPuVwXUl1T95uV8cErlpZ1+wVBW9stxu6U9rV7TRBHqd1Xl1YkF1wrqIZHrQj4ud9AUve2oshUNFzy8rGYxu6Fg+SFd0SpGNqt0G/Iwr3rl8sjr3udPhHH+N1D8j+kgKXCUnYQYYvpMg==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Search">
      <title v="Chọn phiếu nhập" e="Select Receipt Voucher"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>
