<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmphi" code="ma_phi" order="ma_phi" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phí" e="Expense"></title>
  <fields>
    <field name="ma_phi" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false">
      <header v="Mã phí" e="Expense Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_phi" allowNulls="false">
      <header v="Tên phí" e="Description"></header>
    </field>
    <field name="ten_phi2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="nh_phi1" clientDefault="Default">
      <header v="Nhóm 1" e="Group 1"></header>
      <items style="AutoComplete" controller="ExpenseGroup" reference="ten_nh_p1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhphi.ten_nh%l"/>
    </field>
    <field name="ten_nh_p1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_phi2" clientDefault="Default">
      <header v="Nhóm 2" e="Group 2"></header>
      <items style="AutoComplete" controller="ExpenseGroup" reference="ten_nh_p2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhphi.ten_nh%l"/>
    </field>
    <field name="ten_nh_p2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_phi3" clientDefault="Default">
      <header v="Nhóm 3" e="Group 3"></header>
      <items style="AutoComplete" controller="ExpenseGroup" reference="ten_nh_p3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhphi.ten_nh%l"/>
    </field>
    <field name="ten_nh_p3%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 70, 330"/>
      <item value="110-: [ma_phi].Label, [ma_phi]"/>
      <item value="1100: [ten_phi].Label, [ten_phi]"/>
      <item value="1100: [ten_phi2].Label, [ten_phi2]"/>
      <item value="1101: [nh_phi1].Label, [nh_phi1],[ten_nh_p1%l] "/>
      <item value="1101: [nh_phi2].Label, [nh_phi2],[ten_nh_p2%l] "/>
      <item value="1101: [nh_phi3].Label, [nh_phi3],[ten_nh_p3%l] "/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMho4Lmn2CjyGatugWtzrEUOf0W9H3NH5mPDu0XZFV59TxsXPJReLYyWaZ/nBo0mlSLo=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7dgSrK9Wke/fLQJKRU/iQjisntSDV3PIZUNeJ7bnpq8u6iArj+0dSbxLqEGRbbva55DBCrPIK2SjQb0y4xZfWA8=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>UYPhZlPG8kgNm7801JptbE1lOeGFl7FIAMMuI5ORpocQNn2j6TBJS3eirRNQZYyyQPdCk7vx3SCLgWc43zjXhRi598CtvunUeVtfWfe02fFZK4PskRblsTMh1Dd5BskGfEXEjtRJgITKyxL6MBpz+R67/kCsoEXned8N8tPe5qUQa3b4/cUAu2hLRTzm58lWT3RdKTjoRgIv106CILHxFtHLR3Zo7oixQHrtAW7S2qct+AZq6Yn687jr/4jsCTMbNTmSlDH8D/7XygyN/yj8H2LBnfb0RJuptVvN2si1sR67OOjs007qldN7YQUPEm1Iiw13r3eeh6ePiSbKZaR8srlHHCfeTul1+C8fYJgGyk3OXbioLoi3D1X5O2M15FlK5veSVoiip2eriyGEOrd6Cz5rTpuMzD8wkd0UsDfMddZN90BVx9HPHNbqDjiT+FusrcCnwy9JKUhvsqpEHxw1RGlizkaiWwOhu6kMGegq2mfktEWHiJvF/sbzYM1ISH+cMhVRVDg6y2gM5B6UKd2wxA==</encrypted>]]>
      </text>
    </command>


    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>lQdLMfYk5OUXdldiVBHBxZhM1W3POlqPv78zT5ahUyBN6MM+8XD6yQqxVHpgjYREuxql20MQIxile8XtbMAbDkrGbtAriALkhcY3jKXvwUBrw75M7ThmMD6+1z4ZAc46quCnj+YZpAW/FR3pIbQgG+ACQ3Lt6MRldgB2lFElZtLoSue1+zNWb0wfZdYVRXXRS+vOI8IkVgJu4CZshQXFL46l7fe42k/XSI5SgZkmQCz0maur9lyN2FMREinosLxu</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>P5UXwBZkEParxmLS1w+acPRzPqR5s8n9t1EsnuXwA2wfY94nZBIouarxyYYSZQWcBZH2KQCauoJ62Znyx8wK96RoPOtcocMGVKvUt7h+aTbg9Uti0CgQPk+u6Y0F2oRCyO9w1gi43/zOsL57qL713RMDSQZpBv6bd99IYk3npEQ7aqcgjQYCILmzJSB0uMmVMWtFRayqLdGmPjfSZs8jaEQNXuVcWQlZghbGlcYsXv2qf1x28uqjG20HWqMXP68A/7Qb5UqEFTjhzBVqiJcMJm2ay4fJ4Usipv8HVR/KD44TaNgU8fHGZUmYOlwSlERXpn1x7AwQJKc/Xt5ARNwDC0lBvR7Q0pgrNLLd4PvxmzA=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlQwgnRgWzKKbqPBqY/dZqcuIlzfwf+MPKzudHwYqODTw</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>ivgrR3NTmOGPkdlNBe8q6ONKo/R8/EhUJwQEmRGJXAY7pDESTPNVsRVGHHhVOY6t68c2z2nmCUuSc+VleZFrnn7Xs2wCqB3KO29xVDeovTJJi6qAer3PFqaE/+4pxwDaE0y92ptfBMOb/2E6QmkSoNeonc7l2WSvJoqrCr+jjNUkR/I7nCcw7nDdDlhvmKHOmr0NsJMTKObRaMlbJwOPiH2AtgZbNftZlp4RRsbqTUg=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>2Zvt0rtvUTvNZBybuCTnoos4uavbdWzZW2ED13aYGgaH+bGvNASf+8Q7FRPEQawYJt4JIiWPY6HLW2Vev/NB5XK06IcDY4XTrtKGnoeR2tzpA6Vv1ATaUkseVqcPt/MrRhr67HYRcdLN08lJtj13K2Fj0PnRiEn5X/YM4D3peblLxmoaxc01UUy/wp44og7gIzg7oNeqlfYoX2HjnG516dpV1ypW9cygbtojaZwTq6m1E/nJBiIZyAJPnIqhayYcuU4psKtrsolY4vQ2XsIvTqgHVsXgttxZfsCJ85JrmqjumBuTtcTWRWglA1OZtEVUbhUCr55nJD4LdHiPQrTFlsPEHClpZ5XToeEgU60Fle4=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
