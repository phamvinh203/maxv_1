<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PSInvoiceDomestic">
  <!ENTITY DetailTable "d71">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số hóa đơn">
  <!ENTITY c22 "Invoice Number">
  <!ENTITY c31 "Ngày hóa đơn">
  <!ENTITY c32 "Invoice Date">
]>

<dir table="m71$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Hóa đơn mua hàng trong nước" e="Domestic Purchase Invoice"></title>
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
      <![CDATA[<encrypted>zI14mHQgnxDrbTsHdGJPw4zgRjzk15UkaSOloq1dU93WIzDGMYNFqFML3Leowk7N</encrypted>]]>&Identity;<![CDATA[<encrypted>pN/k4d0MgjXMjOekfuVgo+edgrgmDMGu/E0iZOBt2hZYTygELGNDJXgEHHaWiE+bAaqDxZWJ2HNvF9RZ/tuQb6XVig3+iAdlineSmFh3oBGwKjjxGK+K/qBclKsnVeOoUS7iis+5e2gwELyCgukU1cdnpLnnWy3O/IONldh0CELiJ/vSdHqSDIGTSsgBlqLjooiw8+qSQMkjYWNEjh5YAJB8ZetAW70+jzlZI9OUt+TAoksU1tygOxNZuhE72CVKTI5HPOVZr7q0EdscfeamCYyR6Jq8K2crjKCnvvlLurMstMOv/1Q6mDDhUc92BgsRJ+TkXOQ/Q1FHttzizHkt6ANUv4rQSt0bQhRdd88XZ6Ry21ufGTz/BsrVgiWzuKsgocy5uzGbi7UxjfJEtHdUfhrBmiL2qW5z1y6dYDEz12aUEXHg/gTs8QRMbcLCRwQknH7xqnDN962mWl1nKMMXuzdEcO3L7I+4A+YaA6NGdER3MMvmlfEGcRhpuUMYxfVb</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>XTHMBUb+WngJjGJCSfkydNdDqKNbqYDNNPQxj4AV5aIhNs8qhEq5upuNmG6R6y7HzpDinJrQfqIyTXPxu1oIvto1V0j96S2U+J8WIbj4OudC57iiytOgUyYNAtpoQWNOm8eDrWgJOkN1Eklvrwax6DBoAK8NDNo6tm8LSYJBMJzflKDTmd8YkmFf/2nJTFECA0xr52uBY0Hnz5i+jntXmGFcH2nLnMXwXjoViZ6h8DvYxWUJ+jRgZaiDWhkaAAbyPpo7yP1hrcaSjAGRev8qaTuMp5W5wYx5MN7ydRYi4bjYTgf/PflCEy3jfz1l8QzS5McmfKaApm7M21dyI1fBvi/Uqy7AVvFdONS6d4BVWrGVdJ4SWg1z0al6l5LuyK82euSFg219xCKaReK46IcyemnTb5BlR2F/W0yN1nWL8IzlzlBnATLxPv6huFrflW7eIqDQRAIFIceTewQ1j/CkojdKEHI/LB7iJ8zqupY4KCvZzMPagjj/zO5gQyR6KxO9WUqraaJrj1i0I7eRSn51ntfPEeZoHP0cAD1cC1YQ7aABjTOYlqW2QkeU1tiI7WnSBLfGx1kZAGUVcV5Xinpv+C9hQQSTIYSEy4WcgOjnOaFHfNkoE+mtE43vy9K410IvbUrkMz/r+DfgQZ1jLX8yJA==</encrypted>]]>
    </text>
  </script>
</dir>
