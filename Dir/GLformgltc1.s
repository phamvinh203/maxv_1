<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "v20GLTC1">
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

<dir table="v20gltc1" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chỉ tiêu bảng cân đối kế toán" e="Balance Sheet Item"></title>
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
    <field name="ma_so_in" clientDefault="Default">
      <header v="Mã số, mã số khi in" e="Code, Code When Print"></header>
    </field>
    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>
    <field name="thuyet_minh" clientDefault="Default">
      <header v="Thuyết minh" e="Interpretation"></header>
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

    <field name="ts_nv" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Phân loại" e="Classify"></header>
      <footer v="1 - Tài sản, 2 - Nguồn vốn" e="1 - Asset, 2 - Capital"></footer>
      <items style="Mask"/>
    </field>
    <field name="ngoai_bang" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Ngoại bảng" e="Off Balance Sheet"></header>
      <footer v="1 - Ngoại bảng, 0 - Trong bảng" e="1 - Off, 0 - On Balance Sheet Items"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>

    <field name="kind" dataFormatString="0, 1, 2" align="right" allowContain="true" clientDefault="0" defaultValue="case when tk = '' then '0' else '1' end">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="0 - Tính theo mã số, 1 - Tính theo số dư, 2 - Tính theo số phát sinh" e="0 - Base on Formula, 1 - Base on Balance, 2 - Base on Account Arising"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="tk" clientDefault="Default" filterSource="Optional">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="tk_du" clientDefault="Default">
      <header v="Tài khoản đối ứng" e="Reference Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="cong_no" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Lấy chi tiết một vế của các đối tượng công nợ, 0 - Không" e="1 - AR/AP Items, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="khong_am" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu" e="Mode"></header>
      <footer v="1 - Lấy giá trị không âm, 0 - Không" e="1 - When Value is at Least 0, 0 - No"></footer>
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
      <item value="1011----1: [stt_in].Label, [stt], [stt_in], [form]"/>
      <item value="101010---: [ma_so_in].Label, [ma_so], [ma_so_in]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>

      <item value="101000000: [thuyet_minh].Label, [thuyet_minh]"/>
      <item value="100000000: [form].Description"/>
      <item value="101100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="101100000: [bold].Label, [bold], [bold].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [ts_nv].Label, [ts_nv], [ts_nv].Description"/>
      <item value="101100000: [ngoai_bang].Label, [ngoai_bang], [ngoai_bang].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [kind].Label, [kind], [kind].Description"/>
      <item value="-11001000: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="-11001000: [tk_du].Label, [tk_du], [ten_tk_du%l]"/>
      <item value="-11100000: [cong_no].Label, [cong_no], [cong_no].Description"/>
      <item value="-11100000: [khong_am].Label, [khong_am], [khong_am].Description"/>
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
      <![CDATA[<encrypted>z9/Y9CfzK8QOeagR9BwpS2C52fAi99CVEZWHCn4lir6gCcnMNDPTSM7bIj1r3/rO1Eefxlx6LP50OMoC9g+QSp535JvBJgSJduDz6wd3hUCxvo8VY81nTMcOrBeNZ9esWwslpyRM9GhjMN+nD/GpMjCF7E7DGTRfTfjpwFZTcPYy6tGcet3MkjRtptpEoJde+91bCGI5FA9DZYA7KlAm8/DQnh/a6B1gKnwdjvkdbpUqX2FJB2kvjsA3/QsO/5VPYRbnOgvmF0530UoEUTOOPc8UU7mBlx/vtgAkVYxMgNKJpTUk2zNl9CTiAOhBCR3MG0fJygoh6005MPVqq+PNV1asryXLQrPgt6yJPm+gEgcwTJCV9qOw/8g4DYT1Q+bFupZ831oHGBbOtWoGish+nuMAFdJxSQreln9VPEoZQ04s9hhwow98F13S39gdCkoZEb0+2zVxa5rfsGIDI5p/k2ckiV6bTMChnGtlWxXB/grkUVy1R3u5g3aTy8t9LcKZ2/U+8niCR5uKalCS0utUl8wIE9selUa/V1djLeosof/GJI5Z5ViBQj6PRjHRS/kVzx3+WKIasVmS1xymFNCljX8aPvrXxzDG4N3qiCNEXsHS8NY7OV5YwjoVY0HMrHls7K02D/kL+EmeMEqgh5Xn1qOBSqaRwxFYNQkI8YyEt2q1BdwQB/VyitNGFHnHS7hsLVB23CfrEBYsoAL5+92U9rlOaRF82rO4EDLiB8kZbCkFttfBJBeh8bQ+QXadYoNA8Xp65qZDjlWbOEy8XSsTC7mYKt+hQMu8yHnJKhio5Q8zpc9FnSRrrXZ+a65dyvKv6vc38RVxoZTcRy14fBalYt9fDadF/Tia0OCwpxV31P3BF0olU1R1ybcbmIqbzBCes690kv14IPHlDOqkKHzz391QDnuQpefu1QBziSJEFQSfJqtId0tkH+5AuVaYZPNk8M5VvRI3lvJWlHPLUhMVuaIEAEuRpXPbnzUEBVXUL7A8hUwUqY0HDqJNNSviB3Z0TNHy/2Lk7g0PTbGA7LCndVjy16XsTpRAKVUWAh1dKJh6cJYPWhqhFkrpbMgsn8+zb1hTZHeEtMBPHw5ON8II6gYVaWuWC546km4XhWAV5LMIwN8McLCjCmu2F4mQgq7bkfBhYxDkhJOrs/tqZOC8IA==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>MlXPLCaOtEzVobFDfNMPVR0xbbFIKFxZRLW2uDYGEcgYLeae6IAAtFlAYSUZoxgWFqvOmoqXtjxmlO8/9pBBNgHJqOEbh7WSNheJqhO6hL1Zm+hMPEwtTzQDEb+uxYFqSRX/9BpucHOaSLiyBB6maM4Z08GE0QkvHvOZjURhxYKCGOpHI9L2EM1DL+R0ijPg6WJ9gN0WFAoK1HOQ8BO7YqJGmuh9ZYxgPHLdi2ycJ/M=</encrypted>]]>
    </text>
  </css>
</dir>
