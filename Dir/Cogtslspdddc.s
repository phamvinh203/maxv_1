<?xml version="1.0" encoding="utf-8"?>

<dir table="xcdloaiytdd0" code="ky, nam, loai_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, loai_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="số lượng sản phẩm dở dang đầu kỳ" e="Opening WIP Quantity"></title>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true" >
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" align="right" readOnly="true" hidden="true">
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
    <field name="sl_dd_dk0" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng dở dang" e="WIP Quantity"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa40GB1aTM7LTRxOuxNXSetvDH8Ps0EM6R4e2vJiWCF072l0j/CG4X7QlZpBYLx2wmTw==</encrypted>]]></clientScript>
      <items style="Numeric"/>
    </field>

    <field name="tl_ht" type="Decimal" dataFormatString="#00.00">
      <header v="Tỉ lệ hoàn thành" e="Finish Rate"></header>
      <footer v="%" e="%"></footer>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa40GB1aTM7LTRxOuxNXSetvDH8Ps0EM6R4e2vJiWCF072l0j/CG4X7QlZpBYLx2wmTw==</encrypted>]]></clientScript>
    </field>

    <field name="sl_dd_dk" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng quy đổi" e="Exchange Quantity"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 0, 330"/>
      <item value="1101: [loai_yt].Label, [loai_yt], [ten_loai_yt%l]"/>
      <item value="1101: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1101: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1101: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1101: [sl_dd_dk0].Label, [sl_dd_dk0], [ky]"/>
      <item value="1111: [tl_ht].Label, [tl_ht], [nam],[tl_ht].Description"/>
      <item value="110: [sl_dd_dk].Label, [sl_dd_dk]"/>
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
        <![CDATA[<encrypted>pAZHT2x8D+rVM79D64c194RzrgSkkTXnP8xNikPs1+CzQUwo1Y8Y+cJ4djqfflfKD07jWtdaEmxpiTUcuokJ+PF4RffLmz2vqtHQ1zSTmHWzOQj2MvU3WDZdDj4/JJzxGaKArXCY7mRJL3+m2TPU3RcXbtFHVN8BHBQXrLmTKm9TaJl677ai3rGFUQ1cIzKwrfGy5GWIVvBCPnBltpCgeTmWi4LqgvdSjYz2Rw9g1708YvDs4+J9BlKk/IO24OBLZ6T1hDlZPX0auONG1dpnM5ArNbf7yfkmBKimDLA1WaCl6lg7tFJsU9CW0GR9KIx3Pu9xXxaXoEY3ngrM2meDznEkBcbczjgTEm2C34ZMlNrTNYhHjtKvk8afGzFonJd8oIWRpcU64ShVU+qeaX8evEHCnZBOA9K5+5GR0sAQAz0nZqV5az4Xwm/FOxFsa2ejWuesk8sThg/Rxm4gJDvFSOylTuV7mJN4Wr53XU5RVOJ1P1fpKM6INjIrATvEUxRi</encrypted>]]>
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
      <![CDATA[<encrypted>FySIdVTupoYIsBQyLprRFHSCMHsZlMe0ONj/Ns9nB2dzbUUXbR2AcROCk30YelhS5Li384ieO5KqZzJtxjvI+od/9kYyo8+V6sKqWMeKnh6R0t6HA5zEQLNsQH9VQwd4TPkRc7UwDrUxWCIb0YiMjOIytvysMccCc3nUjPfSIymmi7YPj2RjO3Sha6jwh9kcgsFuf6ExThGnzCV5mdWaYLSxpR42RXDGrX2gCumtnFvhpcHeWFfhPpMOi6PYm4+W7qm9UG9kzZ9czGBkhzLQzeV1j3D8gmoQVjU6akD4PS2m6J8koTlSJ6ptHiDDu/nHX3fVixKul7ZOAU9YWWjAnvu5JlciSIj6++qRDF8jk4UseZISx8xA3s/1B6YXtziYEsYQdskY+zikDh+jG5U0q0dhxO0/UxRzgxJiKhncP/sVs1Hb9CvkZ2NKyQkGWKb8QUhwLJg5FnyaTYLOe6yndcWLPUnZ4osi91YvmbufV2A=</encrypted>]]>
    </text>
  </script>
</dir>
