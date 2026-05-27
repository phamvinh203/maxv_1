<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vcthspbccfc" code="nam, ky" order="nam, ky" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="copy" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sao chép dữ liệu" e="Copy"></header>
      <footer v="1 - Kỳ trước, 0 - Không" e="1 - Copy data from previous period, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="auto" dataFormatString="0, 1, 2" clientDefault="0" align="right">
      <header v="Tự động lấy dữ liệu" e="Copy auto"></header>
      <footer v="0 - Không, 1 - Lấy mới dữ liệu từ danh mục, 2 - Xóa đi và lấy lại từ danh mục, " e="0 - No, 1 - New Copy data from Fixed Asset list, 2 - Delete and Copy data from Fixed Asset list, "></footer>
      <items style="Mask"/>
    </field>	
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 250"/>
      <item value="11---: [ky].Label, [ky]"/>
      <item value="11---: [nam].Label, [nam]"/>
      <item value="11100: [copy].Label, [copy], [copy].Description"/>
      <item value="11100: [auto].Label, [auto], [auto].Description"/>	 	  
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN+N9jrHHTyqcCM8/+p4ZDeF55BxcHRgaKfUux+NU+IXGA4Kc5zoLQuLNyMe3bEZ43kxrGVhmpmrett0tP/ZoAN+/jK53xfOzawzPAofD6zhvNzE6hKh4n/hz7fZEA5psMw==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>XF3o8X7xLMsPzfS4yzI//f1TpLpjj5pyJxAo4K4WcjplkloefpFvfTWodOoVFhy3+9Xmi3hCpaX931ohDl7sM5TJEt5b0wfM++6Kkltc4MDo2o4P6aP+Yhf0/8hJ+/wOa73AYHGyuAr2HRPLyLGBeLChKoMOAthIBYCw6k7Pvf8/Mk8SfgdxhcSADD9KlTFVfq48Q84DdZV9H44nNrlPInbqgu35EY2eqsTVE5c1UhMrDuu+s3JnnCuuVA/T9Dg+XZ7eB/NFTDxV4oJ6YhnyF72vIqvY4xprH02dd3ZPvRZ5iW8KLbuC76t+Ke9r+ENt4Xc2wjpPfMk1v2c7/GOVoVkrvno7hHHP1MTSt+zj9mtmExhK/MNKYRmSWdTuFMQtGH2fiNFga3N6/ndqRJWreUvjfW1rR+URpcA7M1UafwpSGOWst7yqYIcWGnqfvnvQVAqXv0qEhP8eP2BVlM/q3sKBoNPNoYOf7jJvbxRrY0DGjL9zjZy8xqXXqgGPwTBcoqh+Jmd9OdVrcA0yQ0ENtHCc6KsnK+xp9a1Vgawmucc=</encrypted>]]>
    </text>
  </script>

</dir>
