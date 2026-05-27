<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="v20vvlkct" code="nam, ma_dvcs, ma_so, ma_vv" order="nam, ma_dvcs, ma_so, ma_vv" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="lũy kế chỉ tiêu dự án, công trình" e="Input Project Accumulation by Job Norm"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="###0">
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
    <field name="ma_so" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Chỉ tiêu" e="Article"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="AutoComplete" controller="JobArticle" reference="chi_tieu%l" key="1 = 1" check="1=1" information="ma_so$v20dmvvct.chi_tieu%l"/>
    </field>
    <field name="chi_tieu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" allowSorting="true" allowFilter="true" allowNulls="false" >
      <header v="Dự án" e="Project"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="lk_no" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Lũy kế nợ" e="Dr. Amount"></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Từ kc đến đn&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Year-opening&lt;/div&gt;"></footer>
    </field>
    <field name="lk_co" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Lũy kế có" e="Cr. Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_no_nt" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Lũy kế nợ ngoại tệ" e="FC Dr. Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_co_nt" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Lũy kế có ngoại tệ" e="FC Cr. Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_no_dk" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Từ đn đến đk&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Year-to-period&lt;/div&gt;"></footer>
    </field>
    <field name="lk_co_dk" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_no_dk_nt" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_co_dk_nt" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="8, 112, 105, 105, 10, 120, 100"/>
      <item value="1011000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1011000: [ma_vv].Label, [ma_vv],[ten_vv%l]"/>
      <item value="1011000: [ma_so].Label, [ma_so],[chi_tieu%l]"/>
      <item value="1000000: [ma_so].Description"/>
      <item value="--11---: [lk_no].Description, [lk_no_dk].Description"/>
      <item value="-1111--: [lk_no].Label, [lk_no], [lk_no_dk], [nam]"/>
      <item value="-111---: [lk_co].Label, [lk_co], [lk_co_dk]"/>
      <item value="-111---: [lk_no_nt].Label, [lk_no_nt], [lk_no_dk_nt]"/>
      <item value="-111---: [lk_co_nt].Label, [lk_co_nt], [lk_co_dk_nt]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>FK6swBrUYrhOaMpExKe6yx0DWJyNVAksBOi4NDJaKSKunjmvUc0Zxfu2gOcKVRiicCeeUA4TtCRfCQeSn9rjMdQMeS7y9YaYaCOcQkL+AAO5NDeAW55701sfPMEaP9m4K1yRNjpZr+W0ceTbJVVUrF4y0+1M2uHSxsNR1yA5ak8Tk3CNn3HNsX1UF9LIC6Apra5dZlBtInxzA4zzhWioL/v9fA1YXVcPVrWRneaot3m/Y6FIvHtLAQKArPA2WTDBZExRAElC6NOGzplnG9sWaqb52CQ8FARuBIUsdZA1I0A=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>SSvPAhJcJhuWU/oU30SK18OYoa0bht4Hp6hwVuFBuSUyVIQgVeQk3dAISdtLekuN44PZRa6T6MOAF7yvMGTFC4JcLyDono7mXFFh5MIRnyi0ApICQ+o+dX8338cIphamfo7CLlPxRwGnPjc03rAxL4/2F3Dkhvbx8/CArPK+2rCJqufaopbe+x/1m30HDuVVT5/eU9/enH2BRUJC1mJLi2ceJtc0hoMbMgc7k+QKXLiGRV1elqewbw4gjXhQIaHmoKiKyPUW3WR1IFOhmnXt6aH85SQrbwNGfJ107OUaC/+yB0GXsiYw5yyePMs/qeXJ</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3P8PIFhqcVK6hpf3CyN5l93Al2E8ZbFE/jY6QNaee+VCA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/5NRu3nfHu1FzbNr0dJx1plA4FrZiZkCpnZbdNO6/cWsCFQnjQceCJDBLlhIqeXFVGgAQggOHEVUMPyHpBbPMMNiPfJ/M//c/+eiT8IAoxYg==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3OqmDartyEUr3ckuJgmUD40pUbpsccuA5fVd1xrpxDOHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>sunFNxkWkJuVNlT9/FKVupgPn6VQ8qknfY5FgHDo74JaB0uES0hx5cdQwA5cd8AyGi/r6y1ebEXzQkiE8Oht894zFl+F/KGv1xeodjzyLNZJylrWrLrSwIBdxJ9bs5iahYP5qxwb172wWKGJ3pEY69pmI4qNq3vnzEOhk4WhJcmOpwMOvpw3gziuHrcq3s8Jpg9KikGLtIjIMRb61osWswaD38zfn4ELynvLs4xlkTEX8k8usWkmpcCLvSYjcRIKSI+8Y59iNLdX+HeOkyB0HPf3a4roW+m43n1nipmxP9R4o+oRsP0wLd6XBw7ZwTS7lVfZOVZ3CKA4mVF6eSNvxkJeJWxAYr0Gyyn6tggINTitj0MOb2Ac4nOjGoDJB8Dvr5glV1XJxPwW8928PC/vVpDoY9Hs9+K3mJ2Ea031NzM=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>YxADnKf/OirQZ15YfoJGhGFDq7XNJ57sSuEa+Tnj9y4zrNknxM6vV5W4neWDAUf3yoyeJ/GEcsVoi49RKH7kuTIa1pTx60yPTpd9Yw5jm0BxN0iw0UxK6Ap1mLtinigzxtBYunry1lw7FEXp2oUqLGGnCQogFfkZv58pMLf0DHsLlkqGUHXtBarY9HaIJSQb3G11rhhNztKHiNKyzOLiwMgsqLZdtuxrQAkV6mqBa7I=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>CLdskzPT141HX4Zoqciam/ulb/IkTrTckMyrlbKdq9qdr5e5TbaNr/IRoGd+ygWRhAXCgc5Yjq4xBmHjA8voV65Npj5vW0hrfo4vA9osZxxtrjkMtP+Dwjw+63xRi6V/x3mlnLXkkW3Q/K1dwgFXQOe63Jz652wzz14RTYsei8VkV4IviRvR5egX34hWpHc32SxgJetFwD6pHtzkLjmUfNWimjpnPyZ9FDbTkimzyNtNXWKkB50idA5OgBLZqfdAlY+btPZTA8t4CIifLr7YPRWRwac6kCBnkpQVcTkAExA8AieUbs/xipF1wKSqDSTPtrZj73Cv/kCoAnm27VffkJb3+t8ypvNGIQUxO5+fhoE=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>+x0Tac8Y73AuR37GyXZ655rwBuo1zEY9gEkiqgpLFi7R2nJxXSwvW9wXwKMJZN6p8T7rKFr0OTqTJHeOn7KEsGP9znaE2m2ai7wR2JwDzra75JyI+uFbTUk0CL5/qyiK4C7iHWDQhUBWmjUIUsX/ptRKUg9h3bgS5jMN2sczTfs=</encrypted>]]>
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
      <![CDATA[<encrypted>YsNqgIjpFCGKcf8k/sBM6rDi8Z3WWqOX4cgFXKM5fnfA7QShdK1V4YzLYuh+FW+vafP2DUR/RH+4MTQrdRLISVTVF6N3Ai6Dvh1YpZ6/xdqCPL8zNJ8Fef7vHx9I9Rx+CSbIPVK4sj9pyv40AVV/z+oGF8ihSZ7Z6AhXOwSguRTQ12vIex3wvndFAyQo+gAHcMySquLYTVPt1JvUl7EnUAMHnVd4799T3vboVcD4K23pcGPgFh9zW4f6KN3wd84C3G7e9I0iZF6JwGOvyPcLmGrQxeRJSo7gGT5bciNlTmdJFPPNPL6nH88SXhFbkVE0P42rQoLSDLhodE/9bbvQ2/00SaqPgfyyGiQSohJPfNc=</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>MlXPLCaOtEzVobFDfNMPVeo8zQNEG4SdZd5gJTRigYAprQqa8UxgDHvU2V6b1tg8GIvbAHO609s4a5iwPkdI9VZIzAJN+yodxPZ0ogSofmkpHZhcZr9tOrzaDnxz367yXy/r8SlZmI56LJt8RTwoOG2uaZfjJwi/lZY9B7n/0eHXhr0b17WNL1abbZEdpn/hL4rIqc/YClDO90m3rQID/N+YA+1I27DFiB9nadsN9dGnJyT5K4rozTx5zTVZj/6p</encrypted>]]>
    </text>
  </css>
</dir>
