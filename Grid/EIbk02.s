<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid" valid="systotal = 1">
  <title v="Bảng kê hóa đơn điện tử bán ra" e="output VAT EInvoice Listing"></title>
  <subTitle v="Hóa đơn từ ngày %d1 đến ngày %d2" e="EInvoice Date from %d1 to %d2"></subTitle>
  <fields>
     <field name="mau_hd" width="60" allowSorting="true" allowFilter="true">
      <header v="Mẫu số" e="Form"></header>
    </field>
     <field name="so_seri" width="60" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu" e="Seri"></header>
    </field>	
     <field name="so_ct" width="80" allowSorting="true" allowFilter="true" align="right" >
      <header v="Số hóa đơn" e="Inv No."></header>
    </field>	
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true">
      <header v="Ngày hóa đơn" e="Inv Date"/>
    </field>	
    <field name="mst_ngmua" width="100" allowSorting="true" allowFilter="true">
      <header v="MST/người mua" e="Tax Code"></header>
    </field>	
    <field name="ten_ngmua" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên người mua" e="Name Customer"></header>
    </field>
    <field name="ten_vt" width="200" allowSorting="true" allowFilter="true">
      <header v="Tên hàng hóa" e="Item Name"></header>
    </field>	
    <field name="dvt" width="60" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" width="100" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá" e="FC Unit Cost"></header>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowSorting="true" allowFilter="true">
      <header v="Giá" e="FC Unit Cost"></header>
    </field>
    <field name="ck_nt" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền CK" e="Discount Amout"></header>
    </field>
    <field name="ck" type="Decimal" width="100" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền CK" e="Discount Amout"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền trước thuế" e="FC Credit Amount"></header>
    </field>
    <field name="tien" type="Decimal" width="100" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền trước thuế" e="FC Credit Amount"></header>
    </field>
    <field name="thue_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế" e="Tax Amout"></header>
    </field>
    <field name="thue" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế" e="Tax Amout"></header>
    </field>
    <field name="tt_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền sau thuế" e="Tax after Amout"></header>
    </field>
    <field name="tt" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền sau thuế" e="Tax after Amout"></header>
    </field>
    <field name="tl_ck" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="TL chiết khấu" e="Rate Discount"></header>
    </field>
    <field name="thue_suat" width="100" allowSorting="true" allowFilter="true" align="right">
      <header v="Thuế suất" e="Rate Tax"></header>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>	
    <field name="ty_gia" type="Decimal" width="80" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tỷ giá" e="Rate Exchage"></header>
    </field>	
	
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng tiền hàng" e="Total Amount"></header>
    </field>	
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng tiền hàng" e="Total Amount"></header>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng tiền thuế" e="Total Tax Amount"></header>
    </field>	
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng tiền thuế" e="Total Tax Amount"></header>
    </field>	
    <field name="t_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng CK" e="Total Discount Amount"></header>
    </field>
    <field name="t_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng CK" e="Total Discount Amount"></header>
    </field>
    <field name="t_phi_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng Phí" e="Total Exp Amount"></header>
    </field>
    <field name="t_phi" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng Phí" e="Total Exp Amount"></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng thanh toán" e="Total Amount"></header>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng thanh toán" e="Total Amount"></header>
    </field>
	
    <field name="ht_thanh_toan" width="120" allowSorting="true" allowFilter="true">
      <header v="Hình thức thanh toán" e="Payment"></header>
    </field>		
    <field name="ten_trang_thai_hd%l" width="200" allowSorting="true" allowFilter="true">
      <header v="Trạng thái hóa đơn" e="Inv Status"></header>
    </field>	
    <field name="ten_ket_qua_ktra%l" width="200" allowSorting="true" allowFilter="true">
      <header v="Kết quả kiểm tra" e="Result check"></header>
    </field>
    <field name="stt_rec" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="systotal" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
	  <field name="mau_hd"/>
      <field name="so_seri"/>
      <field name="so_ct"/>
      <field name="ngay_ct"/>
      <field name="mst_ngmua"/>
      <field name="ten_ngmua"/>

      <field name="ten_vt"/>
      <field name="dvt"/>
	  <field name="so_luong"/>
      <field name="gia_nt"/>
	  <field name="gia"/>
	  <field name="ck_nt"/>
	  <field name="ck"/>
      <field name="tien_nt"/>
	  <field name="tien"/>
      <field name="thue_nt"/>
	  <field name="thue"/>
	  <field name="tt_nt"/>
	  <field name="tt"/>
	  <field name="tl_ck"/>
	  <field name="thue_suat"/>
      
	  
	  <field name="ma_nt"/>
	  <field name="ty_gia"/>
	  
	  <field name="t_tien_nt"/>
	  <field name="t_tien"/>
      <field name="t_thue_nt"/>
	  <field name="t_thue"/>
	  <field name="t_ck_nt"/>
	  <field name="t_ck"/>
	  <field name="t_phi_nt"/>
	  <field name="t_phi"/>
      <field name="t_tt_nt"/>
	  <field name="t_tt"/>
	  
      <field name="ht_thanh_toan"/>
	  <field name="ten_trang_thai_hd%l"/>
	  <field name="ten_ket_qua_ktra%l"/>

      <field name="stt_rec"/>
	  <field name="ma_ct"/>
	  <field name="systotal"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
  
  <script>
    <text>
<![CDATA[<encrypted>y+jaaChMtw4mwnSnCwbdVFcaIW8pLYlrM3ZT7RSbOIx2T21TaMxz7mgN3GcpvKS0G1WlK8l2+foxCRMX99vGI309VItYqsA8b+kWMTxQ5dI+AXIzZnaPBYqJBVAAGd7b+++yRDWw7fKhPvoNBvLRk9/5KA0vdpoETXF+XQ/sijNbICL5sqyACGyTCGa/tBx+U1KpPtYlfqI9df/pXoVw+xe+JWH0va1PSPIeok8p3CrVS/qt/7VL5onLXphPLDNGZJuMxUFYruc3RA9sU3C/7y5wXozZYX7YOF8r9af/W3M2Ial1RG9XvjyKkvAbfpFzbu9oA5JloerQZZeNqeg8s1nYSasg6mENjbsWu4nplhZODfV3crEao4hluxtlqkjihuo/xpZtfZVLLjPXMEsb/D+8dFL5XQnkcD8l3Ug6T2iWJklE7n/y0+ropxXdIl3n42bhThixcnQxczSP3qqch7vHB8lPSsFWTCeINhwBQjKWU270Bj+QUiNU6gaJBoxEw5XQr2w1++Jry161sOOLiPXyVd6HPdpnMsI5RHbEzBUIdgt9C8MsyQ7A9pH5JphiSdxyLIp1MeEZ7Mlm8vU/FPzDl/FjOcUnY7F0/UFdCN/bLK4VqjVY6tKC3USaf8eCAj0vL5683UOflYd8L9Vhi+NuKLNlGtvRk+BcDMO6s2rRiVhHypC0tJgEIbpGNZRsf2as20Ic2XtjNkRY7k82xA==</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;

</grid>
