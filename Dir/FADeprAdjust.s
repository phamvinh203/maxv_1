<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmts">
  <!ENTITY CommandWhenFixedAssetExternalBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeEdit.txt">
]>

<dir table="ctkhts" code="so_the_ts, ma_nv, ky, nam, ma_bp" order="so_the_ts, ma_nv, ky, nam, ma_bp" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="điều chỉnh khấu hao tháng" e="Adjust Monthly Depreciation"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" dataFormatString="@upperCaseFormat" disabled="true">
      <header v="Số thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" information="so_the_ts$dmts.ten_ts%l"/>
    </field>
    <field name="sua_kh" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sửa khấu hao" e="Edit"></header>
      <footer v="1 - Sửa, 0 - Không sửa" e="1 - Edit, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_nv" isPrimaryKey="true" disabled="true">
      <header v="Nguồn vốn" e="Capital"></header>
      <items style="AutoComplete" controller="Capital" reference="ten_nv%l" information="ma_nv$dmnv.ten_nv%l"/>
    </field>
    <field name="ten_nv%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" dataFormatString="#0" disabled="true">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" dataFormatString="###0" disabled="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_nt" clientDefault="Default" disabled="true">
      <header v="Mã nt" e="FC Code"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" disabled="true">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa43NMG/o0uHDHrdoPJRjru50oNrL0DSzxEj9dkX2Ygw9RNped6Fwr4o1EsRpqpaVMig==</encrypted>]]></clientScript>
    </field>

    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Gt đã khấu hao nt" e="FC Accumulated Depr."></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Gt còn lại nt" e="FC Current Value"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Gt khấu hao kỳ nt" e="FC Monthly Depr."></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa43NMG/o0uHDHrdoPJRjru50oNrL0DSzxEj9dkX2Ygw9RNped6Fwr4o1EsRpqpaVMig==</encrypted>]]></clientScript>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Gt đã khấu hao" e="Accumulated Depr."></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Gt còn lại" e="Current Value"></header>
      <items style="Numeric"></items>
    </field>

    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default">
      <header v="Gt khấu hao kỳ" e="Monthly Depr."></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa43NMG/o0uHDHrdoPJRjru50oNrL0DSzxEj9dkX2Ygw9RNped6Fwr4o1EsRpqpaVMig==</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 20, 40, 110, 120, 100, 0"/>
      <item value="1100100: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="11-----: [ky].Label, [ky]"/>
      <item value="11-----: [nam].Label, [nam]"/>

      <item value="1100100: [ma_nv].Label, [ma_nv], [ten_nv%l]"/>
      <item value="1110000: [sua_kh].Label, [sua_kh], [sua_kh].Description"/>
      <item value="1100100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1100-1-: [ty_gia].Label, [ty_gia], [ma_bp]"/>

      <item value="1100-11: [nguyen_gia_nt].Label, [nguyen_gia_nt], [nguyen_gia].Label, [nguyen_gia]"/>
      <item value="1100-11: [gt_kh_ky_nt].Label, [gt_kh_ky_nt], [gt_kh_ky].Label, [gt_kh_ky]"/>
      <item value="1100-11: [gt_da_kh_nt].Label, [gt_da_kh_nt], [gt_da_kh].Label, [gt_da_kh]"/>
      <item value="1100-11: [gt_cl_nt].Label, [gt_cl_nt], [gt_cl].Label, [gt_cl]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>LzVjEVIHqK5wgNGhwGOmdLhEY5Ra/83dHYf4isoSLz2SceGvgDy4KGCyQeHZnBSAaO7USI6bms8gb/h9FUOyrYt8ClonMI3OCxqHtwzB1LjA2Sjt8xBLlsolkFxx7pFnBbfihIFeNOXB6Gx+M5JIBqKpXkFYWqTCqPl/fFo8tN4t7YIEbBRkWRgRqIKXyftCa/sqlTrUciVXeeKutHwUM81ksyTPg19FKZqxSR4nQBs=</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>IOuC2P6aRAZwvU9kfpcBT8dU4TpyGkOPHn9x2LFcTpjxmKjIdVBihWf24p/wIXe0pYkpcMqr4b/vsikeNuVM0liq3h6UI791JgYwlwJ3lkqcYiPfKvpV27sqXT2Zg/oh4uVem6pLRrXvoLuODq14aqN6KzUsLUGnxAWlOuW7AlI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>CsP4SRprmbYlqCT75iSMAwnVQ8oUTcRSv4TDQAPEiJYiRqjbKRtdi/r+anT1tyxlRtnFgGSrOw0kL1D59Jvg97G4IuN1Tpzto0wlN5Wuqf8xFyBPXpKRoGd3nCs6x9Pao+wSRg0WPX78v5nEzrSxvgH71ipSDxkZvNPt1IHX45bFVTGrYfGJU3meBQcUH67T0IIm5b+5eNYzGZ6FDvcl3+/+4RlJ4yCO3GLVvaBTErlXZwBOobXe/MS2KOkZDu9APGNynUxbquqXWdVcP945wbbzJBcAIbtEDe1KlkQ3hWC8Ypi16z/TvFl2iLtbcvncgC2SULzR1plPPPkCh0o1eJJL3BAKlzRg4W2Ek5k2iVDjHptUw8VrzM9VKquE/7Y5lPkLUOnAZV9sqJPd4L8wDwoBhVAn4co0C+9ogk3ajpDgAnr7jEIw0alJowJaAQ0SeCyZz9e0pxVl728hf6AAOBXc/3hLUeeAbsjMx/pMZ+lm5MgBkknSp4yDUbwkmzI0HaK8lgD0jwA/0CqYLp2kE0GhGhqJ2W2p6sgIl+gdQ/mYGZKaQ3zU8ZotbVelBq1ZJJg80KQBb736GmcxUqj6PdQY1tfrC2XNWkk+dvt4mv41x5VQyQ6Zm5d4QIBnJXOjzjx0hk+dhvNKuKP4PR+gQA==</encrypted>]]>
    </text>
  </script>

</dir>
