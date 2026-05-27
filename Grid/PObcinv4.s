<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng kê công nợ của các hóa đơn theo hạn thanh toán" e="Aging Payable Report"></title>
  <subTitle v="Ngày tính hạn thanh toán %d2..." e="Due Date %d2..."></subTitle>

  <fields>
    <field name="ngay_ct0" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="VC. Date"></header>
    </field>
	<field name="ma_ct" width="50" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="Voucher"></header>
    </field>
    <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right" >
      <header v="Số ct" e="Voucher No."></header>
    </field>

    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã ncc" e="Supplier ID"></header>
    </field>
    <field name="ten_kh%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên nhà cung cấp" e="Supplier Name"></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="FC"></header>
    </field>

    <field name="t_tt_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền trên hóa đơn nt" e="FC Invoice Amount"></header>
    </field>
    <field name="t_tt_nt1" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Đã trả nt" e="FC Amount Paid"></header>
    </field>
    <field name="du_cuoi_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải trả nt" e="FC Amount Payable"></header>
    </field>
    <field name="so_du_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Trong hạn" e="In Permit Time"></header>
    </field>
    <field name="so_du_nt1" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Quá %s0 - %s1 ngày" e="Out of %s0 - %s1 days"></header>
    </field>
    <field name="so_du_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Quá %s2 - %s3 ngày" e="Out of %s2 - %s3 days"></header>
    </field>
    <field name="so_du_nt3" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Quá %s4 - %s5 ngày" e="Out of %s4 - %s5 days"></header>
    </field>
    <field name="so_du_nt4" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Quá trên %s6 ngày" e="Out of > %s6 days"></header>
    </field>

    <field name="t_tt0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền trên hóa đơn" e="Invoice Amount"></header>
    </field>
    <field name="t_tt1" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Đã trả" e="Amount Paid"></header>
    </field>
    <field name="du_cuoi" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải trả" e="Amount Payable"></header>
    </field>
    <field name="so_du0" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Trong hạn" e="In Permit Time"></header>
    </field>
    <field name="so_du1" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Quá %s0 - %s1 ngày" e="Out of %s0 - %s1 days"></header>
    </field>
    <field name="so_du2" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Quá %s2 - %s3 ngày" e="Out of %s2 - %s3 days"></header>
    </field>
    <field name="so_du3" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Quá %s4 - %s5 ngày" e="Out of %s4 - %s5 days"></header>
    </field>
    <field name="so_du4" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Quá trên %s6 ngày" e="Out of > %s6 days"></header>
    </field>

    <field name="han_tt" type="Decimal" dataFormatString="# ###" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Hạn thanh toán" e="Payment Terms"></header>
    </field>
    <field name="ngay_tt0" type="DateTime" width="100" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày thanh toán" e="Due Date"></header>
    </field>
    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
	<field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
	  <field name="ma_ct"/>
      <field name="ngay_ct0"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ma_nt"/>

      <field name="t_tt_nt0"/>
      <field name="t_tt_nt1"/>
      <field name="du_cuoi_nt"/>
      <field name="so_du_nt0"/>
      <field name="so_du_nt1"/>
      <field name="so_du_nt2"/>
      <field name="so_du_nt3"/>
      <field name="so_du_nt4"/>

      <field name="t_tt0"/>
      <field name="t_tt1"/>
      <field name="du_cuoi"/>
      <field name="so_du0"/>
      <field name="so_du1"/>
      <field name="so_du2"/>
      <field name="so_du3"/>
      <field name="so_du4"/>

      <field name="han_tt"/>
      <field name="ngay_tt0"/>
      <field name="ma_vv"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
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
      <![CDATA[<encrypted>LS+qfbPsuuSUsdopO9ndtlXrMlTDccfEr7nzVMVpPh97u/S2JHv4uFPQvYTIfTBVKI3BQPxndZ0kyEsfIbLZbvz2+NTQxxWNCUwf2gTQv7rHZ1y2kOsWjNRIridaVjL6MTZLPQPh0HwmUOyqbszb5/2ThYtATYA54conwmpAL8kgXDVCm4Csl9wF2HDN91irfEKkkIvJ2jji7QHJGu4Hqkh5xkbwJGvuNvKTNOHcrwsyNAjNFrOyE4hgPlgfS679tFqnC1ndr9m0flmElIsgyfM9AsRH5BH2+gEF7poFTK9+0Pzfj12kCVVm0fu4Vplir1wum1+IPR1cMLTG/U5ATG5KK3j9rqzhYc5/areXNIkIfFB6+rpv2qxEPFEzFzEJTaoWO9RAd89M8EWRigXzhmdFF0Dlu/bektDKbbfMSSI5oenw2hBjfePs6t6tbA0PrHgLNc2RLeebJp8B4vmCfyzCRaBVtTvFRA7fkdoe54gdsT0CIrdBkAfnvRDZ4fdLcRt1f7C4IxPlT2ZNg0MLEgaBBasl9ptem5AkuQEbjTze8Z9VpPraZY0XWaYRTbWR7gN+9lkzLuXvfsDCLvyrUEDkXdVod3GuChnpZ6W6uS2KjGOMqeqOaJX1hToZxMGXdfgvkUksRL1xnuP1lEkEbEqt1fVppgEBPheP2aIEw0Hfi7Fnn84ueeIcY0SlMseeC3Q49VxPIFwvq8g6qWslfL2aBr8EKlEW/Rr2RsBUU3H6BxvYuhIINRdd+mIH4Mw4CYDYEgUmDRIB9SFU4GZUUfaJ/BEMapLBEUrOweSPm9KEN52amEybBlfqhFhzZGqEjoLBxU1FGkaC/FqNyEzOfn3KXhccFuNftYBJuT2i9w8jJAlAR2KZdUYGuMK/cRel4fL0zy0f0VQphwbcSTMPCOAyJ81+vfOZBSL2scbtVJwx7GMEnICEcC+DNRlI3qO2iA8ACTkoJpFRHe6Zz4lnzZRy1rfmF34WyAsHufiQj8LqqpdWpWMzePfUd5mcRvB/Fiie+dSs9OWsVfB59t6dnQ==</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
</grid>
