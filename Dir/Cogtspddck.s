<?xml version="1.0" encoding="utf-8"?>

<dir table="xcdloaiytdd" code="ky, nam, loai_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, loai_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="số lượng sản phẩm dở dang cuối kỳ" e="Closing WIP Quantity"></title>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true" >
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="loai_yt" isPrimaryKey="true" allowNulls="false">
      <header v="Loại yếu tố" e="Factor Type"></header>
      <items style="AutoComplete" controller="FactorType" reference="ten_loai_yt%l" key="status = '1'" check="1 = 1" information="ma_loai$xdmloaiyt.ten_loai%l"/>
    </field>
    <field name="ten_loai_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
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
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="status = '1' and truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" allowNulls="false" align="right">
      <header v="Số lsx" e="MO Number"></header>
      <items style="AutoComplete" controller="MO" reference="ten_lsx%l" information="so_lsx$phlsx.dien_giai%l"/>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="sl_dd_ck0" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng dở dang" e="WIP Quantity"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa40GB1aTM7LTRxOuxNXSetvA1/W8BiNigsoqezkaHHcSl/+MB3c/dMQg/wZxddKIvAQ==</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>
    <field name="tl_ht" type="Decimal" dataFormatString="#00.00">
      <header v="Tỉ lệ hoàn thành" e="Finish Rate"></header>
      <footer v="%" e="%"></footer>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa40GB1aTM7LTRxOuxNXSetvA1/W8BiNigsoqezkaHHcSl/+MB3c/dMQg/wZxddKIvAQ==</encrypted>]]></clientScript>
    </field>
    <field name="sl_dd_ck" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng quy đổi" e="Exchange Quantity"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 50, 50, 330"/>
      <item value="1101: [loai_yt].Label, [loai_yt], [ten_loai_yt%l]"/>
      <item value="1101: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1101: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101: [so_lsx].Label, [so_lsx], [ten_lsx%l]"/>
      <item value="1101: [sl_dd_ck0].Label, [sl_dd_ck0], [ky]"/>
      <item value="1101: [tl_ht].Label, [tl_ht], [tl_ht].Description"/>
      <item value="1101: [sl_dd_ck].Label, [sl_dd_ck],[nam]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ZSQbC0pmLfsdzMQ1HOvnd64f4VAOa+dmA2g8AKJMU+tf+tuLS99kwwkcUl2VTZXkzKoSqZ+vW8lF85ZCTsZco2Je3qTmFsJjNIMw8XTTDR9</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ZSQbC0pmLfsdzMQ1HOvnd64f4VAOa+dmA2g8AKJMU+tf+tuLS99kwwkcUl2VTZXkzKoSqZ+vW8lF85ZCTsZco2Je3qTmFsJjNIMw8XTTDR9</encrypted>]]>
      </text>
    </command>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>Js1I+8EDvIUD+Yf73WsoOnz0946w5S3Zpm9L1g4uN7d4j2k4WhrX4KjNRy9SHIWBs/kB3XbeFZIdk4MSYwZdAuw2RXALF0jkPSv+vwu9dPJ/rSv6baRoNdD+WTA5JGnmBcbVaaYxFKekf7azMnIoOS6P0908GM1e0rLORjuSlAMmjWtCXBwHdQPjquURygN8BkANNS+tmqekuUn4M5JaCMEE14t7XEg1gRBTjVHRbwl0qjhUgVnUEd/29wcUMjm8GkG3fBUJ7VcoGJkMbja/j19NZE3dyDAu3/zq0Xx2S7DqRHU+Iw/yND9RbX/teCzGsIE5fjpu7nDRv6xD0NPnyD4AZXaPZAYrbgr4fybW07tehqZlgRdfz/qCzPk5rA9MTKk+WeuoQH2L8QZmOm0Q2vf0dwmBDfqlbY6ryJN8V7BrQomM/oHGZzfxHfqgaw8pPyh9vI1xxIBlh/gKDbzNMT6FyF7LtfOblDxKgFvu++Z45+Y7Bk7oJyMXbPCPWJkX</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>S+8ZYbnMzvj2jTOHND3M92IPo7qbEmgYHYwa+l2pOKWFSHms6imLRAfIN86fQkR6S3XCKW20gQbi9YJ5548xINXnBigLBqtITzqop/GaWJ08v1OOrS/KV9SAwONCD7e7IGzIyJfqEon5OewbrPFkccUAVuuQVVWMIdOHYztP+nTpWXtlQd1kZcEEDZrXJkUubfE54egL4wAESMGxCGX4rKnNYx6d6/HlEEjbrwmL+DLgTZqg7L//Jl5uGtAMmr/cgkCvrauuQsDV4RK9mjNoYA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>bFrQ1vU7lcJsSxZVYwCYOYTYZB/BEgDMLNCm74BWTiI2SAmUvud77ZaF+vLYoIqkHaS4s2MZEQXdIY+HCHeG1C9mJu2sl5+URahPgcsy8Onu9/NfXBkb6tWYxDjPIJ4ML5hDhomyf2tViDi+s/AGKhtrlBjYfgn5H4nwbjNZMJ3EAO7LNWonQ86GXO3Rf8z9CszU+EItg6xa5ud9508m4pBIaFpjm2tMa8qIJI6YU4CAvOSRtIrLITnA0XD09KGq/FIJ2jw7aJ0Pc81NnHGuSfaSzO0VxpyTZ+1m7E58lM/y4n7HIrLPhhNRN8fUp2MOCdvwvTvaF8vHsTXGbqrwBnvBpia8wuHhu9p560WkJ3X3ONxMe+S8wnD7S9UeILcIRK1f0HFjlvnJ4NRK1onVOw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>DE886bi8ZhY8JKeGkMEKu0HKntRhljvDZ/7PCvl0I9fpdJzlba/1X+tYUbdtQ89XCYU2s6L+P3sHMgHuMxtuJpyOznzzyKlK5qr/zGaW6U+UpWOEkx/eMJm4YCuToJTFi5gjjbT3Y11QR4PgKTJj62N64QX48UGjn/hsOHqgnY0T5GhjLXc2ooRfDiyG4FuV</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>7tdaWQ0fU1oi0Vc0CqGmWKB+sKyFvdoICh8Qxf7k4s2MviTog4lNcgT4iZI+zE36E2X5ho5lCwH8/gQ0S6je6V/bh+ygl7yRwOlDuhtptjVRh87hXrkP8X4rsoxXpv6zYgwz2KvSuCm7epHhniHq/Kymp2XQJUyZ5HHt5R8oXxAPaixrZ0CdRhEMm5wTluUvuYTFuumgR3Qe3WwTg/50EABi7OU9ETSx8IfsWL27tqSWq9GL2Hjt7ybm/FoQ9LdpJEqeEO7WfjSvmvPZk92VCB1XDpDYhfuYAmX/Av31fxU8Ru1ESKE3OQZHviDnRkHwBpDMttv9hyT9+IVRoLlwrfSj8ExdC2J7wCZWfdguJ0tOA5lGbkzjKnJi1ue+T0i5ky9OeCyMFZLhl1pjevbFR+Me/WJhlL0W08GexZRP+tUnaVkvWGA46pbI6MiT6kgs4e0s1eJIc0ke4GlPt3rr0Pd9nod1ygG1PzjYqhHbpzCnG2CFIPY+a/qSy9nklmVT</encrypted>]]>
    </text>
  </script>
</dir>
