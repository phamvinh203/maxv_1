<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "v20glthue3_28">
  <!ENTITY AfterUpdate "exec MaxvOnline$Report$UpdateReportForm @@table, @form">
  <!ENTITY Set "select @form = @c, @cach_tinh = case when @tk_no + @tk_co = '' then @cach_tinh else '' end">
  <!ENTITY Check "
if (@cach_tinh &lt;&gt; '') begin
  create table #t(b bit)
  insert into #t(b) exec MaxvOnline$Report$CheckReportForm @@action, @@table, @form, @ma_so, @cach_tinh
  if exists(select 1 from #t where b = 0) begin
    select 'cach_tinh' as field, replace(@$updateConflict, char(37) + 's', rtrim(@cach_tinh)) as message
    drop table #t
	  return
  end
  drop table #t
end    
">
]>


<dir table="v20glthue3_28 " code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="tờ khai thuế" e="VAT Declaration"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="##0" clientDefault="Default">
      <header v="Stt, stt khi in" e=" Order, Number"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="stt_in" clientDefault="Default" align="right">
      <header v="" e=""></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>
    <field name="ma_so01" clientDefault="Default" align="right">
      <header v="Mã in cột tiền" e="Amount Column Code"></header>
    </field>
    <field name="ma_so02" clientDefault="Default" align="right">
      <header v="Mã in cột thuế" e="Tax Column Code"></header>
    </field>
    <field name="in_ck" dataFormatString="0, 1" clientDefault="Default" defaultValue ="0" align="right">
      <header v="In" e="Print"></header>
      <footer v="1 - Có in, 0 - Không in" e="1 - Print, 0 - No Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="bold" dataFormatString="0, 1" clientDefault="Default" defaultValue ="0" align="right">
      <header v="Kiểu chữ" e="Font Bold"></header>
      <footer v="1 - Đậm, 0 - Không đậm" e="1 - Bold, 0 - Regular"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_no" clientDefault="Default">
      <header v="Các tài khoản nợ" e="Debit Accounts"></header>
    </field>
    <field name="tk_co" clientDefault="Default">
      <header v="Các tài khoản có" e="Credit Accounts"></header>
    </field>
    <field name="dbf" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
    </field>

    <field name="kind" dataFormatString="0, 1, 2" clientDefault="Default"  defaultValue ="0" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="0 - Theo mã số, 1 - Theo số dư tài khoản , 2 - Theo số phát sinh" e="0 - Base on Formula, 1 - On Opening Balance, 2 - On Acct. Arising"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="lay_tu" external="true" dataFormatString="0, 1, 2" align="right" allowContain="true" clientDefault="Default" defaultValue="case when dbf = 'CTGT30' then '1' else ( case when dbf = 'CTGT20' then '2' else '0' end) end ">
      <header v="Lấy từ tệp" e="From file"></header>
      <footer v="0 - Sổ cái, 1 - Thuế đầu vào, 2 - Thuế đầu ra" e="0 - GL, 1 - Input VAT, 2 - Out VAT"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="ma_thue" clientDefault="Default">
      <header v="Mã thuế" e="Tax Code "></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1=1" information="ma_thue$dmthue.ten_thue%l"/>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" dataFormatString="0, 1" clientDefault="Default" defaultValue ="0" align="right">
      <header v="Thuế đầu vào" e="Input VAT"></header>
      <footer v="1 - Chỉ tính chứng từ có thuế, 0 - Tính tất cả" e="1 - Voucher with Tax only, 0 - All"></footer>
      <items style="Mask"/>
    </field>
    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"></items>
    </field>
    <field name="type" dataFormatString="0, 1, 2" clientDefault="Default" defaultValue ="0" align="right">
      <header v="Kiểu hiện" e="View Type"></header>
      <footer v="0 - Cả hai, 1 - Thuế, 2 - Doanh số" e="0 - Both, 1 - Tax Rate, 2 - Revenue"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 40, 40, 20, 60, 30, 30, 210"/>
      <item value="1011----1: [stt].Label, [stt], [stt_in], [form]"/>
      <item value="1010-----: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="101-0000: [ma_so01].Label, [ma_so01]"/>
      <item value="101-0000: [ma_so02].Label, [ma_so02]"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="101100000: [bold].Label, [bold], [bold].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [kind].Label, [kind], [kind].Description"/>
      <item value="-111000001: [lay_tu].Label, [lay_tu], [lay_tu].Description, [dbf]"/>
      <item value="-11001000: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="-11100000: [thue_suat].Label, [thue_suat], [thue_suat].Description"/>
      <item value="-11000000: [tk_no].Label, [tk_no]"/>
      <item value="-11000000: [tk_co].Label, [tk_co]"/>
      <item value="-11000000: [cach_tinh].Label, [cach_tinh]"/>
      <item value="-11100000: [type].Label, [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fhqxshTuoWE7nU2bGxCZS0TlLccHX5w4abBksCHZ4TFafY8dVPGZvEtkALglNhp9J3apQB20dPChOIYR//xKHM=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fhqxshTuoWE7nU2bGxCZS0TlLccHX5w4abBksCHZ4TFafY8dVPGZvEtkALglNhp9J3apQB20dPChOIYR//xKHM=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>T+MZWh+dm3BMM4qL1aMQ+8oZZ+dFJUZ8tppgilyefRNHh7eOeD4khTGrcBkEXFbjWUBo9ze5hIHXmnY2rJlj9NXlS2ap5HJcWHDa5o//yzw5YDUxJ2DfKu8VyiqWNrrd2akcraeNeo/6rfq9AjKEgjiZKMoNI91LmSlxbSsEtal0Miw3jD2I/offbl3N9KuHD5pzDTGro0vPc9Qt1pMMe1cfcja5ealQlpXw59XvNMgv6onpme0rhNt+BUE1cesQWgef4slsiERuFJagcW/KYYl6DSjd/N4HPc8ePccGowyTg51djLKYOOOPC2XW6HHixZGPGESqBA+A2lwwR0/DZ6aR+spVeswL3Pgp6yWn+3k=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &Set;
        <![CDATA[<encrypted>cvk04x27xbkfxOxK+WLK9tkd2mflTbwUejkTeKqyYomy04EKxA72b6N2bRaExObjbgCkp/imjppnmnGAfi3u6NyNtJkla29kS615na9ilQs=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>wv1WDOL3o3nSpWkotmXyn0iR70qp2G0Mu9bPGSMGTKiQog9otZev3ub0eqZVp47q9D/iHyX5vINoFvhu9mYnxCDpyFMKwrZDTKd+XnlMAFfOfbptj73JPbXsGaDPoACOG/zRBwfZRh7dU9FvSjhElFwfeVl5n3tK8w9ab9mGc6XGXefHyW0kyYKpPsPehfdg9b+Dw5tL3Ql1ZJe1WczFZi2mkn2rzjjXECNP9rmsYjxTkOwAzFFG7J9JVyhCBA9wGBbIQYSFk3zSX9H9Nemmi6t9LMWj0E37HRaGtdRuxF0J57Gdx0SEDysv9gzjGi2pDnQVkoc/84N1rXT7K//enxeX25RZJZT6GvmlrRp4hmu8wgLn6sUEF73KrrlMYoztXzYC7nvZxijPtj8oeadKHA==</encrypted>]]>

        &Check;
      </text>
    </command>

    <command event="Inserted">
      <text>
        &AfterUpdate;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7YS09jSU9gAaljX+1U3aj9yU3xm3y4W54VBan5QQRf+kKJArkPMjqmoYKp+rEwgAPQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &Set;
        &Check;
      </text>
    </command>

    <command event="Updated">
      <text>
        &AfterUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>WVayBf36b4Kr4oiyA9bNF5mJ+uExvZlYgLFxXk5Y75MRARBbdkYSLi57uCsSDL5C/+gLGwnKUcV+yhJ6gfeGrdU+XsDiHyO81Ng3+nsE5G3Zf1zud5lbnKXwxV8kIJ1r0wMzDRP24bHv5IwNp+lnuelbb7iEU7eHa+Gq3hgXbJf5zOvEYqX8HKCuq6FWtIlydtSkjmL6obAyLwGsQcY5f9qt3uat27zvX9twWU5PNBm4eZAcGFzDN8d+Xa+n2ffwQjBGDp0ycnG4i6C+7O/J1uPkSeMEvYJNHB4mOZ2un9+By2zPgT4elvv45749Agawx3mAt8YSdEECaFxlJNjdCl/syLYt0NH+3he8aVbtVWgGN1WMsZht8nQFizzPCETs8NJh1IXYbKjWGz4dXBclGhSkN+2Yv5NCNeh0vcaq7IosKk2F0iB16QEg6Gt0QqMI5BcldTfshQpaoOIjBbrqAw==</encrypted>]]>
      </text>
    </command>

    &CheckIrregular;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>3KmL1OOe58vv22Xc/8HKLSHRyZHzspQivgRG5D8MLYMmZ5q8gpQV/pd4HTjSy0UgSxiPOLrHia69OXy2A/xi0luLKGj9Uk2OgC0NjLdUqV1J78Qnvla4ZLpILrmUTVYxYZxOw6n7dl42O5DpSEih/aQF0VkH8RifoxK+TY0O4z/IgfOvm+Wizoj06Vt/FUxv+n//a4CgsZOacp6XaDwHh7yPdFiTueRH+D9NA15skYPL8SZW2CMxMMY46mdaFALr3iIYFqggLKwQQWQRUQbSwu3OoBPiHB3sQzNHrdwm2As35Ww8abXU4xNpMKbNHz0g5nSw2CpKFUpshRnJlXG0JxUP2PHrW7cakzy43IRgsTgq+bV+xzr5tF1k0/nNVOVxFLSe20liKb7k3zV57pP0pCC0BYoprURSErrOc01Vp9VjxhflPv6IO6xjkYvjvwcua7IGAuk+AcrgKQZAOt0Z0DqozYgq4JEGHaGrw8ng3m6vAVR4xn7oa7DYxDd73heDqWlWc3iByX1EsYXhS6yc0nxSgArmOsTZ9vSKyvhGgYveiU8Mhz6okgd/c067Ql3yuAXKJaJj4nOE47sHlEgv3o7OX+5tkGsdiJAHzkAUtDI1iAjGCJObJz6wrioZdaFzyteQ3TnsZ9KMelEu6Zba1Ytxu+Gsl5CRnbvuiOzK9Zsf4PvJ2/2p7OQWmkghLoPFcxJNoxUfGQmTSal+7jtRcZSeeCeJ78IbLaTF947Le9kXisEFr1hdf930j6oFaU8PsTBA8JyfblIkEOzN7FttcDsyEIH0AnzOmXazDsU3Tl0ONVLzu/WxbFgiL+OHRECrB+QWNTAnmbTFxwZkkYCm6w8GjLg+ViyFxURL8RjVYqLuCEDjddchPh/KQ7fggt1BTZ5OMLz4ZbnMLh4KvaPdoo71NxTbh2h58FxqvAIbynvIYGtnA3FdZCZeYOsfwP0O0m7hoMdIYv7/TvRrNlLa2dqjIzxjlSvOPybAaCiOzT+vKfLYijb2Ol3n/bGV6er7LhnmAYfRcvB2okXpDfsRvCk3d3bwmMw8ZJYCcwZAVdrqq4HoCvay2o7TUG2sGu2J9TQAeFf3tUKb1K+oZEN+kUj7wPlgX3/B55GOQSqjdOTID5oDMVQLr/NVdrlcVG0TUcYfvSsepMO2xrAHv2+x6t1c1WlXZ0v3V0xHyDrfOK/U5s3xPBAcM92ovh/UUlcA</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>MlXPLCaOtEzVobFDfNMPVR0xbbFIKFxZRLW2uDYGEcgYLeae6IAAtFlAYSUZoxgWFqvOmoqXtjxmlO8/9pBBNgHJqOEbh7WSNheJqhO6hL1Zm+hMPEwtTzQDEb+uxYFqSRX/9BpucHOaSLiyBB6maM4Z08GE0QkvHvOZjURhxYKCGOpHI9L2EM1DL+R0ijPg6WJ9gN0WFAoK1HOQ8BO7YqJGmuh9ZYxgPHLdi2ycJ/M=</encrypted>]]>
    </text>
  </css>
</dir>
