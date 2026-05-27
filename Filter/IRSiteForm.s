<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "IRSite">
  <!ENTITY DetailTable "d59">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Receipt Date">
]>

<dir table="m59$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Phiếu nhập mua hàng" e="Purchase Receipt"></title>
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
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW7OQAZQhTZ998nY90ZB+2n9Oz//iYY33IoIwIoepns+M</encrypted>]]>&Identity;<![CDATA[<encrypted>DDW0+Db82hbRCMM/h4i04ROZQ1Lsj6gCyUB6AlFfzCWaGzdPiXDy14dcgwA6h4vYm113tvP+wY+pSB2RiyiFc5X5mPdmsa3p5z8vvZIM58TUH1/DwZh7Hm5g/H158STuYK/rUaPUvc+MTFpWA7fbZFFvgImklTLOYPznKlbRggWk5/M4obwt9a7gwyC/anpNcojo9LLlLEPkszjm4JnccD459Hbj+gwe8A9ofqtyVnKoSRHnOtDcab4+Iq5NJEd7NAEN943YELvJSJw2s54lrdIbC/drdjoOd7vSDy6bZ6Zw1/EaiZ6etSM8OgPtMjIDULSeGj6hXCyCFlG7JwOtIOuhB3LIUGkj8sohOxQaCVMXmsMWEgzjcuPSufDaIk++B662rhYFxC9XRrqnyzqpTL2oT02q9E7QlSGgXRJMHQG0VE36Iv5VrkDV7a7x80Sc4tIM+7+rBeK+xzGJPt+tzclb6QTYWAWqVW8o54FCHVe2PnEwjmTlIz0Gx8iTUd2V</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>rR18LST0RV5fHrwFGe3pijCRs9QS2bci4ItRMcLKpMgHh531Y7acSC7p6sOuG2D+76NSOeopAqSCYBOm9yYlKq5/KL6r0Nc6zCADNbrROaJ4NPKwzamnpmgVNJMAr9h3QoZ0VRu7bvMtLpsyMfYqe8W1mvL5TVTBcS/+kkLbHl9FQkdKFFWTSmgcxhmjbUDJXwcr4dM9TUQVEP9nmnKp2gOurJuTebZ82DgL+Vi6SQmr4+QNwouaR1FqaKijkQ50VXMDWAM1lthfrOdNZUXnCqRiTGIRlmOFnEqwS/tQ8DtupFOuMydVj+kzSv7HkzIwwIWhOvPBEjwlwIuqinjzRdc1o+oShjEkprH/pHsEkD5e85Lm/8+CULAz9C2FZ3jIcemD/Li7WoMO+bWWAAZ0v320nzwXXEvQuWa5ElZpvR/WX/gGj20ixctVbd9pGLV+8glxcXRH+V/8hUp7lvCJQfkwTyhpW3oIlck55pbkPBu/qqcIQDPhe+0nsufSDmuxpvLOVPcE7sxnpZBX3ZoxjobEgmO/6BJSn00fFDgiWSwbvcNcbWJDGW/yyaFuv5WstXI2qPVy3ViYG7mX3b47cg==</encrypted>]]>
    </text>
  </script>
</dir>
