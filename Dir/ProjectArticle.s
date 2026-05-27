<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="v20dmvvct" code="ma_so" order="ma_so" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chỉ tiêu dự án, công trình" e="Project Article"></title>
  <fields>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Chỉ tiêu" e="Article"></header>
      <items style="Mask"/>
    </field>
    <field name="chi_tieu" allowNulls="false">
      <header v="Tên chỉ tiêu" e="Description"></header>
    </field>
    <field name="chi_tieu2">
      <header v="Tên khác" e="Other Name"></header>a
    </field>

    <field name="tk_no" dataFormatString="@upperCaseFormat">
      <header v="Ds tk nợ" e="Debit Accounts"></header>
      <items style="Mask"/>
    </field>

    <field name="tk_no_du" dataFormatString="@upperCaseFormat">
      <header v="Ds tk nợ đối ứng" e="Reference Debit Accts"></header>
      <items style="Mask"/>
    </field>

    <field name="tk_no_gt" dataFormatString="@upperCaseFormat">
      <header v="Ds tk nợ giảm trừ" e="Deduction Debit Accts"></header>
      <items style="Mask"/>
    </field>

    <field name="tk_co" dataFormatString="@upperCaseFormat">
      <header v="Ds tk có" e="Credit Accounts"></header>
      <items style="Mask"/>
    </field>

    <field name="tk_co_du" dataFormatString="@upperCaseFormat">
      <header v="Ds tk có đối ứng" e="Reference Credit Accts"></header>
      <items style="Mask"/>
    </field>

    <field name="tk_co_gt" dataFormatString="@upperCaseFormat">
      <header v="Ds tk có giảm trừ" e="Deduction Credit Accts"></header>
      <items style="Mask"/>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 50, 280"/>
      <item value="110: [ma_so].Label, [ma_so]"/>
      <item value="11000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="11000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="11000: [tk_no].Label, [tk_no]"/>
      <item value="11000: [tk_no_du].Label, [tk_no_du]"/>
      <item value="11000: [tk_no_gt].Label, [tk_no_gt]"/>
      <item value="11000: [tk_co].Label, [tk_co]"/>
      <item value="11000: [tk_co_du].Label, [tk_co_du]"/>
      <item value="11000: [tk_co_gt].Label, [tk_co_gt]"/>
      <item value="11100: [status].Label, [status], [status].Description"></item>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7TCyZc3mcIeWRnmLSsOSWbg6VgxF4+J0lr+OVtZeuQiwye+EGqO8aEcvxVdr8optghQ49LpKinjLbue4Z3WynQyM6TwjeouFsvyBHBm9D8Od</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7TcsEoMgaaFaAWMqR9e2ptII+jYPcVRUtAeFQ5hokBPgZvhcvkQQVQjK30eCn9Yf+cPfbSeLmW9i9ikPinxioJQ=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>7x25mdXF+Wr6LQ6qIMtjVo/m/f5V4JbjtoQax7HUnREBWFPTxmXoXYszG6xg2tSDtpK2F7u1oUNtnzsex+bx1MXcPvaN4RUmhOPpYW0pcsVA+Mz0DwLnJilsrl2biMw15Rc+Yw+7NM29kPBEtMikhkvM+fk/Zwj2ByDzPmOUpwbbWAoN+pB5HAZENDfch7bv4MFI9AKkIKtWGeERCpNasbrM4s+P3JrkYmL+xuKk1l9cG7DmPMkgsahJnrngR4aPIaloIljklDGGGJu6/PwkgVKnBfGW6e08HPBXpPhFkZHdWx6cYXnE4/PDmDONC6rwPead3vigYUkGMtqx1vhUPb2HM0mQgwAXqYA194RA/qtmihibxewynx0OvkW+hVQSiNOzG5E4GyINtEKm8NTGvyGexBGjb/enAJMx/Yd7V73m6Mm1CSXSn70l7M8X22hSRBN74WbRwf9xVE73ncZWBiCcElIpFQNGNc/mPkMKnFnAs/QihoXahr3OEvJXGgBvbEy83EHs6ITum7xktpEsSBfj0R00QFLp4dBc8v+q5ZihllYKhPtc6P5jtpa5yqXX697gECVGrMz9AlzYeytq0g==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>M3k3QgowElyc2pcM1HmK81whdtAZfSEmybd8V6/gUpFd0QyPOi8mHMn5owl7ZgMFu0ajAszJfWtUfl+Isr71ZY7wuJT55gBWhNOl3coaeVHaHlsD/uevHGz4d9/ObC4UDgmc2ThBCBQzDpoxWH8urkybEy2655hVrktdMRpOClwZPn7WDOiWrM0OxyANIiVFvLyin3yAaRKXYIRJXGTiW3F6A53F866CuLRqcGrxkDEzokNd/Tsm2Eeb3EVdz0QWieKWwPf+7fvrtVPWSQpfkQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>f2IgEeKxZguFwRflxAzlnvPWKHXjiqDmwYO1QKUe3lqpV+SekS14eBkHDcj7W1x2Ul7Sn1pvcEK5So4tyIkPCd5EtqQim+yxDk0+3sCxU7S3YCB7Bv0hZT56zvPiCO/GQj9LgPmHFN8CQLW7Mc1vFEUCFe3emgv1/zsfE5D8nWtV4UO/MLNOp0vm2WETLKnEuBIhGKPV8U+pW+l1jVBHy1KjUPwds4ig9+a97hQieaHr4CjieGDE3mmEfFtpMxcqAtkEaUhWBCYL/4eWo5M9o6Rrkj8CREl1ptmMGFgA5AWg9AhHwSAsUJok0MlAELkp</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILYZ8CDGKtjKo4jmXAxcQxpxvg8d+VRAKEgOUy58jbaof</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>hUFKWCU07fZaE8M4a2p3ola8EjlH2xXHiduA/37QOitQRuMGCZPIpp7iZOKsw/1eVmGLdtrGQ2Q+HCFd9Pzgcr/EVD/R73jeophfUSZeLPJxCZdmLVnmYP975LIcqPeHFh45kg80nxZSJDHmFsVGoYoLz9Uq6uwe0O18MpuDlMCeVc3bdYMhxWwFtnvCti7aeICSMClJ5Gm81+IUmMld4kr142ADihnnrMBPo47yZQ3x7qDZOzrmwAlOZe1qzkwENpPiWjZhRr5JFpZaOFYRnm9+XzRGG6P4zANcYxhWqYKD+dCo34Skny+OeCIty4Kraohf/5iFkzyTNpBV33ZQYuY6Q0wMNOmuMzJLjNynyZA=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
