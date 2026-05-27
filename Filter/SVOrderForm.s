<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "SVOrder">
  <!ENTITY DetailTable "d64">
  <!ENTITY c11 "Mã khách">
  <!ENTITY c12 "Customer">
  <!ENTITY c21 "Số đơn hàng">
  <!ENTITY c22 "Order Number">
  <!ENTITY c31 "Ngày đơn hàng">
  <!ENTITY c32 "Order Date">

]>

<dir table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Đơn hàng bán/Hợp đồng" e="Sales Order/Contract"></title>
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
    <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW7OQAZQhTZ998nY90ZB+2n9Oz//iYY33IoIwIoepns+M</encrypted>]]>&Identity;<![CDATA[<encrypted>C+rCPuiEOwlj5/6/LhgPPeRi50Drc22lXNb8v7FyghqZEXs/QiqfwkTsXLINNH9lCts+oVGwRzERW6OMJADQy8zNKL0GvO4kkKRNN+1CLZUI8PhExfVT02EpinI8nWICc07W6XecHv7lP3TFBBaN3ADEYrqCfh89skpRvr4SjjSRYIxTjvAQtUtN4CVegBskgoBV20qaWqxRPeVbleLxFRzBZLs/c+G3zUXAYg7f2IJLsB54KK5vpwI9+GE7lKq9+PXgpyvmDNogjBhHkyYLxYIZKof6/NA87/NdNc+MIyjkNfdmJFrH3YPj6eGb8u5BePa7UvtI4PYaW1yPGqmq4fZxt2ijgmXKx0Him/Bu0SEBQ/fVxeM1mar8A05yCW0ukcfIKqDSc7w/+6LGG+Ho9ajJh4kvKVeSS9V8y6idh0yxxu9vHkFMtnX8XpREZ4iGvWbcQFRaEzWGKZ7rULs3Nu37hxbJMFtwaNJKj28AoITdkiC/pFXpekANuZAZuBzzzGwdbfEXKX4pgj5VeL76YJUuE44PA+JDgws0K15gtoQjgpKsBzQTnaeXcxUaUKV9ADBU5zkLex7ZUuicwcJQGUc55nt9GhrJwKKY2rWcT7DZDKbGAwsFvf3LiYy0tAVSlFbyRFbl8LqULZrrrPzNkADR078wpZVRRoh+B8sg/V0OfxDOZoSddOxoNF2HiFhXs7ilKw4BMZv91mtMn5wvehRaLQKZ1Gy2RAY38DS72pDBDKlrWIR7p3KTRjQb49S8wOkfcT3oFYHlj/CH2AJanRVZvQQADXPd2S7Y7AAFsrE8McCnaAx+mcaXTDIZFHHDQ8J/XXwox4vwgi94xXBOsqffMmg6qeGcR3SbHSAz3pXmdF97zuyK+EV4YDkrLanSf9FwVQbCbdTXAc35EXik5Q==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>1p4skvXx/atROrKodQUiSPG2OzjV0hbBDRpgjobANi9a3caKzxvRDJCyA7ChINmVhp+x390nXetz443W6SDOurXuXm/Ny4GrVvDtv2W8KFlbokkhmCvjBiYtrR8oqePcEch4t+7P2SgDXFMBt48vYDwPI0UBYGr3Zyy+HWaWgXj12OGdFZjkr9Ynw9c16avzi5qmX/37st802V57ZHFqYEMfV57oTs5jdWT7z195OHtv2PFM9qvz4OVcggsgMR3tQLcvfqMRiRtdTOT/6LB81fryzU72Tp/VAIQ6I8XNMdxSDLI78i19TFUAwVaMPjjw4rLBUgWpdNzl2mD18kiIMwIudiv0lIIPrYlHnglyaW/K1GRQPOSwOl/9ObJewI/cbZiSeAkjgYugcYwZXby820wm/5HqTqzzwzuWJCsmowMF2rgKbhoTsFyGRAlzwkcqO88IZ2Npgr9PYVMF3qYphpQ8oDrheWHrUYJU10ZWY1ycxvV0kLy0cwLQ0hDw4B2LwfVqfiF7TrOwlMWxbhX8OrTV58yFJTCcZKNILOooPt4BXEPLtlyORCzJJjg2rIHtEmVmlFbqUb8FeSMylYP8oWtv+zw9ziKPegS+r206CqhipIyZV2pHDdwbykwHooC8Mf8/LXdb+S7W0pQMC7vIUGcSELJ/rHEODOfoCsADEhy50Ur8kDgdhbsb5+TwvjcdRefWWSpoyYTohdhGlKx1gOUmFKwfAeKMGI37cIe1uK4hxoGgPD7r9GGf/+V+HZcAZSu0EUPeh/pnrHiSmCd/95cU0bKEd/aIMcTUm9fJVzgQhIGBvkbG7NsTS2mCjpD7qnoBoPAAEu5ewmZw5sfAdm97nnNucc3lsTbDahT0naxH6jd9wjO5SIoPwDaLQKeYum2a8L7K9Brs1biYkGVCVxvyA4Xs4ywJJoSGGpF8B0075AD1Lep/CR3dzlL2y3yUKpwLh3kZ7rD6H3iAR92YWavy+FMQG9bqVEDZMFPFnx/RF5nsuB4tf1vYNjaOLds7i1N15eOnCj+gcMfyYrvk/o5UwoQy2kuVCaGyS8BNx8kAVZ+fpyubJR4sGa5vcxps</encrypted>]]>
    </text>
  </script>
</dir>
