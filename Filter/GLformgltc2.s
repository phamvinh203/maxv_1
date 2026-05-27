<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY defaultTable "V20GLTC2">
  <!ENTITY defaultForm "V20GLTC21">
]>

<dir table="dmmaubc1" code="ma_maubc, form" order="ma_maubc, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc mẫu báo cáo" e="Filter Condition"></title>
  <fields>
    <field name="ma_maubc" allowNulls="false" defaultValue="&defaultTable;" clientDefault="&defaultTable;" hidden="true" readOnly="true">
      <header v="Mã mẫu báo cáo" e="Report Code"></header>
    </field>
    <field name="ten_ma_maubc%l" readOnly="true" external="true" defaultValue="Default" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="form" allowNulls="false" defaultValue="&defaultForm;" clientDefault="&defaultForm;">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="ReportForm" reference="ten_form%l" key="form in (select form from dmmaubc1 where ma_maubc = '{$%c[ma_maubc]}')" check="form in (select form from dmmaubc1 where ma_maubc = '{$%c[ma_maubc]}')" information="form$ReportForm.ten_maubc%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48/EVfKu/nBIlvVoc5tgv/Fxhah8xBhWZC0AHJU7W7I50OUuKua0/7oupP7bnYacog==</encrypted>]]></clientScript>
    </field>
    <field name="ten_form%l" readOnly="true" external="true" defaultValue="Default">
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
        <![CDATA[<encrypted>TUFGAoBm76lAqRW2z6nBraQ//9DVPoFaFzV+lY0zfeMCUBFAOlqHK8ZnAlrxkTbhUwgiF+tWBvsiI4RF9wEbh8YDuB0pWnhU0S5vSvznCBNOCR6pIMoweMGLXGYL5aXPHuT1/3CCSdKP+J1OxbEE2chHk7/K+vMlFXsVmHMpG+Wox+5YMp/KnzTlKa6rPSQHRzg5+kXoqh0HKuH5uVAJiv/Fep74JaAr/Eo/P3RFc0QFIhzFSDvyjugy1X9HnciA4gjhFY1oZuoOZxdR3mKF9xb68SEqPlwhv2xowVe5sCKpog7dfrmlYOxYPAms+/F9</encrypted>]]>&defaultForm;<![CDATA[<encrypted>ZYJdYgZIxtjyeZbfMk76lHppupjQOz/LJgyHR496nv8=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN208nr8ddUOkdV+VIPiouWE+Npt/BygzU+deCoHyHy2MUu1t17sBWApdTAeaOfFfW5SK25Cwy8n2fi/Le22V72eHwMlyqRZSzkk0OXo+4tLPCNBV9O4VqjKCGd8NQElE+JbSyLdI71ao1f5NJwgP0Wdvsjx+ZLxWzlC64/NTpSeX</encrypted>]]>&defaultTable;<![CDATA[<encrypted>zxcGrAvrbZyzhNhB7Qc8YbXbjk7icsYg67BsolBIJKkx9/e3g+BuPQKUtJh2W3+JjrsgOt25Pm47cgAaDT6M3pR5M1DjgE/1khCu8pt63QGUapv7w+i9fzqc+jgXOeK0b3B35a3zgmwIJeC3U5x0ObeohXA4qgY6DpGntreBjXemowpg1q5AzUvbKG8ynPZhUoorj/oH/3bXBjbjSy44lbVV1CDpTWcXnO5DWiB9NDryUhdNI/v3V1aXnBppyH1ce9cDqJGGGBQOuOfCmTo/jmGh8L2j6LY7AzlAVuj3J/yopWGUHWlccZWfpfgvnDVEQ58mE6MtRy7F/+LP4rtiIOHQO8/WU6FypTBbLHAJTjI+vIZERWOL9EohxuGRya4yjVVJrPVeW59wXJyTWR3S+dP2VRaRo2L4ZXqpNtgOgaVbDJTVZFcXwEYrBSTtqHcq7IDPCI93R7E39Jf5ZKIhGAev79nyjvCt7vBuxcS/LFA8cEQ3wbHJjhsb5t3Dj8W2b4KKWXR3svVNb/bSTy1uBA8wr+gmYYVmrtx6QHE4aoZRfPMv7j5Sn2cCrPENEASIoa+3Pdkzhso/CM8XZWSiGl8RFA/oQLO7+8pxECVdAR25c8i5YA1bPbg5d+6GVhXS18FuDmMt0mT56HBFWG+CGnkrOsYqvGWyt+y5VBhSebqb7AufWL+QUcgCP82ZVtV3mU2VIJbqbStO3TY/h3pMBGg9v1ByqkDgkk/fuMSEqofgbZXiUebO33rDGZiLHjaT9uNRa4+1KyacxFnbDFUJ6wREOEL5zaO2CsVSr5QJOKpHszlNtzgftR73tQVLJOqoR3nxc2cKrj9J8ovSeYuqCPzfovqawPe4+DNLBQV4N3WAE80Kv1xPH40Tlj8glDd+QWhW0yRQfMC8euUBr/ji6RxoJ7ckVucS14m/zxN1pvx7oTCz+c/14BjIBKz+LtT2NkutJrWQCNj7wFrQ+ldBhd8KOeLnRlFJSxcdO2fLNce8pzpxpQlZq5bho/obJvfHzRj0NvHXYwFECBgvJuhNLrwHsBN4ZwXY+TV8esZB///pE3PYVGhNtenHyFHn/4v9YypZP+Ugy7mV/ONBy++kIZRoEoYJGLHCtzRvJSfy4t5d6jayQSF0C/Y6lhyYbMqWyDT2U78bXqYN0m/aqTi5dQ==</encrypted>]]>&defaultTable;<![CDATA[<encrypted>SIoRqfcWGdnHjb3HcQr5gLo6L0hSMicok4SvnEM7yBo+BoTn/DRgUdSXa6Gn//GPYzI63ZHr/wNeq8atMpuaczE4+sSUHoslGkl1J2U8Li4=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>jO9omhthnZAcnXutIOUjDUB9c314HrGvIru+3ZXvnSWXJiaj+xA85fBaxy94yQblcxAzwxFXu9S2H2DNPoUh4GmSBVL9p9C0f6SodHcXxepoHiXGRSR7ZF3YLlzvWPfHb/aHIY+pgs0KTkKSx7ab9iXoW0smHyJcd0/Nm/qNVV67Q5tRjATIvlRE0ogTA0VP</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>WKHeDaVYiimO3bGwXKDgXGFVNj3Z+F92JTQoW6FdLTTw/FWaQYwsTWU9JQ/PdGZiyDGz36XTlinEZqMbWTgKdhmykMl5hXceHwmcY3S68Mo9hpyXXNQq0ZSjmtS1hpv5UQibXM4F6GB8NwIWNw+W6AD7QgnMFTeDgnrfH9h3tS73TM1CKupgCpbWyDPY70R7NwstA2GSwpVVo/hGRYHfu8zRLQK2PQXbpW/OhZNZhOt93tJKAS0t8gwn/Po1inJf4l0ggP+OX3v+RuIAiRliCTYqw+BkKq8GBfgW7KJfIKCHxDKyHq613OkYcsnktMB0qu/IeReidTaOuwFxRdEhMKA9/VDi6ijXraALSlMyHI6iSm69eH2nsbfGnPVhexGPjBsdr6CtG/SHwhu73JnsH92nJKiWnLuBwlUMMnyQ+S3neUady4JuO7Q7eaPJz0N1G8nlWv5AG+xVLZKoV1MxLouGpPhsjCP9RcyYQCK9/rmNLSgZ0bQEqKjGnejuKShbDK0lspM5HEeRgTnz1G1OPvACy5vYPIofUG50XGyWi7Gbn20PtWjgLYUsCHx+P04Okt7QgOYZBL2Ll+nOaF5SjBHxWRbIJvNHimJo0cX09chqqJBM+eRPrGzM8mg64GtH016D4+TKrsRi8Yz2af7DFmbORFHwdRUcbYyxffpElailJ7Zx50WQSPr505+mTZQqCLGUZWJX5V65sVrNnoc0K0/F6lEl3BDImZ1s+Un6jWU7wUQiR5+zHKRduIJ/m816LydMtr/2x0XcCUh0tI6ZTKRmzZ56Xvhjli3OiTAWmoUNtR9cZp6QqZO4Q1B9kiKR/foIKjIS1fKoiwEkm3LjXspjXU8kCx+w1J7OiS0oJaESyi0INjBUVpxoT9xxiFqxCwakCaKYA+DRAo3YL086sOG+yMNR6Faru8HrO258CRIm6jHxH8wWDiPAoxvP+qnlJfN3NpTBN25wK3DdiQytcbLXWKE0xJo8OYhE/boeHaD1YJ6evbfb6+cDAESkHuJ/l1ob78nAza1T56khFtgKQcGjJ0SYj0rU4ifDd226YEW152mX6nbE4QfkiCD7DLZgsvwrxYg16/8TzIPxhxeOFyH6igRyUHTCvg+/BUxlIxfBfsLDIPx7c94RW5jKPZ8PuEnmN596WgwanatqgwjVwZSGEZ9z7vYf1aPoThPa7/2uUSFc5uOejYMWiB/M+glni9Gl/17PEfK42gi7GumBmg==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ReportForm">
      <text>
        <![CDATA[<encrypted>8GSKgPSMdkilLcYJpJHkTCMvELV0JvRVink+LCOVuse6xCe/lfb5WbArHQzPAJn+aowF/lh/O11JofsaxuIekdq8DSYEN9ONuE9CJRSV7kk4OULV8hWeMYPYKXM518oWJ5GIkxfoqWxtE+2aB/26fZXHj1SXXxmvrb9tDd4OWrO9q5Fe0LueBKUKJCo6Jc8X</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>4MvSlYt1KryJh9p3EYdigax6+PZQLyAdjxI/FUw+i9HHDGIDqEkgfNgQYVxVBoZ1MaG19bXlOZXuwZXlxjbU78Gcq3c1kbnUY6sEwQJ4IGwtvO+Qk26lV6ZxcZjmGbQj</encrypted>]]>
    </text>
  </css>
</dir>
