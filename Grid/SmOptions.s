<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY FilterCheckEdition "wedition &lt;&gt; '9'">
]>
<grid table="voptions" code="name" order="ma_phan_he, stt" filter="&FilterCheckEdition;" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="Tham số tùy chọn" e="Optional Parameters"></title>
  <subTitle v="Mã phân hệ: %s1 - %s2" e="Module: %s1 - %s2"></subTitle>
  <fields>
    <field name="name" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_phan_he" width="100" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Phân hệ" e="Module"></header>
    </field>
    <field name="stt" type="Decimal" width="60" allowFilter="true" allowSorting="true" readOnly="true" hidden="true" external="true">
      <header v="Stt" e="Order"></header>
      <items style="Numeric"></items>
    </field>
    <field name="descript%l" width="450" readOnly="true" external="true" allowFilter="true" allowSorting="true">
      <header v="Tham số" e="Parameter"></header>
    </field>
    <field name="val_view%l" width="450" readOnly="true" external="true" allowFilter="true" allowSorting="true">
      <header v="Giá trị" e="Value"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="name"/>
      <field name="ma_phan_he"/>
      <field name="stt"/>
      <field name="descript%l"/>
      <field name="val_view%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXIosa+IfEiHkJbaJnM4YVbUErsvkxN+O6xmLmqdOfyrVnb5+EHapkJrxDW1ULkmeY</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kmNVlJ8qAE598VP3aFNhL5VoHklzLtL4k9lfjKCXnnw813m44mPsv5Q20+0q5pw1W+1WMCDy5RZrSCUTpj92sHQ=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>6e3/jembAF60O4bSzLXEziTHbxFAWLYIfU8HIlaHJtoUr7ap2AXEmfqNiEtTHQJv+SLweFAzmil4aVx7H8nNLVNCvzY9qtxvypgw7VQjr8kF7DCr5DlWryqbnChWXsSsPj27VUK6PRC9kN8sNpdH9gUSEQcmGVahYaraH6M1/NvXUyhorOHfp0QQCQAMBFiod/ttY9BzdDoMEo1+AV1e8+u2WvbDCYSL+r9haUC3LiD72ohZJfIIFmop9YOIea+EkiT5XvyqHL55pNsLLY5YHHHkDHCVqz+ubmtruOYTDQk=</encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Edit">
      <title v="Khai báo" e="Edit"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
  </toolbar>
</grid>
