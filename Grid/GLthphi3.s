<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Báo cáo tổng hợp chi phí cho nhiều kỳ" e="Expense Aggregation Report for Multiple Periods"></title>
  <subTitle v="Báo cáo theo: %s1, số kỳ phân tích: %s2, từ ngày %d..." e="Report by: %s1, Analysis Periods: %s2, Date from %d..."></subTitle>
  <pivot rowField="xKey" columnField="xCol" dataFields="ps, ps_nt" indexTable="2" indexColumn="1" indexHeader="2" indexView="4"/>
  <fields>
    <field name="stt" type="Int16" width="30" dataFormatString="### ###" allowSorting="true" allowFilter="true" align="right">
      <header v="Stt" e="No."></header>
    </field>
    <field name="xDetail" width="100" allowSorting="true" allowFilter="true">
      <header v="&lt;span id = 'idf_detail'&gt;Mã&lt;/span&gt;" e="&lt;span id = 'idf_detail'&gt;Code&lt;/span&gt;"></header>
      <label v="Mã" e="Code"></label>
    </field>
    <field name="ten_ky" width="300" allowSorting="true" allowFilter="true">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ps" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
    </field>
    <field name="ps_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" allowSorting="true" allowFilter="true" aggregate="Sum">
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
      <field name="xDetail"/>
      <field name="ten_ky"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>Ers0gce30/eVDBIEgsojWhFzk+UmUcye+oOZwMXZ6Coea01iR4uhFynH6dUAb/u0YU9Fsw5vE1ltmj10HJEpxNYp9/YAO1uXnxNuMmoWWC+tPrc357mqZyeqLVoLeAbvPSt549ygJxdYuLNQfoLJGT71lVjoWlb85VDdLMLK6QI9jlRr0dz0rfWLywVqOtUvlD2U58MHNAWwa9viK08sW10Qzrwq+9NYkUoBXuTuogWc+BTDVEvVsZc1mMIcpXph7ZDH6xCIMe9NqZW3U4q6lluYKVUyEY74iarAbeCDMtv01A6fKxwhAo5gI+rPMgg56RPPazskg64G29y9Wy26d3x153OmHsUjm/VA22PcuXIfc9ULtR0TLCANLFZ0GHaB9+p6LvQrqngpJ6dIK6hpUPzyWmdMc7oACLDjCihMo//HRNgxfiL3yiqcB9JtweO5+5kBcRQ/9/y28qU54ShrGYv2UhIWUXFRSJpRE138GlSftMBW9fRq+h5vLZ+F0Yno2kwOWRZ9oJUdGYB4TZ50Ce7VSFI5ohAQRI1nIAXOVYMxaxKMmKTZ/upYlxhrfP/3RE45hH/MgyHlBfLHRf39O4lYWil0jp5BkPC4gzt72Zvd2cjY8dTbsUFkEQZ1qWOTBrFoyIHDMPBUwrujdVRZkyk9SQphj9UcYnfgDjJSzvYp8IyGOmb/FLNdsZBrBfZpI2igfrpigpesenOEOyf3HTnom8S5tgliAVLHkjPs2UrkPShf957LcU4+v99z0IWSlxXVG9e48lnJYeAcRvAV4A==</encrypted>]]>
    </text>
  </script>
  <css>
    <text>
      <![CDATA[<encrypted>KC+F+ao7uPbOX1d5ceT8xMy5Y2rcEv1asf+a9bAw4FPRcNTa+yDH/Otj6rxEWg2Un2Kf9uBBA1J6TXCw5uCB68VRU0z30nYKyeQC5OO2BYgOCfot7FDm5ZsaFQS0/9Lw</encrypted>]]>
    </text>
  </css>
  &XMLStandardReportToolbar;

</grid>
