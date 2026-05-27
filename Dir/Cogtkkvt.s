<?xml version="1.0" encoding="utf-8"?>

<dir table="xcdvtdd2" code="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="kiểm kê vật tư cuối kỳ" e="Closing Inventory"></title>
  <fields>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true" >
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true" >
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_yt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã yếu tố" e="Cost Factor"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1' and kieu_yt = '1'" check="kieu_yt = '1'" information="ma_yt$xdmyt.ten_yt%l"/>
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
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="status = '1' and truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep ='1' and ma_bp in (select ma_bp from dmbp where status = '1')" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" align="right">
      <header v="Số lsx" e="MO Number"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l" key="1 = 1" check="1 = 1" information="so_lsx$phlsx.dien_giai%l" />
    </field>
    <field name="dien_giai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="sl_ck" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng " e="Quantity"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
      <item value="1110: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1110: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1110: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1111: [sl_ck].Label, [sl_ck], [ky], [nam]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>scrVVFxID0UBZkVMi1xM9XpERr8EeXS4xV2OgXJ985LghG9mRYZ20mYaxIzjoUKdo2KP2yWr9vYq0pN+2T/F5HZgPzM7lsNgDrmpvVZ44fw6jYVq44aeXroCUlWLz848</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Te2Ohq5lRSWHLDRDvGj/4v8v8YRyyVbpVX/WWQlAbBuLOYXLyYoYEjFi46tzQoLaU8CfjSFjfrpZ6M+CeilQ3wO24Z5E//Vn/E0XOhvVk9i</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>scrVVFxID0UBZkVMi1xM9XpERr8EeXS4xV2OgXJ985LghG9mRYZ20mYaxIzjoUKdo2KP2yWr9vYq0pN+2T/F5HZgPzM7lsNgDrmpvVZ44fw6jYVq44aeXroCUlWLz848</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>Y9Dj9ROvDCThl0h/A6l/cdQBlHlTkaixaJ4PoBbN/aMJ5/7gjzGruNrOn9kWCZOYb8VzHLwkpe4b+eKqbdoSotbmfrXPvesJTRQbzbTo1b3kLK3tXSQSVN+bgUyP38qs66chzCg73nJ72q19R0NNVvR0UHry2JGkGeS5oa+IGgYFGZtHwMuAPdGlwTed19GrGmogyq0fEqqEgZsEQ8apUeHAv2f5Ndm87AUGvQEgHp/rYSXfSiSGZ4mDbrQuIjXxrxxb7LsSX55+zb55cOrij4D3+h9GdxKJilWCPwdKMoFU9jRR3nNKguJYiZ4+24Ujt+1Q4M7JckbHvwz48KrSyxZkQKC2SQfEA3Lf0LFrQWEB23n1Xkr/Qbk1/RU6InRQNNUso04c0dP/QZZp7pZA5Px90Xy7rLPeM9WETAApRLQ9J7/A+BWxQLxm4ZsRegHvabU1n4z8Vj0tqcASuz/0nAxa5wueg2OhWf/eUnsTXfrA+QPXQ6FuH5uzOzISsSa0</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>QY6acP4FkE6LA/QynSIzKbxuU3XqjiUZRToSwpg6Qkn9pTZxTW+tKov/CNT+ZZFbSKjTTfgSCA0qLYufmYnaYQ/c376Fgx6+BlDzdjgAkaXBxURneM479FOMSa+BgWvciDcX2EpLE4pBD7ZSGTBte1Iv36szBLTqhbuxNysPmVNuQSzNhQetAKhSGlfhjNds4tiTyfqF+E9UAK45f+EK+jNtFW6sCKAe8xxd7b4/3kvhDoGh3lWtIvJbHyqLfNIRkwXpVHebUMDEkwDj6avxHA==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>wYFN2xJF48Z6QTXf755yUR1cFmqfWp+ibKvNv/FnTwOEPXwZUtd441eQpSK+w8q+4iJZLES/NNxZxC1/lA3T8lFnUlOhXR/1LgbqbTUGiyydtBf5f/D0yLYbfa22IoGVO4ogsf3vVd70AqfEBDRbk/Vr4IxmY8p/F/eSccSnx0h9iOrpMuE51qYqNoAHcZKXlb9W2tEincfHmFhQNqSd0ekgRh1qWp1cX493OQJZghno+aAvYM8QWn9B9ALMAskPEqaqNVJgS2ZPyTnZ7lzT1naMN/TZAJXBDsLWm7praKSIc93l8dg3dxyRcXlSC+oaTflwfTHuHdMfsIr5spBPj7PKip53+uIvxXVNjQZLxmeSh+x9GY7b+Vpi2BHhEil3Knii8P0/dL3KiwRlU/N9Dsq9d/hEkjoVbzKcn3cw68pkjgo2o3o3xC28HJGDMV7w</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>kb4i+GbLUvpbZWauaZ7r/nAc8oZy/dAks04equ8BjvH2AmL4LTTCoT6jmt6moaj7jYGzGSR07Ky4ziazOq+W1MFSIEeQftpB0b5ux9aqRpBQtk1Wzzq/T/fO8ldy4kCSRTtz3hGszbqtFXQrqPvvyvTj2G8i9wg6daaAVgCg0knqJXtBUya5o9CC5XGbu23H</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>3SIQnZ9xrEgqtkPuyPjTVtDQruyHFmABD12RjUCoPrT32zMdS5i/AkG8R+xsCNwCjZuqsVx2MxdAAK4s3DGOjSJVHftA6BbIKHFVpousdUo4gDUqymO4fREjNynUyXL1xGyOQaCHcvnyChXhvzerSo0AQfqnr0rvvokuQ4pFMTxIHUZN+9occ7skusp+7/hUC2KsGe9b2wUJ5bFb/XU0/KmkwcprtZ+HMZ+tEMoa6cWhfVzPRox7KJR1wtxbXRwqaygF1FMLrEsRXspBa7BYAnMAMefxU/2Mpfrxq3rAZbkr0XO4joLC7LixoDnOhmlRFiYSWe72J4RaOJAuk4jmRMQmjRm3OsNUc2fGHy8sGU4P33ZlIf8VntxAWaGpoiXnhh43wCxuYMz5nJBOGZGYfYOovBUcA3YIMhBb+K9DkfWPqBvrGPLDSWi3inj0+3jG923bQ6hCbnFADRVZdY3VIeGs/etFaK/PsyDKf/ll/1kwOMsOQUE7jxomoLboTO1x8bcxPLyZwkkSwiENAc3fZ3ANeT3yBXL4l2m/69qPexnIx2RYMHFdAU4RcLH26G9v</encrypted>]]>
    </text>
  </script>
</dir>
