<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "SPInvoice">
  <!ENTITY c11 "Hóa đơn từ ngày">
  <!ENTITY c12 "Invoice Date From">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY ext "81">

]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" id="HB1" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Chọn hóa đơn bán hàng" e="Select Sales Invoice"></title>
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
        <![CDATA[<encrypted>jdZAMYxhgTBzwr4kQKW1VrxHfE+R5A4zddGxDN+Mj9Yrf7tIFCF/hAcFqGg7gS9pLWdzPDLp88BMNKc4kEtiRLJUCr+7ta34QprPEpcj865LgARhjHy1iYXVdic12/1IWmNVLpEZbj/qI36AmC6FJ3ALpPUWie6wm8LTORoVkCqX3fahxDQdCl0pKhkS7TIZFlgMNFck+yMGfMhPsyTXbyYpUsusoXoDP9VmBv7hgbuRoX+CbsUhyIHpeogjviOKaqHXWfmLvAkAr36oMhg/DbPBEf66TZG8sFd8p38JfOjUZDFqHDCNaQhLwEeRi/yj2OsSkHfupilaHeFndEuLAjPqkxMP8BUdHSb+IvnrTlTT5mTelma9fFItQbusCNRd</encrypted>]]>&XMLFlowFilterCheck;
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