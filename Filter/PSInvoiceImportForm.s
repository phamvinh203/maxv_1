<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PSInvoiceImport">
  <!ENTITY DetailTable "d72">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY c31 "Ngày hóa đơn">
  <!ENTITY c32 "Invoice Date">
]>

<dir table="m72$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Hóa đơn mua hàng nhập khẩu" e="Import Purchase Invoice"></title>
  <fields>
    &XMLFlowFormFields;
  </fields>

  <views>
    &XMLFlowFormViews;
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>oTtT4tY+Ot5AxJekh6lPlBOxAPZXlE1l2kXG3m1RecCBQ3Qj5GbdaRIXWoWyqkx4</encrypted>]]>&Identity;<![CDATA[<encrypted>pN/k4d0MgjXMjOekfuVgo+edgrgmDMGu/E0iZOBt2hZYTygELGNDJXgEHHaWiE+bAaqDxZWJ2HNvF9RZ/tuQb6XVig3+iAdlineSmFh3oBGwKjjxGK+K/qBclKsnVeOot6ebRhVb1djisgaNh5BviQXcCzN7EY3rq0OH0ErrPW+BVVln4SM+MrbV8t3DVjXQ2ka74NdO1iCpvHXBHkBy+HxzQ4ousbNlobivF1Oaa5BZmd5tuHmfxn5ZPKgDi3WVhV+YEDnsthjqlvCl4Do6VsJHx7GRw8ECoeyGmiHq0ETFIwsxkN6JDoX4+Ey203N0lFLANx1qKPFUNjiaJ0gEPgIF+egxZlrHnS869MZFLNnJVbm115Xv/nc/V5OP6HG6uo+3Yv4mptrLDAoxj2CEAZELW0elBEfWnpzL3yV6U1epaIAsgJU2C09C0ZcKno9Bq3IZNKS4/Ohq0trB1bfBAlNjHo/LSxszqRF9QL/ItuuxxKkxrzCY6aK0l4a0y0nu</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>XTHMBUb+WngJjGJCSfkydFPQASXS9hC+ybwWtkzJZhVDjVuToQ0H3rTZbplCkGglVN9JMV8s/bpXNwzy8CJHr3wjLpBwb5sYSZPZBvgKet4nz4bywW+0KLhZtwlwMvWj8XHap56PvQp1fV5s7WNf1aZ8JAfDWi42+YqiyrO5QCRRYprmaxSAJiATb0RQhMZOEFpoSIJt3c1/+ru8PPDrWeSYwXaeOOedR+uXYFr4xU6AiWgNmW5WTov27YQ9+LFy56dCdpH71pxr73zIGtav/sDjAfjH/fJVRBOKEddl6zGI5jeQKJKSZ6KZlsiHUhVaDFosulmlOYQ2MlH5714VD0p3p9r5jApAVOgLuRF3+o1S5dAmEAAMIvKEudlU/siIJCD4WfICTyfhRXBEZ8gW+WYV+BM16agukiis2EyvJr45l0jgsgZziAyF80iQEal5aADQJ9upeXlfs04uzRDV0aOtdnN9T1ICNjsyvtWzLqh9mZiqnG3p8UuAUAh1nIWgADyFfXzn3lSCHIT7khzmf4gJMU4qm6Gxm6fM7HGPq1YShJaVQFYrst3w2f//g2B5WPXRWrzFyBBx75UMxS7p0gBa3r+VNdksNBokZtExApzpNiZPz7Axtf61fS4B/wFlm0lP/tVcE486ngZZsdc1pw==</encrypted>]]>
    </text>
  </script>
</dir>
