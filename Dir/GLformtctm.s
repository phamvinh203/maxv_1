<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckIrregular SYSTEM "..\Include\XML\CheckIrregular.txt">
  <!ENTITY defaultForm "V30GLTCTM">
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
end">
]>

<dir table="v30gltctm" code="stt, ma_so, form" order="stt, ma_so, form" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chỉ tiêu thuyết minh tài chính" e="Interpretation of Financial Item"></title>
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

    <field name="chi_tieu" allowNulls="false" clientDefault="Default">
      <header v="Chỉ tiêu" e="Norm "></header>
      <footer v="0 - Theo mã số, 1 - Theo tài khoản" e="0 - Based on Formula, 1 - Account"></footer>
    </field>
    <field name="chi_tieu2" clientDefault="Default">
      <header v="Chỉ tiêu khác" e="Other Norm"></header>
    </field>

    <field name="loai_ma_so" dataFormatString="1, 2, 3" clientDefault="Default" defaultValue="1" align="right">
      <header v="Loại chỉ tiêu" e="Type"></header>
      <footer v="1 - Chỉ tiêu đơn, 2 - Chỉ tiêu dựng cột, 3 - Chỉ tiêu tăng giảm" e="1 - Normal, 2 - Crosstab, 3 - Balance"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="kind" dataFormatString="0, 1, 2" align="right" allowContain="true" clientDefault="Default" defaultValue="1">
      <header v="Cách tính" e="Calculating Way"></header>
      <footer v="&lt;span id = 'idf_kind'&gt;0 - Theo mã số, 1 - Theo số dư, 2 - Theo số phát sinh&lt;/span&gt;" e="&lt;span id = 'idf_kind'&gt;0 - Based on Formula, 1 - Balance, 2 - Arising&lt;/span&gt;"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>

    <field name="ky1_0" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Số liệu" e="Data"></header>
      <footer v="1 - Kỳ này, 2 - Kỳ trước" e="1 - This Period, 2 - Previous Period"></footer>
      <items style="Mask"/>
    </field>
    <field name="no_co" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Phân loại" e="Classify"></header>
      <footer v="1 - Nợ, 2 - Có" e="1 - Debit, 2 - Credit"></footer>
      <items style="Mask"/>
    </field>
    <field name="dau_cuoi" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Đầu/Cuối" e="Opening/Closing"></header>
      <footer v="1 - Đầu, 2 - Cuối" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>
    <field name="cong_tru" dataFormatString="1, 2" clientDefault="Default" defaultValue="1" align="right">
      <header v="Cộng/Trừ" e="Plus/Minus"></header>
      <footer v="1 - Cộng, 2 - Trừ" e="1 - Plus, 2 - Minus"></footer>
      <items style="Mask"/>
    </field>
    <field name="khong_am" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Chỉ lấy giá trị không âm" e="Value is at Least 0"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="cong_no" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Lấy chi tiết một vế của các đối tượng công nợ, 0 - Không" e="1 - AR/AP Items, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="cong_no_ct" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Hiển thị" e="Display"></header>
      <footer v="1 - Hiện kết quả chi tiết theo đối tượng công nợ, 0 - Không" e="1 - Show Balance Detailed by AR-AP Object, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="vv_ct" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Hiển thị" e="Display"></header>
      <footer v="1 - Hiện kết quả chi tiết theo công trình, vụ việc, 0 - Không" e="1 - Show Balance Detailed by Project/Job, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="phi_ct" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right">
      <header v="Hiển thị" e="Display"></header>
      <footer v="1 - Hiện kết quả chi tiết theo khoản mục phí, 0 - Không" e="1 - Show Balance Detailed by Expenses, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="tl_gh" type="Decimal" dataFormatString="#0.00" clientDefault="Default" defaultValue="10">
      <header v="Tỷ lệ giới hạn (%)" e="Max Rate (%)"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk" clientDefault="Default">
      <header v="Các tài khoản" e="Accounts"></header>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" clientDefault="Default">
      <header v="Các tài khoản đối ứng" e="Reference Accounts"></header>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="tk_0_gt" clientDefault="Default">
      <header v="Các tk không tính g.trừ" e="None Deduction Accts"></header>
    </field>
    <field name="ten_tk_0_gt%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="cach_tinh" clientDefault="Default" dataFormatString="X">
      <header v="Công thức" e="Formula"></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="8, 125, 40, 40, 20, 60, 30, 30, 280"/>
      <item value="101----1: [stt].Label, [stt], [form]"/>
      <item value="1010-----: [ma_so].Label, [ma_so]"/>
      <item value="101000000: [chi_tieu].Label, [chi_tieu]"/>
      <item value="101000000: [chi_tieu2].Label, [chi_tieu2]"/>
      <item value="100000000: [form].Description"/>

      <item value="101100000: [loai_ma_so].Label, [loai_ma_so], [loai_ma_so].Description"/>
      <item value="101100000: [kind].Label, [kind], [kind].Description"/>

      <item value="101100000: [ky1_0].Label, [ky1_0], [ky1_0].Description"/>
      <item value="101100000: [no_co].Label, [no_co], [no_co].Description"/>
      <item value="101100000: [dau_cuoi].Label, [dau_cuoi], [dau_cuoi].Description"/>
      <item value="101100000: [cong_tru].Label, [cong_tru], [cong_tru].Description"/>
      <item value="101100000: [khong_am].Label, [khong_am], [khong_am].Description"/>
      <item value="101100000: [cong_no].Label, [cong_no], [cong_no].Description"/>
      <item value="101100000: [cong_no_ct].Label, [cong_no_ct], [cong_no_ct].Description"/>
      <item value="--1100000: [vv_ct], [vv_ct].Description"/>
      <item value="--1100000: [phi_ct], [phi_ct].Description"/>
      <item value="10100----: [tl_gh].Label, [tl_gh]"/>
      <item value="100000000: [form].Description"/>

      <item value="101000000: [tk].Label, [tk]"/>
      <item value="101000000: [tk_du].Label, [tk_du]"/>
      <item value="101000000: [tk_0_gt].Label, [tk_0_gt]"/>
      <item value="101000000: [cach_tinh].Label, [cach_tinh]"/>

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
        <![CDATA[<encrypted>VLHrR83oamV8t7Z/XR1pfsZOcxGt/VyFYD7TEIfx8VNuJ+sX6BZEmPXGRlD/t3LLi9vSji7U2JfCLxFLlsXJrxtY4wu0c2r6/bUtymZbXodBmTqJGJwg3VLgmXbOmQqR78VBbK7bFocGTe9YvpLyu3ftRYPfqU9PWV6aEYjnzNF1+gDglNM1UC41YsLDvIvEoRyisuI7ZFupHZjDNiyXKhSLVy5mLmD+SmKgFlWgM8dTdWTNgsdlneSfEVy5YOkO0IivVhQROm/Wqn/NRAcr+n7nHUs8Iehcy+8fuO7+uDyVNDuJApWsH3IAqqxNY330NW1ZOQlEO9BLXaLYlLe5MphqihoCEQUwSCuTc9vfUGo=</encrypted>]]>
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
      <![CDATA[<encrypted>q/OEioaMACX1z6NSgvjiWLcvtLwtX/2DBuB/rqQ8e6O9QXz/DNSE7pXlBvk4kBP1t6//hUCkcA0VnivQ2WvxuwlvvCvFH6iGkgDPhJL6XN9Zt1dmtc3zZY58mvLQYyCfXbLIPFveRge1wpgMFzNrI6/9L+6etjj1wKCD1GEI1WZanBSpAVnohxUEGIt0rNPUZr4LUhdGyhZKu7dmPzHDv9rxJ9G3je3xEMrqK3uIuxGTQrtZ1QdTQch0VxOWha5aowqxy6vbPidkjaLKTfe6tcpKhlvJNByuI+4frT7/4wUUuffltb2kx6z2SO+wTF393Za3HrYTYVT4KZweyFNUBb/RIzzdgehQdiOOAZIJX3LHUmX5aD0SDma4X7bJ5PTAikluxl8QSJoawK8CDgBGttLAOIb4/1+ep6jTkj/CQzadx1l0fifc+so7RmhA21C0HOPErc2X6vRG2MFt69WbLdWOICDCXT6KxZGYMZn+CS+YEkwFXwXUabqMp2U9BNnqO/nqTZnHcuIynKmaFaT3ow2ojfvjp1OplxWAGgTSrlX6Zefq5Y721I80AKJcsKVyTpZd3ntt35OtUO6bZ880GUMcT9LytOkuRs4EDQ1Pw9R3jEZZJ7rLaiOC1ffhlPXlSPrKTPslhWGcYLunGgTuz1DEXggG8N5B/0S1xAc0aUJ2SqcwnBV5R8cW45XBhHSPrCW/B02J+YdIiQ9azZafcmcMhYr56icAeKcApn9fZd7RkZGNK3fQMA4iye02bAkAdwvzKevKlX0otsL5x2oVqoB2g7HGwJm9PuWOX5H+KiV8oLxBiAPapA2U3I6tkk7RhvN+FpRJbpJs/5hV251vOPQndh6lyyF0s+Cy1bcDpvJqtnqvomFp/euCPytw9gA0NXPzQpWH5/rXrhrLMser4umCRfQWM0wyC54lKl1pV0NbuCvopR9VpVTeWV1o5Nm3GM5XJ2VSPlQc2sM/slvafoTi97GkubykHHYozi3TW+p6E1m7obm5LtPgE1u0EpihdEZgLoMn3hG1YHbtlBH4hbfWivS1hW1iz3jp7WkeCrCKBttONMgUmqUjK5l7pSM/rV7rVoiL5uI2Qnne/w737mxoCheD8yPrWOoD07PFeKz/y2YSOQA85gpE7kv1gHWr+FcoKSZ8MjmCGGqBePKCaOhso2duSnLxFvBFoQ7SyuMh0DgfYf+5CBqtANeSFuI029E6JfnS4v14jMn9knvgKq9crvIFVUP35Gh5zvkirj2VXAnRbSOFn871Au4j0jDKGpfFF1ce8ddYVM4+zZjN39kxysCkE6U7NqeCg6XEYJyCvdHA7skIDCO9Pa0qmPUfSALbb3uvDTwXzSuU/KepZvNbsggM/04TYQL57Bh28A4DlT+v7FBb2GuuZOiWliQ4GeqOV2owroAeGqKH7ShJzbqv/TIdPDd9LNmwHMS/dU6btRDNHa/YRFB7ofbUzdZZFYKkcCfrgafmZzMYmaxTBUR7Z61LbdtUh9Zt/brvRNUxerroD4OTWzSPv46DxdoPj5DEOINSxcXg5Xn11R/9zA==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>MlXPLCaOtEzVobFDfNMPVR0xbbFIKFxZRLW2uDYGEcgYLeae6IAAtFlAYSUZoxgWFqvOmoqXtjxmlO8/9pBBNgHJqOEbh7WSNheJqhO6hL1Zm+hMPEwtTzQDEb+uxYFqSRX/9BpucHOaSLiyBB6maM4Z08GE0QkvHvOZjURhxYKCGOpHI9L2EM1DL+R0ijPg6WJ9gN0WFAoK1HOQ8BO7YqJGmuh9ZYxgPHLdi2ycJ/M=</encrypted>]]>
    </text>
  </css>
</dir>
