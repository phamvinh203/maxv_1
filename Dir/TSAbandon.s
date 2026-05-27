<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenFixedAssetDeclarationBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetDeclarationBeforeEdit.txt">
]>

<dir table="dmcc" code="so_the_ts" order="so_the_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="khai báo thôi phân bổ" e="Tool &#38; Supply Abandonment"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l" key="status = '1'" check="1 = 1" information="so_the_ts$dmcc.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ngay_kh1" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày thôi phân bổ" e="Abandonment Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="11: [ngay_kh1].Label, [ngay_kh1]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>c4wXgVPKdLiNv3KNLgyB0waa01+lqsxEVycRjnVbW9KtF+CVbM0vy6lY1DqGrzVGqfZqVZsE1Dy2ZCDVDciOpss1UC70k24OtQVOH2pF6GDJNg6DhCIJHP6n8wpnvF9thpYr02ThPqjCgvgBfT3JFFHUDrjbT3gc7IwYs9PpZb9D7EP2N97nOOVGEPdSGlMX</encrypted>]]>&CommandWhenFixedAssetDeclarationBeforeEdit;<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh6b7AjoTAJeRjERKZlUB7ZRRi/HnNOQr0yKHqNGxp8eEQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlScs7JQbMrehkjvYbKRQ4+tj5zWSQyLO3zaXaNoCyVrC</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>
