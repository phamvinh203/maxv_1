<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="xcdvtdd" code="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc vật tư dở dang đầu kỳ" e="Filter Opening WIP Balance by Item"></title>
  <fields>
    <field name="ma_yt">
      <header v="Mã yếu tố" e="Cost Factor"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1' and kieu_yt = '1'"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>BRk+dbjVvsPpD/l3/ydovILaik/SYwhJB64H9fG3XQDI1Bvntz7UL1hpE8iFN/hy6fg/Uaew3onIhusXEFZrO8EJqvc7+iBE9kJFkpcs8ybGXLpO99ExR8wB8u1jkRLG39iStlEDKK5uULohMXzB808+we0SXGd3fRRckxQf9BA77THdiYtuCBsgXfEDPmUV6qNvAN56SxaRPkfUzM4LvwS1CpMt1rcVQEM1i7fbMfn0pw/79zaEYqv2DygLYe7pbxkDJJcUNZJOufF56hwNXeAZ8+VVIDe7IWwYdWvuhQoxgfcPnL5vkCIhWBxMWbHP8D7PMrISKRzaQP5iboWQDaPzutDJJDs5G+z/87f9HKEDWHgaq7zWxFQTFmEbpJYbGr6JasTA7QevfUuO2J/Hi9gdJITJZkJUNJz/NebUU9J/fvI635OIVz0q3E9SSFTQNFxIBECIrxHfasZhybi1zO94sXBf1oILDdsdtO2GLa0=</encrypted>]]>
    </text>
  </script>
</dir>
