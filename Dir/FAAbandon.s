<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenFixedAssetDeclarationBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetDeclarationBeforeEdit.txt">
]>

<dir table="dmts" code="so_the_ts" order="so_the_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="khai báo thôi khấu hao" e="Fixed Asset Abandonment"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Số thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="status = '1'" check="1 = 1" information="so_the_ts$dmts.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_kh1" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày thôi khấu hao" e="Abandonment Date"></header>
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
        <![CDATA[<encrypted>c4wXgVPKdLiNv3KNLgyB0waa01+lqsxEVycRjnVbW9KtF+CVbM0vy6lY1DqGrzVG1+3fTs46AuhraZ95EWaia02uB4rl3DRPrWS4RWbeSqXAB2ASRionypclqSJE+M23arvocjzPO5zrF1EpV9f1Nsjb4T+p6j760UVN5jnb4toHZAbhg6ouAuyYhrWCoLbj</encrypted>]]>&CommandWhenFixedAssetDeclarationBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3OqmDartyEUr3ckuJgmUD40pUbpsccuA5fVd1xrpxDOHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlScs7JQbMrehkjvYbKRQ4+tj5zWSQyLO3zaXaNoCyVrC</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>
