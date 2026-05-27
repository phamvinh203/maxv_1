<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng tính khấu hao TSCĐ theo nguồn vốn" e="Fixed Asset Depreciation by Capital Report"/>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y1 to Period %p2 Year %y2..."></subTitle>
  <pivot rowField="xRow" columnField="sysColumn" dataFields="gt_kh_ky_nt, gt_kh_ky" indexTable="2" indexColumn="1" indexHeader="2" indexView="10"/>
  <fields>
    <field name="stt" type="Int16" width="30" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="so_the_ts" width="100" allowSorting="true" allowFilter="true">
      <header v="Số thẻ tài sản" e="FA Code"></header>
    </field>
    <field name="ten_ts%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài sản" e="Decription"></header>
    </field>
    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Ngày khấu hao" e="Depr. Date"></header>
    </field>
    <field name="so_ky_kh" type="Int16" width="60" allowSorting="true" allowFilter="true" align="right" aggregate="Sum">
      <header v="Số kỳ kh" e="Periods"></header>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="60" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency Code"></header>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>

    <field name="gt_kh_ky_nt" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" aggregate="Sum">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowFilter="true" aggregate="Sum">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="gt_da_kh_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Đã khấu hao nt" e="FC Accumu. Depr."></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl_nt" type="Decimal" width="110" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Còn lại nt" e="FC Remain"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_kh" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Đã khấu hao" e="Accumu. Depr."></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl" type="Decimal" width="110" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Còn lại" e="Remain"></header>
      <items style="Numeric"/>
    </field>
	<field name="systotal" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
	  <field name="systotal"/>
      <field name="stt"/>
      <field name="so_the_ts"/>
      <field name="ten_ts%l"/>
      <field name="ngay_kh0"/>
      <field name="so_ky_kh"/>
      <field name="nguyen_gia_nt"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="nguyen_gia"/>

      <field name="gt_da_kh_nt"/>
      <field name="gt_cl_nt"/>
      <field name="gt_da_kh"/>
      <field name="gt_cl"/>

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
