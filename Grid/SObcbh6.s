<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo tổng hợp bán hàng theo tháng" e="Sales summary report by month"></title>
  <subTitle v="Từ kỳ %m1/%y1... đến kỳ %m2/%y2..." e="Period from %m1/%y1... to %m2/%y2..."></subTitle>
  <pivot rowField="xRow" columnField="sysColumn" dataFields="so_luong,tien,tien_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="5"/>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="xRow" width="0" hidden="true">
      <header v="xRow" e="Item Code"></header>
    </field>
	<field name="ma_vt" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Name"></header>
    </field>
	
    <field name="ten_vt" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
	
	<field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    
    <field name="so_luong" type="Decimal" dataFormatString="@quantityViewFormat" width="100" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>

    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Giá trị" e="Amount"></header>
    </field>
	<field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum">
      <header v="Giá trị" e="Amount"></header>
    </field>
	
    <field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="xRow"/>
      <field name="stt"/>
	  <field name="ma_vt"/>
      <field name="ten_vt"/>
	  <field name="dvt"/>
      <field name="systotal"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>kmV1xICZ1MhrG9pCiHQMmjxl4lLhy0D0ArxosSuYDb/15jb8x20k0P6Rfj/FAcvDNiCOnshyr+CqNIe/jgOeSkckiQXTguu7brZNN7Z5NbdgrGapti27isU8q0jMnNJBoOsUx/1Yo6xAFIuZ8BwMc435pyCkxpU3VN+JNfwDvF4hylooQq0MB/QCykH7jNkuL1tl8casIbB/WHVAr48Hb2A7eGGSf1S866FX88cmCE79SZgDGP00kdmq1m8CRvt/Q4enBD0sUvuYihVB1fpDZkMAJ1O4H+KyZOlnB1XbxWPv6tTggyXgTvOJ0Vv+bboN7JXDCx2Ni6W4JTXj246Xo9B8xBYXxQw9BYBoru6XjKw9HZ143oAS2fNiwek/fKQJm6SAkstbqfdfuO4375397HKYLTRoxTS2dTnxojRBZPygt1wmYsDFKHWxQWPN398oXPxYVVf2UJG8EUM142Um402kjKJk1v1fiKAxo+isEPMciNkNyUx0xIk7iNH4YvNtiFBqLSo7TNYL0q3a2ACVaaEpYIph4D1fs4z3HeH/62JXk+f15nTGDiRlz1HPi2YYZB1a3QdHDPr/XJmCDy79JfpbHeyRZJVSRbk+0LuSJtBbjsjpSYloffWwH10qf78o</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>