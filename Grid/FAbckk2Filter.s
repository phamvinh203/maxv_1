<?xml version="1.0" encoding="utf-8"?>

<grid table="sysrpoptions" code="form_id" order="form_order" type="Detail" freezeColumns="2" id="" xmlns="urn:schemas-maxv-com:data-grid">
  <fields>
    <field name="form_id" allowNulls="false" readOnly="true" width="100" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="form_name" readOnly="true" width="300">
      <header v="Đối tượng" e="Object"></header>
    </field>
    <field name="stt" type="Int16" width="100" dataFormatString="##0">
      <header v="Stt" e="No."></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="form_id"/>
      <field name="form_name"/>
      <field name="stt"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kuBlQPyirSOZL2Z35G/RooaCvOgjiHEifW3Y5sUy5IvI+Ukug8b4ba6WYF3U+PvsbMso8bDPtgoLn7V2q8FSDiM=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW1pOWZCUyecNK7eAI+G0rK34sK3S1tWasWu2UD056icDIFkX/7IapvFH5l5+NgPQpKGolL21InmDxV0bVRpZrtjXadNYwgLWDIi/9HOUCJwrEfvw6OwkBuQgs2FuRDcxsY32lGdKdmPWRk+AH7U9wDmSqFt/vewRHUfhFFYAszP7</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>mpGZb2q4PmX7FH6YseyCwNaq9rMZyWzmhSQPF9/N6QmQBjixCpU5jxkZA9yduUrnskfPcIYCQJdXzFAaOor4jJ6EMxTod/BXEj2jCltWUxvEyW4Xd9YptKd4PaiPpeBLOuHJfEoxSgDKSoC1ukJlXPvIrs3gBY1B8mlqZdQPekXONodvB7y/aWsoTmDiQVuU2/BQqrZ4tqAI9MyX2SAKpG+25G6MNDb/p7BFaInaf1YT+mu8Ni0eyd9qgUEU4tClYyoCTsOFAF+F9tyVpABC0Q==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
