<?xml version="1.0" encoding="utf-8"?>
<dir table="dmgia2" code="ma_vt, ma_nt, ngay_ban" order="ma_vt, ma_nt, ngay_ban" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="giá bán" e="Sales Price"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" normal="true" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ngay_ban" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày bắt đầu hiệu lực" e="Effective Date "></header>
    </field>
    <field name="ma_nt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false">
      <header v="Loại tiền tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" normal="true" key="status = '1'" check="1 = 1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="gia_nt2" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right" >
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>
  </fields>
  
  <views>
    <view id="Dir">
      <item value="130, 110, 330"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11: [ngay_ban].Label, [ngay_ban]"/>
      <item value="111: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11: [gia_nt2].Label, [gia_nt2]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>BeSdMNy8N6S7NP0Ce9WJ98g4Sfo5uJ5giAuBO4PJzUE2FCqRStLuK17Jfm56HqNPOTh7NF1ysGnhyJsXzxdhGver+XcMuBc3eGDswQGN1fde81Vqy4jY/sA2cRsYVjHwRCT1y1XQk9qSqKXETliBFRgYTBFON78mRmZyCojcJ4FR4juPta07ZZaOBeg1HpYNwSBKXmr7u37Aweib71dkycaUpAQ4r3o2qPJvhX+1Uqd0b7fDHl/NUtxHOMQ4h+TIyUXll/cPPXdu6NRp6AWpPfTBPUTM5kA0tWjv8y5tTgfom5eORlsSWhERpAjOTxGb8qr5jHsWpZaf4b7LY8qiiXkIdCftdDljm9uWeS3BIouq7gCv/ee6lEg8BLDLDw9AEgs3k+TdF2ekkNK7qPyrIyX8Bg3WVjZBBXUvPV7cOIwllfrRiXCNFkase+eFE6FZJDuTx7R8QFHDF9PoWanyeoHgz4g3vedQRQi2K8hFWpGiA3DRyF9UNlXSq5XWZV6h1S/67k6tA033jGlS1qB2lwYqDejXq34vCvnLWZj6ibz+aIgiCxJy0brR2DlBi5znQAV/m3O8amo9QQccv1gj1axogDwqQGEFuNoA/2+o8PHWsYXGTP1W6IHXjfhUyH7wSyDyVjVPSUjpWGPcX1F2kA==</encrypted>]]>
      </text>
    </command>
    
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>o1oE/M6g+1duIry/3V1VYKh5Pw8rl3oSa2fNTW4yZKE/ar6QJJNYKiccdO9K38or1bIxO5e6z3ARfBj6+smRiUM6NPFB2sNUk6+ykM8svP6y44P0Bgn3vfhUo/6G9YKXyYUuxypEsl3G4cbWuira7UBklYr64JQCuCnMNQ1SqQ4z8lnrgnRbuxZNLIl5nSZ3H7E5NYli8hAnb6OMMnwUZvA4XC2xaeIxvE5ZS14DNB686YZxnszvqeEMj+AqzfvH49oRczf2FYMlpCDttZFm5zYzAtcU/SHlyuEMjPgenn35Jj0gS/5WMK1zyXH+aH9y/Z80wfXOK9H4h2biZezLeoSXHzOWQ2rSBanZeOaooks=</encrypted>]]>
      </text>
    </command>
    
    <command event="Updating">
      <text>
        <![CDATA[<encrypted>cbvgqS/uuQmqZTqtl9pK/m/RBpa1tDcNq+BL8i3v2DLHoVwsHgXzey2xdpth/hEhLTqFzqDsUSLLgBYYjIdK5KKqrINd3soXsQ2Go1QdNBzmcrlbZFEMAUVz7bBa0PU3h3nRP15htLHbbJ7omLHVt8bgyJHzTLd8BM4ha1nLcd7WWoMs1tjc/wgOotkHyb2FbMd6StfOfIjAtcpYNwdxxM8/w8TJpqHlOazQcBCHvmTnNLTFL/gR0LAIDM6dKeZwgLDv0AGMSfgL4zmHYmb4WtHeiKRvjv3WENS9Nk8iMcBj4lscnTWo8rmXTKImjzuF5pIfKDRCBdZ5FlhJe/me6UIdd5rJUEkfAd/PVQvejkz9iO3/Y0RUboNPwZisTLgfslASCvytKrbhx7zdlB8nL/kyLCiV17pXuHFYJypajx2hSYbMacz8nOkiOCZFqSn4</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>pUT5E+AJ7QlcP+vOCq/v3AIt/Yg1irQh7WXEnWp8oIa6/F6ZAX5exdB7BhRXSvErzOruT50B2yvZrwDOhb9HkR4LkupOwzr/PVkeUyWiqK2hZE7oJjUMDI0zvpTevpHwFN180Pa4MHo1nqL3oPcBqQ==</encrypted>]]>
      </text>
    </command>

  </commands>
</dir>

