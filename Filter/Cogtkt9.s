<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Int32" dataFormatString="#0" allowNulls="false" aliasName="Period" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Int32" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 390"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjM+abBrv00odJlCYVFRyl9LapV092DY8tr4EszR9iDy0liadiqLvPvyqUF9zxvSp96ZehQYwa0nSOdtfQvsuHVA=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>W/3eOutcdOTq4entMdKrxy33nrmXaDe2QIopzaV3gjy0BerKT/2/INMRrmE8bgDb843/CNvb2heiF/29AKamX/dQNPHM0j+k3ZVFgwYfCEDOQvTVBkN3kjaRfRiOwcRTqBprbYps/bjg8GIBoR5TquORhXi/j/pVu14J6Be4u8kFPHGodGJbHIMF2aJbgvuDlMJ2nuv43r+ngkxrRDusWts4mRm/5yPSfqrepC2o8O7kJ1Kuk+iPHMa7JPdNo81Z555rnc3lkqw33edAU7ggN8FW6NUDxQp7ptmsfrCkyJ91HbFkdoSK+HREnEQBH9P6UreX1ZgZOefLU+bubIIuY67F88+E1g+F80+n2Ks6mZhb2xU4AUFFt8dwLeDUXGT40mT5RV1w/vo+U44bbvatmnBJuak2/OVh49C8S58UkZ67GWLPHvKmMK2zgMuXF4K7HrS9v+0MzgJuaqq68yDUQxJfjjB9HXo2S+DFgDcnjI4=</encrypted>]]>
    </text>
  </script>
</dir>
