<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  
]>

<grid type="Report" valid="systotal = 0" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Bảng cân đối phát sinh các tài khoản" e="Trial Balance"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="tk" type="String" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'glcd1_detail', Controller: 'GLcd1', Name: '[tk]', Value: '[tk] + this._queryFilterString+String.fromCharCode(253)+[no_dk]+ String.fromCharCode(253) + [no_dk_nt] + String.fromCharCode(253) + [co_dk]+ String.fromCharCode(253) + [co_dk_nt] + String.fromCharCode(253) + [ps_no]+ String.fromCharCode(253) + [ps_no_nt] + String.fromCharCode(253) + [ps_co]+ String.fromCharCode(253) + [ps_co_nt] + String.fromCharCode(253) + [no_ck] + String.fromCharCode(253) + [no_ck_nt] + String.fromCharCode(253) + [co_ck]+ String.fromCharCode(253) + [co_ck_nt]'}, Script: 'beforeDrillDown(this);'">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ten_tk%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tài khoản" e="Account Name"></header>
    </field>

    <field name="no_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư nợ đầu kỳ nt" e="FC Dr. Opening Bal."></header>
    </field>
    <field name="co_dk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư có đầu nt" e="FC Cr. Opening Bal."></header>
    </field>
    <field name="ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh nợ nt" e="FC Dr. Amount"></header>
    </field>
    <field name="ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh có nt" e="FC Cr. Amount"></header>
    </field>
    <field name="no_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư nợ cuối kỳ nt" e="FC Dr. Closing Bal."></header>
    </field>
    <field name="co_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư có cuối kỳ nt" e="FC Cr. Closing Bal."></header>
    </field>

    <field name="no_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư nợ đầu kỳ" e="Dr. Opening Bal."></header>
    </field>
    <field name="co_dk" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư có đầu kỳ" e="Cr. Opening Bal."></header>
    </field>
    <field name="ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh nợ" e="Dr. Amount"></header>
    </field>
    <field name="ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Phát sinh có" e="Cr. Amount"></header>
    </field>
    <field name="no_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư nợ cuối kỳ" e="Dr. Closing Bal."></header>
    </field>
    <field name="co_ck" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Dư có cuối kỳ" e="Cr. Closing Bal."></header>
    </field>
	<field name="systotal" width="0" hidden="true">
      <header v="" e=""></header>
    </field>	
  </fields>

  <views>
    <view id="Grid">
      <field name="tk"/>
      <field name="ten_tk%l"/>

      <field name="no_dk_nt"/>
      <field name="co_dk_nt"/>
      <field name="ps_no_nt"/>
      <field name="ps_co_nt"/>
      <field name="no_ck_nt"/>
      <field name="co_ck_nt"/>

      <field name="no_dk"/>
      <field name="co_dk"/>
      <field name="ps_no"/>
      <field name="ps_co"/>
      <field name="no_ck"/>
      <field name="co_ck"/>
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
<![CDATA[<encrypted>y+jaaChMtw4mwnSnCwbdVFcaIW8pLYlrM3ZT7RSbOIx2T21TaMxz7mgN3GcpvKS0G1WlK8l2+foxCRMX99vGI309VItYqsA8b+kWMTxQ5dI+AXIzZnaPBYqJBVAAGd7b+++yRDWw7fKhPvoNBvLRk9/5KA0vdpoETXF+XQ/sijNbICL5sqyACGyTCGa/tBx+U1KpPtYlfqI9df/pXoVw+xe+JWH0va1PSPIeok8p3CrVS/qt/7VL5onLXphPLDNGZJuMxUFYruc3RA9sU3C/7y5wXozZYX7YOF8r9af/W3M2Ial1RG9XvjyKkvAbfpFzbu9oA5JloerQZZeNqeg8s1nYSasg6mENjbsWu4nplhZODfV3crEao4hluxtlqkjihuo/xpZtfZVLLjPXMEsb/D+8dFL5XQnkcD8l3Ug6T2g09YEWAlDqHG3UEPlJQIxj9OCzbPy0jCtv+x7zX9Wset2l/3Hkz3VTJi1mGuuxZz10Ru2xBPHYYZ4fUMfFyan4jToeAMrKsoZLxLVOqk/eTjJcgGcfozsUIqkM+XG4Ydq1MEeToQ0a+zF10a9fharhZEt7t4CR06QThSYPIJtCYZlabs2AaXU+r4Gym4+4A0SwJelVJsu8/oF2KSuLbFAeDih1iX5Q9ZsQOs1ijL28dra/XN9VayrtuH3DkgmlNV1B5m6N9mV3HG3v6vKyDLoY7QtmHCpOFpSXXZcJUwMZfQ==</encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>
