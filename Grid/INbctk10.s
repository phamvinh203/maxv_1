<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo tồn kho theo định mức" e="Stock by Norm Report"></title>
  <subTitle v="Ngày: %d2..." e="Date: %d2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" dataFormatString="# ###" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên mặt hàng" e="Item Name"></header>
    </field>
    <field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="sl_chuan" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum">
      <header v="SL tối thiểu" e="Min Quantity"></header>
      <footer v="SL tối đa" e="Max Quantity"></footer>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum">
      <header v="SL tồn" e="Quantity on Hand"></header>
    </field>
    <field name="sl_lech" type="Decimal" dataFormatString="@quantityViewFormat" width="100" allowSorting="true" aggregate="Sum">
      <header v="SL thiếu" e="Shortage"></header>
      <footer v="SL thừa" e="Leftover"></footer>
    </field>
	<field name="systotal" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="sl_chuan"/>
      <field name="so_luong"/>
      <field name="sl_lech"/>
	  <field name="systotal"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7cp/o4yHIi5iNPyL4s81qug0snhjhoxRsI5BSgIRH3Ty2B+YEVOqZxgm7YO6+FmZNcgzONXccixmPYJSgSGG0qo=</encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>+4MGZi70gd99DJ1Xmp9NU0gwuNGKxrM5utRFkT8jhu4UlzcCfo7u0Eugsm9x+uzKlXjKQ82oGLJ9AGF5FMPHNzjg5bInS2CLfpimIozR6KhgjxZsxxMEvQyzUm4YNzUterNw0DIrI33qaGy7lV+qmmPMb21s4Yupw0frRUzA1RJxmg4JJtkCh3z86y9nWgdkLqZ+8vfL3DpXL8Rj7fSHWsxzB1EJ4LgglCIhY3/SfgWnKdpcIdSB/uAyggPajbW5ZQ4MQj1i0qSCHQr49TWI9KN4ADzeq741u5aRo73puLR+umYCDVbUgDrPje+sdH21kHR4U/rcOMK8bKehtdIkvBjn8tyg+USsR53fryW5B2wM7jeQkOBo8hw1figwYVEnByBWfnKjSO3CZg7+5HzqjeAo/vxuNP7HZJpl/Fa9haz6zRJyDL/UTDplDirsiDHy4EV7xVrB7CjVI0CYfrvzUK/B7VjeLkoudMPIiXgDFRNZOOaNcUPbsncCR89DznZ6xyGXOGZRrbaoAnTm6PleSgvalElScpBbpFlnGhQ+7LGD0gzXj2LJG+1HC83p//Wa/2/25ptUmIJvSlQ96TScAoW1YbkuFdNoKjYnasBNSsM9qc4DXaA2dKM5qjH130rhehb2zzaFucHM1etxvf/KTMBE/kEtqLjq9rBgzcLPy22Egqgg1YbVZwXWHhkWsCRl1AVtJcrp2/+oICivCUvTHgcjdc6zxhWC5PJkuUhpvgxqxQ65Z/QJAofZwXJZos1Q3tSe0XhY+eVzIuEM1cI0xkL7LErmnNeNQqcPZJ0WV/jcnGEFqfNfepk87jB46JD/SSQyYBkfoTvPJpT3p/nJiilPc8grPT7pjnvRh6w+1HgwwpT4fIPmpNrivCTxYnlmD/WivJQfUrU63EKRAn+W/m6PDSS4nOWuaeOSiN3lWJYI0BOzws5ubJzVXaWuGMa5</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
    <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
</grid>
