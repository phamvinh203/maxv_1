<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "PVReceipt">
  <!ENTITY c11 "Phiếu nhập từ ngày">
  <!ENTITY c12 "Receipt Date from">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY ext "96">
]>

<dir table="m96$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Chọn phiếu nhập mua hàng" e="Select Purchase Receipt"></title>
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
        <![CDATA[<encrypted>RJgnMYhMWoiANEJ6o9E6uXfclrt3pjWPcVIXrG6ug4FfkDHu7u6FpXeHuwSlpGWu8ZHLLcfWEu82iu4fnXtVnJQfHahUVjOAWPBiS7BSIYdb0Kn4wJeL+6tZ0FwrgdeM60G+PYCesO31RIo7IsQsUDwe1KQcQPOOAOCyI35wUTWyLfCRtKNOKgZu3eih/H//Ku0S/cgJ0+1TghdFyzSXiULwx+Z1FnpPEtPxFtG7/dGNuMyR+n3Ljyh4xv4rFcoHCH9SGmz5HxvE9Wf1JeC9FD3FL6LgNZyWnZKU9HwymrTPks5Ljqs1tP24lycR4o5q9x2yaSHvZQ+7xrhZcqIaqtdgAHHQbn96bqq4b9dTRSNdRCEf7GR8FmneGjeLi4A/cpC8NE5dtKEWTb/JKvX9Vw==</encrypted>]]>&XMLFlowFilterCheck;
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
