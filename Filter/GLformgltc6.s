<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY defaultTable "V20GLTC6">
  <!ENTITY defaultForm "v20GLTC61">
]>

<dir table="dmmaubc1" code="ma_maubc, form" order="ma_maubc, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lọc mẫu báo cáo" e="Report Form Filter"></title>
  <fields>
    <field name="ma_maubc" categoryIndex="1" allowNulls="false" defaultValue="&defaultTable;" clientDefault="&defaultTable;" hidden="true" readOnly="true">
      <header v="Mã mẫu báo cáo" e="Report Code"></header>
    </field>
    <field name="ten_ma_maubc%l" categoryIndex="1" readOnly="true" external="true" defaultValue="Default" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="form" allowNulls="false" defaultValue="&defaultForm;" clientDefault="&defaultForm;">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="ReportForm" reference="ten_form%l" key="form in (select form from dmmaubc1 where ma_maubc = '{$%c[ma_maubc]}')" check="form in (select form from dmmaubc1 where ma_maubc = '{$%c[ma_maubc]}')" information="form$v20dmformbc.ten_maubc%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48/EVfKu/nBIlvVoc5tgv/Fxhah8xBhWZC0AHJU7W7I50OUuKua0/7oupP7bnYacog==</encrypted>]]></clientScript>
    </field>
    <field name="ten_form%l" categoryIndex="1" readOnly="true" external="true" defaultValue="Default">
      <header v="" e=""></header>
    </field>
    <field name="loai" external="true" dataFormatString="1, 2, 3" clientDefault="2" align="right" allowContain="true" defaultValue="Default">
      <header v="Loại" e="Type"></header>
      <footer v="1- Tạo mẫu, 2 - Sửa mẫu, 3 - Xóa mẫu" e="1- New, 2 - Edit, 3 - Delete"></footer>
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
        <![CDATA[<encrypted>BdsReXuPQ7IpzHYWq6Y26LcqNe0kk5krI0ylE3SFGVq8lmkuCMpltU/za/J4lLObrHNE6NBNXNWpzDuAycNZc8JzfEM8VmCaff4h7ilnr3Cw0ySAVpm2UriLZ5TigqanS9nttqsgvOQyfNfsqI6FK8wBRtSVfOppGnB4WKrEU9sl5aH+hKWi+bf666pNzzc7RiwvJ7MPicTWROeCI5259hLSKyaA3yqmk5IPqXAuHkpS6cIBzXJ9KfJYTm1kRUcEM9ZG8vLdCl2q3k8szJYQLT3D2NsQTmv1dG20qzVa94kcUNOSq2EMiPKDloJt1X91</encrypted>]]>&defaultForm;<![CDATA[<encrypted>0Sir15mnM0PNG1g0fOF7/VXUmUUiK/3xEVk13T4A+Oc=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>EC9ce4OM0Q6jgxVaqehuwgwIrSMlJsZglQxkOAT2et1cBRd3JC7EcyeaCbMKV9Ej5bWLzG4oFpbnzD942nqemmCQUMkQFNyFiqgdDvEy/+8uPNVIGwuDEdyNBPTKG3UNZ4B5AMHUGhyZXC+SYxlECxBS2tIehkSFAq0CttWHCP/qhDSnWlfEj3jlSnlwA11j</encrypted>]]>&defaultTable;<![CDATA[<encrypted>zxcGrAvrbZyzhNhB7Qc8YbXbjk7icsYg67BsolBIJKkx9/e3g+BuPQKUtJh2W3+JjrsgOt25Pm47cgAaDT6M3pR5M1DjgE/1khCu8pt63QGUapv7w+i9fzqc+jgXOeK0b3B35a3zgmwIJeC3U5x0ObeohXA4qgY6DpGntreBjXemowpg1q5AzUvbKG8ynPZhUoorj/oH/3bXBjbjSy44lbVV1CDpTWcXnO5DWiB9NDryUhdNI/v3V1aXnBppyH1ce9cDqJGGGBQOuOfCmTo/jmGh8L2j6LY7AzlAVuj3J/yopWGUHWlccZWfpfgvnDVEQ58mE6MtRy7F/+LP4rtiIOHQO8/WU6FypTBbLHAJTjI+vIZERWOL9EohxuGRya4yjVVJrPVeW59wXJyTWR3S+dP2VRaRo2L4ZXqpNtgOgaVbDJTVZFcXwEYrBSTtqHcq7IDPCI93R7E39Jf5ZKIhGAev79nyjvCt7vBuxcS/LFA8cEQ3wbHJjhsb5t3Dj8W2b4KKWXR3svVNb/bSTy1uBA8wr+gmYYVmrtx6QHE4aoZRfPMv7j5Sn2cCrPENEASIoa+3Pdkzhso/CM8XZWSiGl8RFA/oQLO7+8pxECVdAR25c8i5YA1bPbg5d+6GVhXS18FuDmMt0mT56HBFWG+CGnkrOsYqvGWyt+y5VBhSebqb7AufWL+QUcgCP82ZVtV3mU2VIJbqbStO3TY/h3pMBGg9v1ByqkDgkk/fuMSEqofgbZXiUebO33rDGZiLHjaT9uNRa4+1KyacxFnbDFUJ6wREOEL5zaO2CsVSr5QJOKpHszlNtzgftR73tQVLJOqoR3nxc2cKrj9J8ovSeYuqCPzfovqawPe4+DNLBQV4N3WR1FS3J8QMpSokgSBdOTlYt5JT19s8bZJDyFz1zQHB6CvOudhXDQrcOfaUrLW3CzyI6GfODflFdAcrwP/cY/4Zyg8+fn1YoAmCW9+76T8o+jXFJ1sYsrTJdo7vHMp9q5DlZF5lGVt+u1AAKjqcPaLmxnnuf8uaEx60w/G1c1nEXZhOE81ZxDFQQqLShexhcLpeJbK8sIM40UBL2zWJYJSRQsxzFona7HXPjLq544RB4P1VMH4k+zxCieEdY8bMFkwo9dEUGv+a/6tXOvvojr7XT2PDuffMFcnwrpoCvXJwyg==</encrypted>]]>&defaultTable;<![CDATA[<encrypted>SIoRqfcWGdnHjb3HcQr5gLo6L0hSMicok4SvnEM7yBo+BoTn/DRgUdSXa6Gn//GPYzI63ZHr/wNeq8atMpuaczE4+sSUHoslGkl1J2U8Li4=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>AWRkUwmxdfr+YjAe/tMjzcwHqNad0bRpleBjIsFhttaTk5zj8nSRGudnvd2u1Q1pn+0qmi3J+w5lSzvf1XvK7NSXbARSSk4/DsBgzAlwjGufQ2ve9G9b/KHtOWNOE9mppaYYENLrS++dglo85DWUWOlYu1YczcofTkmLxNhxCunZnay6XfMEXtLTIAax92Sy</encrypted>]]>
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
        <![CDATA[<encrypted>8GSKgPSMdkilLcYJpJHkTBaRNOwSc9kU6L2laYt1S1yfcXYwLmXxN8/xgorkhN7rBJLdHLJ8y3+/oAWjoNt2xNORFGQGFII9T+lbAFCVvxeD3vGpu/XouswSs+wI4UzQGHPBIM5OS/TYwcFzk4Focf+3fzm/4vRenwIAPGrRjHQ1zvHWhEdG9ZrnFdJf6/cD</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>4MvSlYt1KryJh9p3EYdigax6+PZQLyAdjxI/FUw+i9HHDGIDqEkgfNgQYVxVBoZ1MaG19bXlOZXuwZXlxjbU79Ldvj7j5tqpBWrQjTIlmf07SQvc1gQpn2QaSfFLr6ZN</encrypted>]]>
    </text>
  </css>
</dir>
