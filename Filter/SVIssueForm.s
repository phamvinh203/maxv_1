<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "SVIssue">
  <!ENTITY DetailTable "d66">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số phiếu xuất">
  <!ENTITY c22 "Pick Number">
  <!ENTITY c31 "Ngày phiếu xuất">
  <!ENTITY c32 "Pick Date">

]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Phiếu xuất bán" e="Pick List"></title>
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
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW7OQAZQhTZ998nY90ZB+2n9Oz//iYY33IoIwIoepns+M</encrypted>]]>&Identity;<![CDATA[<encrypted>AqPJ6XyLjQqlWe+QKbHbCdtzaAixVwdXzeea8b+eCIgIZ36fR/vx7ta8P4RR+eQE3ULpdOYdGxm+jxqie7ye+ktwwf1NeBA/adbaPGpbbn3rRiBVbfZ/d6ytSKj+ofl9MgQTOCwsq/J3ZQNLhUmKGXYbiQArg4pJwJx9GRd/nONocMGaELU/MT12bvDQ0/7rhxFob+BpwEaf12Elpe/9B5Zyt6MrSiinhiVkEHhrog7v25tB2NWn3L5NJCGVqfUpIBoO5t4AbRdd9cTIlAyQJkzgKlvggXB5Mm6h5oRS2LSAh1VIpKaOurrhTNsv+fDk7UOF/QF/AtfMrsk3Rpq8wIBJSfENWSoKTVf66wXNG1360+xqjqFOEJHZ5V39sXgkbtqwu8IsJvTYmM0NaoNQC3mQOo2H+TAyShL+mcF6/yAucfz5VoT+rtCGAItoBoGEgfSxEGyhvDam4QRXWvdbHMISbYpseNLVYTu7Zbq1wWa/adCaqxdY3FmpKUmeYMFsg94ENZGBs8QurhD4Z3JerVT6vlXkSY+hEgIujmcboTmjgqMhzTwWsq0nJoy/L8eUBuBrFRCYZv7u/8YCiOSD9c13RvtA9lEmY08zBBLxNAIGWk0G1ttzD48x+KqAHTso9cQfYfmbn3BY/6CPin7hb9auEy1lj8BwcLngWaRfSCyhmGvKUeHRpPx05UgmucwW8SURrgrKLBSDoY7y+Qi6YmMvv3OF2DXf9Nz4sCIflmmB+7s37TQjzIzWaVfSCwJFVcNMFNEFIacw5h9DOzAcHmWTghQKEdUi6KXJHLMopTrh7+KIHTwoYlToag19k1sE9+V+Lz2nIAVJEvcc3bkBWdozOc/2kG49Ps7VHBA0WAs4oYeLuBAbjKduqe4lLFDB</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>cyzdtGD4zlxL2gEsL/HmpyIuiBnt/7X09ZBD2H5yw52TjO3HOKihre+clY7KSJqegY5IxqHtSExBepsW3GCkobgxfb/a2LbjkmrryF5CXcBna/t2QQ98KcK7Hovp03arUyyD2obRKN3aQ71V60l3abEXGTPMtUFOVd3WkQ5vogytZ4eK1aaWFHcLMz9YXFSdT5QevS8beb83LkaMsCxgSHIuqyRoPWrSWHEnEMixrya/WbQGOJZnXWTEqTBvdYOUernd+Xt1u+/LzdFqANW/6dOpUquPYlRDLtlfw82EzpA3kNfPGwAeWzYSFpnbGbHDpQYhzinS7pcDVehPwzWLXtRlroupYTgumxWS+ZTeBeLMDu0g1L8Q5bMEPJNLpLi8N5oXY2ralFsXlvxO9zgXutUYLP7bsoChdzXRIHZgQBFJLOc8kJkbWRuvsfEPfsADLgZMPsYnP/fxWj9KfQy9WiDbzbp/XCqJ/r7nEOilzVaJC+k2TASgp3e9jtWcIfneLhixU0/a/2BIt8x6OPGkU1xHUJSX8NVaVpHhWescyNd8RP/AiWjTnGzY4ito4ac8SSTZryYlUV8uDShCSl+hedLb5ChF9L8aMoV0JBd6Rzuuz8lcqsJLK7GcZh7ZQUJLUTlGgQqY4kJcRfXEkmWn6qtVG0QpD1u0mKzfkgApLjKVmeJ13zC8yY6rEwgQg8j8NvHvsfnwmA1gj4NygAUKxHwvCG9jb8DbqxEYKOIo7YvrB7A+75kN4jh3SWuCPctIkR4oZ9wAPL8nb7aMfGzB/xekdwd9RkqSfXVLRCRF3eTIa2W8eEDuHK1KmlyWgbGmJQfpWT/M2P8t2C7K0jEz7hTKTU0hzCEWjSYoo92HspH5jyeD0YSnC80x643pHSSAmYNZIgxC7Y8G8/M2GloRCkwS3SGHcNtq3Vy5Jy5K61wSdkdFyc2fwJx99LlNbL0fBNuaKsHpk/WYNhMVGMJGRbw5zAip2OXupriTCFvsxjjiuijCIfvKj0UcHwENJKg/NCiGTK/f6eeO8hkVmTUBbkWehN/4ID8VPTmTBiw9YwqLZspSv8poHOmCu/w0fotpbQxHDnnTji6vCApF/eCabA==</encrypted>]]>
    </text>
  </script>
</dir>
