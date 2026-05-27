<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmdvt" code="dvt" order="dvt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="đơn vị tính" e="Unit of Measure"></title>
  <fields>
    <field name="dvt" isPrimaryKey="true" allowNulls="false">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt" allowNulls="false">
      <header v="Tên đvt" e="Description"></header>
    </field>
    <field name="ten_dvt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [dvt].Label, [dvt]"/>
      <item value="1100: [ten_dvt].Label, [ten_dvt]"/>
      <item value="1100: [ten_dvt2].Label, [ten_dvt2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khS7mCLcf+fsJ/8xHtbexMwB2dNN5Z9jwEa1QnkfElhjKxIwmARXMSQgOtmnEGWw8UQ8ja283SdmWsCQLGmsqN4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VzLMC4aR/F5oXkbFW9/l7s42BrqptzM1jCyBobwqCdfLZaeIoGqRylOnmG/juqfwQi2JiVtMXm7iJ8elqoAdlc=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>d25l3QydtBrqWU6ASyr4d/2vrcp+mfbLbioV/sbwDfHt9mfyXiNqkmShLIArI+nFBDuDnC9Gv5HzRN1nXT+wnbrpOpx+ZfcgBSOeftmZovZIjK5ORlQnl5USHxfj96XD+R0Wsnsv0Xa1grdO98hU0gVNJwHQvMulmMVj67TC5tt/eVbnNDVWwmLO0RuDrJKQYlQZegfZAI4C2MfesPM3AFcQenGQzXzy4BPVDk8U9rfM8d623BJg37aKxWY1Sxn8iSW4gNx8FtXtWX+uVq6uSgvCml08PLRRDqNlmOW/ylIeqaCve+VvnEUJ6M8fELrGD3i2pQgmRkxaym6/ukLXG0JPcwakJcThPVs+GZbLbpVhT5/ukF7ppnlJYbmcSBvPK/AaaR7wz9MihHW46KsY1BUQ+bsz0AATaqlfhDC4EsVZpz/VCBolOPF3JFyNTRZkmcZxN65FYQ+95KZse7TOVo2hCtAG0WCL2p9QYGYUp0pPAdT5KxEM4joGfgYvFsokHxsYwgEiZI6EmA0w/d/korK7jAsf0HW+AAk6JvWokp4=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>YbuMyPpRZ5olCDoLnkq3KIr8KLSJc3lJolTKAfXvhNxjTDR0OySr8WnG1tH3ZU/WojtNOMqHemTNh4ZQr4FtrWqFeBbXQNI/aZpJNIEX3OQEIbmG57o8EqcpL7JJ+pA3bpemIf6c02k6fvSBN8F2L7diHJEwvMcT/sA5zqnyovwJpxvFmQAOXKUIAbpCGKa2qvDGJvdGBL69NrW8ajT6ITLikXFgeT6ArqYx4pbSr0SGoeGP2QJv9Vm0JeFnXFSj</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>BTrv7SLQOw57cCJo4MCUCdeo33Q+UTaH8WHLfMC0C4CFgEcW8p5n4FnETGd76WcnwxHYF9U6+e/ZW6e4wy+XoHyoCmHrM+wQeMfg1h0+iCgiVhzLIqYltOTLctqNVm/z1hLbqzN+uld8W6fawdA1C293yt51HxFhPDUBFp4iLBYejo5oFtef97V7KuxJv5TX68fSN7IJMQ/RYSBT7QcNXiimf57Wz5nCMGwn2BB3d6FTdL3mhfy14e0YfmV8ecsB+8wCbHtAo7D7cdj1n36z9sypbpq9fepckMMMr+V2JhzC2EXdDZ0P6uGRGVexe0/8fVlrHWCvDqFI5UpohZ1PAwPSgxI2K5KKsdnLFUiumSA=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlXu/aIFRDIsMknTEULQgDSyVGNKJna38r0HjgcgkiLmT</encrypted>]]>
      </text>
    </command>
    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>/9jXpOAG9Ye44K+o8BfKk5NMuuSfaBJN1O6RvuXaMwCf0IGlfLgrdKOl/pKGzfJ+lJBxkFbF+XXgwRqv2ywm1bcqOgNrTn2zCr81uCyfbhat9K78sLG/QsJIZ739prnIrab/wehZxDkHnoDKbJItb0opaWfDKpqD6ObRII3Fu3vtDN7SR02RQuBT06c8T5Jq</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>3s//6FKBovwSpg5I491Su1wz3CIPC4c6in5OU69nv2n0ZoTeaD3jz8fQh2C7bOa+6PGCd42EBWLgiMHnpc9prA2UMfjnBcKHTUnf6JtJuLO34reMvoeGjt1VL1ywswLfu25oevX0kOrdviF20YJXN+bSIynaf9pMR85ambY6NsbSp8CpXQEzxvKC89JnKeVh+5MsPnsCnEAzbHT82QjsLSBz9/kNqthg3/r6u0pIchHOGCzHxS254fiJKqS4uIiLs0IdwBE2Wp2bGX+GFL4QhJoKjGGLedydlUKm+VepfMVj4SQ/lfjw+k8EqAkD8e0WDNnOZ5bE7k047Y7a2OMcp2oGtKkgQKIDSTSClO5EaGQ=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
