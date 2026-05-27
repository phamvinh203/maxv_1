<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="vctdmcc1" code="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" order="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc số liệu" e="Data Filter"></title>
  <fields>
    <field name="so_the_ts" allowNulls="true">
      <header v="Mã công cụ" e="Tool &#38; Supply Code"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l" key="ma_dvcs = @@unit"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ts" allowNulls="true">
      <header v="Loại công cụ" e="Tool &#38; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai_ts%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_loai_ts%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date From"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date To"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="111: [loai_ts].Label, [loai_ts], [ten_loai_ts%l]"/>
      <item value="11-: [ngay_ct1].Label, [ngay_ct1]"/>
      <item value="11-: [ngay_ct2].Label, [ngay_ct2]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>NwoDsFm+vMmbDYJwVUApSlm6Fvh3bnLbNL8YqH3Pds3PP+YvXgXDBdhWOlwWwNoL/8VSvc89hJLRqm1F+RYYRZd8aG0D/jVW6xmSv2JD0R8wZL2073qMFly57GIE6XQVwhij7KyPSDtWs/zZea7TLbCy8ylnEB++XJh39hazPA9MltuMtsNAToiy5f0kyvigYbnXq5VVvivv1EjxEJVWM0rJG4VC5zmDvJ8hbp23+ydxUSy9+mUGS1vWOMeLDQ+97lF9j59KgJ39lyp3b7jaZEubr7U5NvWPwxYBQJI2dyCi3dX0myuOaS8umrLdii+ll1CRCXMuiY6vJbzhRTJYCahpTuzJVUtQJCQ50E68twWdmT459xxbT6sv4+dfie7/qBem7trQHI+6+WKjoXR2M8LjF5lkoDJP8TDWelQIg6GTFo7xZuCIV4wcZtZuDXi9VdjLck/iXwyElpWAoRXDgu8wwaIO3MEFspzRbX8n46zR4dEsds904RnOuNL70St3moZs6N9wnUScV8V/hZIVWPN10gOllQguLP/2L53qdB58WBJsivWmwW3Y0Gdrb0dNrGpFiA86FpeRjmWhRAKr6Lw1R9Ci1eWBBT9bs2pMyJc=</encrypted>]]>
    </text>
  </script>
</dir>
