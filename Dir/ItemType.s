<?xml version="1.0" encoding="utf-8"?>
<dir table="dmloaivt" code="ma_loai_vt" order="ma_loai_vt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="loại vật tư" e="Item Type"></title>
  <fields>
    <field name="ma_loai_vt" isPrimaryKey="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Mã loại" e="Type Code"></header>
    </field>
    <field name="ten_loai_vt" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai_vt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="11: [ma_loai_vt].Label, [ma_loai_vt]"/>
      <item value="110: [ten_loai_vt].Label, [ten_loai_vt]"/>
      <item value="110: [ten_loai_vt2].Label, [ten_loai_vt2]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kpdyH/EzgLuGeQik5SsePbNBF+O3ZHO2qdocV/OF8IumMUG0u6nWe4DG1ZvqLC2OJ6YbEsAZgW3uqeLabRSixK58iINeaGJDhecxKrmwT3if</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlUtUL5ndPZI1ZPfDejSAb+PUPqZMruuFKzdTlRzC8LlB</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>
