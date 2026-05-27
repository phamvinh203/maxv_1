<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="dmct" code="ma_ct" order="ma_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc dữ liệu" e="Voucher Information Filter"></title>
  <fields>
    <field name="ma_phan_he" onDemand="true">
      <header v="Phân hệ" e="Module"></header>
      <items style="AutoComplete" controller="Module" reference="ten_phan_he%l" key="status = '1' and loai_phan_he = '1' and wedition &lt;&gt; '9'"/>
    </field>
    <field name="ten_phan_he%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_phan_he].Label, [ma_phan_he], [ten_phan_he%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7aKcie1BCE2VvhhFSnQV2ktj8/+XxPoj1ESMgLMaKXiaUf8ZCNA3ZjfS/SFs2YiGluuzJRQrIvCo//ys6pzJ3cU=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>mDydXM+mFfsOJlYclPIGo48jWsn+wB8rqzqUiO7yPjl+HUXZ6h3PO22s6hEyYlcYfMvTWn5Cm3TqkJCdWOdcVhSZ6NTSxHcMtFfnzLe5YtDTlYXNSsIPoI3gIZ8j09naUMhnB73I+QflpVnVftxfEsxFiFslVSDcMHv1I5MVZ20dd6wdQCLm/7mURR2IR0EnIOtbiR/MjLUuX5B63C9sxEWSS2Je4j9CRyBNXAqJaoIAWcRsn7htuUa9669L+q6QbUu4N+R/pDU9LpjbICwFMRmsrAYbrfpYsJnH1P1l0BnmL8g72WKmldoVy4Kd639hBNNyWftZaaBnHUiKIDjNH8Ha9KJy/EoCd0ScZ1hHPZlcpKgspUcvHacRrV/4RQI3ausuS+b2ummvkndrw8P8n4Sr7xQkdwgCL/1oEKfn484qxn5Pj0EL2nFQv26LilgGbx+OEAshkkIzOHQbMwdK0trIdDcezV2ZbVDYwbV6BrB+wJ/PlyecKexjYNzMI9nakecucM7R52D8kFog9s8+Gy70uG7woH0ERwXKlIDdN9HRyqzRGR23Kff1lvndBSc6+LA+4CfdXsP9AktRS7YVDrc4/Y9a/4FJ0Nt8AAYr3S4=</encrypted>]]>
    </text>
  </script>
</dir>
