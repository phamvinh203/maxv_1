<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 0" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Sổ đăng ký chứng từ ghi sổ" e="Journal Voucher Register Book"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ctgs" type="DateTime" dataFormatString="@datetimeFormat" width ="80" allowSorting="true" allowFilter="true">
      <header v="Ngày ctgs" e="Batch Date"/>
    </field>
    <field name="so_ctgs" width="90" allowSorting="true" allowFilter="true" align="Right" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'glctgs1_detail', Controller: 'GLctgs1', Name: '[ma]', Value: '[so_ctgs] + String.fromCharCode(253) + [ngay] + this._queryFilterString'}, Script: 'beforeDrillDown(this);'">
      <header v="Số ctgs" e="Batch No."></header>
    </field>
    <field name="dien_giai" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tien_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền nt" e="FC Amount"></header>
    </field>
    <field name="tien" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="ngay" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
	<field name="systotal" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="ngay_ctgs"/>
      <field name="so_ctgs"/>
      <field name="dien_giai"/>
      <field name="Tien_nt"/>
      <field name="Tien"/>
      <field name="ngay"/>
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
