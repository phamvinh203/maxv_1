<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultForm "V20GLTC1">
]>

<dir id="0" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="mau_bc">
      <header v="Chọn mẫu báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 70, 100, 100, 130, 0"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>rLuBgNxhyNrqX/dtSfLeGWdQ9sAq7f1rqaPHkJoxmaLwHFg1TnlSHdjN/So/vBHQRxsZhTlwJbY/flxE72K89KJrr+UsNIPJAAZLLVbTK2c0QrBYP/uciNmmBszhU/550bQ55JQIQ0ZjF7zY2Oqjtp+RHWzOgpiqKJHuv/S1vK5Y71zRoaRsakyeXXfpALxwad11HVSE9/JGJiUhzCFB8kPWOqMcaT2as8JaPXI4chc=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>ZscIDFm2Fk1i37UGcOU087qnrDmUajfNoPf0f5AlMeazArDrC0HV3Uebi7SvkMntaIaGGSbasn88ssBKnAba5tJEfWyjrmiFSDDY1prNDinQBghSe4j5RHbAQ0VmLjcv3C7Qg58lvsb7AopUUlrtHioV6I2HpAVvo2xKxgCHQ2VeA0kOi7PWnmlTe28L43cBB3ATAsHoEOuhnryolqGaSSRyu/RJ4HF8Y6RWTPdA6tz9vlRKQIK5LqhxRqfpe5ua</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjOmU51j/9ggDuHlDNbCtDo2PPNr/EtQzuWwIycp/VlB0hC8IAKKxUfrPvWbrkmtczzaPOFlAb7LR99YzFPi3Q1NJTp4Mg9K41lNrqMDC0hwb</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>3xEhgXSqP557ZH5C9q3gijXy3DZkfaXfVgCtYgyaUa9rwdVLeRj/KSpahUjrORmEIqHLJDeT8EhYhjQmbtzX2iSfwWn2ZLZ54O346OvXW3KefZGwq5JOpUEkf+srOPDcgSqhKXsUQV3ugfhgFlPZnzsGOWoJs+yzuPRdddGzu7Au2UyG51H40r8ux2x61jys3PoTsNGd6NKWVx33IW2YasN+49l/UNQXsYKnm+8xL5HtEzwv5RWd+0mznFuZLm/LsUXYB2E6B8+Zitj6wbvKTxnMO1Kg6qjMKPcXppwBKl7fbWDxS3AV3aP14iTSzpZ/Lr3mZj2y4EmQKnz32kR+SYcIVQVvNFqYuXc5ZxVl2ZqLPNGbQONqnkkqH1pYzqk8uohBJSG4S11ucr0HvO49WF9C+MreG7+L0L3h8xQ47qiXoPDlQxzjXVswp9myO9NLXA93Iijb6a5ph0UWdsx6YX54epVYAhSlG1hEKHafU4/BFPwz748lsSJtZi3RfCbtQnpVCg2jDFbGJrIqq56VOSmIAagWWqsyafET0P16q+Ec6UN8W8Q+IM0SENElKc2fOf1EbRge9r2Ssc/fUvBlTwbmhJXV8oxN1KsfAje21mWzU9bEuzC4oXkI3fDx3H3G</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
