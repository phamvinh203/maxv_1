<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
  <!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
  <!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

  <!ENTITY Identity "PVReceipt">
  <!ENTITY DetailTable "d96">
  <!ENTITY c11 "Mã ncc">
  <!ENTITY c12 "Supplier">
  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
  <!ENTITY c31 "Ngày phiếu nhập">
  <!ENTITY c32 "Receipt Date">
]>

<dir table="m96$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
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
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW7OQAZQhTZ998nY90ZB+2n9Oz//iYY33IoIwIoepns+M</encrypted>]]>&Identity;<![CDATA[<encrypted>mMkfIKD3A70Y1Jx8+m9yxuwFNFHcSeMyKU+rxkBbAm9ZTsaJZKI3yJ5uvR74QSpL+Ir6LY1E9UFQl4sV5MBZHU2VkAKnEmqrOsoAvwp3RInBKE5dUexq0YboZ9Wxgr/fuMH45wV18Y48tECxONQvKU/azvWvXD9XMud4YN64PD0CakVbhdpMp7vi29jU0ZNb265es00a0gT9qRxr+X8jhhoeH8C+VMOFAUHJ60IjI3KWnE/9WeJFiKMh/g6GQ1hRNZxMRD0AFaNjHjenwlo/veglf9DjNTJ2rmkjgwHMFOvMeVyxHuSDUykt2LNplXTyPQ6L94PgMaIIkpiAhzPuj579g7BUMgVVPuvZbWcq0jSQ67DqAdIO4I+K4ngazeymmTkVXscXL6ZG+j3QkEFAlv/oMd41cdVU9s2h7kylpydW4r5q3vAPbeCSuaZe52UaAW6PF29iyI6dmWhQhtJ5g5hgi25kcjAY7ekAbi94v2w=</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>BxgBC2jnqdzVE0cP/T86MC8qveh2Fd10NOnvDkfpIDaSRmW7bQ3hUcstvC8ANkT+U8CsPpPP3E4/NeG+BpuTU3WhnI+b/MkaSVqn+hAp2rVW2REZEd93xIb9+ZmxAa4wI01hGLOGej3kM/3/u+OuyTNiBgZEyxhQCsmADp8qTQbkgnWfKo6X6E/ESCSbhAS4KMVOYN8FRWtJNx9Nz+UfvS5e69sK6MMv7r+Lpxi3eyDI3wM6uFEs0+iDj2Hqs+RNvuti+KIe4FB4K95+H/36jdU7ZQ4zTb5ymprOMeUaQkqqZnGiYJBsxx5poAPbZZ40FTj3h+1sAvaEpX9GMmS2k5hPhR2HK71R8L5SW3sxVJOWdolx2XJrYmKZmtL8ARsSH2kb/iBz2oAsKniTmLA/OW4aW60eW0I777B2Xac2WXOHVm4VSnKbpZM84ou3LErbffLdLuj3Vt0poMRBZ90lED7rIXhx2JP9eBOcm5CL5LXEqcTx8n+C9WpQp5oFK5HSHGx+7jTJACjB3n+2BY8FQt6dLcZXYkiMpaYPOSETm4MBhRHfGt3IQXSJ4JC2JoQ86cCr/axSBs5jxdwYfntwlSxGJwhCv523/11QiA18sossg2lFx9nIw2bmn+tRxFJ0</encrypted>]]>
    </text>
  </script>
</dir>
