<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmthuettdb" code="ma_thue" order="ma_thue" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="thuế suất thuế tiêu thụ đặc biệt" e="Excise Tax"></title>
  <fields>
    <field name="ma_thue" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" >
      <header v="Mã thuế" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_thue" allowNulls="false">
      <header v="Tên thuế" e="Description"></header>
    </field>
    <field name="ten_thue2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="thue_suat" type="Decimal" clientDefault="0" dataFormatString="##0.00">
      <header v="Thuế suất (%)" e="Tax Rate (%)"></header>
      <items style ="Numeric"></items>
    </field>
    <field name="tk_thue" dataFormatString="@upperCaseFormat">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" new ="Default" reference="ten_tk%l" key="status = '1' and loai_tk = 1" check="loai_tk = 1" information="tk$dmtk.ten_tk%l"/>
    </field>

    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" hidden="false" >
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_thue].Label, [ma_thue]"/>
      <item value="1100: [ten_thue].Label, [ten_thue]"/>
      <item value="1100: [ten_thue2].Label, [ten_thue2]"/>
      <item value="110: [thue_suat].Label, [thue_suat]"/>
      <item value="1101: [tk_thue].Label, [tk_thue],[ten_tk%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhog9yWyb4zgUJkli5ReGiu9nLJXzxDZcqKaD0KGkmyJgiWqxhZzn+8aEKg4sx9tQxU=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kkZhSc+s5HVNpoBk01KPzzagH3VyuvOq0Pdtej4DSq4AjXoZh5MHlIVzsonEJ4eWsgkIbaX2aE3K4oiJw+0wmMs=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>s4WQ6SOunE93If5jiiWzPVfqO5F9tjZVJrkEddhj0L5SqqLyFR9FFTwt2ckRHWYk+pylQ2mr9o24mB71ETXZfy51fya9xn2QkN84ZWXf04qTD2SylqgqgUZFyC1CUF30qmnTEFwPRhRiv08B3GwlGhXjJm36QGztzLBmNnuXesz5hRJM9M5OlTLPypcTKEHCZE2IRxH4ND0jowNtx3x6J9qu4dm197XlgOBBYf4uvnfKecKY7A62RySXcPBOibKc4DLEa+UGU6wp/SGHRiXwfyA137dIZtoRcZ4knH+jBNmcvDfhcLcWjwwbz/4gihXJLVHKCddigbvP/a571qtEXg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>DZG7GEI227+BhsXCUCQqwcAaihgyGJV4OYSwEZR2Z8PSy1xwcV8u5q50T0pxkLWnL9PoF88jPJ6Un9x1YxB7UPkGJtKTSWiW3k8KlMLwuc1RVlj0aXqrCW6y8GZbcsTuIht1Zk9zlWmDl1dVyZo/hCPPyfAQVyfm/EC5gI8+IoY8+4HMMDmWQ5uY1YjmAnZGooluQtTYkq/IqAu5zzhSqPYRYOLeeTkJUOjobCCHy7gn7yse0Srxcc1d5cRRr2yEWkKDigie8BGtojRUkEVB1w==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>6JgV622O1QkxRdVn3np0QhyZQ4XE/EcUBzKLzvjZhDUCVB+joip+PXzfXOa5hI/wSmIsEp9zU6ovnEjmilHJ/YW/QlUuP5S2q4hO+BOlWuJanZTBpgKPQ7T1z8yXcUdtDerSpBedsmyex65/vsMNZ2sCj8MwS4bRrlXIWkrWaAm0V8a/+nRgjPbfhiBSXK4rRW+7QplOvinLvx487MSrVQNGtauVlNibUuecMaHXr1TdwBaOzrWvtnn21gR0wJz529MADFf/vFSgcJ7NmIzqD/OMNpLfzkBlV4xOg9nzVlorn4rNgzb/6dsXs6hG5g0H/N2fz5BbAoBRCvJKbeZpFQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlTta7dOMHd3h/k7SVd3OObhFMj5ssnqhC4wYoZUVlvsi</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>2Zvt0rtvUTvNZBybuCTnopL3cfe7nrpJudwLjGAihDzvXKVXeNwqn38/Ai21679l8UnQMlI8bit90YWxUX5LKtxu62EQVIRgXfwqmSEPHjvfN/O16xVHwvxevfYUabS/+CpOGpQsY4vVDqFM0rYJ7VzL+cStzJukip7yxVXdEO2HVE/URASwXZt3F+68fQgnNtq2nhRxXAQxYNhQ1doUcRhAZpn5Iy5zR4azqOh9QYySUzjwR8s6A4irajiNABLN5UcJarr/QflrjX8QAiUhplcY/LMTKYrw3FWSfWuo5ijziAk9zTv507wYEyCbmg7T808/KGfSBQz1fRu0ltq/UmT1/FqigO0wfK0fvlqj1Cg=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
