<?xml version="1.0" encoding="utf-8"?>

<dir table="xcdytdd0" code="ky, nam, ma_sp, ma_bp, so_lsx, ma_yt" order="ky, nam, ma_sp, ma_bp, so_lsx, ma_yt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="giá trị dở dang đầu kỳ theo yếu tố chi phí" e="Opening WIP Balance by Cost Factor"></title>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true" >
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" align="right" readOnly="true" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_sp" isPrimaryKey="true" allowNulls="false">
      <header v="Sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Item"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="truc_tiep = '1' and status = '1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep = '1'" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" align="right">
      <header v="Số lsx" e="MO Number"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="dien_giai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_yt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã ytcp" e="Cost Factor"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1' and dd_ck = '1'" check="dd_ck = '1'" information="ma_yt$xdmyt.ten_yt%l" row ="1"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dd_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_dk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="111: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="111: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="111: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
      <item value="111: [dd_dk_nt].Label, [dd_dk_nt], [nam]"/>
      <item value="111: [dd_dk].Label, [dd_dk], [ky]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7b/zJ0II9pBVDjl6g4565hdOvA1/RW7AjUNHxrHTNUecGMuWSk2jNH09SRTqy7RJJyTLOfT6AlDsbFb2UqZO94w=</encrypted>]]>
      </text>
    </command>
    
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7b/zJ0II9pBVDjl6g4565hdOvA1/RW7AjUNHxrHTNUecGMuWSk2jNH09SRTqy7RJJyTLOfT6AlDsbFb2UqZO94w=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>Y9Dj9ROvDCThl0h/A6l/cb2OCiTtmijYz8cOKx1WuaapABVZfmAJZZ38/CGPfvVqDLrFyTN3M4MoC3rGpCHDc1qGXK3G+OQEYH1KnkjXVb4aBzVKekrcf5SQLtFbjyJJeL8Bjz72y2SBNn2gWxN7Xmu7VKy3KKhBHVPdsKOxFxVzPqgUrsMBRKe49gsNHbrhbNG0bz03rIRIBzmI8yDTIwy2vYNiteg+VzOhFF4W+AuzKXcdCxmpNnSvP1LhRyC0qKb+L4hqka+8fyvE5mpB6kiL6cR6ikI48kNuLguMHjB9qNOZXePUcLU5mEF8MVath3veaaWMcYQ5KoYEySmNeIGtNjwParAh7JFlSCuHQ6UcC06lbTv8E2F1hs5nHe9zixyHh4Yp5bx/soeWRqs7vDdNGgfJpTnB43TNLsAc7ASLV3erNEaKz4hVJ7BA5Qa9VtGdM0MdEqzaxLxea5pMtkgSqUiEtMKe68FyH+IrDgNChvtfMrFT39aMszw1DvDaU4zLNO7AlLHSqOi2wYpSGg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>Xdg6J+Hsxor/VZli06bT7puBOY2P2qma4cJyFPLHn55bpiXpFvt5VOQRTusoeHUDgKacF1PJjzNTMIu/MPG8VCjl6M0MQLTVJWW6gsOEjbHLG/Igc5OV9FU8MyWy1cKYNs42jNgl3tsskF+8TAe4ivBoIUcXMfhcpi0r8JNacwA919mMGHNODGZOSnSVJEy2aw6TTprf2Ip/ToZylAeVTWjwfNyrIWZMX0GUuhWxXMUQnOBOTB3SNkvtKzC3gy2yRXp6ptiWVAeFQnNCrAVf/A==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>4Xmz75iVgymY8G8Qzq5e5wEjFiyv8OUegzcz2d4weihjTyxvzweEk1RSg5k5Cjk31lx/tFteeHH39wedi8ecK7caKbau3W0pp48kzBhrkAof14TQ/j3l18Umws2tEfNoOFzzHulG5Oh8lNcrm31J7p/iwLqKl7HE6ZicIb8xNKtVCx+/xIYQFQRhYo3+HiZcnNt9NKavNgXnyY6xGjTqEbOnpUGe1MjQTmV8p0UCqz325vSfBJ4d4yGmL8fUQm8dyh4irT6tmSdnKtSjRzMeI43ub+8nFwTSJ5ur16Q3uSrKGnm8/Cs31mFeirZ02lQacGwyz14+J6V5uEa8ujWQJMhDGzAJjWpP5oDNZ0FSOMJ9W1u3XaSkabqgeKSe+6/lKJiALbz/yDbwCm/NwdxSHw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>DE886bi8ZhY8JKeGkMEKuzQfom+5ZI79A5Se737T5vb0WTYK+3np0Nq0h4bTGiVYcLaHnejz80/fWcC/cXo19PKT4/zrm85JxlXd1cS+q8kAbM/lvnE74P/jVfXBtkIqniFyxVzHvWkKl4+NMcwxIjRRBuwnuNSA6Vlrdhrt43/OwX2r8UdM2KsJaQnwx8hj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>rjcS7z59o0EfnDkxoMeBg1ZKzANgkJSxlt2a/cMIV2hObsdZsthKyvJ1kUXleFk9NiMrb9z0Y7gMUcTZg7C4A1MjDE9FZ35FpslAZiSGn5vigiroxvYLqWTmcWAyJFN4vzAoWycBMJJ3HsbBS0y8Ae90cL9lFkAdOxehHCm6NfobfIBAXGjRKZXUaaTsWqps+JT331f01X1K2hXuzcudpRWgBbHDZzN0KRdeMurTRXQJt3opUjMma3Q9Q4xwKb5vIiv/JFuPHKcrW450QkmUAuIKW9NundNgZFXdoyyENFwICm8wp6NXFGYBd1kPOKXnHwy3hkWlJfboyE4BkoL+c8AlPJixqTXGgPSrZlKpVyxT1rOeTQqzgPfYt8ELlS8s</encrypted>]]>
    </text>
  </script>
</dir>
