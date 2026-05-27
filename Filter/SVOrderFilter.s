<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "SVOrder">
  <!ENTITY c11 "Đơn hàng từ ngày">
  <!ENTITY c12 "Order Date from">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY ext "64">

]>

<dir table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" id="SO1" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Chọn đơn hàng bán/Hợp đồng" e="Select Sales Order/Contract"></title>
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
        <![CDATA[<encrypted>i2P7DOJHd9M7oG3eejghT1U5KHb/OYKR+ZAs3AL2qBgymZ80HocD2CuOH6ZLm/XtzqRf4osWKW3tTMcYaq0gEuBmrc4tCg5/j2habbFumQVBmwS9fygYyQ7Oaj0QR2j1v8z8QFe3KccNH0M6GTuceK1k+SqmAp5ZkSVNF6cZT3gMrMMBxbFYyFhMnNZnZKQeDp/NC+k0yIfYYhZPwUyNt53FgfZoB+GYzochc3zQTSsFwrtjWrLThYf0WWgseOadnbkT2/qgiL6GJUruHeJZq849pOrQiZZEwYdXTDSqfwZFqWT2ANAb0Bl2Pd+EuzuxeLFSkqMHYli2gV4W1ZxmaLmXkaXt1zGPbwKDhE5BfagkgaccJmtoB1GfWj+g/8Nk</encrypted>]]>&XMLFlowFilterCheck;
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
