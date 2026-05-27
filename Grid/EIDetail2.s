<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="m50$000000" code="stt_rec" order="stt_rec" type="Detail" freezeColumns="3" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="tinh_chat" width="50">
      <header v="Tính chất" e="Type"></header>
    </field>
    <field name="ten_vt" width="220">
      <header v="Tên hàng hóa, vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="50" >
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá bán nt" e="FC Sales Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thành tiền nt" e="FC COGS Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thành tiền" e="COGS Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue_suat" readOnly="true" inactivate ="true" width="80" aliasName="a" align="right">
      <header v="Thuế suất" e="Tax Rate"></header>
    </field>  
  </fields>

  <views>
    <view id="Grid">
	  <field name="tinh_chat"/>
      <field name="ten_vt"/>
      <field name="dvt"/>
	  <field name="so_luong"/>
	  <field name="gia_nt"/>
	  <field name="tien_nt"/>
	  <field name="gia"/>
	  <field name="tien"/>
	  <field name="thue_suat"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>WW4RkYL1Ae4iZ0LFICZq5X1rYaRPUxLcgxRUF2OZAqo7na+Y4e826SkEqSWkMpzeVtfafNOmCOhvdUTEqXSdxlVaKeeW7pgXl7KTSbFwUFjm4vFpZNMwIkMzMs7IMNs5</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>WW4RkYL1Ae4iZ0LFICZq5cmikuaP4/jhAuuw7/2kNXmyp0dvjcHJXYGXwna2GrlOrkFF5Bv4R+tdH+UrAnItey39O0o0KVxJVrs1u7KwOnNHA1x0pEX9LbrkAq9qbYp/</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>GRACka9yaTWOYnNPzE91yYSkgxbZaG7kQwdox27aUN/hjwhaqRMEMKYreyS6B+jf4iquBm4lDivzRqxOqSqCqWImYkd+Y7WCcSI6UnTxu401oX39krRmViQL6DXR5/ZUVM1wXybLy3zKHdNoFlKf1MobaFT5t9h4D6wTCaV07ziCMsD8sLbRr8mGreJvBD9GYSYbmk5gKfSltktQ+c0tl6L8eTswf6PG7gMQPJy7FfHK3BIQaP4PJwo+CQYEsPeACUN1vLvxZv9z4//77ySXPenaOC7JakZ+XoAWlY2KV4aB82W3alUwvOenWQrBFOJnryVc9YECHNZe5wKeJUYNylKg0VAdXVo1QSF4dAGmBpuZMJtVWvs3eylIL7npvL6Tc6xCqQVdQp6E0rFlAmpB4J6PowCQnFywTm8ELn/jD0it5ynSEH/6BR2MDuLg2CqIpM6hR27Fsfe68feVDlRPb4vNzVLvopvNJIkMZ6wbGWY=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>vKgOkVhAk9j45wSEaJaFSBuPS/08dzw5SDQNEi/Wr6SeI6ZDuDkK3aypQewqegsGwg/8Ola/RMvf6LiO90/P5o/I9B1/5UGNY8M2OcvYAkBqY/VzW44Vp7IznYfH4VQJspZYpWKwCO4DUrai0y24zldkuOPqfzYgnIUKkOlxT9glWVp2x35y+6A2fP6YXG1QdX5hRcFNngGpR6b69Q6KxA3LriPrQjN7z8k5TagaZAVdkQTrVezz+FhRw7u9B4kydaM6H93OfmlsLXYj6SFPMO8LXLXQSBBZ1NG6VgAuSdm3HYdqfBr1bnn/lu+jyFJIydRLEDIm8LMxWNgPcWHHfg==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>


</grid>