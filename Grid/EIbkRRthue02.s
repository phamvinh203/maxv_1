<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid" valid="systotal = 1">
  <title v="Danh sách các hóa đơn đầu ra với DN rủi ro thuế" e="List of output invoices of tax risk enterprises"></title>
  <subTitle v="Hóa đơn từ ngày %d1 đến ngày %d2" e="Invoices from %d1 to %d2"></subTitle>
  <fields>
     <field name="ngay_hd" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true">
      <header v="Ngày hóa đơn" e="Inv Date"/>
    </field>
     <field name="so_hd" width="80" allowSorting="true" allowFilter="true" align="right" >
      <header v="Số hóa đơn" e="Inv No."></header>
    </field>	
     <field name="so_seri" width="80" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu" e="Seri"></header>
    </field>
    <field name="mst" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>	
    <field name="ten_kh" width="350" allowSorting="true" allowFilter="true">
      <header v="Tên doanh nghiệp (Người nộp thuế)" e="Name Customer"></header>
    </field>
    <field name="t_tien_hd" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền hàng HĐĐT" e="Einvoice Amount"></header>
    </field>	
    <field name="t_thue_hd" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế HĐĐT" e="Einvoice Tax"></header>
    </field	>
    <field name="t_tt_hd" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng thanh toán HĐĐT" e="Einvoice Total amount"></header>
    </field	>	

    <field name="t_tien_ht" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền hàng hạch toán" e="GL Amount"></header>
    </field>	
    <field name="t_thue_ht" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="110" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Thuế hạch toán" e="GL Tax"></header>
    </field	>
    <field name="t_tt_ht" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng thanh toán h.toán" e="GL Total amount"></header>
    </field	>
	

    <field name="ten_cq_thue" width="200" allowSorting="true" allowFilter="true">
      <header v="Tên cơ quan thuế" e="Name Tax Managerment"></header>
    </field>	
    <field name="ngay_dong" type="DateTime" dataFormatString="@datetimeFormat" width ="90" allowSorting="true" allowFilter="true">
      <header v="Ngày đóng trạng thái tổ chức" e="Close Date"/>
    </field>
    <field name="tt_canh_bao" width="200" allowSorting="true" allowFilter="true">
      <header v="Thông tin cảnh báo" e="Alert Information"></header>
    </field>	
    <field name="ghi_chu" width="300" allowSorting="true" allowFilter="true">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="systotal" width="100" allowSorting="true" allowFilter="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
	  <field name="ngay_hd"/>
      <field name="so_hd"/>
      <field name="so_seri"/>
      <field name="mst"/>
      <field name="ten_kh"/>

      <field name="t_tien_hd"/>
      <field name="t_thue_hd"/>
	  <field name="t_tt_hd"/>
      <field name="t_tien_ht"/>
	  <field name="t_thue_ht"/>
      <field name="t_tt_ht"/>
	  
	  <field name="ten_cq_thue"/>
	  <field name="ngay_dong"/>
	  <field name="tt_canh_bao"/>
	  <field name="ghi_chu"/>
      
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

<toolbar>
  <button command="Search">
    <title v="Toolbar.Search" e="Toolbar.Search"></title>
  </button>

  <button command="Export">
    <title v="Toolbar.Export" e="Toolbar.Export"></title>
  </button>
  <button command="Aggregate">
    <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
  </button>
  <button command="Seprate">
    <title v="-" e="-"></title>
  </button>
  <button command="Freeze">
    <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
  </button>
</toolbar>

</grid>
