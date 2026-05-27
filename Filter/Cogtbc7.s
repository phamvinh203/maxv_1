<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "COGTBC7">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
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
    <field name="ma_loai">
      <header v="Loại yếu tố chi phí" e="Cost Factor Type"></header>
      <items style="AutoComplete" controller="FactorType" reference="ten_loai%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 200, 130"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11010: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="11010: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<encrypted>hR4eQwfsAt+9Vdj8sa3rMgta1qTZeHJESXctK40PgTGQOy9oaGKAd5Umt8crN/tN7W+udodHsX7yGH8Q7Tx+Qy9BqGIO6Lw1OHXz9mUg14jCPFsGboNaCGGUppo/JXDzwekeefSFw4FcQHWcNBXjarNXkxGyeI3TVDgZ7tuzLCIkG+IBwUPcYvPaiUgxWwXu</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>8tJZcznnLddUww6I7+Z8k4M6SVJLADDdsWVs9/fhnnDQ7TcAJdisw9hOF3gFb1b3Et4+MYy2rEt3gaaCRgea5vhWU/i8IFOWgBBz0ywT1L7r5iNdJqh/ToYScu2P8rR1qzTgKWtOY7BiE6xPKKWp11+Xuv2ov0kqRhnBly/7hvZ88ycl+G2NKCRxdM67FdX2uNbYzJ3Kvwgq5WPIcZXg0oc6tZW6BLIbOlWG46u3hb8JaBOiLA8+1OCa2by4TId35heXqubqL3fsvnipxUjDddxaSuLCIRDDCzbZrFsm82Oc/BtwVBhYZf0Em8nlo9j3N94QH/r4tFHQgJkh7u9RweDmgpcOupR1VgnoH2AgEjb+wZUBmWMV/Vu6Lzg8PGRlCzQxVSL75/ILn7e1JIMHQ36GZqEGVU/pTbKQ92RZ1LOy2wB7gfxctBvNJ2G7Lp83PDjnk9dGoZUvqtiO0J3nO6OxgsP9vMWbL2fJhDR29cDx4PrnqgQNKA+BvGcoGqvX/unrExbofyCY3sC7uJIsozNAevVAqsNDCWYgo9Bvt6+pTYmY+qFLdCT9nXcgATTCKi2pCdQ98aNeF72YSw1ygw2pvjXISL4atXm96z15X69nxr5bM46jLvYBOjWkdjSWLRy3FH3/tVkqDqZEaf4MsImroDTodLtqXKBok8BlRqv1kFmCOSUKZJ3GWmnRH2T9B3vCTYmj7FKLukaBrxVL35kLsuGIhCotcF+br80VSs37gjGBwjSX13SUEHmy99xi</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
