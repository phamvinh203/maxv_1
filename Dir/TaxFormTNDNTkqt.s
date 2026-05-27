<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "glthueqttn_28">
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

<dir table="glthueqttn_28" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="tờ khai quyết toán thuế thu nhập doanh nghiệp" e="Corporation Income Tax Balance - Sheet"></title>
  <fields>
    <field name="form" isPrimaryKey="true" allowNulls="false" disabled="true" hidden="true" readOnly="true">
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
    <field name="pl_td" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Tiêu đề phần phụ lục" e="Appendix Title"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>

    <field name="pl_yn" dataFormatString="0, 1" clientDefault="Default" align="right" defaultValue="case when pl_td = '1' then '1' end">
      <header v="Thuộc phần phụ lục" e="Belong to Appendix"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
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
      <footer v="0 - Theo mã số, 1 - Theo phát sinh tài khoản" e="0 - Base on Formula, 1 - Base on Acct. Arising"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="tk_no" clientDefault="Default">
      <header v="Các tài khoản nợ" e="Debit Accounts"></header>
    </field>
    <field name="tk_co" clientDefault="Default">
      <header v="Các tài khoản có" e="Credit Accounts"></header>
    </field>
    <field name="tk_gt" clientDefault="Default">
      <header v="Tk không giảm trừ" e="Non-deduction Accts."></header>
    </field>
    <field name="ten_td%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cong_tru" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Kiểu" e="Type"></header>
      <footer v="1 - Chỉ lấy giá trị không âm, 0 - Không" e="1 - None Minus Values only, 0 - No"></footer>
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
      <item value="10100----: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="10000000: [form].Description"/>

      <item value="10110000: [pl_td].Label, [pl_td], [pl_td].Description"/>
      <item value="10110000: [pl_yn].Label, [pl_yn], [pl_yn].Description"/>
      <item value="10110000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="10110000: [bold].Label, [bold], [bold].Description"/>
      <item value="10000000: [form].Description"/>

      <item value="101100000: [cach_tinh_yn].Label, [cach_tinh_yn], [cach_tinh_yn].Description"/>
      <item value="-11000000: [tk_no].Label, [tk_no]"/>
      <item value="-11000000: [tk_co].Label, [tk_co]"/>
      <item value="-11000000: [tk_gt].Label, [tk_gt]"/>

      <item value="-11100000: [cong_tru].Label, [cong_tru], [cong_tru].Description"/>
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
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kvONeh/HyKX923InKTpBhTqLWqJwvkca9NIwL0X/+3pn/KEe1fZZIU6mRvtRUbEpXAFxl711GHq8I1tH0bGt0VE=</encrypted>]]>
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
      <![CDATA[<encrypted>LhWgDDzgTTuK72bb0y8IeddsSyRPP2WAXR8EpLSqmFCjUHwN8oT5r7pM9vVeU7vvL3Vxy3Wjndfc9Pad1t8CJHAoe5OyJJ/MrlOTLiUwhqVsErd6yoCdxvqJHYyCer8AvKvxSRW6/8ZiT2uVYmJvYS93RhnDh0xZmavcEzNJ53ee7q4Z5ODlTItGrYiI1HEv3D6fbZChtM2CH0cWm71LBicBqLhYdox2IfpEDc7SriQUb6ScJS6VwpPvMXnDlC27bA0zG0/4kZyV1BjLG02c1PA8weAgMEfMYf8z02P/6Gsz/PHQit9YJlNPjPVN3bAst2t2eOKIgmmig3NaZuc/0L+r1O33P+tX6M0s/j7B2M3lI4bax4jodGqLdSvaOv46UQaMg8kh7MN0c3p4Iz1w5RcBZOlqCPzeGC7+An1VmAXB4onBys1gS578ADO1LIwXLu9jkTTReSgUzgYqf5xr4i0qCxLoj/k0TQmNuNfVq0vqrIh1wX+sHgVG8w26EMU3gV+dc7kBEtZ4nqsL3vV+D9ontA/MQAgKyolI32Q8N3qnz96FGumz+n9+3pHjZ2o/iaBxfNnSYFdVc7Nk016ZVoXk0pR8JcvDK6JGTREJKlrOxw2O8ancbzGOtRhfF62YSrwrnecbeQC98S0woPAezAWMttbkOt5NrMi7S0oeoHlEfRnx3LoaD1hB5BKiuMBzQt7Yzqo8X0BQd5SUXR5LMmV13qk6WVY3i2bJKhJLSD+HNyOjjfrDyWRQffEopqA2hRX0AyoOqjtNwziiWPUJexWeys/eOwxrAYWSuqfHHHSvmhA/IbdNcNaQKFq38KmNgptmYd2Ox5Xqq2vwJgbvRxDDqsmk0XVRTVnNhJIIGU+rZXXwpmOOiRBcMzWaOMd4B5yGBs8E4uAy1KWtnx4S11mLxR1mvlhf3j0sqGMyVgfWtMzCJVMdavYP+kFNQTxwOTDbH3WF8km/KTvbgzw/eiucBSvmc9W6oB2jTnxxZbzKMQQlYNBiAxvVHdFbEBhR</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>MlXPLCaOtEzVobFDfNMPVR0xbbFIKFxZRLW2uDYGEcgYLeae6IAAtFlAYSUZoxgWFqvOmoqXtjxmlO8/9pBBNgHJqOEbh7WSNheJqhO6hL1Zm+hMPEwtTzQDEb+uxYFqSRX/9BpucHOaSLiyBB6maM4Z08GE0QkvHvOZjURhxYKCGOpHI9L2EM1DL+R0ijPg6WJ9gN0WFAoK1HOQ8BO7YqJGmuh9ZYxgPHLdi2ycJ/M=</encrypted>]]>
    </text>
  </css>
</dir>
