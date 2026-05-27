<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "SPInvoice">
  <!ENTITY DetailTable "d81">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY c31 "Ngày hóa đơn">
  <!ENTITY c32 "Invoice Date">
]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Hóa đơn bán hàng" e="Sales Invoice"></title>
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
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW7OQAZQhTZ998nY90ZB+2n9Oz//iYY33IoIwIoepns+M</encrypted>]]>&Identity;<![CDATA[<encrypted>D6xYIH0zVuBxkQgr+3O5jXSPP8JNkUbSsEO7Omu8+piurZPpA7ZWQ7bl0bNcEOqpziqh/F2iRAGEB35PMXD4/B01womE2G3MuxR3stGaBtVacTOuIEaQKj/jfXcMH0WEzN8mSLUnPe/mdGf9ObDqSyiJuHB6CPAP0rlgHFdbcTn4Viw3X4XxwT2FSxE+QSp91F2gTdx5FWpQt3mFoTAzYsG+goMbPsFu+RbLg2MFwdZBImJdVxhjsN89YOZ8k/2V6dxeQcOPL+PrAdIC/k3pDSnbD8vM6Zyc7MfgVgz9BxB/bu/jwIAd1c/akhXPGLAaOC8Tc9jTfeanmcsRZRVZLlouv44ckKWVS4w719yNeaGo0TcRuJHm8noRgJYaSoGsM+Q2AoBsDRcTMcDPcpLOPVFoRJGLcRe7Vweh0YAJMQyuSVeysNxyvGmOgX+BNk7eVrOBajTDY7EMdKkZmCd/zplTdpUXdqC6aXJpR5J+LBD3k98xcUA6zfQALrlgjAr9g2W7Ud5kAgBsUhMFHnyUNZz35bgJ3U7VCwyaAUxdLXvECOQFIiXqmrY55RoKXC0avsc1Ya+StjaGRkpos4ZxTA==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>zcW+l9CLUyT6V1czPfAUFpC6dzK/LxlS9baXbH96FJx92WZrewRx4leJOUdULwL/fZEyMQcy2eWdMoOrqYgBj6CBsUzPER9sUMSmvU36sMiNn2/J+7p+Zwx1h0NU67vp2WECTpWaF+Vtq6FzOOWkVP0vm5S6CAJEZYkygOwjFssUfRESERp5tgnEH+ZDE64R2jhhAGLYuz4dHx+KddzR1DncEQ7Vb0ccjDEboQpvC0FGYg5NQ6ub6XoEX8xMr9RMqDEeWtz/8ZRojf3qwOb0LooUo4YGOmP+ouPw/IJZBn27PyukIPt33fjGPBb9mBLo83i9s5tCcJO82B4QJ8inDlbhAjKdWoWh37noJAHU2Jcl70Zb6KdYAjZ8xhDId1ehL+VVQda6bBkri5oOP5b/uAlM4fQvS0mFZrz4AV6Ewruwtj24rERcokTkkq4HjKSuFnHPEqk5AI8+YwV36BossGMzJbQU5PTRmdGiaGZF6bAZDakP8s0xQ+rpzYXIPzFHmQ2i3vFQ9zoABAOeUXY4PuX7+0Wq7iutxpIVKi2duK/eVlIlv5+rd6xEaq1koo4XA7K+CDblROMkvHU/Ojv3T2EFoSltNrXkDbYM39Xl7IploNZGcXVbGBxevYo8ogtooixkKsb0CP9VSwjPCswsqHyQb7VV31LuLA4xziLrbqIhpKAhsoCJbGAlI25fsvFBhu7Ud+d7kEIfhbNhK1pbb/o2FsCmnymzCppOqGoIyP4gCtmUV1gUJ0pb2mxsbRN62TZtXrpk/LpD7ESmR6YvZmxG9po+0uuiuiv6qRiQU4DP3s3Ij2RVN8WkoOldQVQw</encrypted>]]>
    </text>
  </script>
</dir>