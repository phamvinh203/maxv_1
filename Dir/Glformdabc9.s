<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY AfterUpdate "exec MaxvOnline$Report$UpdateReportForm @@table, @ma_so">
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
<dir table="v20covvct1" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chỉ tiêu KQ SXKD theo công trình, vụ việc" e="Income Statement by Job"></title>
  <fields>
    <field name="form" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="stt" isPrimaryKey="true" allowNulls="false" type="Decimal" dataFormatString="###0" clientDefault="Default">
      <header v="Stt" e=" Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="X" allowNulls="false" clientDefault="Default">
      <header v="Mã số" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten" allowNulls="false">
      <header v="Tên" e="Name "></header>
    </field>
    <field name="ten2" clientDefault="Default">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="kind" dataFormatString="0, 1" align="right" allowContain="true" clientDefault="Default" defaultValue="1">
      <header v="Cách tính" e="Calculating Method"></header>
      <footer v="1 - Tính theo số liệu, 0 - Tính theo mã số" e="1 - Base on Data, 0 - Base on Formula"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48yEJDCDssOHChqOdrnvaDDxe382qUeh5eG9eKYy0IIu</encrypted>]]></clientScript>
    </field>
    <field name="ma_vvct">
      <header v="Mã chỉ tiêu" e="Job Norm"/>
      <items style="Lookup" controller="JobArticle" key="status='1'"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Loại phát sinh" e="Type"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>

    <field name="cach_tinh" clientDefault="Default">
      <header v="Công thức" e="Formula"></header>
    </field>
    <field name="nh1" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <footer v="1 - Phát sinh trong kỳ, 0 - Không" e="1 - Arising Amount in Period, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="nh2" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <footer v="1 - Lũy kế từ đầu năm, 0 - Không" e="1 - Year-to-date Amount, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="nh3" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <footer v="1 - Lũy kế khi khởi công, 0 - Không" e="1 - Accumulation from Work Start, 0 - No"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="120, 40, 60, 330"/>
      <item value="11--: [stt].Label, [stt]"/>
      <item value="1101: [ma_so].Label, [ma_so], [form]"/>
      <item value="1100: [ten].Label, [ten]"/>
      <item value="1100: [ten2].Label, [ten2]"/>
      <item value="1110: [kind].Label, [kind], [kind].Description"/>
      <item value="1100: [ma_vvct].Label, [ma_vvct]"/>

      <item value="1110: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="1100: [cach_tinh].Label, [cach_tinh]"/>
      <item value="-110: [nh1], [nh1].Description"/>
      <item value="-110: [nh2], [nh2].Description"/>
      <item value="-110: [nh3], [nh3].Description"/>
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
        <![CDATA[<encrypted>UXi4dLVbLA3AUnbna2/Tz3ROOMaJp41hNA0HikQaPp5Kn4WpzrauVkYtx4w62jgv7+yu/ObIB111C0BYOknQZFrSOzh1EUuie4HIMJB/Kg1LNBFqCv/TbxgHumYnn5mwe6YJ4spbQ3oMV7Rg4261dlmm0KxLnDXFMo0Bg1wa1hnWgKB95iNlNGkN/EHNu9VVqazRONHzKYRTY9HJMMcvt1pHFd1M5V+hra/oL4vru8tyLW0YueK8RmOSSim92AiWYsfoexsboCk8HflO8cLyBo5OQUjuRNgH2ExAgycoqWFVq84h2dbqXr8itNU4kKOnqzsrOaAsWVq++2exLziDr2JWc/4RhyCAFOnNZuT/TSWUdgh4VqC15e4Gc0U/BBVqFNIfBFyEljptdFUL9jMygw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>Z1uNJj3ALDtGeYpMvP7XolOv8HjvavdrpFfTLjrkTKJ+pRTDaRmQZMkCty67c+t43b7gRHMP1mvJWIC/3UTOlOvGw/ddrxCAHoThnOD99whWojen1fo5/2E39Cbx0I/yKXptesOcooSVL5QBTpojlSL8fbBxwOCtyAFG6yx95YfNBb7NO5IZ3opzKHeoYUwhm5AZBGEc/rzi+eh86QFGoXaHY/+Q0aYLupJWb1VJAr4=</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Inserted">
      <text>
        &AfterUpdate;
      </text>
    </command>

    <command event="Updating">
      <text>
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
      <![CDATA[<encrypted>f7bW8fk/a6V0JINYntIeKzhd9JCM2EHRYMxZ0uxyGXE7reliTlfMOhhIRwmkhn9zee/+phSJdJTQUDMrU34gu+NKlTWN8WuRQQTHxmKqswXJuGD9AZ9krjp2AJNFnXzXgWKjRDQb35MWb43rKEf7KoAdKVP/13zKF64ke2lePqo+S16NQDFrfGAAnS8E6bftpEDgtOWcToch9tRiW5+MXiaoWCbPtiA9j2XksQvyNzuXWlj4xCI5tjJ50HdA64uPrYxMGGz2x+zmBYIbrHCUikq/H17zABhCHuWGvc7WOaXkWDtHr0kzTSMDOP93SrHIwA2zykTlm4YKvUU1ACfnVpDbmLAnQx7WAwMH7CJl20rxLR0LuJvDNw6w42mNt4uQWn3hgb6Ua6PtaCpeYhw/vgK3tA7xeZWZ9EjBrwqXTR+78MlILea7UXusN9Nvcno6dJ9z3coRo1J9UA/TSlVwnHHX2PUy4jihrhtnXnl7V1dm4NOJ1D3rOMSMznXD0O6WJNSVe0GE00Hh0tnW4jwQ+fhw5b9klPRfcEKJ6rQ4L65KlpPebLxGy3/wesFJFC61NPKM/1TZpKwtIzsX+0nms2mCayV4WtNraHZcqnDMRZ+SUp6yGk7LNe8UazBOHNjPD3gUVMcEfYegxZ2dGxEhlRZ+cUdwRjl5Wfy39+IUyQZlwKNIxvdg8Bg50alhFTxbKRwk/qTIZZ8uoEjq7u/f8wGvBCF+HlmMu5y1p6rHLs4N22Xx2z01AcnUVS+a7dhLLl2fhsZ/JO5TZDuBRY9E4Q==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
