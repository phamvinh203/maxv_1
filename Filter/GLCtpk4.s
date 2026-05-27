<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\PeriodLockedDate.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLCheckProcess SYSTEM "..\Include\XML\CheckProcess.xml">
]>

<dir xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Bút toán phân bổ tự động" e="Allocation Transaction"></title>
  <fields>
    <field name="ky1" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Từ kỳ" e="From Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Đến kỳ" e="To Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" >
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [ky1].Label, [ky1]"/>
      <item value="11: [ky2].Label, [ky2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLCheckProcess;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;<![CDATA[<encrypted>sVV0XVRytihjEQAw92yQ4HCvMyWuhc8p9huRriZqsOoulYUzYWL8r8J6sET53raD</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>kE/Br8Kth80Z0L/VTzLi2T/uahy1HGmE7CC4PyN5Z4DlHNPEO6FXToRS8zzvEsz+8pbUG2dtlMkF2MVuyV7VGK/U5qSSitwT8p2dtCJuD5Asj6/C8zHZTEHXLZRiB43mQS5dnHWi4GPGvcH091S1NCdFhF1vquBVOcVJDHNy1YkpW9sCVnubxJ/LCmAHsa0AaP/jATYZogTjdvxwUA+k1QdxRmVfLrot6cDWaEupNlELorFjpW168zosLzCEsqpkrpdg9pcdYd9Shd+64wF+w56SebJwrdFAhxL0KTTCrmqjBv0XnwH4AA67ctp8KBrXxLjqyNeky+qt4Chf4NUO5WKyNyxvYg7De7tyrM62rec5ffszk9pDFXfDXPS/baeIFqIY0PEaiYCwB/FCgdb767wm3x+t6q4mshCucsW2VzpCsYjqmj0vPjntTr9onBs7Lp0MJyl9vJ3pVIE/Shmrkw==</encrypted>]]>
    </text>
  </script>
</dir>
