<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="xcdytdd0" code="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx" order="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc số lượng sản phẩm dở dang đầu kỳ" e="Opening WIP Quantity Filter"></title>
  <fields>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
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
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>LpqAuYIifDo/LW9ou6BiL/bSsZuL5t7KzfjJey2P0uzWWeRVdjdeQa2wPn1V3l+4i3YR8//wD8eCfor6qcqVaHO9U9CTmxQv1GPOUA13sZpNR01YaTM1y4jRdT+tgI0zgIoawwX19XZRBur4mgRp36E5X1MMKXhcEcPnTOUDc/2ytCJIJ0yFNLXzWaU9l+V7TOyojjsBuSnF+UkfcbknNHNFw4vSW8Up20wo1Zo47KjrCBZLZS3GCWQbvQOFK+chSDTRdwZzzyJpe79KUF6eru83u8M5NzqOOK3FY4D88HjSmWt1ufw22+6+2Un3Yt1fRz9d5Ed50ix3Ma2a3hUe+nYKmjIM0vvTanQ/zQLdn3Q3g1YNqXcu1HOQGtj+cdNFZ07/fCILmk66caK4S7ajpT7kM0j36jrYPo00ZQHA95uxreIK3di2gnFmouVHQ9xYrIjCl1olXP0mROELr7LLcysySE/uqP34LDBS96N/Y7nRYT0JZrVwMmzietU8uOGDXHyWyGUILaNjCSksYpFO1ZOTge5kDC8Z0mII2XIB3+kwUoTp4bbp07dYKvm71x1X</encrypted>]]>
    </text>
  </script>
</dir>
