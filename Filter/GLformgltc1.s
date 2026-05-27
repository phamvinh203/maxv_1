<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY defaultTable "V20GLTC1">
  <!ENTITY defaultForm "v20GLTC11">
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
        <![CDATA[<encrypted>/QPraNaNBxbuDWx+yDIi6Q9RsKBFRyrGA8qT+PZmr+6YV2IIZzmPXOcsLDvrKVlSHEx2h3zUQwA/cbBFXskBhohosEorTBWRVHmN12RjorZuy63NJMEyDEfmzvV7IHdH9VMD70VFuNETksFx8kDVtAyGhGA7+Sb74vy5PQ5dYnlMmlsKwWfa2BcrQORlHh7kWjiWKz9jMU3WqC1oYqUOE+De2nImFlkxiRlul6BNe4Suvr6DJ2+7waCJ2qYZxUfYqhsMfTXwOyYNsoCZaqSEl8ftgdaGYgdRI+tMVwTrLx0=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>W2z24gKhHkubSbDPCmixhWe3WyJQRlcie9UO4BO/mUiM1il6r1qIqu8Z+XHkpKVXaGabHLXcjTUpS6Ds76sEKF95BT2sNVWytZMr2DHDNetWORKep+3OOS4wYnjvKGKIJuMeKKAXoD6ZUyF11llJ1b2WHhHxfHd84VGvXjmaQXWowXbvDqeIRTs1Qb2PhYXOUfGE/qulg8QKF7LPjGosgrRHW/7Hnkhxuc6tZslqMHqcZ+A/uzbGwJA/G5XEmewhTW7Yqtt5jlGwZqe4N0xX9qwM7Q/5idvB9yOBfU2IcgOKZCCd/aaAXu5kBIwE2t08</encrypted>]]>&defaultForm;<![CDATA[<encrypted>ZYJdYgZIxtjyeZbfMk76lHppupjQOz/LJgyHR496nv8=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN208nr8ddUOkdV+VIPiouWE+Npt/BygzU+deCoHyHy2MUu1t17sBWApdTAeaOfFfW5SK25Cwy8n2fi/Le22V72eHwMlyqRZSzkk0OXo+4tLPCNBV9O4VqjKCGd8NQElE+JbSyLdI71ao1f5NJwgP0Wdvsjx+ZLxWzlC64/NTpSeX</encrypted>]]>&defaultTable;<![CDATA[<encrypted>zxcGrAvrbZyzhNhB7Qc8YbXbjk7icsYg67BsolBIJKkx9/e3g+BuPQKUtJh2W3+JjrsgOt25Pm47cgAaDT6M3pR5M1DjgE/1khCu8pt63QGUapv7w+i9fzqc+jgXOeK0b3B35a3zgmwIJeC3U5x0ObeohXA4qgY6DpGntreBjXemowpg1q5AzUvbKG8ynPZhUoorj/oH/3bXBjbjSy44lbVV1CDpTWcXnO5DWiB9NDryUhdNI/v3V1aXnBppyH1ce9cDqJGGGBQOuOfCmTo/jmGh8L2j6LY7AzlAVuj3J/yopWGUHWlccZWfpfgvnDVEQ58mE6MtRy7F/+LP4rtiIOHQO8/WU6FypTBbLHAJTjI+vIZERWOL9EohxuGRya4yjVVJrPVeW59wXJyTWR3S+dP2VRaRo2L4ZXqpNtgOgaVbDJTVZFcXwEYrBSTtqHcq7IDPCI93R7E39Jf5ZKIhGAev79nyjvCt7vBuxcS/LFA8cEQ3wbHJjhsb5t3Dj8W2b4KKWXR3svVNb/bSTy1uBA8wr+gmYYVmrtx6QHE4aoZRfPMv7j5Sn2cCrPENEASIoa+3Pdkzhso/CM8XZWSiGl8RFA/oQLO7+8pxECVdAR25c8i5YA1bPbg5d+6GVhXS18FuDmMt0mT56HBFWG+CGnkrOsYqvGWyt+y5VBhSebqb7AufWL+QUcgCP82ZVtV3mU2VIJbqbStO3TY/h3pMBGg9v1ByqkDgkk/fuMSEqofgbZXiUebO33rDGZiLHjaT9uNRa4+1KyacxFnbDFUJ6wREOEL5zaO2CsVSr5QJOKpHszlNtzgftR73tQVLJOqoR3nxc2cKrj9J8ovSeYuqCPzfovqawPe4+DNLBQV4N3WAE80Kv1xPH40Tlj8glDd+QWhW0yRQfMC8euUBr/ji6RxoJ7ckVucS14m/zxN1pvx7oTCz+c/14BjIBKz+LtT2NkutJrWQCNj7wFrQ+ldBhd8KOeLnRlFJSxcdO2fLNce8pzpxpQlZq5bho/obJvfHzRj0NvHXYwFECBgvJuhNLqNRci5aW0MKUZ4db9OeUnZQeByj3BgyPbOnHUEISoOepxfIs0unNtN6mLoQ3V2XRZPePLNnHnNVCzlng1ihANgGTyl+pgqwr/c6b75f1w/YaUqsy5kHHaSgT5NWVL0j+g==</encrypted>]]>&defaultTable;<![CDATA[<encrypted>SIoRqfcWGdnHjb3HcQr5gLo6L0hSMicok4SvnEM7yBo+BoTn/DRgUdSXa6Gn//GPYzI63ZHr/wNeq8atMpuaczE4+sSUHoslGkl1J2U8Li4=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>jO9omhthnZAcnXutIOUjDUB9c314HrGvIru+3ZXvnSWXJiaj+xA85fBaxy94yQblcxAzwxFXu9S2H2DNPoUh4GmSBVL9p9C0f6SodHcXxepoHiXGRSR7ZF3YLlzvWPfHb/aHIY+pgs0KTkKSx7ab9iXoW0smHyJcd0/Nm/qNVV67Q5tRjATIvlRE0ogTA0VP</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>tQUFWY+fmZQbc7/cJuy2ljIVj91z31CL7+Q7QqcvrrtxzPfDI290oSSreadXevw1/WYpqZrr9VP4L1qHAz7L8lnOGyactYMkgR5CfXx0v23yu5COYzi+OGlAMVC2K9vdzAu/Zcsl9GQJlRAA8B9jEtaOaIBHg+XWHgoDv+AOkvDK2xFAALk7aBOH+zwkK224sghu3OomVKNTj9vB+jthC9Z4n2APmGKtXL5QQ4fdknahIeKRsUyXePSWcwEdwlKfqRvME9Veu0fXEC2fNuLSNsE6SWyM7z6Cg6PEgoQIGJwvoFOkYcq0ifgROo8a7W0krZ5Jm063mrYX+2xKe6+TiModMPsXJP0cVzL0ICEDPk8MeA1YeGstlpk+SEBUT2Bo8M2JJsZWck1uaRZOsoavKv1HfFeXWvM3zC0KVl+a1DR7wZvkXhH4kI2W0QmpiZdKFs8x3cErrlTOSZsKcxEnEbe/G9aX//rnhSWDDrab2s+l0xuzgu/cZyNCjP6bXY3WO9jVtHEAnTkaYkQzqmZLZTrJ0NDcgL/raTXHnA7G00icYIZXCX4DujJhqFPAZV4LDcm89dgr8MKjVQ8iSraPwSLMZU6F5stKBsDdYlwoGMrGQ+FTKHoZOt0heigddGZ9EREFoXvyBrH8VMoSfLJYwRzjNpEWDR61ZdMFP0PzJOVUr6tvo9fCzVCQYwjMEfSPad354iyC9v4pbNNoZzt40mzqMPfJS5WqJAHTqSNcNcWrDxV6Dc8B/pUk2Aj0XU0vxopotWY3/39Ljo9wdGAwK0JIzSTleD3yuPVgU+JNeIImrrXmLmBADszUHP4iYMBpFArmGsVA24gLggR5svnxLozICbhmJUjWrO5PCDI2cQrAbZIthOFaDFGAIaKYBi27QZrVhGD0CD/AtSRi7hgvqHo8GtqIlAAvB9KkdqG+8w2dVfLdmPl5FrKYiLiuPCkfjMa9iSm98KI4oGG46GZ38lMOplAp2o94xFd99Rq+tC8MHCdZwWteJgf5ispsJVyBvlW4p9VvibMJUt/k+KxgWPDgPq+LO0hrKv2vQ0CahakBlw9UTaOeCy4OqbbZNvwc9biyPVxMxArUK285dJmvtRUQxO/6vXHlHMCf79r+Ns+7xvsaZySGyu0KIjwAOi+UyQza3hRk8q5SD7Kgst5it478OoeT47UqWYc0fWtrzqXV3sNAuRJXQEUxrweFrQEeud3xVC6UeX9l3RSeHTCWNQ==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ReportForm">
      <text>
        <![CDATA[<encrypted>8GSKgPSMdkilLcYJpJHkTBaRNOwSc9kU6L2laYt1S1yfcXYwLmXxN8/xgorkhN7rBJLdHLJ8y3+/oAWjoNt2xNORFGQGFII9T+lbAFCVvxeD3vGpu/XouswSs+wI4UzQGHPBIM5OS/TYwcFzk4Focf+3fzm/4vRenwIAPGrRjHQ1zvHWhEdG9ZrnFdJf6/cD</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>4MvSlYt1KryJh9p3EYdigax6+PZQLyAdjxI/FUw+i9HHDGIDqEkgfNgQYVxVBoZ1MaG19bXlOZXuwZXlxjbU78Gcq3c1kbnUY6sEwQJ4IGwtvO+Qk26lV6ZxcZjmGbQj</encrypted>]]>
    </text>
  </css>
</dir>
