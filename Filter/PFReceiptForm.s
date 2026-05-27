<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PFReceipt">
  <!ENTITY DetailTable "d73">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Receipt Date">
]>

<dir table="m73$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Phiếu nhập" e="Purchase Receipt"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>


  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW7OQAZQhTZ998nY90ZB+2n9Oz//iYY33IoIwIoepns+M</encrypted>]]>&Identity;<![CDATA[<encrypted>3KXTCy6Eyper5JmoTDYrSnAVh/h72sIRPZLOcUukMDMuspliorFwjYare9v7AEkE936HYC1VZ6r+N3uvcGutfmY9aFNOWjPxkYAkgy4DpxkfkmnF8knxvTvHSPO47/9ZmQHo+JBIoxoxbY7iEaLqPHBxGLd4AAF3idC8843nBhZmP4DIGNvyKK2kXkETtePgQzdzAXFeoZdoCbsAMaM0vD2rs+s9Mnmu9u51ZFqSUiGh3xSfX/p5w8K71dt1IN4KoFUn+Xz4pRDmSkM5FkJ7nkEINP/+o9uMi8Ptr8jCUCGakHsHdzLDua5um3CNj1oZyhxTGfcEJY0ayen/UyMNJV51Pvw6/VojR9vqvLQhrehGGAgs50MljPV4deIjb1/CQyTPV7DsOyTTNaaEFQWkU6nZ+xPKhTeIPa33OFyxeSW3fFJWYkCMkp/HFuINKrLfWOmat4Dz9k3u1paTxC9ggYM2aEx2fNTDLu06AF7mqcw=</encrypted>]]>
    </text>
  </script>
</dir>