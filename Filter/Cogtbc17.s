<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Form "COGTBC2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="fromPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Từ kỳ/năm" e="From Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="den_ky" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1;">
      <header v="Đến kỳ/năm" e="To Period/Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year1" defaultValue="(new Date()).getFullYear()">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam2" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year2" defaultValue="(new Date()).getFullYear()">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_sp">
      <header v="Sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx">
      <header v="Số lệnh sản xuất" e="Manufacturing Order"></header>
      <items style="AutoComplete" controller="MO" reference="dien_giai%l"/>
    </field>
    <field name="dien_giai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [tu_ky].Label, [tu_ky], [nam]"/>
      <item value="111: [den_ky].Label, [den_ky], [nam2]"/>
      <item value="1100100: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1100100: [so_lsx].Label, [so_lsx], [dien_giai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>9Tm3hVodkhlaBgVI24Gbt1PjLrLs04LLidRuY8TAf3bUMG60ix2lQhRZG5/Opb52sK4kVv+T1UxTR+A8C59fiWfLlS/u/bg18q85bJ0YB4l0/cydc/0WubsUaW01XwcHTN4LAzOWj+9FDqAok3vqGt53wF56OJaq+4t2veVuZ53dCHXGtxlBAc06MQPP8G3ugnrrhTs3261M84L+VY8otqvDQlip+zxAh00TVHH/a2RAu2L7mpGst8In9GS4wPpdKmAOqaSSdtEw8nNVWf08YtOrEG9df3vj4NeDiuAy0KNVwNr9czeDt+br+UowxEKN</encrypted>]]>&Form;<![CDATA[<encrypted>t5/OLHv0rYiuX11GAuCYaxJMS8vctBVmrTaZ5rmc3SAjQlZqZZnFcDeJLmzp86hCjK1W+xv+EdqckGlqg33xOge5yAQ+LZPz7GFtts9rih0DFYG/0bb6iD4+fOP6X2Mzl0rLk9Ak+9jnNzbtd0sfa/EzS9SDDIw8assvzpqup1ExuSs0U6vAzqa6xiA/osyA7G90p6IQa/WX5qKs+1LCvKkgXIfFRQOwBcW++/pTq0oCL4kvpLTfuy5UeaE8xHjul2ESDO7suXAVxSmFJHzFN2dWLswPUTZuXfKwJ0Nz6uPDQVfzZpQP3CXUFBlupoC1</encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>Xn8v9X+tCxJDdvMMGiAydKeiuOWgGSUD4VBuGRZChVhQ3MCokapCJTxKs6Rc8NOEWeLWSn++zVq+LQmbhS348/eQxn/aGsUXq5EbbFi2ifP+GknMTUwrsSDD8isJIPG+V/Vh4nVtqQC/DVezqv1xoc9v18B+iCwSM7eoPoeC2Uc7rVsNtplCuoMgjB61uNARJcQbDGCaxImBRmfcmZEo3q/15oPt218vZtJEA+3xYjZcfoojDO6z4BqCtR9bupf+XVYHhNiAmxCRBOxH1VYULqsxvXgpzCQvc1L4oeEMDHw=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>1mPcVg+Pn+j4pVMzjTRnSeUjgUIslLxZBNRR55QElbNaZhW26SzE4M2BPNlDdrqlh24HDNDFFuTpsZkAYyI94AYx+SjopHltNZvny6fTxDywLF5AWfSY/fYHr95idi5770i6/UMh8iwbQVkpru5ARZsaZyd7k7gOqDCfPPxCUMAi/vRnXZ3lX4vAEWgcDcjVLMWfs7k8j2u2021Xvb58rCeUgRGkfTKY/b7VyJnnmPH88YD9ZKU6IslewRiOvyG/H0IZxCLIFvxVB2u7rX2eBuu15CvaB9ssIi1heOXnVla/D3UMsh4WyclEtwXj9gVN9PW+DHKeumXUKmB/4TJSNfzaVsZzOGAnoQozmI6Djb9EcII/o7ydsP061/oQuKo895fLzFGEgtUYqTYdZVuG5ONplefoKufCm4Q5yseM0SSfw0QiQXWVViJvDPxot7YLBYDl3FIXl6VQQVUlczOSaTd3T1UiBqP4pKqnTt/DrpIr+iNBny0uxlCOulEEVDt0XNX7h10bCZmgRQuykVGA8bfTnbcJ7kOAC5BaaLwMZcZEqd1+B6vmmmm1b3B0lhbXV0PdztCCf6cKsfGDtRzINfo1xHwiP75YDlEUBc19qx+0cvPHaDe7GXcTIHIvR4Xq3gvZILKlnvcddqHZsHVo42AHTH7PmhtPz/nch2C5CpwAe787KWSNRJtUvPlCSbGT46l7Jnh7vQlud7Yhfetj1A6CS5o8ZFASDa8dwON/GkuE7O8Arz/4JHwMLoaDiVeO8PsGlxRvTAp3TxbUsKo5qH68yLREHzLMMQ7LVKvipYfSv1XklN/lTf3RxJnS5DmFUcGhnYENBx79H4KO6N1kC10Q11NfwN/ZvL5dxB+OC5sQNEbAA711j5ULuDeEidKlw1tV6iBbui3cAFCF0sFgDea3c9FzrlUhSuvSqAF8bwBYszjiXJkHZR56YJi6ttkcb+9miJw94E6NF6begNjvQgIJmX1ThtXRWJ1RReygNLY=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
