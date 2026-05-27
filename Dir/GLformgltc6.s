<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "v20GLTC6">
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

<dir table="v20gltc6" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="báo cáo lưu chuyển tiền tệ theo phương pháp gián tiếp" e="Cash Flow under the Indirect Method"></title>
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

    <field name="tk" clientDefault="Default">
      <header v="Các tài khoản" e="Accounts"></header>
    </field>
    <field name="tk_du" clientDefault="Default">
      <header v="Các tài khoản đối ứng" e="Reference Accounts"></header>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="khong_am" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Chỉ lấy giá trị không âm" e="When Value is at Least 0"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="dau" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Thu/Chi" e="Receipt/Disbursement"></header>
      <footer v="1 - Thu, 0 - Chi" e="1 - Receipt, 0 - Disbursement"></footer>
      <items style="Mask"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Phân loại" e="Classify"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="dau_cuoi" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Đầu/Cuối" e="Begin/End"></header>
      <footer v="1 - Đầu, 2 - Cuối" e="1 - Begin, 2 - End"></footer>
      <items style="Mask"/>
    </field>
    <field name="cong_no" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Loại" e="AR/AP Items"></header>
      <footer v="1 - Lấy chi tiết một vế của các đối tượng công nợ, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"></items>
    </field>
    <field name="kind" dataFormatString="0, 1, 2" clientDefault="Default" defaultValue="0" align="right">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="0 - Tính theo mã số, 1 - Tính theo số phát sinh, 2 - Tính theo số dư" e="0 - Base on Formula, 1 - On Account Rising, 2 - On Account Balance"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 112, 30, 30, 60, 30, 30, 250"/>
      <item value="1011---1: [stt_in].Label, [stt], [stt_in], [form]"/>
      <item value="10101---: [ma_so].Label, [ma_so], [ma_so_in]"/>
      <item value="10100000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="10100000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="10100000: [thuyet_minh].Label, [thuyet_minh]"/>
      <item value="10000000: [form].Description"/>

      <item value="10110000: [in_ck].Label, [in_ck], [in_ck].Description"/>
      <item value="10110000: [bold].Label, [bold], [bold].Description"/>
      <item value="10000000: [form].Description"/>

      <item value="10110000: [kind].Label, [kind], [kind].Description"/>
      <item value="10110000: [khong_am].Label, [khong_am], [khong_am].Description"/>
      <item value="10110000: [dau].Label, [dau], [dau].Description"/>
      <item value="10110000: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="10110000: [dau_cuoi].Label, [dau_cuoi], [dau_cuoi].Description"/>
      <item value="10110000: [cong_no].Label, [cong_no], [cong_no].Description"/>
      <item value="10100000: [tk].Label, [tk]"/>
      <item value="10100000: [tk_du].Label, [tk_du]"/>
      <item value="10100000: [cach_tinh].Label, [cach_tinh]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kvONeh/HyKX923InKTpBhTqLWqJwvkca9NIwL0X/+3pnggQLqP4zECYP7IOhv0njs66ZsadDx21Zid5DKwN1JDY=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kvONeh/HyKX923InKTpBhTqLWqJwvkca9NIwL0X/+3pn/KEe1fZZIU6mRvtRUbEpXAFxl711GHq8I1tH0bGt0VE=</encrypted>]]>
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
        <![CDATA[<encrypted>cvk04x27xbkfxOxK+WLK9tkd2mflTbwUejkTeKqyYomy04EKxA72b6N2bRaExObjbgCkp/imjppnmnGAfi3u6NyNtJkla29kS615na9ilQs=</encrypted>]]>&defaultForm;<![CDATA[<encrypted>wv1WDOL3o3nSpWkotmXyn0iR70qp2G0Mu9bPGSMGTKiQog9otZev3ub0eqZVp47q9D/iHyX5vINoFvhu9mYnxCDpyFMKwrZDTKd+XnlMAFfOfbptj73JPbXsGaDPoACOG/zRBwfZRh7dU9FvSjhElFwfeVl5n3tK8w9ab9mGc6XGXefHyW0kyYKpPsPehfdg9b+Dw5tL3Ql1ZJe1WczFZi2mkn2rzjjXECNP9rmsYjxTkOwAzFFG7J9JVyhCBA9wGBbIQYSFk3zSX9H9Nemmi6t9LMWj0E37HRaGtdRuxF0J57Gdx0SEDysv9gzjGi2pDnQVkoc/84N1rXT7K//enxeX25RZJZT6GvmlrRp4hmu8wgLn6sUEF73KrrlMYoztXzYC7nvZxijPtj8oeadKHA==</encrypted>]]>
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
        <![CDATA[<encrypted>ZoH8V1iolBa16b5L5LMOFNWf//nPkbxofjeiSUHuf2JRnrtHBEmGcDZPrC7H8vhvHw7OTn65KfBQsoipOevX72qmwBgNux6O7898YrPz/affkg4Ltf2qpajzhHg9t0CbVxq2Gh+PBSyff5S4J7zcj0/gpcQvninNll63b2WYwsZdF3rn7IjFoADl3Hfhdojw9zWTzOJ/CHQohf2Jh4URFLD/gX3eiwiV2ujdPGd3xobh9WyN7x25yc3Z1xT7ztu30gZ6QKKFJgo+ZMZexXE45dujRoZQjE6XaJeN2HD7UglDZOEXd2ksRiB06hh0SwaF67CHaYoMAW5XoTU230+glYwYQhY+rzABTWSu+iUah0SbCGNChnWFYzbAMzOzN4NmJJKQDMbq7+eqlnkbeyRVPojFUI+1YuUPShsMhdpJd/eSgOWQsUkJIhFYxjxY3YiTtzFfU4/jT7TUvRLz4euwwA==</encrypted>]]>
      </text>
    </command>

    &CheckIrregular;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>U06KNBcHXNmRT9pb/h//rfk/AJs1G89DaooqCGfC4I11Wqf5vw3+QLEaYAYWWNZvgz/OFfD80rYkrQ1/7AiUakDqjRDZq36VarJD+giosAKRuFBJXFb+cfGyCmuaFca8+4ovyWHxkaKzKG0RckRpVZwwLDNzCLa3OBBUoNq4M6zeBbIAOUAfo4Geff5EjRFQlEhIYH1N6WsbdOWdIr8H+uwjT06mct/HpZEQ2mHYldlwDla2AaUN07Oq/8ThQ6uYqweTG2ds6JC+IQCGWE6zNenzEy7jxe/r14gphE9022yvZZatmi76PZnbVYzy6f60e3/dvnXJLqemCiC1BZT/jroWM5nEZk3boCC9+RWAnTap5F8eg+N4gTy7YSN9Yj/LQkqtgk+SGwuu9mHjAAO8P8IZxU/c36/yJXgE/XLbKregK/ST7oQO6bCMmPbBMLc8NK9M+1K7L9UyAFlGZzabUAQ3RiecoO7nKZf9Mhq0/wT5uf1sEZB0g35HearHhrbTcBOZ/btunHm8eshvUDmQW0Bnj2mz6yOW5sD59DEKdY81rokOd4TNpCZcdztUqtsctPVOpZWWGlqzkXtB2NPz1qaF1S77o9Bg8dwYj6X25BQZ6yJ1QwciWyGRp8rNBdjuxz8Yo1wli+dY79ebtM85tyPQt/B8qTiwAhg0SZQgRFqkpVhqSDcFM04kErpj/Heo8bwQjJXCfy49eDsW5jEDhA==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>YaXthurMkhLeHVcyHI7oYobBnDP55wXFYf4uoqJk4jD8R0nx+RXHFnHmPpUWzdXxYl3NQ2cUN25cwn1ebuRSrhBHxulus91yNOffbry40PsGLzO7H6uEAcSrC2suARH7vj/VtEiIlfUPgcct0F3tk4pZ02BJU4fLoK3GEJ43TUZOqaw7IzCOntbs4crgCDlGJmsXNT3eY2R6Hap4JPoMozWNj/KFqQFvG7++a4qIg/E=</encrypted>]]>
    </text>
  </css>
</dir>
