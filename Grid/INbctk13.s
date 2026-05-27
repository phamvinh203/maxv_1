<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Thẻ kho/Sổ chi tiết vật tư" e="Stock Card"></title>
  <subTitle v="Kho: %s1 - %s2, vật tư: %s3 - %s4, từ ngày %d1 đến ngày %d2..." e="Site: %s1 - %s2, Item: %s3 - %s4, UOM: %t1, Date from %d1 to %d2..."></subTitle>
  <fields>
 
    <field name="ma_kho" width="90" allowSorting="true" allowFilter="true">
      <header v="Mã kho" e="Site"></header>
    </field>
    <field name="ten_kho%l" width="200" allowSorting="true" allowFilter="true">
      <header v="Tên kho" e="Site Name"></header>
    </field>
    <field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã hàng" e="Code Item"></header>
    </field>
    <field name="ten_vt%l" width="200" allowSorting="true" allowFilter="true">
      <header v="Tên hàng " e="Code Name"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true">
      <header v="Ngày hạch toán" e="VC. Date" />
    </field>
    <field name="ma_ct" width="50" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>
    <field name="so_ct" width="90" allowSorting="true" allowFilter="true" align="right">
      <header v="Số chứng từ" e="Voucher No."></header>
    </field>
    <field name="dien_giai" width="250" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>  
    <field name="dvt" width="50" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Đơn giá" e="Price"></header>
    </field>
    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="SL nhập" e="Received Qty."></header>
    </field>
    <field name="tien_nhap" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền nhập" e="Received Amount"></header>
    </field>
    <field name="sl_xuat" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="SL xuất" e="Issued Qty."></header>
    </field>
    <field name="tien_xuat" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền xuất" e="Issued Amount"></header>
    </field>	
    <field name="sl_ton" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="SL tồn" e="Closing Balance"></header>
    </field>
    <field name="gt_ton" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Giá trị tồn" e="Amount Balance"></header>
    </field>		
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã kh" e="Site"></header>
    </field>
    <field name="ten_kh%l" width="200" allowSorting="true" allowFilter="true">
      <header v="Tên kh" e="Site Name"></header>
    </field>
    <field name="tk_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk vật tư" e="Item Account"></header>
    </field>
    <field name="ma_nx" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk đối ứng" e="Account"></header>
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
	  <field name="ma_kho"/>
	  <field name="ten_kho%l"/>
      <field name="ma_vt"/>
	  <field name="ten_vt%l"/>
	  <field name="ma_ct"/>
	  <field name="ngay_ct"/>
	  <field name="so_ct"/>
	  <field name="dien_giai"/>
	  <field name="dvt"/>
	  <field name="gia"/>
	  <field name="sl_nhap"/>
	  <field name="tien_nhap"/>
	  <field name="sl_xuat"/>
	  <field name="tien_xuat"/>
	  <field name="sl_ton"/>
	  <field name="gt_ton"/>
	  
	  <field name="tk_vt"/>
	  <field name="ma_nx"/>
	  <field name="ma_kh"/>
	  <field name="ten_kh%l"/>
	  
      <field name="stt_rec"/>
	  <field name="systotal"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB6yD018mr/8MBZrL6lPM7OdKGuKIyQaS3qr064whCO0GkHK8Ro8WI7WEIOprT9OovUg==</encrypted>]]>
    </text>
  </css>
  
  <script>
    <text>
<![CDATA[<encrypted>aLvwAaGv3+yG3ua/+QqiMauJUFilxIJjJ+uzcnHQALBXAfwuh1xfS1ESd/GQPSHX7+zYbgHlKKR6Zzaxco5yZMDeIZWNEzYDNPmJf1V4xrViMPzJkQ72A60+d+PT3IiS9m8kLRMSEibt+J6L2r/2V+YoLYzLlz6LLe9I0I6XJmt4B0C2vQx0/8WIyvOBzHRRLsEv4A5FzWhZWhK9TNHszqRLlleYDJMBSkRKPX3dByVil/dPdSPbTxfF3mZi2MvdyINBLYqCl+UVxwsajII8/kEaOHxGsfnJ6Li5mVoxBdJcYLw1Im4ZPprngHKhcA5Y7ceEl3nOy8ryYv95wFMLS+Lp2yx9su6v2fMuxRsnQvepJER5XrnyAZQHPlYsRDxzZhwfhglUS5A1N48ujuDCX04LhuVPhmznfngkPSfMjSLZlDY3qOVDXXTQtuey+tJ4GVLtQN/JSE0GUeBv9pbxnOieRm9Pkk4ryUGBSe3KrLZL1MaWoNLW1aJRFi/fXoCOTNNHzO/ar01/qUPKXF9omPRvyneTTpTtzduRLTEcM2TUFir/0lPOPLadYqIVnwyK23hKiOc1fRO6k8Yof0v5npW1mt5cl0rbDQ0QuRouji2QZW0i3OAxMRJCe0B/FrGWVtCHp8wBAmdI+2JIXX+G9ZUnEq5LsJ0VUbabaNtXimjwnzyrC88lQB9gCg7f2wGHni0ZjOxoCbNkOCyjudIiOZ60f4/wKbm+ekshvh7GbylcGP4mswEN5Zv26l+DNxED</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
