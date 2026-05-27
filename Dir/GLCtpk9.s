<?xml version="1.0" encoding="utf-8"?>

<dir table="vdmpbky1" code="ma_bt, ky, nam" order="ma_bt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="số chứng từ" e="Voucher Number"></title>
  <fields>
    <field name="tag" width="0" hidden="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" allowNulls="false" dataFormatString="#0" inactivate="true" disabled="true">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"/>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" allowNulls="false" dataFormatString="###0" inactivate="true" disabled="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bt" dataFormatString="@upperCaseFormat" isPrimaryKey="true" inactivate="true" allowNulls="false" disabled="true">
      <header v="Mã bút toán" e="Entry code"></header>
      <items style="AutoComplete" controller="PeriodicTransaction" reference="ten_bt" key="status = '1'" check="1=1" information="ma_bt$dmpbky.ten_bt"/>
    </field>
    <field name="ten_bt" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130, 0"/>
      <item value="111----1: [ky].Description, [ky], [nam], [stt_rec]"/>
      <item value="11001001: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [tag]"/>
      <item value="1100100: [ma_bt].Label, [ma_bt], [ten_bt]"/>
      <item value="1100: [so_ct].Label, [so_ct]"/>
    </view>
  </views>

  <commands>
    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SEmpX0Mpr/u4VYMy34uULcwDpQyeXLxiHeIZonSTWKEaDxJb5NR8L7pjialp9f7VlxKvOEIiHwDl1tP1Av8o5nSrhF8RONBbY2E7WYMg4ubpE6g8LTma8y/nDkvcatEPg==</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7dtNCTfk7CV2yXSqQFDBA5jTXmhzmF3O9ZiOsntxfT9amOrqn+OmcIValHHgySBPnCWFpwKfTpG/hZUPZO27rp1+QHFUCZqje7tiGkW9mabz</encrypted>]]>
      </text>
    </command>
    <command event="Updating">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/6+S30oDJvrPLV7FsYAcM/gFFhz9Tci74ELxMwzHsunxpYXUMCwbqidcBiXO6r9cKnKXkKIIXH3aIKsrIqqyqsMq59pefl0Dk3u9oC9TartjTyDH5fjb7MTO1SwcT4Te2ys+EngOqyaFWKlFyqAhn7vM=</encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<encrypted>ggxCG4eHB2veh19MkCtdw/GpqDr3uG66YBz9KZJ6aISkiOKHYHSN1hpC1mNMkenuNQ3C0FWu83m+OBC/X2TsWwfxMEvmTXKqXZlM5Ffv3oPQ+idf5rjL+Vkv+BBL94Wk1oCZF5Il7oVXTJfdS2Ly62w8snQgY/GjI/TgTW3tFx0hnAckIL4YOju+Ycsbo/xWUa0azEG7hbHiHSHF2loh2q9ozy0+mWbNZH05w63Fi0ovJk1kzclE0VMw45bRITNpF3y4HhY34F4lpECTNZHgcwHSUIJr07msiGCQxDCM71zk0DnDgahxFTGI4GpMrNauZUiz4qjo2umvbKauaCeTeIW4HSOjNAb9pPhTCCtPJZ0=</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>DQ7qpQqe+wmpItdlRaP36FCkBUT6473ts6CEp0PPeGZnF3/auGNg9hRr8Kf70tuzmGOStMCX926giyIj9WIVEydRIkZ3rBeJYt8qGLNlLmt1K+yAZk9q5u0xGsxrxUClhvui6+bzIf7bQTATxJYKD1qtuoE4c52ymr+zkk43bfKmDscmqSPMoDI7dsDD60AWe1yp9qUL3F9jRTtGlcN/sAU5RzHCftaLb4iBcdNyNnioOzY2lnAEV6hBbMYaq8P6Ad0o3ner2pqnOOuG5njXNepLZHDzP2gzDGjkf7n3bxiJfEXGF3xO94wteo9hreUp6QmffIVmT8BGq5PkxXIxhG3wkiK0sKo85q59mpXc+zo=</encrypted>]]>
    </text>
  </script>
</dir>
