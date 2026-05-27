<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 390"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjDFT+H2Mq2pOWUhvdewRqoMvGLE/puiydcabKXJEZYzNCj1DgbTvgW2IPLgYw2W6DtPV1qLS8idThBv2qPQ7qo4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>0mcylnoqEJwNJSPAnMaPoNTIQeX5EISVCTY6/inY+swuQRkhIlw8fqmm8yIqpGIpRyxd3getJe8CgFJ23/wR9pptAftXQyCIQLw3z+5F6WHzAsj9SyydjsUx2CjnywozhRk+ZLCB7SzqsB6k31XnrvtWZvgcl0XrDyrbOD7/SZXWLl0J4Nw5w4pIz0TyHx/OtDohfQl7AFPzXpCQ/ejcxCDoR77LoVAMgHGK2yZRDPMCcPVDA/V7ImoYJT5GFnu7TNrYxd1V/qEggT6vNXPEXcXk+8uyv0IaiZnK2dwB0+p9aPvVOmJc7QYh0RKgiknYWfiddyaCYUimo1MBBfxY77isQdYo8ULwzfZ2DbNX/D8aR03h2f2dYpPfHRys/4lAwnL2ih7Ee8r3cWhzXj7jRJUSYfmqcZZP95ELjmqrq/BXfU0bgulxTyVrUSEriJYrp2cvw73ESMB7ZaUKPZejElx/mD/3T/5Ma66L/INpaOg=</encrypted>]]>
    </text>
  </script>
</dir>
