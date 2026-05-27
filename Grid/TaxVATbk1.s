<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" filter="excel &lt;> 2" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng kê hóa đơn hàng hóa, dịch vụ mua vào" e="Input VAT Invoice Listing"></title>
  <subTitle v="Từ tháng %m1 đến tháng %m2 năm %y..." e="Month from %m1 to %m2 Year %y..."></subTitle>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_mau_ct" width="80" allowSorting="true" allowFilter="true">
      <header v="Mẫu hđ" e="Invoice Form"></header>
    </field>
    <field name="so_seri0" width="80" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu" e="Serial No."></header>
    </field>
    <field name="so_ct0" width="80" allowSorting="true" allowFilter="true" align="right">
      <header v="Số hóa đơn" e="Invoice No."></header>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true">
      <header v="Ngày hóa đơn" e="Inv Date" />
    </field>
    <field name="ma_ct" width="60" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'">
      <header v="Mã ct" e="VC. Code"></header>
    </field>

    <field name="ten_kh%l" width="250" allowSorting="true" allowFilter="true">
      <header v="Tên người bán" e="Supllier Name"></header>
    </field>
    <field name="ma_so_thue" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
    <field name="ten_vt" width="250" allowSorting="true" allowFilter="true">
      <header v="Mặt hàng" e="Item"></header>
    </field>

    <field name="t_tien_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền nt chưa thuế" e="VC FC Amount"></header>
    </field>
    <field name="t_tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền chưa thuế" e="VC. Amount"></header>
    </field>
    <field name="thue_suat" type="Decimal" width="90" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="true" >
      <header v="Thuế suất" e="Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế nt" e="FC Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế" e="Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vv" width="100" allowSorting="true" allowFilter="true">
      <header v="Dự án" e="Project"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Phòng ban" e="Department"></header>
    </field>	
    <field name="ghi_chu" width="250" allowSorting="true" allowFilter="true">
      <header v="Ghi chú" e="Description"></header>
    </field>
    <field name="so_ct" width="90" allowFilter="true" align="right">
      <header v="Số chứng từ" e="VC No."></header>
    </field>	
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true">
      <header v="Ngày chứng từ" e="Voucher Date" />
    </field>

    <field name="ma_ct0" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
	<field name="systotal" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>

    <view id="Grid">
      <field name="stt"/>
	  <field name="ma_ct"/>
      <field name="so_ct"/>
      <field name="ngay_lct"/>
	  
	  <field name="ngay_ct0"/>
	  <field name="so_ct0"/>
      <field name="so_seri0"/>
      
    
      <field name="ten_kh%l"/>
      <field name="ma_so_thue"/>
      <field name="ten_vt"/>

	  <field name="t_tien_nt"/>
      <field name="t_tien"/>
      <field name="thue_suat"/>
      <field name="t_thue_nt"/>
      <field name="t_thue"/>
      <field name="ma_vv"/>
      <field name="ma_bp"/>		   
      <field name="ghi_chu"/>
	  <field name="ma_ct0"/>
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
