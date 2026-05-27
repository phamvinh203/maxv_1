<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "v20GLTC5">
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

<dir table="v20gltc5" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="báo cáo lưu chuyển tiền tệ theo phương pháp trực tiếp" e="Cash Flow under the Direct Method"></title>
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
    <field name="bold" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Kiểu chữ" e="Font Bold"></header>
      <footer v="1 - Đậm, 0 - Không đậm" e="1 - Bold, 0 - Regular"></footer>
      <items style="Mask"/>
    </field>

    <field name="dau" dataFormatString="0, 1" clientDefault="Default" defaultValue="1" align="right">
      <header v="Thu/Chi" e="Receipt/Disbursement"></header>
      <footer v="1 - Thu, 0 - Chi" e="1 - Receipt, 0 - Disbursement"></footer>
      <items style="Mask"/>
    </field>
    <field name="tk_no" clientDefault="Default">
      <header v="Các tài khoản nợ" e="Debit Accounts"></header>
    </field>
    <field name="tk_co" clientDefault="Default">
      <header v="Các tài khoản có" e="Credit Accounts"></header>
    </field>

    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"></items>
    </field>
    <field name="kind" dataFormatString="0, 1, 2" clientDefault="Default" defaultValue="0" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="0 - Tính theo mã số, 1 - Tính theo số phát sinh, 2 - Tính theo số dư đầu kỳ" e="0 - Base on Formula, 1 - On Account Rising, 2 - On Opening Balance"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 30, 30, 60, 30, 30, 250"/>
      <item value="1011---1: [stt_in].Label, [stt], [stt_in], [form]"/>
      <item value="10101---: [ma_so].Label, [ma_so],[ma_so_in]"/>
      <item value="10100000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="10100000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="10100000: [thuyet_minh].Label, [thuyet_minh]"/>
      <item value="10000000: [form].Description"/>

      <item value="10110000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="10110000: [bold].Label, [bold], [bold].Description"/>
      <item value="10000000: [form].Description"/>

      <item value="10110000: [kind].Label, [kind], [kind].Description"/>
      <item value="10110000: [dau].Label, [dau], [dau].Description"/>
      <item value="-1100000: [tk_no].Label, [tk_no]"/>
      <item value="-1100000: [tk_co].Label, [tk_co]"/>
      <item value="-1100000: [cach_tinh].Label, [cach_tinh]"/>
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
        <![CDATA[<encrypted>FdEoHj+sIVjmzK0q5sCEVC9MLt/Kg5o+H3j3lu5NbJaXXh7Bk95qoggHWa2vaxJZEo4cJK8OGQsE7H0BKIRriy+7X6weM3DgRi9m4J5bilHT5oTGlNFeOS+n0cYLf7TRSqME3gT5/tzKPSFk4i2JqK37Lmxicmk48dcpi3knFh4KE7I4GUqc+DopKCqLudd5sykWq1ZfI+KPXPjMmcZTs5HZ00+RKl3fVrgLU2pnoEONt1Owl9U3bi6469sOTwYdZItPKmKjufT4m444iGSeIvKsq1N3cfEfNPUKzVYQpV9xgqDSnRwCeqiYoI97PDnl4Ahr23kJT2nzVFiIT74lu6o47r53OTNNV1gFQmuC9qE=</encrypted>]]>
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
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kn2uFyr7Jt62gXLYXlVr96v0KYp4PMHFI3gpR86Z1zxB</encrypted>]]>
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
        <![CDATA[<encrypted>WVayBf36b4Kr4oiyA9bNF5mJ+uExvZlYgLFxXk5Y75MRARBbdkYSLi57uCsSDL5CedXbQZNYCz1mYxR7rhyoeuiZvcMd59VMhBCBuH8TaOCj+cCVnR61wl2JwE6BtKBsaZfdrQSS7hfLdyruGHGI84iXm+iKOkg4FGEY+XaB759JSPAht8u3BDZLlrBGz3NMKwwLe0o8ff3bBkLJVZ0YqjkKn5DB8g9ErEpDC1gQQSPK/GV1eqJ/T4RT4d/qWqf99ek/ASIF0FGpPXg2NZrFdWoxluisXpAO/+BZZbWxbDqvKh8Mu4L2oMSfg4diYVvrUlg7ZsMaKgBo+d1X8T+e0y0BjkvtqGKjwwZFinW7Gb3e+yLiyhJwlpfXnUfkKyFEvCrvg2a7fLpircYLJtwORMDdTCdhI6jywxu1LEGBCl221ukoMpULxOfBETzNfSKzdfvFy7FBokQt749CzeTDzw==</encrypted>]]>
      </text>
    </command>
    
    &CheckIrregular;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>ByOsUtVPERBLSQoDrHnWgdlQrWhzNXs69abniiCtj9B+VBctGw112A4uLt1hhotTmJgUlrfCGgzYtJ+KDg7Arez/vYqMul39WOvzKF9M2MpkDaDRLmrge+6QOJitbsPW92lHuWEhwrgdtzyn+Lc3nJB2H3w+blyqt2sG4DHV2SvpaqLeh5a5i8XcfFhOuf1pi44cVKJSDrwRZZFltawDeyaOPSXS7Sme2xSNK+Ahd9Me/T3VNymdezoPy5hBqxGFFKoMTQX3ngu/fcX1Exm4SFKZ8uVBY+vXYlCd+3/KHNiCcmvESiHWGv6GL/PL3FQHxVDUa//7tL2f5JSgYnXgpx1jsDSI6+DIFiGNdOGanBGC57tYUKAzHxoz2H36ID/I9AW4w6fVc3kIgyxqQaz8sFFjPwtB8vMtmgP99kPWfshJUL5EL9LFGJpz7+nfLoHztjWfzHM3Ah0rgWslzXLWPj5T+V8WQCQsALjGQCCopGOYl9la/l//0VeTcwGToC7fXun4vfYmIgmaPtB7DQpVBN48oggcS7wb/nFTJNescQ0iD04juHMZYabwAWB2RY/m+4mJoy6KeXAvglYgOlg3Wj3MQEY1mNtTSJays0yLkTcUcU/t1yO6/EcMuJLmNHgw</encrypted>]]>
    &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>Md7GNls0Sn197ZVNR6si+x/3x8LU2uBDLTnl+F2wQQSpRcbL4/AXusHsmbxhrMN7yPGf+reePRTWYbRg6zCV3ZIG3p6KV9klcGb0dX+IsUC2+YVYDNT7/zZz4BtNAoI707+2Eh05tohDomtou0/ETREH/aehnw6usuNVNV6jmOIODFEJmmF//Y6eCMJtfQOIO/TVvi7ftIQeC26tM1/0IjFXb5vkooItqaRLB35las8=</encrypted>]]>
    </text>
  </css>
</dir>
