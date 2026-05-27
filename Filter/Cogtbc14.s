<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Hiệu lực từ ngày/đến ngày" e="Date from/to"/>
    </field>
	
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
  
    <field name="ma_sp" categoryIndex="3">
      <header v="Sản phẩm" e="Product"/>
      <items style="AutoComplete" controller="Product" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
	
    <field name="ma_bp" categoryIndex="3">
      <header v="Bộ phận" e="Department"/>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" categoryIndex="3">
      <header v="" e=""/>
    </field>
 
  </fields>
  <views>
    <view id="Dir" height="233">
      <item value="150, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
   
      <item value="110100: [ma_sp].Label, [ma_sp], [ten_vt%l]"/>
	  <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

    </view>
  </views>
  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>ZL9NtsUQ0ohywZ9x8XWjvmjfw/EOiZEElQEJD8qYOpiUJSRsbKnoDj8s0m1YVKqKxXt2Uql4VJFDUCBJMH97gg/dbtl7Wpzy+2EeiU8YUTH784G9BRb5qXmHGDj/GCileBAg8dB1n4NdPNYzLgMFXa0u3rV7uvUc3Y4Ske39MndzzvUpK5uh/axytiV4f9RN</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>K9HJBFQy27NXcVQB7N6bOhNDn2PaiqJVHexMhO1oY6+n2E4U6SvZYhHNfE0U0iLRe6TfR8bxyWEnPnptcEoHHeZOsZXupqAPYwTIc4yVYLqu7EZJNja/Wi91k9q3R8R6LtxkERgX5/Y9GiL9WUrKHpGUxv/773p7g6Gh8VYBGpCCAzPS0zq6v7Tand2Nfa4Rx4x7K67ZdytKhjyRrmXa3m0cFZECzAKZEogdKN1JnqHUAiOpidVaq84qQnJxdupUrJ2AGl63llEFSOAMGXbL1PvA9lKXCMcZcOSMkhPZV58NboUWWqynsE4VoPPIysIKY2cDq5TBBrD/lbLKo8Jj84un81Kfp56gn63hNyILmtiaP7BA5zhYpKMfAI+pLXOD75ig5l363L/OgJws4cLod1rj9Zj4WF1X0kejBwqrvWz+GG+IHep0P8G+DQrQBakr</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
