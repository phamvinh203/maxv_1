<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "SVIssue">
  <!ENTITY c11 "Phiếu xuất từ ngày">
  <!ENTITY c12 "Pick Date from">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Pick Number">
  <!ENTITY ext "66">

]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" id="PX5" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Chọn phiếu xuất bán" e="Select Pick List"></title>
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
        <![CDATA[<encrypted>i2P7DOJHd9M7oG3eejghTx8aoKBkgSjPkCNDsX3REQY7HzNq2PUD73rcUd0IiksRPEYfaf3pNRVDO8xmAEGCQY81fqX6QTXb9ICJ3ETi0s60CCwbSUTvFIiIWuJIOAYbQGkGkGR4hOL+uKcOngJgitw5pX1aANnQK5Ek6t8QlYMBJsZHEDf9IyLp0+5tWH7XMf7BYiDLEwa8v3/G9dZPGlmxb1MOTTsL68fSpvK5SfTn5ykTJnmrBv0a/sM3Uav9MDjMJGimVHOm1o+A4b4Re3O4yYfZ40tSEr7tI9bokWYBv/ofvw3QjdJKiumylLU4yZFSRA+NpxxVA0pzxW/noTCtAyf11ttsneoAMIKKLqWNMA5pvcvVdtWk1MlL4Px8</encrypted>]]>&XMLFlowFilterCheck;
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
