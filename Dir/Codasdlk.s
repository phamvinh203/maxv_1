<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="lkvv" code="nam, ma_dvcs, tk, ma_vv" order="nam, ma_dvcs, tk, ma_vv" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="số phát sinh lũy kế dự án" e="Input Job Accumulation"></title>
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
    <field name="tk" isPrimaryKey="true" allowSorting="true" allowFilter="true" clientDefault="Default" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="AutoComplete" controller="JobAccumulation" reference="ten_tk%l" information="tk_lkvv$vdmtklkvv.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" allowSorting="true" allowFilter="true" allowNulls="false" >
      <header v="Dư án" e="Project"></header>
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
      <header v="Lũy kế có" e="Cr.Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_no_nt" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Lũy kế nợ ngoại tệ" e="FC Dr. Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="lk_co_nt" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Lũy kế có ngoại tệ" e="FC Cr.Amount"></header>
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
      <item value="1011000: [tk].Label, [tk],[ten_tk%l]"/>
      <item value="1011000: [ma_vv].Label, [ma_vv],[ten_vv%l]"/>
      <item value="1000000: [tk].Description"/>
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
        <![CDATA[<encrypted>oic6JtxgSvAC4YWM6iY4EWbUcLxmc0d4xU8lcgq8+3kkJwlBTf8QWsJNTaAQcY9p/R8DP6Wj9VjcnDXvqxLZ6XJcU8m48zEtRDnuoz2lNrfeArOJKnbojWNmP1qe+dGV71OP0hyoR1N+ltyDCKBJJh9gtNiOXP9Fo8RpzVXhhhbccf1MjyPyxPANgA/gRDIDeVATTVzK61JEztm9cj7+jAsK+QaF7AB67zYgmnL+f54Wk3pU4cH59AM4BDM5XYrSqtPXY3zrikPmp+Mmj1xLzfwHja7gezAJA9v3mQKdkn4=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>SSvPAhJcJhuWU/oU30SK13BzN6yk0D5XpfZ+kPXwx7UUTYrY9KeeGLdJWONdk9MLt43sAofg1WGjo/iKNurK+2fuDPs2OQAzOqbeKqhcQ9ccRfZeGal3/wavFhINGw7TO9v+m863yIftBEE0pcX8yedUJ7gDroTMp8ydL2UB+fejUqUT9vRynIc6KTe268E57ksrdnLtJ7dcbZqmPGS48hwQKnYm/YK74SeEjhL9zqr1Eb0tec3E0thQ0cn3qutUK356DyEA46A3LUS6Q0knU2zNakEE7Q2Dn0rcoAD6hkKcXGGvT+QcZCIZn91mayue</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3P8PIFhqcVK6hpf3CyN5l93Al2E8ZbFE/jY6QNaee+VCA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/5NRu3nfHu1FzbNr0dJx1plA4FrZiZkCpnZbdNO6/cWg/Nvho7yWFZQ3WgL6oXDKxvMJ9M19i64UvXBypVfxU1</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>sunFNxkWkJuVNlT9/FKVupgPn6VQ8qknfY5FgHDo74JaB0uES0hx5cdQwA5cd8AyGi/r6y1ebEXzQkiE8Oht894zFl+F/KGv1xeodjzyLNZJylrWrLrSwIBdxJ9bs5iahYP5qxwb172wWKGJ3pEY69pmI4qNq3vnzEOhk4WhJcmOpwMOvpw3gziuHrcq3s8Jpg9KikGLtIjIMRb61osWswaD38zfn4ELynvLs4xlkTEX8k8usWkmpcCLvSYjcRIKSI+8Y59iNLdX+HeOkyB0HPf3a4roW+m43n1nipmxP9R4o+oRsP0wLd6XBw7ZwTS7lVfZOVZ3CKA4mVF6eSNvxkJeJWxAYr0Gyyn6tggINTitj0MOb2Ac4nOjGoDJB8Dvr5glV1XJxPwW8928PC/vVpDoY9Hs9+K3mJ2Ea031NzM=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>3GNHHYpEbHEC1CCKkqgdnIdkQt1k+SzXV1FyewHyJlsKNJ9Rp/DZ7tBTx+k34+GX/hX+APo6VU7iqcPWnLDrFxGntpPTfFZ/evnazMK9XAh//cQmhsPzql/lFyWOFYiLEVrVgmRjimLWAqVz/Mv6lysFLTbBQd8MjzqoQrdmKd9b9pwLVNMtQtDK5E3UkUUb7HJpPSf8xVugB7sNgHyC2uhM3ZyrzbxzfslMyTDpedc=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>DViefHFhMk/Dol7+MfnTHrzlr8224kyuA98amN+4T19jQsH2heWCkysgFPmDOaLO4AVZhRFCf3bcrnEotA0VNf0/WEjl1kzfbQXrsY0N/sbc2xNenR+SF3Y/HqwuvNGZzdNjToEmP5ih82bNpb5j2c/xlyVRX8thrDOZrTiTdgKtKpsLHHPFIENqS38svIrOREzRtFDokR3u5g8n3yPJtDvcPejECp3CX/GKNVyYC04qIPCZV88DZcd8DQnDyF9ZL41heaw0DUQtWsKa38zvHldEkV2z36CJlbT4907Ie0xuKJTNltn5G4JFnv6laOU5/V42dnkpMkp/tRzB03LWhzWTPL/ihd7xyA7/wJWDjXs=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>L/v1a8o2jFogKb886RK0ftC/lkKn9FDVNlL1rs6BlZSyQbNhkk6OVmaRB2aAu3FyQdkx773IzxFrpacD+mtQQfgg9StCFAjtgdfLK3bYE7/kWB5yW+OmwY6xa4iJjT0NTCmgWbcoX2zMdS4o5ebt2zlUkFlHvUFTCB6UJfW0coc=</encrypted>]]>
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
      <![CDATA[<encrypted>TVZLUCCcIzAXsIUAXR10CDwZFnMLadkmNJ/HGnXvX1kGhw5ZSL/I23I0T/KnxUnx/25HwsO5gcWzfuHH6nQvdh08Sb6vILz078u8XcdIJOvDFx4cV03P5pYCt5/bvxp4GPjdObIpg6vwHqJ7A2lXYzZIuK5CVYrOFw3AI/Q5AVJHeWeJkpSQ9VUKVT4E0wO1xvDNrtpgqJX82g9VKQ84STdo51KtkI6UKvamqo2YsYn6wNJWCPeT1ug5MUf7upNXyYjSng8nQKZaf91jy052TD4pWXMVefhmT61t3xqNZ8NRBrJ4uxSjRiemthKqEXEcdi9loK+az955Kv5elo2Okg==</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>MlXPLCaOtEzVobFDfNMPVeo8zQNEG4SdZd5gJTRigYAprQqa8UxgDHvU2V6b1tg8GIvbAHO609s4a5iwPkdI9VZIzAJN+yodxPZ0ogSofmkpHZhcZr9tOrzaDnxz367yXy/r8SlZmI56LJt8RTwoOG2uaZfjJwi/lZY9B7n/0eHXhr0b17WNL1abbZEdpn/hL4rIqc/YClDO90m3rQID/N+YA+1I27DFiB9nadsN9dGnJyT5K4rozTx5zTVZj/6p</encrypted>]]>
    </text>
  </css>
</dir>
