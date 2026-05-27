<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmbpts" code="ma_bp" order="ma_bp" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="thông tin bộ phận sử dụng tài sản" e="Fixed Asset Using Department"></title>
  <fields>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã bộ phận" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_bp" allowNulls="false">
      <header v="Tên bộ phận" e="Description"></header>
    </field>
    <field name="ten_bp2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_bp0" dataFormatString="@upperCaseFormat">
      <header v="Mã bộ phận phí" e="Expense Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp0%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp0%l" readOnly="true" defaultValue="''" external="true">
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
      <item value="110: [ma_bp].Label, [ma_bp]"/>
      <item value="1100: [ten_bp].Label, [ten_bp]"/>
      <item value="1100: [ten_bp2].Label, [ten_bp2]"/>
      <item value="1101: [ma_bp0].Label, [ma_bp0],[ten_bp0%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khlMCzp3IQe+vunFiTdbm0OlbgMowuEhY/LDrmnidzIFD2V+SVL8NOG4EFxF3OP/ZNuRpLfvrdk3TMHAk2/lP0Y=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7cscm7y4mD0HhTX/4tZNMLyuwZN9wbSrjVVBOS6GRsLY51qiiyBBHE10BSn9RRx/etBwNwz/CvBK8wPJfjRS0Tg=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>d2qWPZSfOMYA5D3be24hG0l45KuwijfmcICkCyXMPiGY027oDeP+1dHlsxWiuM/yhY34XrE7HOBjmE7AEZAw+cgrhlA+fdErs1USn3x+nO1m8YmkEmuhx0Ssp7n+vZe1FKvo21770zhaf4kAy7PeizmRkKSFzCxLJtNl+iKxo036EQqc6yvimPMmSm5pyr0Vc5oPyx/e+KmDUmK2w0gj+qEOTlRTCnwnnvEBOEEJcceWbNlsH+SsJXdXd91qYIgWzyOqK69A6P0SGnBZW3OxOTgCrSgVBBJelEAPlAONhNOwXdj6pe565uY6irE8LmmSetW0gZk8aED2L9nCoqr3bubj+/OSc0edxRFjgl+4waWDg/eMo5jxpna1cMYIvWpi0DGb5KCOJwM3TDQzsutnFtjRfBpWDeHpGemsuTjHwSOHQ9RhIDpwhJChmrmyWVLPEQzcLkPIo8N0n4cM5+uF6H3qz6w2obPVK8xbb0HQQXlmxDaAWQ1/bDQppcPct67o8SYlH3pgkk/jJmDxpxm2bxzNWuYcsMSrilO9ee+yypVdHy9JU80xoGfgCqYVdFWBgiMQiuUaduPCyemZwFNC1Q==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>xlxEjLmrZaKBqUbrJkH8rUo7HXrqoAp6GEsHJcUmy78gs2WYhZ05ZUjMVxO2SDmdzFuzj1LVm8wX2leMXQ+CDSgJTUjUNgbjrb8Q+zEGFbXxXk8gnJPhQSh8zFGnGCO+Yj8lbV4+DDHvphr/EwsRm9h+n7pbLt3TPw2zmZc8hzJ/RZbvZ/z8kyBytFPVC/RZ0k91to5A7yHRIvHwUPWgqgK/6h8PmapOIEGxlE8phF+fViRttGmVLgu71MYXQX6LPkvQXAfDmBs29EjMHJtG7g==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>6JgV622O1QkxRdVn3np0QlU9ae9L2H7C8kx7nSlUeMCjOo6sCsC89IWKelKUlSFb/qWiiy/iqJ6wjaS0NM8vFox7o6BHVIoCqVOcwuLf8VBKsc0Acba+4pAPtNWajZRzD+J/q4akh0qDVtDNIWuWl3SJ+uQdoob6PhbSD+/lzx2MpnWpU62JCCd0f2u/VXLfI2UWzvf3Anbz2u0rpSgZQqT3/ozWT2bH7CvgYFR98VM1wV2Kd9MckJ9MFf0vg3Bl9KtclK+/tHo5U7AZhMPpEWAB8AyQ+26lZ+XegZycEo6EhOqyru4+aA8jFOjjB9zN</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlXejnL8kJDv8c03JQYMb+SHUGPkuquyUQ6arIiS6WHzx</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>703DmfXpnKukBy/AKOC3DuGXQ4ZWIIy6kq1ZRZ3b0mrPQqtIoX72xrkIJP3jnYJmZpAMnWzXegrjLjB0brNzJi3OI0CQc/iN59lHZitTifEceASr3bQuicVNJjeShDSJLISuVhewm39PFz1CHEAVryCsY2vZ+ZJYa+Z1YJNj+TDaZWSriZdVCzG5D59bRHCPOl3dz8VnepQybImCUcr1725lXEerDyUZxSdh6nU7Wcg8P2mteC/HSwRSW784pfozv9ARvSkpobb/z4v7SVI7c9iCZ0hvwIxsr/NkfuJ9gF5dF7ditfo5XKMhOQEZMfNWnYtlGRFZK9qa/4JgxY4tzLWOqvusOfs3OyuDlg48Q2A=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
