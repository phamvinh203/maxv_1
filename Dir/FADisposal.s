<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenFixedAssetDeclarationBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetDeclarationBeforeEdit.txt">
]>

<dir table="dmts" code="so_the_ts" order="so_the_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="khai báo giảm" e="Fixed Asset Disposal"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Số thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="status = '1'" check="1 = 1" information="so_the_ts$dmts.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_giam_ts">
      <header v="Mã giảm" e="Disposal Reason"></header>
      <items style="AutoComplete" controller="FAAcquisition" reference="ten_tg_ts%l" key="loai_tg_ts = '2'" information="ma_tg_ts$dmtgts.ten_tg_ts%l"/>
    </field>
    <field name="ten_tg_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_giam" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày giảm tài sản" e="Disposal Date"></header>
    </field>
    <field name="so_ct_giam" align="right" dataFormatString="@upperCaseFormat">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ly_do_giam" >
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="111: [ma_giam_ts].Label, [ma_giam_ts],[ten_tg_ts%l]"/>
      <item value="11: [ngay_giam].Label, [ngay_giam]"/>
      <item value="11: [so_ct_giam].Label, [so_ct_giam]"/>
      <item value="110: [ly_do_giam].Label, [ly_do_giam]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>dcjwf6tOmaA+XPKwpo/JSS3HAg8tI6l+nN4ktqyHo6iuo4uf5bUlgBvVko96spKPyJ4MCHY51OEORefVyE3psdTCeE3I2VNmxSbfbv+yhtmLPXeKaUyVRL2amn3Wfnj6hYKo55dk/rGCYfOx6zme/p1icy3HTf3/nUWtDPx3iCVTkOd1JCtk+QTfWgGTk4BK</encrypted>]]>&CommandWhenFixedAssetDeclarationBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILYPr/596yWEjy+wYmLOwbqcLr0EO2PcxdV/HRNd+7H0t</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>
