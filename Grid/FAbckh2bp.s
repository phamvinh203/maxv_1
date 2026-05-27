<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng phân bổ khấu hao TSCĐ theo bộ phận" e="Fixed Asset Depreciation Allocation by Department Report"/>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y1 to Period %p2 Year %y2..."></subTitle>
  <pivot rowField="tk_kh2" columnField="tk_cp" dataFields="gt_kh_ky, gt_kh_ky_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="5"/>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="tk_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk khấu hao" e="Depr. Account"></header>
    </field>
    <field name="ten_tk_kh" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản khấu hao" e="Depreciation Account Name"></header>
    </field>
    <field name="ma_bp" width="100" allowSorting="true" allowFilter="true">
      <header v="Bộ phận sử dụng" e="Department"></header>
    </field>

    <field name="gt_kh_ky" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowFilter="true" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
	
	<field name="systotal" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
	  <field name="systotal"/>
      <field name="stt"/>
      <field name="tk_kh"/>
      <field name="ten_tk_kh"/>
      <field name="ma_bp"/>
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
