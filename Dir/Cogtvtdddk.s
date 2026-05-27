<?xml version="1.0" encoding="utf-8"?>

<dir table="xcdvtdd" code="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="vật tư dở dang đầu kỳ" e="Opening WIP Balance by Item"></title>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true" >
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal"  isPrimaryKey="true" align="right" readOnly="true" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_yt" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Mã yếu tố" e="Cost Factor"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="kieu_yt= '1' and status = '1'" check="kieu_yt = '1'" information="ma_yt$xdmyt.ten_yt%l" row ="1"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true" allowNulls="false">
      <header v="Mã sản phẩm" e="Product"></header>
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
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="sl_ck" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dd_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
      <item value="111: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="111: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="111: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [sl_ck].Label, [sl_ck], [ky]"/>
      <item value="111: [dd_ck_nt].Label, [dd_ck_nt], [nam]"/>
      <item value="11: [dd_ck].Label, [dd_ck]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>4si6A0Gz+FTpca1qB+9LfBArd2O1Q+nEvHhf0g25VrWe0P/06jCkTReVUpgLZI6bZwx/NpSOymLXgHGicqdg5PsLbu2dba7cIiI4rMzUz2QSEJChdf16mmaapK5KoRnNnzvbFf+oymSFv7FFqIMoUUl9qF/TYKuKNMwNJbNJO6qdB7aUKM6K66o7pLkWXau1</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7b/zJ0II9pBVDjl6g4565hdOvA1/RW7AjUNHxrHTNUecGMuWSk2jNH09SRTqy7RJJyTLOfT6AlDsbFb2UqZO94w=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>Y9Dj9ROvDCThl0h/A6l/cdcaRFxr0sQR8jlz05UL4/iQbyTmQ87A0WtXpdmlqhNOcjwMw4/xgaQ/n7RTZ7mmbSly+B60slFdT1AyzBdMMsG0L8oOO5yVyqi/RJ9xGOOsp3Fs0/Jpf9lB7u/1w0QknYUb1Hd5sKEjNVvg6n6nzuwyEIeSH5FPyRshzUBNclyrBpZcmLNF6moAdElR3PxPCmR5JGn1fC7Qh111O16AgYatDPmAng16SF/t3a1FP2qGDIB5kwxrw15perVeA+eiwOteISen8Rhl/0pfaWDDGTxt5cxBVT1aimahEOLNYNMbQfmCKOXpvYmSFb6FI/7gt4wbRTUzHcfnqv1gkrak/tHkDj5IzJO9y8VU08cqyAJh2b/oli7Kg3U1gXVsjNaFko0JgbHgbgSIDkRs+RIx2Sd9ZpF6B3XmtowRO2x4BMBM9ndcOiYgaNmEAGgKHS01X6qntuxB7YYxCZJGuwla458=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>OvRUVjYq9bnIJkbmKimBlaVxKv0ZyH8JA1Pupl8PV/Eyn3d10KxQ9dv16agL6uIyO7n+hfOlP7mJbR/sMM2tNMHGg/13x0YoH/NtfcptSfqas+T+VRDMMRD12vBkVQKGS89bilUTrOCWLVnIRNxn9X+wLNsYd4eLwFP//BmxVmNbfMFEu8l3RZIqQEkFPC50usuknLMw7tzytgrUPoTTPbsE46+6++g1P1lsGm8uZXtADpH9Xp1vrVaLpTn31LwYoG5fwODIeTX/ck1GjkzKiA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>+fVs8IVHAKs7/QHQd8fPoVDLWTct2udMM8sN8/Z3uyj582UsiP3aN5Aixf4Q9wuMdKZFGQ6KhMtH10zD4waN3BYGYsw0zZjOq1GE4saNkbUyYpfV33jSuri/hYRY5oNjJ0sx3kLDOgIxb9aPe3q4CAH8MfIqCBvlGGZlfv61psZQkKhEH0lq1NMIAOpB5giarXE4mH/uKDFacPGYqmpF+bGa+h+wkyCtfHc4RbNg431iC6JKGAp6Bbf5pOFvtDWW83lybKAK+mC7i8/orLOO/Y7QgjOXA6jkFmR1OElMfuFXgUU7ZnDpFRZtdbaUMY0EJZ+hGJLue0EACL8KSduqEi1kkSLTu4Im3etiEo70Biwn9xfCJzsLu5BsT9luzHmywGfacZZD/Z4Xe+f84tbRk5JMzDAe2WyApN0PvuHeN2w=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>Fx5NVvAFfNDOtpYWpHq6kr6xFj6ioypqTFODx//MzV/4D2bxtgwrLqV64YzjJbPa3m/zYsYDcPIUcXLnG+lwimW+pTcpOLk3hR3N5lnUuEqUChrXpp4t7vvxukwtfBvBlfDap3su0kQu3Kn3Pg2sKxzI1E2BqSmRLAkYH68LYhtl0DiXT7/hAwqRo0eJwXjx</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>w2017mzephH/rmVhhHv5SLO9e3o1SCGNbWFfjSqEw3G8WqMywMRsnDJCocS2yPtSMn9XP+Obso7dxeQWZsGIDT1gyQE965+7HGoPzcZvlqZbPQtrzPAUiyOUcwWjkXqeARCpT4irCqA/uAr6Os/RpZOp4Jrq1GyIjV1TBK5YVWn7VUxfTBPw59rJ5vVqXQc4up6dLj1rCjEsAKsoaIn7YUeatcO09jlqWv1lZy8GJmrkRASrNUVp7sxC4GahnYibbfCagYM+UBpMocvAhqIENj+07N7lbu8iSmleic2DFfc8y5RaNmX1sJ9lfVcoMwl16qlhFpCxaJnbVB1q/tZ89+8qrXd8KYJpBuip4Eqvb5TGYH5HRCdUVcU3Ry6bxsGo</encrypted>]]>
    </text>
  </script>
</dir>
