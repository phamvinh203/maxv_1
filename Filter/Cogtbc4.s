<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "COGTBC4">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ/Năm" e="From Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ/Năm" e="To Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year1" defaultValue="(new Date()).getFullYear()">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam2" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year2" defaultValue="(new Date()).getFullYear()">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_loai" allowNulls="false">
      <header v="Loại yếu tố chi phí" e="Cost Factor Type"></header>
      <items style="AutoComplete" controller="FactorType" reference="ten_loai%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l"/>
    </field>
    <field name="dien_giai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 45, 30, 100, 100, 130"/>
      <item value="111: [tu_ky].Label, [tu_ky], [nam]"/>
      <item value="111: [den_ky].Label, [den_ky], [nam2]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1100100: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>n7WiY38rGx7BO3qPmle8zp1JaNgiwQUJLjzPfZG5F8FY4qg+7KpqcfLHB7mm0anCrhaJe/t8QSyKmr2CWMbVSRxIWtAUM7fX7by+Hs2ITRCa82Kna9jxJZlGXPEUrSlmOhMPDbaM4nBqSYhgmaLjcXyo2LMF8Qpt76jzawG2R9VqMB4LnF/rKWn+mfP9VztBWjf2X6L62d2l3SsGWjOalvCZICucs8c0BEunb164HZW9p8Pni8IOcjXXavexXZyLTd1564cfsT70ia3hg7rWOBLXXuNpQtKJ4OUgk/rh5MsA5/d5h7dfWukPWxBS7ZjJ</encrypted>]]>&Form;<![CDATA[<encrypted>t5/OLHv0rYiuX11GAuCYa4jcEGQcY7Y4OEM01RECbR/r6lRwHSShpEvnIIGBlKju28tM9rm9m+fDTDlxRMjobv2kIxU1OWyLN0EN2YCwebfTusKHzI0W5Se5mDgo0bSbKT6ET3SmYo4bmiQ1T0HxR2WnSMTghzfypGXSyLBAVEtnZR00JJYNUkS258AtuopbR5+pUNvRJDY9zwuZMv4Pxj3aLI2JSDq4p8w/1zxkUFKTiM3w6wL3zhG0k7J95j/0aRFjCAMIfmrzhyVeVf0m2fz2NW0Yyzo8p2xJJw0SVK6JsdA8D8XSi77QuoEOL+OO</encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>jBc6/5wg3suMAdDKOQuV84sRdtoMxLahRV0AG7FqlT/qhMzKsgBUXcO4wBJNv4tMCH+3NaIeg0FEA/eA8mEZL3LDyTgydbY+PvmEcNzFYXMeO/tP8dEYLN7cjWPPsir0jdGM5PBliPoRiu/l4viX01rQIfYeLyXz8UTzUBI5r3QcCwRTtR3fLJ5i+L6XTWQ+JeT9wCBQ4/vSuhBuScGvn3avsEgUW0Ch7fZcHbjx5nY=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>BZZUOpflWnOZbc8B6lxDDk18oHuuVkNBVNSY6TgBOgmzrnJKJ1WUo4WmbLuFWyGLFjjB2fqxsy7TwzWaXWARqK0esAmaJG3fby7NlBblAPvhDywH89C+Blhfx2xi17Vq5cVl4An5dgW0EkVmoe7GQhrBEjaNzyHcnZgNbLlTR1Mc1cZxM1QlSdAUmkwO3K4qqB9nkUwUJ3RwS1vIwNMfW5o8w0xIqDOSoAS7az8J6KL68/tlLjxRlKXRL+Bb6ex3qJmnlPKWGZHZEbmaIwnWi4cXqk0GN6w/BqA1bwdKX8Rk0ZzqG3J+jlZN2CNuyOB7t1xGkvIXbxttLa1GygrxjV5hgPI9zE2pIdZiO6OKaQtkdo/9d02cwgvQ8OSjaDL92VsmSk2B0LjeU+BhYsxRuCm74YxRppnSfAl29eK0gwluqZjllFqDVb0NSsONdApq+El7j883HZq4TvM3foa6Xr2pyoKhRSTtmbjeawjKzbuinw9sZaP3gleiaieXgCTlQxHcTjrutY3/YmzAFUKc686KpccQWTeugefVYuClCIiLMViloNF4eUCOEs5/Exte3OEW+8tNwFuJ6Y6lgXftqF+/2m3uDgab1g6qvcC6c2scEK+KxslJVDiGAJbD/dT3YaUfmsDq1mUKrwXyOiCL3pUnhsY3t4xHMKfv6KegY89Hs5zVUgLItUfl1xdD9Wchbq6+PM/vE3oa+Fyeidd0jjOU2utxPzVk58Uv90aR/MPMOZF95qMTKhhDyul4Mfz3EF3FDRQLZ3WxxYbZZxjKad2vD346jUr1YJSf9QCkwv4km7GCk0WdsUYOQ5xb9QaP41irsFntZS+6A57kmsDQcs9rZ/yTtf4fl3BPSwQRHGF9O0PXdfc0VV689Ey/op4t</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
