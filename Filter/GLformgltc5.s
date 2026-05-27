<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY defaultTable "V20GLTC5">
  <!ENTITY defaultForm "v20GLTC51">
]>

<dir table="dmmaubc1" code="ma_maubc, form" order="ma_maubc, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc mẫu báo cáo" e="Filter Condition"></title>
  <fields>
    <field name="ma_maubc" categoryIndex="1" allowNulls="false" defaultValue="&defaultTable;" clientDefault="&defaultTable;" hidden="true" readOnly="true">
      <header v="Mã mẫu báo cáo" e="Report Code"></header>
    </field>
    <field name="ten_ma_maubc%l" categoryIndex="1" readOnly="true" external="true" defaultValue="Default" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="form" allowNulls="false" defaultValue="&defaultForm;" clientDefault="&defaultForm;">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="ReportForm" reference="ten_form%l" key="form in (select form from dmmaubc1 where ma_maubc = '{$%c[ma_maubc]}')" check="form in (select form from dmmaubc1 where ma_maubc = '{$%c[ma_maubc]}')" information="form$ReportForm.ten_maubc%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48/EVfKu/nBIlvVoc5tgv/Fxhah8xBhWZC0AHJU7W7I50OUuKua0/7oupP7bnYacog==</encrypted>]]></clientScript>
    </field>
    <field name="ten_form%l" categoryIndex="1" readOnly="true" external="true" defaultValue="Default">
      <header v="" e=""></header>
    </field>

    <field name="loai" external="true" dataFormatString="1, 2, 3" clientDefault="2" align="right" allowContain="true" defaultValue="Default">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Tạo mẫu, 2 - Sửa mẫu, 3 - Xóa mẫu" e="1 - New, 2 - Edit, 3 - Delete"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48/EVfKu/nBIlvVoc5tgv/Ea6YSdWtucg3mz5FtGE4cmbrw4BEyNpsC/PGHE/fmcpg==</encrypted>]]></clientScript>
    </field>

    <field name="ten_maubc" categoryIndex="1">
      <header v="Tên mẫu báo cáo" e="Report Name"></header>
    </field>
    <field name="ten_maubc2" categoryIndex="1">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="xoa_yn" categoryIndex="1" type="Boolean" external="true" allowContain="true" defaultValue="true">
      <header v="" e=""></header>
      <footer v="Xác nhận xóa mẫu báo cáo" e="Confirm delete"></footer>
      <items style="CheckBox"/>
    </field>

    <field name="h_line1" categoryIndex="9">
      <header v="Thông tin" e="Information"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Thông tin&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Information&lt;/div&gt;"></footer>
    </field>
    <field name="h_line12" categoryIndex="9">
      <header v="Thông tin khác" e="Other Information"></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Thông tin khác&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Other Information&lt;/div&gt;"></footer>
    </field>
    <field name="h_line2" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line22" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line3" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line32" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line4" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line42" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line5" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="h_line52" categoryIndex="9">
      <header v="" e=""></header>
    </field>
	<field name="ma_tt" allowNulls="false" >
	<header v="Thông tư" e="Circular No"></header>
     <items style="AutoComplete" controller="CircularNo" reference="ten_tt%l" information="ma_tt$report1.ten_tt%l" new="Default"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="157">
      <item value="120, 20, 80, 100, 220, 10"/>
      <item value="110100: [form].Label, [form], [ten_form%l]"/>
      <item value="111000: [loai].Label, [loai], [loai].Description"/>

	  <item value="110100: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="110001: [ten_maubc].Label, [ten_maubc], [ma_maubc]"/>
      <item value="11000-: [ten_maubc2].Label, [ten_maubc2]"/>
      <item value="-1100-: [xoa_yn], [xoa_yn].Description"/>

      <item value="1-1: [h_line1].Desciption, [h_line12].Desciption"/>
      <item value="1-1: [h_line1], [h_line12]"/>
      <item value="1-1: [h_line2], [h_line22]"/>
      <item value="1-1: [h_line3], [h_line32]"/>
      <item value="1-1: [h_line4], [h_line42]"/>
      <item value="1-1: [h_line5], [h_line52]"/>
      <categories>
        <category index="1" columns="120, 20, 80, 100, 220, 10">
          <header v="Thông tin chung" e="General Information"/>
        </category>
        <category index="9" columns="271, 8, 271">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>eagmagMYjgYVfdc31GDTdLLzpvun+Dhtzj7jOrcGW0AB6if1yg2CKBe90bawGdsMsu4hLhvFeRkuQyWmnYkE7DRq4T65QtKkL9efs8TsBFxESM7lly55MNbD+8NPrzrL9GqNWxM1fgYbWPs3NJslUKkX9TVd3scPDs/VfNaoT9NR9gvJ9siPwklwFZ5rlHffen7xqxbgVvey+S7OOmVdxTQ5UcDQTia+qPbcxeCJS36b5SZgfcelCVmr0KeuiDqa7Tw2bg5GAJbPgs4sHghlNw==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>TUFGAoBm76lAqRW2z6nBrQmNjwnVKHg05chViAwQO32wPhCKs/Z6w3u29ci+elNzoBfXDCoJ9SOx6PHb4+jcwmQ2k5t5zN35HlbrSryOeEywmXx99XEMdNfjtqnuFvEgVK78l69aMpd3RU9IawJhe/ZLXAxNkCYLDFJPxaLrQevaEkjDiWlbFn9UWHJwFmZwfggEAqRYlmnd7k3VnbdFnDYRUcL2tx2ulr8BW+kKrSGkZcb3J4rOa0YVv/HeLNiYE/+LlwVrmI59XbXyf5lO2cZhjrokwJGAJW4UPn/76NCEYp+7+SidXSdbE5YLMBRj</encrypted>]]>&defaultForm;<![CDATA[<encrypted>0Sir15mnM0PNG1g0fOF7/VXUmUUiK/3xEVk13T4A+Oc=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>EC9ce4OM0Q6jgxVaqehuwgwIrSMlJsZglQxkOAT2et1cBRd3JC7EcyeaCbMKV9Ej5bWLzG4oFpbnzD942nqemmCQUMkQFNyFiqgdDvEy/+8uPNVIGwuDEdyNBPTKG3UNZ4B5AMHUGhyZXC+SYxlECxBS2tIehkSFAq0CttWHCP/qhDSnWlfEj3jlSnlwA11j</encrypted>]]>&defaultTable;<![CDATA[<encrypted>lpGZuN4AtSzJIcW1YuCc4bPUfHnYS4cGG7A1OWCOoJhjihcf+2x8zzk0gcosOlUzWb3WLe2wbERsOas5k1GlJ9aGn6Svt6mE+gyXHG8Mhqs3chx3Y4b86lNfy0EmP7C+n2++j33UGhSb2S/jmug/MqCQyxoszkrlF+/ljXapZLNJzD8MWnbfxcDvjRmi7QHKni4FFFJ1uIcgimk9EMXrT503deqTZ0tI5hkheL9davKEDWFuuSZuNkHzOkD//SxG84UqO6e6z8pIxR6HJEXV2yQZ8GMZRncZHB1f6TfBTVdMCGKbcdMlYuQG6jpTbEawrxZSS0AiyD/3R0g42tY5/50FsqJb5pGRGiZ1mNScSGsQwa+aNfgH/LcyEoXNBU57agwXCofgdW8w+b6Ypb0pq/QuUSlkoSHJEUS1kQtD/7D0EunmSU/Rgno3C8J2bEizyi9M6kALTOuYjvrdt5M3xIyBeaGNE0csF9fY/ksk7GRJtfPwC4y0VYKQS6iqIKQ8QiMcZqtr/ZtvLOxtETEfzfeTimWt3Wlwyw+03KZswLdmEKDZpINSW7uLnHhG2/OtN0SX/jici2TWKWrfv7S/6bTG4i2SLhp+RI7yDGul0XJsweQo2Vt10lPTTN7WUeEAm2zsgRdmEZO6iW67ixWEcZEhhPMZ94u45yem2E+hVtR3ZpD73Ig1tenROAFp0e7GkGQI6W0M7I7zXJh7WnL7Oqpj+KzgXiwJsqen0lNg1jQjMj8CaIRZ1p2yvOqaZT70iadoYzRn4mYb6QhTZrRYDtcLR37gc5cP2tGubHaPEaeKqJL4Q5dHxd0s/BRJPzA+ibJc929ZbbuLDlJhvmcEiQnE2QyiafqjMEAvAAj24EpB1ln3dhCIRg2EuEEGUVuVSwhgf1F6Q9pwbDo9RyE2xXQGVsnjgdc1PGa2xkjuKzzMlVYS06CEpuRkR375IfMV8hWf1Y3lfPTWIX/MYdP1qcCFLi2iehCHv+6lZgaxZI9ulKfJZIATFpERGBOoqWD+FqfHTBd4n6o/tucXYpvA7fmOfts0aFmtsT1AOGUyuzWk32QcXnPmkKwUP/cVjJex08zMwRlCU+ag77FzfZ5iuaG+ljgs0vbMalEpvtbGPYe9m7su1xFPoHgmSeLFgkuSg5P1U5meRRQJNevd9WkIqwGOIfI2iJ3XXGBWmvN2Y2s=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>SIoRqfcWGdnHjb3HcQr5gLo6L0hSMicok4SvnEM7yBo+BoTn/DRgUdSXa6Gn//GPYzI63ZHr/wNeq8atMpuaczE4+sSUHoslGkl1J2U8Li4=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>jO9omhthnZAcnXutIOUjDUB9c314HrGvIru+3ZXvnSWXJiaj+xA85fBaxy94yQblcxAzwxFXu9S2H2DNPoUh4GmSBVL9p9C0f6SodHcXxepoHiXGRSR7ZF3YLlzvWPfHb/aHIY+pgs0KTkKSx7ab9iXoW0smHyJcd0/Nm/qNVV67Q5tRjATIvlRE0ogTA0VP</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>9OZ7LmNu9F4XuL9Irx54zktOpF4mOeCr7ldWQly2E+XC2hWwwHS8UipjqOeukEgx/+2IpXPnatH6oEDN9p2XAz38SihjzRF8hvXnYbpe7u436uPm9mNFEpykcgbheGmsf0Wj2dWLtFZhh9joLXrVj48Bx7lo3lDNSHVADfmiFaGi+TkA6ZVmRlfRk5+8ooe5WDVH2VS8IDQd2QncCnvyQTQ/EGT8CjB6Ug2ZSBSYFCNZw0An//FQ53+rzxzV1hrvCLtuCaChQghlPNaKF0OBbxER6aZNmgRBc10XfTijigTYs9MLwG8+si1hNx/s5NHKf2e9F1DNrrjHxmWLuzKyQXxM7+kJ/t2WvZliBPPFzMWBcSkFSBzfkLls60axYf1dqbYMaVwf0aDAMWjrMEL0Jj7jrdEzWkMxT+Z3kAv0cMyHWj0dxJI/IB13m9lsTMjvP7Bm3nz1JuV8FeVYXyPzVV5V0ne0JDndh7bdvTo4/0mOBTE02X9NvTjmFD6SuudxLAG5DseLru63fgGsGeKIPKRVYJAYIcy+pThV4SoKXd0fA1Y6+yIIMoCE2zDCChjaRgfG24KcHu/u0uZtb2FVp/kUEWd0xLpbOAdk4j0QhCGgCMYctRJuiB/XhFVNEtN88jSeuqga00WUBpHZAriunE1ubZ7MMeZcCyEp70fbb9sxNftNS71Untgh9XsThgEoFxLrtph9Pf6idxptiEwRrR/sGs/dfdyWhMrhhYXVz0vc5OVJgzjHRet6gR3puqxkK/nKv/zLShLBp/MEQ1vmi19HBvYq1LD73uB6BUHA8G50Pfxtpt5MpjXoTHFKCPUCmGriOfWqmv29T145lMkH9k8A6DvzgPuZnw9kYE1oTgX2u0w2YclUCmM3w2RSJDsMDBFNsTRlUTx+tZe7cN8O/H6s6yVjOaUf7znwxSPNswNR6D8K9J5fLdwCIfL4kbZMXnieMbc2Tbrg6xh+RuWNycGWut4Mv9LYik+tsQOGok+ySfB8fmpRELgCOD+L823RxgMm+8+3A7Vtjr4brZ0QrVmBrvFil0NvJiAw4Eqw4vvXqyTrrqo132qEbdcTFoQK</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ReportForm">
      <text>
        <![CDATA[<encrypted>8GSKgPSMdkilLcYJpJHkTMViflN2sz4AQyWQbyJdb6pMt2TESKTZRlrR4TILLct/6rnsGawXP/baD9aSI4rYmVvZ4GdYKR4Yk3snQexvTiODQP3i8NL/GxOeWF87t0Bx/yg8Mwo5uXPDaT0BD9taekfXO8oRxs729ty6w4+FzahTIRp8Bcwfu8YYIKRYmMfx</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>4MvSlYt1KryJh9p3EYdigax6+PZQLyAdjxI/FUw+i9HHDGIDqEkgfNgQYVxVBoZ1MaG19bXlOZXuwZXlxjbU79Ldvj7j5tqpBWrQjTIlmf07SQvc1gQpn2QaSfFLr6ZN</encrypted>]]>
    </text>
  </css>
</dir>
