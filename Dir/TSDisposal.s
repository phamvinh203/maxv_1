<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenFixedAssetDeclarationBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetDeclarationBeforeEdit.txt">
]>

<dir table="dmcc" code="so_the_ts" order="so_the_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="khai báo giảm CCDC" e="Tool &#38; Supply Disposal"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="status = '1'" check="1 = 1" information="so_the_ts$dmcc.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_giam_ts">
      <header v="Mã giảm" e="Disposal Reason"></header>
      <items style="AutoComplete" controller="TSAcquisition" reference="ten_tg_ts%l" key="loai_tg_ts = '2'" information="ma_tg_ts$dmtgcc.ten_tg_ts%l"/>
    </field>
    <field name="ten_tg_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_giam" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày giảm công cụ" e="Disposal Date"></header>
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
        <![CDATA[<encrypted>2gVmOKjnANzO1WWY/XHyckJ+Qq1RTmRexQcBiNvg441TL8ick8BRaxg6ogVz35D/H0CeJ7sZEixxaXRrKZBYiYXyKuh+krn1NcnNOK+CPpkP3J53aVsxVJwYGps+YIVsoA/liyJAy/DrgZMnH2DOH2qBuNnmHxciqW7NGLmkDpicDvo6+GZHpnL5Iax7mkd6</encrypted>]]>&CommandWhenFixedAssetDeclarationBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILYPr/596yWEjy+wYmLOwbqfTZjqbhVmBcxLKNNS9PNf7</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>
