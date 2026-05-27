<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="cdhd" code="nam, ma_dvcs, tk, ma_hd" order="nam, ma_dvcs, tk, ma_hd" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="số dư ban đầu hợp đồng" e=" Contract Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" clientDefault="Default" allowNulls="false" >
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status='1'" check="1=1" information="ma_hd$dmhd.ten_hd%l" new ="Default"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ" e="Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPq5nBcVJMVUcSR6+GJGQ+XGPe4SVeh2lk4rGi73JHLOxo=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có" e="Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPqhoO/yUEppLuYCVG8M/7IwtZsW1DhPQoGMq6f5lOdU88=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ ngoại tệ" e="FC Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPq0O1D2X/ETf5PQbkdXoHqBN9g78szMDgrThUjUCsLIaw=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có ngoại tệ" e="FC Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4yCdbN5ohLqyrNkNtwO+TiIrTc6wTC5uVz2A1DxjNkPq5TUF/SHqk5ApU1r4Zm9/pFl9+MeXWycakelM3D+J6T8=</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 110, 330"/>
      <item value="111: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="111: [du_no00].Label, [du_no00], [nam]"/>
      <item value="11: [du_co00].Label, [du_co00]"/>
      <item value="11: [du_no_nt00].Label, [du_no_nt00]"/>
      <item value="11: [du_co_nt00].Label, [du_co_nt00]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7W+/WiT6FegCvJc5gl4Wc9AzY2+7fHzhPzoilbZSKN1kkWMSFth4lXgPTBvoczCrOKU2+gDGHJdS+RCmV0m1vWavvIUxXCmFPffYR1b5oaxh</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>Rksp2KjvPuryWFurkGBYTTE3RDw9agbJ2fgJddfHctF8pLmwL9fGYy/U9kCsrb4aDEhfIv2oh3CzGh6mDPW3zMwtXgkJGMnqVNQ5CR1cQdvtqSocBg80Hu6SyZoZAvYoAzY24DIjGVMKwZKk7csfr7pYchAAHMjKA+HRrNoKfbmjcDdbPj94Pw6/+gdVLK4K97oj8xs6WpukquL7DuneuZWCT9TtlUiCc03ZLyJltJO56UfWjnSgEztJ1gjYMvS8TNdHBtFecSbfy7JelD1E9/UHHx+GOnUYu6+UCXXgYWg=</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F5TO6PUvuzECvgYM/jXufISF0kCvjHVQOwrqL9xfX3lgkgYHbUAhqBtrfrWEbd1XSIVJ/vjvKOe7a6q44bEgae9rA32eQ9pavtNN4emWvywn</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh7u/oKtoI2Jct/atPcvdSHfrbM7qdzC0OS8g4IVC9xQWQ==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>/iQ1KnZZgFFsVXe8DEsWjxxmy3EiiagQmLbQbYanP7OSVFG5rwp4f4f/kS/UW3hRS/aGpYYdPIq/l7C5vooXaPCzJ1SYz+TR8NoiLTQJPnu+z9EEOEu/N2Fi6VhxvKoAEuTa05Z1l+51mwQ3wPLKd0qu17RcTydTpaCFPlI7SBbnhKr9X0LoVMi+hr5MWTxpQp9yoWeigGwA4aEvHxAJYI2mq5qXR3+jANA4JZdaNr1RcP87HNjBwiAziHVKiRa4IZIW9i6og5KejLd+T8aLT6ehsNgMQ5yJXzT5Y6UbmRj/tx2MFD7Fy6DGgXO4SsWCTewet9cI76P4/6Su1IcVoYV3yvtNIRMD6Y/5/ptSLOMFH54wpCvCH2TwPQQAissq+hNrLUqlLRQeKFXmYUc0c5gjeWaPSLWxdYXaeglZs8ld10oMwf+WDZhaEf/ylz5KnvVgePjSw9m9KmzekTanSrjmx///Mt8XT3uslSDup15iZM4KgMEPA6sLZluPXtQ2</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>1Qj7NyZ7B5XexINggfsMYVaVo56ZAsOzgld9lCHkeaFVrT5hX0VxikMmuvnqVrtXi0VE5fxOmZsKwxcWQw/jAJFAnKY/POCpgFEILnuUsVSX6WpiRmvu8MlZAaBb5rR4Qdh7FYTzoqdWVJdh+ZplN/DNFvqcocpY6EnJgjnn1LpKfyqnztJeTZxFbd21GMI7wse5Ti7x7CyTmMeFrZq42R2M3P95efSnb7mSIyvA/0+hhGC2r9NCzHEhpNMNtgwtsF9i+z0A0wUi5CDPBFSNKq1syi44NBILGTHKZuqFrTg=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>oSPezELn7nDZk7ycz90Ar6LlMLZ4cv+3tXRgjc17XMg496p6IevoqaAkfB480VMqwTqDmu537bKbUAf/cCXcPDIccydbhju8/QtbPXaPVx4JFtMOU3ouMY78xEKbqzsdV4XQflXOZoXTwgF3OZaPpRgsL9CnbUb+eYBMsPbgpAzcv82OUr81YMqRBrAb3JTjmT/S6pYtUhkgrcy4v2mM3CVgOOF1HysrDlF8L1FR2EscDq7Z4jinMQeOohKxuhcp+tfwA6O07TnyIJlEUCiug3L+L78k3IYeoo1Lu9B+7X2i/4LssgaMv4kfbV5/DHCZUBMJv2cExBkTR/WWi+tjpac3ncXhko8zL3Bg29PGGLC5AkpP6HhwiJIDEDLRdge0nqHul1vM29LZFPV9CLk1eA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>/4o99Dq21LhfvR7t3lNTuSTCNh/aTSfCD051bJnWR5S3/FJfMbqdDehipDsBdMsrZ9WfdE/42x7YQF5pEJxezjxcgUVGl4/NzIBqYVoumFDqv46BkGOa25G9vIQrpMprKKI/l07LqEKqB9n8pKIv0Q==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>uOuSa1d/n4EWii3hPWTEvdiyt5k+WZMtkRxwU8jgQDcto3bjHHC4jdBRqXynepE6Gtfp5c2+mh4Ig9KkI5mA8PFGYih0VtA2AJxCoK0AbgJWCTorCIAsT/ZLYkFDcY/cg7M0nFep6Zgfo9M05X3k9j7haPD3H4P2lXMztHvrBma5mYnKKEaiabFErx8s4u4YrDhLVW88L1YqzYIivttbtAQExh9LwGjRhzIXsRBPq79WPUZQySdP6P9HeNuaitj3FsvhjlleNNT978/i9IuUx/8z/GaZGoJA+cuTzArudipCuanu3n6YjJon9Jt/qYj0DSWn6KQGFKHZNBgQ9XQyFShXYg1wcF4l0PU/UrW78Qc=</encrypted>]]>
    </text>
  </script>

</dir>
