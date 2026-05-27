<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 0" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Sổ tổng hợp chữ T tài khoản" e="Account T-Form Summary"></title>
  <subTitle v="Tài khoản: %s1, từ ngày %d1 đến ngày %d2..." e="Account: %s1, Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="tk_du" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'glnkc4_detail', Controller: 'GLnkc4', Name: '[tk_du]', Value: '[tk_du] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Tk đối ứng" e="Ref. Account"></header>
    </field>
    <field name="ten_tk%l" width="350" allowSorting="true" allowFilter="true">
      <header v="Tên tk đối ứng" e="Ref. Account Name"></header>
    </field>

    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Debit"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Credit"></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh nợ" e="Debit"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh có" e="Credit"></header>
    </field>
	<field name="systotal" type="Int32" width="0" hidden="true">
      <header v="systotal" e="systotal"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tk_du"/>
      <field name="ten_tk%l"/>

      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
	  <field name="systotal"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
<![CDATA[<encrypted>y+jaaChMtw4mwnSnCwbdVFcaIW8pLYlrM3ZT7RSbOIx2T21TaMxz7mgN3GcpvKS0G1WlK8l2+foxCRMX99vGI309VItYqsA8b+kWMTxQ5dI+AXIzZnaPBYqJBVAAGd7b+++yRDWw7fKhPvoNBvLRk9/5KA0vdpoETXF+XQ/sijNbICL5sqyACGyTCGa/tBx+U1KpPtYlfqI9df/pXoVw+xe+JWH0va1PSPIeok8p3CrVS/qt/7VL5onLXphPLDNGZJuMxUFYruc3RA9sU3C/7y5wXozZYX7YOF8r9af/W3M2Ial1RG9XvjyKkvAbfpFzbu9oA5JloerQZZeNqeg8s1nYSasg6mENjbsWu4nplhZODfV3crEao4hluxtlqkjihuo/xpZtfZVLLjPXMEsb/D+8dFL5XQnkcD8l3Ug6T2g09YEWAlDqHG3UEPlJQIxj9OCzbPy0jCtv+x7zX9Wset2l/3Hkz3VTJi1mGuuxZz10Ru2xBPHYYZ4fUMfFyan4jToeAMrKsoZLxLVOqk/eTjJcgGcfozsUIqkM+XG4Ydq1MEeToQ0a+zF10a9fharhZEt7t4CR06QThSYPIJtCYZlabs2AaXU+r4Gym4+4A0SwJelVJsu8/oF2KSuLbFAeDih1iX5Q9ZsQOs1ijL28dra/XN9VayrtuH3DkgmlNV1B5m6N9mV3HG3v6vKyDLoY7QtmHCpOFpSXXZcJUwMZfQ==</encrypted>]]>
    </text>
  </script>
  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>

  &XMLStandardReportToolbar;

</grid>
