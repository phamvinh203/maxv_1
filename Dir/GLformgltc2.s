<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "v20GLTC2">
  <!ENTITY AfterUpdate "exec MaxvOnline$Report$UpdateReportForm @@table, @form">
  <!ENTITY Set "select @form = @c, @cach_tinh = case when (@tk_no + @tk_co) = '' then @cach_tinh else '' end">
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
<dir table="v20gltc2" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chỉ tiêu báo cáo kết quả hoạt động sản xuất kinh doanh" e="Income Statement"></title>
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
    </field>
    <field name="stt_in" clientDefault="Default" align="right">
      <header v="Stt, stt in" e="Order, Number"></header>
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

    <field name="kind" external="true" dataFormatString="0, 1" align="right" allowContain="true" clientDefault="0" defaultValue="case when cach_tinh &lt;&gt; '' then '0' else '1' end">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="1 - Tính theo phát sinh tài khoản, 0 - Tính theo mã số" e="1 - Base on Account Arising, 0 - Base on Formula"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="tk_no" dataFormatString="X" clientDefault="Default">
      <header v="Các tài khoản nợ" e="Debit Accounts"></header>
    </field>
    <field name="tk_co" dataFormatString="X" clientDefault="Default">
      <header v="Các tài khoản có" e="Credit Accounts"></header>
    </field>
    <field name="giam_tru" dataFormatString="0, 1" clientDefault="0" defaultValue="0" align="right">
      <header v="Tính giảm trừ" e="Deduction Type"></header>
      <footer v="1 - Tính giảm trừ, 0 - Không tính giảm trừ" e="1 - Include, 0 - Exclude Deduction"></footer>
      <items style="Mask"/>
    </field>
    <field name="cach_tinh" dataFormatString="X" clientDefault="Default">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 40, 40, 20, 60, 30, 30, 210"/>
      <item value="1011----1: [stt_in].Label, [stt], [stt_in], [form]"/>
      <item value="1010-----: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="101000000: [thuyet_minh].Label, [thuyet_minh]"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="101100000: [bold].Label, [bold], [bold].Description"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [kind].Label, [kind], [kind].Description"/>
      <item value="-11000000: [tk_no].Label, [tk_no]"/>
      <item value="-11000000: [tk_co].Label, [tk_co]"/>
      <item value="-11100000: [giam_tru].Label, [giam_tru], [giam_tru].Description"/>
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
        <![CDATA[<encrypted>/zwNeuDqGDkj3df4H0UoXIY/Vd1D74iB9DY9/Klaq7VVV5Ryo9nJIPXIF7tgOwOUg/m4O9YWoTQAQvyGdDzCdINuWYvB9VDV+o3iIVAJYmPZcvBjPd/WThLOhT9zpar7/EctOzPwlTfe0u5pwQgb/75RsWV3oebD7EgpInDpZLuLxRgpDh6yr7qR8EjXdCW34XWbJy9pmeAAffN0GgQBuo/8ZvLpObnja4o+vMnFxbgey7J7nUaq57FAKZAYvfMVNtDGBMRV5jYxGUzRURwuK31gvLyLpfvf9XHEt1eqRA6eyMA6SKKoxCM7zZuO+UK7/W00BToNDpNpRD9GMS53SV+HEumDS8pB5L3wMtvIUVQdcj6tUV6WGnauPNZN0/MU</encrypted>]]>
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
      <![CDATA[<encrypted>kPsVtTp8FXJu5KBZeq9mknCp/fq+lP4mFrc+E9cCJ0bPgjh+HUj5n2raX5s9vKjDpSjfIhfGrLN1FsQQ5scLgomYUWGZDR/tNEPloz8QHb/vPcKfHSp53hW48IwnwM39mbsi6zzsjgYYbwR7OOiu6JphT2355B5cLOtwbPXoHeFvQxrMqdHLD0MlHzPlVcnqEG7vn8bYXGwZwqLNkneVfDKh1jJ7IhYIRO4q6672yZhZEa8jD012Ez556fZnqMz/Y0Bdkv+rgwOCe+Xbtd+SeHJirVw/QhJzM5ZH/SwZgdH+2b1FhNe0MTZ3emAFcteH7SAwDjvNmuIinvS6uj07F8A+ClJAjxErbLxGDmqRgEITqKRGOill3QeGqXvCZxV/CBRzzXkC4jWD5moh9EfcYJ+rAngBd/EwJ0+9mHruCuHvSbMpLMbHQ6PDe0hZj6sHrY3RioKF+y6osjnh/LBdKeC0B3Z6d1XebAwdhm44XF82PVatfyuPWWeu0bKF+/kiPq5FSEOBGkj9IpVcdJ1DjuK92id/me0h+QKQgyncY8szBVCElexE9h/Gx1kDbcXxXvB/WSV5EDv0gR2i26z8ET/vc/J4Q6GrAAbpIzAs0qYiHDOnl2VXLcYiy62mWrthwWJcaU6Zc6oo0ngRXTx3posubDh8qHlCYDj91zRtvyNocZ9PxSZ2kLK6QvwoEUBqV9GuM/maR5TSePI1SGAuJTgYuvmP8NSxpH7L9q1SEcWsGTyZY9dC4AjEQL3kPHrHDEHYjeIRQsTq/953qlRREHwrF0kdmemEkU1K5McRCAdNBFx752IpZbqwZ1nZvomkSZttt8z/dDQOi2JXOE3aLg==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>MlXPLCaOtEzVobFDfNMPVR0xbbFIKFxZRLW2uDYGEcgYLeae6IAAtFlAYSUZoxgWFqvOmoqXtjxmlO8/9pBBNgHJqOEbh7WSNheJqhO6hL1Zm+hMPEwtTzQDEb+uxYFqSRX/9BpucHOaSLiyBB6maM4Z08GE0QkvHvOZjURhxYKCGOpHI9L2EM1DL+R0ijPg6WJ9gN0WFAoK1HOQ8BO7YqJGmuh9ZYxgPHLdi2ycJ/M=</encrypted>]]>
    </text>
  </css>
</dir>
