<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "TAX01_28">
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

<dir table="TAX01_28" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="tờ khai thuế thu nhập doanh nghiệp tạm tính" e="Provisional Corporation Tax Return"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e="Order"></header>
      <footer v="Stt, stt in" e="Order, Print No."></footer>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="stt_in" clientDefault="Default" align="right">
      <header v="" e=""></header>
    </field>
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>
    <field name="in_ck" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="In" e="Print"></header>
      <footer v="1 - Có in, 0 - Không in" e="1 - Print, 0 - No Print"></footer>
      <items style="Mask"/>
    </field>
    <field name="bold" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Kiểu chữ" e="Font Bold"></header>
      <footer v="1 - Đậm, 0 - Không đậm" e="1 - Bold, 0 - Regular"></footer>
      <items style="Mask"/>
    </field>

    <field name="cach_tinh_yn" external="true" dataFormatString="0, 1" align="right" allowContain="true" clientDefault="Default" defaultValue="case when tk_no + tk_co = '' then '0' else '1' end">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="0 - Tính theo mã số, 1 - Tính theo số phát sinh" e="0 - Base on Formula, 1 - On Account Rising"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="tk_no" clientDefault="Default">
      <header v="Các tài khoản nợ" e="Debit Accounts"></header>
    </field>
    <field name="tk_co" clientDefault="Default">
      <header v="Các tài khoản có" e="Credit Accounts"></header>
    </field>
    <field name="giam_tru" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Tính giảm trừ" e="Deduction"></header>
      <footer v="1 - Tính giảm trừ, 0 - Không tính giảm trừ" e="1 - Exclude Deducts, 0 - Not Exclude Deducts"></footer>
      <items style="Mask"/>
    </field>
    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 40, 40, 20, 60, 30, 30, 210"/>
      <item value="1011----1: [stt].Description, [stt], [stt_in], [form]"/>
      <item value="10100---: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="101100000: [bold].Label, [bold], [bold].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [cach_tinh_yn].Label, [cach_tinh_yn], [cach_tinh_yn].Description"/>
      <item value="-110000000: [tk_no].Label, [tk_no]"/>
      <item value="-110000000: [tk_co].Label, [tk_co]"/>
      <item value="-111000000: [giam_tru].Label, [giam_tru], [giam_tru].Description"/>
      <item value="-11000000: [cach_tinh].Label, [cach_tinh]"/>
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fhqxshTuoWE7nU2bGxCZS0TlLccHX5w4abBksCHZ4TFI1kNUVYQL1c//H/OFCvVQ9iE2OmOeIR0ywgb5wQCERE=</encrypted>]]>
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
        <![CDATA[<encrypted>FvAUjaYb2oeTjQtqNgwqWU3Y05GrmUkwEuk28hRve083enABzAa86KwNvGFuvSyiIzBrE130+sSZMoyeTHAZ+ktKILwN0zkNNDQts1J2Nbo=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>wv1WDOL3o3nSpWkotmXyn0iR70qp2G0Mu9bPGSMGTKiQog9otZev3ub0eqZVp47q9D/iHyX5vINoFvhu9mYnxCDpyFMKwrZDTKd+XnlMAFfOfbptj73JPbXsGaDPoACOG/zRBwfZRh7dU9FvSjhElFwfeVl5n3tK8w9ab9mGc6XGXefHyW0kyYKpPsPehfdg9b+Dw5tL3Ql1ZJe1WczFZi2mkn2rzjjXECNP9rmsYjxTkOwAzFFG7J9JVyhCBA9wGBbIQYSFk3zSX9H9Nemmi6t9LMWj0E37HRaGtdRuxF0J57Gdx0SEDysv9gzjGi2pDnQVkoc/84N1rXT7K//enxeX25RZJZT6GvmlrRp4hmu8wgLn6sUEF73KrrlMYoztXzYC7nvZxijPtj8oeadKHA==</encrypted>]]>
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
      <![CDATA[<encrypted>bf2Si5CV8PKMUlu8OmR5AeoiH+ZRD8VVWzraqmqPHH7wWd+rZxgM6sCPtNcqCdXq558LIB29kOwK/yNvcvrSLeRzMpSTgQWjJaFmUKCYkEe6hTfFkLNyNDCkRPRbsE0Vxoj6SRxhoF3mM7klvqk+Dvp5SDmr81oxAfi/wT8o/HTweFF0ADiHQVVZdHXyLnfVhAfg+uvQQM4oCzkSorhabPYVzeCMc1pZrKO7iagGpVeyurruNGuNI+lT38GZxOIeNyBZd3FwvZixt+2FydDT0PO+N744PA0Ru8jy2eG1cqIP3B/QOz273riJZx5VwVT/kdSOsyzWJgeUFE7dH7Cn80hfsGNHiCp15wFAj0m1Qr3gqtnC7bD2WYu4Qlm3WQTe2umhdKbLjICqX349fC1h2HKWDlcLJylGT6mB76wW+6FWH1ua55ZhgZ/dHCdtcZo6JDdfS6wxRue1sZmx5wjk5Wjo0UlXKR2FUESaOSBdsLt8TEzWLcjcG+Wsx5+O7lgHQ/bkwalkTqnQaDn7kQgFvttHD1dzGJCbQusEesP5k6gI1YpXt2EFBIkQi5xBQMsTKs601l89+sVVCOw+YXUyc0rxMxB/le8OZ7+9zekO0q+BFMxdV9MXGP5QDHzrLBPjF5hY/Ki59awwM25Q8wXHPl5bmuC6cprWb18Z9N/07Zp46Y6UcSaXyhxYwcXdKkq03t5m3IfG/W7b2vfNa9JvZ/zTSrRsSxvoNyD7pxVmXMCdQuUN7XyV+OJygFJbu+o/PaGp4iyaJNi5AkH6m25CP0tVxSTVEW8vIyn+FvHd7FjDGCS5PPu0/3OhsztdNZRqWaDGD/4GsCnwnp0FhVjRdx2Mo+OITjWbgUl2WvyLeX0=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>MlXPLCaOtEzVobFDfNMPVR0xbbFIKFxZRLW2uDYGEcgYLeae6IAAtFlAYSUZoxgWFqvOmoqXtjxmlO8/9pBBNgHJqOEbh7WSNheJqhO6hL1Zm+hMPEwtTzQDEb+uxYFqSRX/9BpucHOaSLiyBB6maM4Z08GE0QkvHvOZjURhxYKCGOpHI9L2EM1DL+R0ijPg6WJ9gN0WFAoK1HOQ8BO7YqJGmuh9ZYxgPHLdi2ycJ/M=</encrypted>]]>
    </text>
  </css>
</dir>
