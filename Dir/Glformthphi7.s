<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "COCP1">
  <!ENTITY AfterUpdate "exec MaxvOnline$Report$UpdateReportForm @@table, @form">
  <!ENTITY Set "select @form = @c, @cach_tinh = case when @tk = '' then @cach_tinh else '' end">
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

<dir table="COCP1" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chỉ tiêu doanh thu, chi phí" e="Sales, Expenses Item"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e=" Number"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>

    <field name="stt_in" clientDefault="Default" align="right">
      <header v="Stt, thứ tự khi in" e="Order, Number"></header>
    </field>
    <field name="ma_so_me" clientDefault="Default">
      <header v="Mã số, mã số mẹ" e="Code, Parent Code"></header>
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

    <field name="kind" dataFormatString="0, 1" align="right" allowContain="true" clientDefault="0">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="1 - Tính theo số dư tk, 0 - Tính theo mã số" e="1 - Base on Account Balance, 0 - Base on Formula"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="tk">
      <header v="Ds tài khoản" e="Accounts"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="tk_du">
      <header v="Ds tài khoản đối ứng" e="Reference Accounts"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="tk_gt">
      <header v="Ds tk không tính g.trừ" e="Non-deduction Accts."></header>
    </field>
    <field name="ma_bp">
      <header v="Ds bộ phận" e="Departments"></header>
    </field>
    <field name="ma_phi">
      <header v="Ds mã phí" e="Costs"></header>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Phân loại" e="Classify"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>

    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 40, 40, 20, 60, 40, 100, 80"/>
      <item value="1011----1: [stt_in].Label, [stt], [stt_in], [form]"/>
      <item value="101010---: [ma_so_me].Label, [ma_so], [ma_so_me]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>

      <item value="100000000: [form].Description"/>
      <item value="101100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="101100000: [bold].Label, [bold], [bold].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [kind].Label, [kind], [kind].Description"/>
      <item value="-11000000: [tk].Label, [tk]"/>
      <item value="-11000000: [tk_du].Label, [tk_du]"/>
      <item value="-11000000: [tk_gt].Label, [tk_gt]"/>
      <item value="-11000000: [ma_bp].Label, [ma_bp]"/>
      <item value="-11000000: [ma_phi].Label, [ma_phi]"/>
      <item value="-11100000: [no_co].Label, [no_co], [no_co].Description"/>
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fhqxshTuoWE7nU2bGxCZS0TlLccHX5w4abBksCHZ4TFafY8dVPGZvEtkALglNhp9J3apQB20dPChOIYR//xKHM=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>T+MZWh+dm3BMM4qL1aMQ+8oZZ+dFJUZ8tppgilyefRNHh7eOeD4khTGrcBkEXFbjWUBo9ze5hIHXmnY2rJlj9NXlS2ap5HJcWHDa5o//yzw5YDUxJ2DfKu8VyiqWNrrd2akcraeNeo/6rfq9AjKEgjiZKMoNI91LmSlxbSsEtal0Miw3jD2I/offbl3N9KuHD5pzDTGro0vPc9Qt1pMMe1cfcja5ealQlpXw59XvNMgv6onpme0rhNt+BUE1cesQw1kwqbuvc1157HXzciuI/Yh1gVC0fQRGYfyFSXZtpx4IHLWzqw3kbiRWsAqUCTgW8qVzVZN+34am5vzSB1ZT4tD/lbk0LrDMuYIG+MRDRzc=</encrypted>]]>
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
      <![CDATA[<encrypted>J3nF/yKYEWGTTWu4oVafQUHLRV/bDEJG1qk3eQNQ2EA3UjuFEvv43q1dmZ/QZcwGSxG2Rr73OAQCfEvuWAwARKIFz/gGgWeElBYjuLsAP3trGiVgDUztviNZ69nNowsSrGpfTP8qIRMUGwCgohI315z1LR7wOMogPwxy8L8AxtJI9Nn7zroucyy6HkEq34st4sFsewly1BPE9+Sw7kfkJhiJmZQ/JNcx6oBDDZ9CVUDvEpDIEbHibMfbOhG+sKKVpQxvpU633YqPALqO7ENrTTccM6Uz4rFJFD8URUmuWG380HhAw5513bM7wfx67IYCFHR7c7xYD4IQUUj1KyQa9njOmNNIc0z1iMYgP+qhteqYIn4j+7shlh3KQrLHlc7QDZ1CTtAwmpVy52ibKV64z8as20OkFt0vS8Btc1IczlDwe2TUwYkZSZ2iX4zaq5fs/14Lwom6g+VaRcKbiIERyH1Tm2WCq4nfUnxTPUU+MbzG6Q5twtZnw8+kc0ZvBvoEuvXvenZtWkA5qLxHX5DVMZK9xTqt1Gt/RjYvnZf9zsWVhiI9YBUTwelk6lL7o4zmzZB/HpOUIXvawaEB2PP6EdjhW2LuXs5rGzkbwU+U6fM0aRye5Syc1YEe7YrR7ZmyhIkHNoLPANjtEWXnoNxol6T5IVzq8tbBEUwBQROMYlm9LAcZQbghXqTd9gkV4CWDhlYTnO/6IMWW+WNZyQopcS/4jitPxsGfXG2n0jaxV5pY+1/JgVSP8/i+QxZbtFMk0BXDYTwSPowvnuZqJ/8q8wlj80q5YlUFMi6xe/7IbOQoQccfDWp31YSEfIFcfMg5s4UtTmYKIeVbx8VgknvQ/kJBVbEFkL9f7CrjxsONZQHCvXfFttuRm0vP+gbXAZpfp2iHZd+Y4mSgrbLoCKNmQ3cJjAtxyLLMmBUxTckmCkhFxS8c0jefuwGYibiA0WEIveCl5paNPcVyGWbnoi9tNpjAtApDZUKy5JzZCpMSfl5gAzhHWYFUJkhIAggu4/gjGZjSkKCeHuB1hAB9uGpBJ43dOf8otW5t/Z8g2NOxBAATe5yZa1tMJv7aEf6DuRYNxjAf+2YhZ4WWOwQqYosdVqsVFf2rxwP2K1XqsSn6NLEPEfP/EFxwOpAfC9fcllDy</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>MlXPLCaOtEzVobFDfNMPVR0xbbFIKFxZRLW2uDYGEcgYLeae6IAAtFlAYSUZoxgWFqvOmoqXtjxmlO8/9pBBNgHJqOEbh7WSNheJqhO6hL1Zm+hMPEwtTzQDEb+uxYFqSRX/9BpucHOaSLiyBB6maM4Z08GE0QkvHvOZjURhxYKCGOpHI9L2EM1DL+R0ijPg6WJ9gN0WFAoK1HOQ8BO7YqJGmuh9ZYxgPHLdi2ycJ/M=</encrypted>]]>
    </text>
  </css>
</dir>
