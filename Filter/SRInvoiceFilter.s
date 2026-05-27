<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "SRInvoice">
  <!ENTITY c11 "Hóa đơn từ ngày">
  <!ENTITY c12 "Invoice Date From">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY ext "81">

]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Chọn hóa đơn" e="Select Sales Invoice"></title>
  <fields>
    &XMLFlowFilterFields;
  </fields>

  <views>
    &XMLFlowFilterViews;
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>hfvo1IWFjFC6wQYm3OeA8SW4Vi4iIeGwX5Odxay84bV7hCzDb7Oao8UgUF2RTqmGLivTYSikRYaLY3qXDKiVTzZZedoIS+JEUH0WJk+CnfxOSsDluSFMa0lgYpSGIQOgaz4AM7XouI0Il+kdhS7jl7vhtXLEwmapmxcTJqcpg8cfRezGze1SNODCmAFf/PN59XYj1ueofViZRu0yQusmUU+RZvG+/+yzpe61d6BHkCrN2A2FVPSUoVI2tQTLT0gjVcDwFOCcSF2w4LhZcpiyqHHU5Sh+FO6vXuP2tJ5ed7DJTL8+gE0hzduoWu+gwF9ca4M+fq3Ea33AtQ2dulDaCMlt3nmud073sYSirNUIF4o6xHS6Vg/ClVsGjw5t3YXV</encrypted>]]>&XMLFlowFilterCheck;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptFlowFilterFunction;
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>
