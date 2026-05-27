<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenFixedAssetDeclarationBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetDeclarationBeforeEdit.txt">
]>

<dir table="dmcc" code="so_the_ts" order="so_the_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="khai báo hỏng" e="Broken-down Tool &#38; Supply Declaration"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" disabled="true" inactivate="true">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l" key="status = '1'" check="1 = 1" information="so_the_ts$dmcc.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hong" type="DateTime" dataFormatString="@datetimeFormat" width="100" >
      <header v="Ngày hỏng" e="Broken Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="11-: [ngay_hong].Label, [ngay_hong]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>oG6J+8L6E2GjuYXdWvlihSLXEsjcV6Fv9+K4dTNhvANYlesFD/vrSxaBWIsVaxkdMLOL0KEe8f7blXy1etmgt3DGwrf/pSqiXBnfGO9qGxDqzZleZZ5AcsvMEtc72fvoNkaD0qGMCZrDx74siATg6CwsCFQOKLIi10HIyonoJ4wXGxMqtVCEmXAZmmcnal3z</encrypted>]]>&CommandWhenFixedAssetDeclarationBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlScs7JQbMrehkjvYbKRQ4+tj5zWSQyLO3zaXaNoCyVrC</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>
