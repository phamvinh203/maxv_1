<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Phân tích bán hàng theo thời gian" e="Sales Analysis by Time"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="stt" type="Int16" width="35" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'sobcbh9detail', Controller: 'SObcbh9', Name: '[ma_vt]', Value: '[ma_vt] + this._queryFilterString'}, Script: 'beforeDrillDownWithCondition(this);'">
      <header v="Mã hàng" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên hàng hóa" e="Item Name"></header>
    </field>
    <field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="so_luong_kt" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="SL kỳ trước" e="Prev. Qty"></header>
    </field>
    <field name="so_luong_kn" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="SL kỳ này" e="Qty"></header>
    </field>
    <field name="so_luong_lk" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="SL lũy kế" e="Accum. Qty"></header>
    </field>

    <field name="gia_nt2_kt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá bán kt nt" e="FC Prev. Price"></header>
    </field>
    <field name="gia_nt2_kn" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá bán kn nt" e="FC Price"></header>
    </field>
    <field name="gia_nt2_lk" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá bán lk nt" e="FC Accum. Price"></header>
    </field>

    <field name="tien_nt2_kt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Doanh thu kt nt" e="FC Prev. Turnover"></header>
    </field>
    <field name="tien_nt2_kn" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Doanh thu kn nt" e="FC Turnover"></header>
    </field>
    <field name="tien_nt2_lk" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Doanh thu lk nt" e="FC Accum. Turn."></header>
    </field>

    <field name="thue_nt_kt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế kt nt" e="FC Prev. Tax Amt."></header>
    </field>
    <field name="thue_nt_kn" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế kn nt" e="FC Tax"></header>
    </field>
    <field name="thue_nt_lk" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế lk nt" e="FC Accum. Tax"></header>
    </field>

    <field name="ck_nt_kt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Chiết khấu kt nt" e="FC Prev. Discount"></header>
    </field>
    <field name="ck_nt_kn" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Chiết khấu kn nt" e="FC Discount"></header>
    </field>
    <field name="ck_nt_lk" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Chiết khấu lk nt" e="FC Accum. Discount"></header>
    </field>

    <field name="pt_nt_kt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải thu kt nt" e="FC Prev. Receiv."></header>
    </field>
    <field name="pt_nt_kn" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải thu kn nt" e="FC Receiv."></header>
    </field>
    <field name="pt_nt_lk" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải thu lk nt" e="FC Accum. Receiv."></header>
    </field>

    <field name="gia_nt_kt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá vốn kt nt" e="FC Prev. Cogs"></header>
    </field>
    <field name="gia_nt_kn" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá vốn kn nt" e="FC Cogs"></header>
    </field>
    <field name="gia_nt_lk" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá vốn lk nt" e="FC Accum. Cogs"></header>
    </field>

    <field name="tien_nt_kt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền vốn kt nt" e="FC Prev. Cogs"></header>
    </field>
    <field name="tien_nt_kn" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền vốn kn nt" e="FC Cogs"></header>
    </field>
    <field name="tien_nt_lk" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền vốn lk nt" e="FC Accum. Cogs"></header>
    </field>

    <field name="lai_nt_kt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lãi kt nt" e="FC Prev. Profit"></header>
    </field>
    <field name="lai_nt_kn" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lãi kn nt" e="FC Profit"></header>
    </field>
    <field name="lai_nt_lk" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lãi lk nt" e="FC Accum. Profit"></header>
    </field>

    <field name="gia2_kt" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá bán kt" e="Prev. Price"></header>
    </field>
    <field name="gia2_kn" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá bán kn" e="Price"></header>
    </field>
    <field name="gia2_lk" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá bán lk" e="Accum. Price"></header>
    </field>

    <field name="tien2_kt" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Doanh thu kt" e="Prev. Turnover"></header>
    </field>
    <field name="tien2_kn" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Doanh thu kn" e="Turnover"></header>
    </field>
    <field name="tien2_lk" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Doanh thu lk" e="Accum. Turnover"></header>
    </field>

    <field name="thue_kt" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế kt" e="Prev. Tax Amount"></header>
    </field>
    <field name="thue_kn" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế kn" e="Tax Amount"></header>
    </field>
    <field name="thue_lk" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế lk" e="Accum. Tax Amount"></header>
    </field>

    <field name="ck_kt" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Chiết khấu kt" e="Prev. Discount"></header>
    </field>
    <field name="ck_kn" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Chiết khấu kn" e="Discount"></header>
    </field>
    <field name="ck_lk" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Chiết khấu lk" e="Accum. Discount"></header>
    </field>

    <field name="pt_kt" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải thu kt" e="Prev. Receiv."></header>
    </field>
    <field name="pt_kn" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải thu kn" e="Receiv."></header>
    </field>
    <field name="pt_lk" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phải thu lk" e="Accum. Receiv."></header>
    </field>

    <field name="gia_kt" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá vốn kt" e="Prev. Cogs"></header>
    </field>
    <field name="gia_kn" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá vốn kn" e="Cogs"></header>
    </field>
    <field name="gia_lk" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá vốn lk" e="Accum. Cogs"></header>
    </field>

    <field name="tien_kt" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền vốn kt" e="Prev. Cogs"></header>
    </field>
    <field name="tien_kn" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền vốn kn" e="Cogs Amount"></header>
    </field>
    <field name="tien_lk" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền vốn lk" e="Accum. Cogs"></header>
    </field>

    <field name="lai_kt" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lãi kt" e="Prev. Profit"></header>
    </field>
    <field name="lai_kn" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lãi kn" e="Profit"></header>
    </field>
    <field name="lai_lk" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Lãi lk" e="Accum. Profit"></header>
    </field>

	<field name="xgroup" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhóm" e="Group code"></header>
    </field>
	
    <field name="sysorder" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
	<field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>

      <field name="so_luong_kt"/>
      <field name="so_luong_kn"/>
      <field name="so_luong_lk"/>

      <field name="gia_nt2_kt"/>
      <field name="gia_nt2_kn"/>
      <field name="gia_nt2_lk"/>

      <field name="tien_nt2_kt"/>
      <field name="tien_nt2_kn"/>
      <field name="tien_nt2_lk"/>

      <field name="thue_nt_kt"/>
      <field name="thue_nt_kn"/>
      <field name="thue_nt_lk"/>

      <field name="ck_nt_kt"/>
      <field name="ck_nt_kn"/>
      <field name="ck_nt_lk"/>

      <field name="pt_nt_kt"/>
      <field name="pt_nt_kn"/>
      <field name="pt_nt_lk"/>

      <field name="gia_nt_kt"/>
      <field name="gia_nt_kn"/>
      <field name="gia_nt_lk"/>

      <field name="tien_nt_kt"/>
      <field name="tien_nt_kn"/>
      <field name="tien_nt_lk"/>

      <field name="lai_nt_kt"/>
      <field name="lai_nt_kn"/>
      <field name="lai_nt_lk"/>


      <field name="gia2_kt"/>
      <field name="gia2_kn"/>
      <field name="gia2_lk"/>

      <field name="tien2_kt"/>
      <field name="tien2_kn"/>
      <field name="tien2_lk"/>

      <field name="thue_kt"/>
      <field name="thue_kn"/>
      <field name="thue_lk"/>

      <field name="ck_kt"/>
      <field name="ck_kn"/>
      <field name="ck_lk"/>

      <field name="pt_kt"/>
      <field name="pt_kn"/>
      <field name="pt_lk"/>

      <field name="gia_kt"/>
      <field name="gia_kn"/>
      <field name="gia_lk"/>

      <field name="tien_kt"/>
      <field name="tien_kn"/>
      <field name="tien_lk"/>

      <field name="lai_kt"/>
      <field name="lai_kn"/>
      <field name="lai_lk"/>
	  <field name="xgroup"/>

      <field name="sysorder"/>
	  <field name="systotal"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>D9zuJYsIK61arRKwe1XSlY4XulA3Gd/GabjF3JKldD732CCaoz/xRGgN4jEoRnPI8uUyNNWxvjVdMFiy5JhfFJi/yCK73o4SeSfjcN5ugIO9WCkmLGw/PYHdb8WsGD8pT9C2Cms+ayDyaC8aPQz9f/bjTlDl+tJkAh4zVnpqlwvRATCAaQN8zJ9eQWwaEpQv/ayUQ5S1Q7/xtjmBaZBkCSsDOXy5ZgHrXlSnO1fNGh1PPZu3Z1ezI+AKjUc1ZugwG4d8q+Txri9WzcGSCabfxuSfgXNVVfYMgLLH8hxyWc4Q+o+ibCMpFl5XtfqezJ7WMeETFRUb1+8mer1T7Blq3YFgcpNtP5Zhmgdh8a9iCgFiKkDkW0fvMsrkRSsmQXR5NH81mLtK1RqcRjk820U1wDQj6wDt+ko8RGwjasm1bEJl6ndToHxycv5RdY/w2Iph9W1LP+Hpw1TPKA3uHAHwZYgS9g40mTIc4nQOi9EE1h/gF4OzxMWXlB8ozx0E+5pzLSGnapaOc6GEFUSIm4vXPa+vjp7vb9RdSjNgm8QEZqI/m2Hwrlt06hMekjs3Z02xKKJ2IJTf09LfPB6Uuia1hcQHm0vJoPgJieJ2YI98yuulll5kzFLSXJY6RRFWx2SSx4Uxe+YFaXh1UiJI4bKs8x4TiJHozIbTToBoIUe8KMmyjxDQ/ojjCDqljoXFL5qCv+3CjlFuhR0d2XmpYzLcSs955kjwPWtxjeYq5Oq0v1Ql2paqL71zclZarXZo/mrY65RMURscZFqrxgRBMWPtdQ==</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
    <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
</grid>
