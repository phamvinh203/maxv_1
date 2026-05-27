<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterFields SYSTEM "..\Include\XML\FlowFilterFields.txt">
  <!ENTITY XMLFlowFilterViews SYSTEM "..\Include\XML\FlowFilterViews.txt">
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">
  <!ENTITY XMLFlowFilterCheck SYSTEM "..\Include\XML\FlowFilterCheck.txt">
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ScriptFlowFilterFunction SYSTEM "..\Include\Javascript\FlowFilterFunction.txt">

  <!ENTITY Identity "PSInvoiceImport">
  <!ENTITY c11 "Hóa đơn từ ngày">
  <!ENTITY c12 "Invoice Date from">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY ext "72">

]>

<dir table="m72$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Chọn hóa đơn" e="Select Import Purchase Invoice"></title>
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
        <![CDATA[<encrypted>+5uyFJMx17hQzWBQH2ARWqI9n+cM6vOZiGzqCgsErOx5+fI1bAf/Dpq8CFfnNdAzrB1tbHClyma2KYs1znfXLawZRNeHFMpZqwZb8/v/MaDDWsl9lPcqifLVAn6ax3OOR7BXL7sPL2GRof2EKbmk1b7fuEEOi83+sAKpAV63/x6RcROYhgeOJvE+3yaJol8ktlrsHn7/S3dlrpoPhJQZaKOCvcR0o+btC2wUSB0jE5E9TBv3zwdjg2xV5rfjcIJd9fAE8DM/J0uQISkJPByitWuVuxSMwIPUVds1KL9XYzjCh/OXxsdNf4um9eV8vKMyD9jVjTbG3KhrPer9H1MCdBfOGrZjtl9oIoBjKwBXtFxJLFYCZDFQjWThauJwieWd</encrypted>]]>&XMLFlowFilterCheck;
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
