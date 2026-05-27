<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultForm "COCP1">
  <!ENTITY Form "GLTHPHI7">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="thang1" type="Decimal" dataFormatString="#0" allowNulls="false" clientDefault="1">
      <header v="Từ tháng" e="Month from"></header>
      <footer v="Từ đến/tháng" e="Month from/to"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="thang2" type="Decimal" dataFormatString="#0" allowNulls="false" clientDefault="12">
      <header v="Đến tháng" e="Month to"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"/>
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
    <view id="Dir" height="210">
      <item value="120, 40, 40, 20, 100, 100, 130"/>
      <item value="111: [thang1].Description, [thang1], [thang2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000: [form].Label, [form]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>CsmqwEPRUouoJ2KuaenpwZh0pTk5Rl2CohW6yBM7dz08IFnp0Cig629N+598Mdo3xCw4qq9QICnJZ5hPtAPpaBMaRONjSzO6XJ1+X/iXadAVrBDXuZQ3XUNWtUf1ywVmmSBRufISIh+1MfiZmQ7OCTGG1oGf9z4yd9OAiHsISIIsksciC2rlMjX/N7MCEgCBuWZFrtvsAmgO6UaK0OBDqH0txg57/qB7vHfHMnhV43Ap0VaZgSjzJZbzFkLWWREpjTgaplmtzIagRJ+XHNv7RA==</encrypted>]]>&defaultForm;<![CDATA[<encrypted>IKtMmDPZWEkbea6IPMdVt/LLhEfjI39+3BXgUXp3dU0PcCIh2NJUvOnTiumBeR4JZVIcNA1u5ix2jFTrojFpwIDDDlrAB05PfWIFfBz2rMjQKbjCHIELkHees2HrPp8WcKcaX6YwCDNWZ6qEiAVTa/86SHPuW6SOnZF7LVVwrmxNtEA+Qkc6629K2F+kFfAg5JEZ37LABMGd75Jg8nRmzRaH3kuyCk3fMVuhJeQcrPje1EM95RrxgNCMPU1xjuSa</encrypted>]]>&Form;<![CDATA[<encrypted>Olell4OZWorrJ39gO0ddIsUKKGZX2kXnaRo5h6xwECPfPr5nwAgk07pcS1nbuW9uY+/ZAdcxyIy7B3Cx7hZZFsleiMU9Izcct0VDgADdlxx2jOBaDqqQX7wsjzNor7Xt3KNgPv3K7fpioIStz2RzPBt/+WgLQZCBEer6Gz0wjOk9FhzNZ2O4m/shlspfzYuM5yvn669h8IiMc6pXbFmrjwg8at4XL7A3RHj+Kz97KF5ksYPBf4fyyiKcGSkKlqUZ/W04RtBE2l+yb9ypIWdN7TKvEj1kpN9SUnbLe/fqtgU=</encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7R57MFFe13UhD2nISsCyTMyMxG3WfRvryppSR1BijLLFs6OlifXYa0C9zjemg1/ym/ZtVtmo9YXAHA+NfkcMiP2ebT5yjxS6pKlgWmahQ7DLC+R07Zt6OVV344rQM3WaEMCdGY3p2on2jcOZwOXwMBI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>lqksVUs5iQVpPDYctKVFgqMO+djfEm05JZX2Ri4VIygt7zzKP3oU65oI2vDySxtyz0i1YfP6fLmNfZ0lUxHyfc/RDT5bPzOtvooYfV97eCNCEkwq5YeDlhhF62OH8PoGfuR2VK5DwsjkZ+7KveBNoQNICjqJqwLsMdF1FPJSSXCU4McttHGaOL5lL2KPAx9DHHVs09/m60T4bL4RdkagBo8s6kb7skhx4QZZFDg2+MfKKrd5SewmPrGPMzSrWnLbGD6C6dJyszFMv2fFeAe8aLPH9ZG55dVKcGcVFiLGcEiAgpiXQwvoSrRoXyuMC7SllcdyHp3pwCpvrdys5DHbZb5BZJQAps+rdvcVQZ74vn0SWfxlUKlzuhu/EvdvdabnnYgimJyMT7qPL9QPt/GZOAxlUxl6bGnX7bHCsb7/q6CS827SyPsKtQ//lAAyQCw7rjWqTd3Nu8HFi6N8ds3tHpoRGxmcWc4xHcd7Wd+N1N9pyEsQaE3D45no89mojWONChaI0BB4LQodzQumbiTmQ38uTdr2zLS1D7ZwGGrs+2JugimsNPqdXtRdPpUmsPLX6BVxfXh4xdAmYe1PEnDhNC+YeZXHuWRrs8XtMzkTMqGN3KSP64IWGt+BgXECPIm6xWhH2PLAb4sf5vesH5CmUOfO0YCRnlNvFR4dle+HS8Hdpi1CcHiMqb1vrmUIZalm3WbDMbPmN3cy3v+JQ2AUJjbixBnJHCr2I0n4CCEMmrA=</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
