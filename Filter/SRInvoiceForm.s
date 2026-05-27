<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "SRInvoice">
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
<command event="Created">
  <text>
    <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SN0UN3w1cDWrLJM1eK2lupn3N3nlNR8V8Y64QrcGzW4</encrypted>]]>&Identity;<![CDATA[<encrypted>KuV0B2/FNd/lMUhLG/kMQgnfR2n5EqHoAl+WAtg6tnxwJYPhKuutGshK6JnqxHjWWYUUHNe8EzAtxTeJ1VNQAw==</encrypted>]]>
  </text>
</command>
<command event="Loading">
  <text>
    <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Ub/rydLvKFZDMPY1RJY0L8KyO8SSFX+335uEiJnm2Ji</encrypted>]]>&Identity;<![CDATA[<encrypted>KuV0B2/FNd/lMUhLG/kMQgnfR2n5EqHoAl+WAtg6tnxwJYPhKuutGshK6JnqxHjWWYUUHNe8EzAtxTeJ1VNQAw==</encrypted>]]>
  </text>
</command>
	
<command event="Closing">
  <text>
    <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7RrLvJfo2uGnts+5rTaC80yAz2ndUAGkMc0o7w7pQsEu</encrypted>]]>&Identity;<![CDATA[<encrypted>KuV0B2/FNd/lMUhLG/kMQgnfR2n5EqHoAl+WAtg6tnxwJYPhKuutGshK6JnqxHjWWYUUHNe8EzAtxTeJ1VNQAw==</encrypted>]]>
  </text>
</command>
  </commands>

  <script>
    <text>
      &ScriptFlowFormFunction;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW7OQAZQhTZ998nY90ZB+2n9Oz//iYY33IoIwIoepns+M</encrypted>]]>&Identity;<![CDATA[<encrypted>hL5ncN4+u+LDFSR+jeruKeUKcQDjwjB4iYUzJdclH3FPoF9Do8hwgHCWmNYJ7/rz1Vbn0PZaCgkS6jMFTrQdgzER1FbJzduye5eIE7LoA6cCJznMCPG8zR4NUMrLSgjj/Q8gqYrN053z5tnXK7Peq5avF6kykpwUzBW6DBvRJYPFTz3FEGTrVHOpLjvfaDxrdNnCyZIHJnesr41ljGY3jcyI/7W9pHlEfIwUkHiM1Q2cjqx5i3hQZsGheNFumpkMU7VtX8q7e2r1rnVER+Q0m0UlCS4Af58NmZjbdE0xm8EUvdcoy/5y7Q6VUk9+W4EgOoneicd+4f4zn8QBjeaPkaDfFIenqQm8dk0IuoVzXkezALkpv4S2J20VG58irvoISzrOr5hwUybpVZi1/S4CiI/AQzT3FrapXZziSb6X41qNSUELBrbYPvOsmY5lbyaAP37mT0srNWV3Oi+d1IyFOSH5u626eq51vx8t3A3wntwRC2BcbTWWycMmsV2Inx3KWjXMLTbzIH4fglyQ6it1ixePcysY/1FxAUC5Xb8CHC0=</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>Dsi7/u4iXG1DL6UFC5lhQMwHRVpxU/HLtcjT/TgBtaUinMTNDff35BhgqHjzkgoSeRQbi/MUHMbpmUR7jkF+bp8cteB1nw0jbjMGMMRbjgIMSjF0Kx8ektknCYaCQ41e1DGeVyWIZUl75L99Jg193eAUXceWl7O8NT7Qe+vWLg467+iss9VMJG75MSAMIK26n9TQakUid086rxawSalAsZfRdtS81uVqQODx8LOFxnRD/dQmAULpAXK51xp8XT5iQlzL92VQeC92EW3b8Yujlbq5Cb/NZqd454pmTWFGm9ZHYY0KIrtjKwjeJnxxmqXNBeCqZXIoLP88HEpfBKd9yvabZf14I0sqULPqSM5TzQ/UHMUGtSfdb/jX8rtqm9JZReoXqYgau4FiHuUqAF6L3yNNr+GGMZlgaFMSUbWuAlkVnJBAFZM2Pf/d2gtSLLRb/MK640bu7OunSqcSLy2k1ZjR4tHkzHFoOZaZHrUkNzZdqyG8aloOv5Qq6qf3mFoBGVlGKHo0PN7R59CUzobvtOdA/T5AzWWkmjanrk3irkTVd9owK2DPXV3kY46M5Hsk+UNaLqPaT8DXdplJvCEnhUw/Fv/0GYOfF1fZAlZEzDmWxmJastpCRU1gT1kaNhvW9VqG1kQDbuhLp3p3U7JilBt1/7oUdZX/IrnktFqMpX3sG3A44PoYblnMcsYWhqj8JjXAg3NxFoo0OOc7/v8scT+2W+QtDyC341zS00Fbnqxcou71Z+CABLyVrGLxQsENuPR7WaKTLzcsLpeVfYUMlZ6vqBbDHOtr/755uD6V73Wil9kNjkb832i+PWPYVKoBLKNf9YzdjBoYIkP5Z0gOUA==</encrypted>]]>
    </text>
  </script>
</dir>