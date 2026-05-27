<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
]>

<dir table="m73$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Chọn phiếu nhập" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Phiếu nhập từ ngày" e="Date From"></header>
      <footer v="Ngày nhập từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Phiếu nhập đến ngày" e="Date to"></header>
    </field>
    <field name="loai" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Hóa đơn trong nước, 2 - Nhập khẩu, 3 - Khác" e="1 - Domestic Invoice, 2 - Import, 3 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" filterSource="master" allowNulls="false" operation="10">
      <header v="Mã NCC" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="Số phiếu nhập" e="Receipt Number"></header>
      <items style="AutoComplete" controller="PFInvoiceLookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 35, 75, 100, 230"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11100: [loai].Label, [loai], [loai].Description"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<encrypted>if0prz2qPlVmiNJorsvlV0ZxbLQSHA0zCJcBavL72vKXTxzOesuKu1vKcp+ocCtOgppg3TPx80xT2u8KKY/BgVRm+CXRlfsEwICvdcZGI4vSZ8iRUMswdM50hcgPN9zF</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>yBL9zUph3JYfUoL0FYoRbqz0JRZm+emYReBMZwQiZIjIOPTDhh9ucfxdyWvO74nq8jCWo64p0tUbCuJuRtlFJ8o+ONU4eg8y5m2VWgLhXRVeCjqt7tNvmko+BVFwJPzo</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>yBL9zUph3JYfUoL0FYoRbrVlgwsSQoVW3htO4mDTHmgRfVI33oa6JfPXXVvrI+jxH4J13XjLdHbk0E/2sX8YVPEznAKNV90YATQnV5/UnYDZOMR3sOlgLpEDERCsEhXF</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>ZteOMoH4NHBpcwWO9OeVnjobKhRkMm6CXRP4qlMORwI5qU8Tj4rZ6uRa93JFQnX+7CPm9lmfx3VwU2sYY9bItRf5n0W+N3a7SUvJYE2fWlufGsO3MxyWWrIin4c016aKqMxL7iVGKXY4s6/2yJ2IM3Zg0GIr4NBtwd1fO8EHtTbTrvHxKEjDQr0Se5HcLSW6GNxVMeGdiYcVzqkx9+4R/aRTRSoTN087IBPS1xVmc0UOovFtKWQXttQZCK7MjKT+4ClxopzHL8JbREP2ji7u1pkAUOHeWkPQ+rqcjDiGI/UlQZ0dz1K3Zp8/z+yDCdPg20xk/dfRP7ynGMD20Hn60k7ptEqXUg5kNBTLxFla2XNTLa68/sSTWAtSs7aE71OWMmwmCNPtTJRu4k0TRSDVyRVazq3AL+SDFHBTww7X8UO1m04+0wlW2q/tImciw/QcbSrA9MmmZ6y9GgZdY5mW/t2dnhsDCVYtkE4qIa1/aR3bphmZlPRzkRAiaXJq8PUtHYjf7s7LxRVfyj8fUIGgBpUL95MWjxranUT67nbR5NOHWtlCtm5UYr+IkMzpTbOYLYkmhQn8Vun9TtUdp9Zc3YrMqbIRekLhCBVDBEM2tTBhGiuDvjNtUzLdPAKAzzypdzqOtOIeSlQsaAXkU935KLOLLEsdr+RaOWcpIba0j284CGHHJMVGeEaI8krHvT7IfFo8CmFq3UkiZqH7HbGJomXwV0oUWSGffxirUWPQhtxzy4VhTfg8l9B5OMh3JoObj1eug7YZasbjx04DxPwTyiD1zhEYPQ5z3Dnhp32QMEauxqyRVBs157SdzhPEOh5skfK4cPEGccWOhffRkN8QVhPc5pMwHx5mnuxIjYJFz6y9bLPSogOyrhQOZcnMFvrbo3mWQU5n72dJrqHQZT5zvy703qApeEtuVczjlqvRmNGr83i6lTeqxOAAi5j7rLuPTUtVEZqNzxF9v8td5//VFlcb3XmFpd4a1fSt+0bnfACqxzjU9PdAgOpSMW4/x9r1Ylntzozzd1DW0qK566PmMlRoGQW70nad1tVF2cjJ63jYP+vSLFV2u+6JA6YzNewKMlwR7sG/CiQoMwShyZc2PA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>HkSVz4JnaS1y83KZ71UlfruzKIihZc9PQqucb4TglBPEryR7zyCcvV9Rjp8JWZZ0X2F3+LdMznpLfTEalJVqUpHG0gPX5J9PYyQKtcQhmxfob/FOpxG+vwZk/ysb3Q7Xk6Ib1TtCmIMvESxTRNBoMDWaoUkdAko5NmkY808Y31CEYiV0rYqKhl+iU0+SlRFx6TrxY9NdkifyGQh51biUwWp2ITdr4XnSBXOYbOHONU3bsgMgeg86K6/harzd+0imdCKgAzcOYqnOoLL321rVtNI53MkxMOBqUK9T22vo1r1RMnDt8ABgjMG/Or3t1BjmVI9jnQOb3UHRb1xS68ojRuinmIJsxU1nbmaqBgn5bme/cDxpsBtzMeIx1mkPktCesQmTloXlY42bHd5iY0ErQT/fTUtuq7Qy29lhhe1uMdx5qTwYiA0SaiDZ9IK51boMWdVc67afNQhwP7ZNLyLLWbLjWcY2sEgnG+wSGGIHY7LHnMzP5pAdXjkUPI5538zbjlf7smBG0ql8pqMpdyHKvSzFolu5R9LF1nEmuOoTvFi8h/ckwYmHzc/xqBEPl8mVkGucrcCnJeEcXbx/Dulpr3gwJneVEKifZWgY5bVcwWHl043KRuQvRErVi+u4XUAwxi9imvRqCEAl9zzH9buR3X6BOXVM8UpwOpAFeFrogDvn/gX8yK1PtYVpn6ilFR+pPJGJyRX88ItgYC5K9DY4jR+5MFTtu6ppBqnFwYkqlz4=</encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>
