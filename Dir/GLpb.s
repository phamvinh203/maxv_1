<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Check "
select sum(case when ma_vv = '' then 0 else 1 end) as vv, sum(case when ma_bp = '' then 0 else 1 end) as bp, sum(case when ma_hd = '' then 0 else 1 end) as hd into #g from @dmpb1
if exists(select 1 from #g where (case when vv &gt; 0 then 1 else 0 end + case when bp &gt; 0 then 1 else 0 end + case when hd &gt; 0 then 1 else 0 end) &gt; 1) begin
  select 'stt' as field, case when @@language = 'v' then N'Chỉ được chọn một tiêu thức phân bổ trong các đối tượng &lt;span class=&quot;Highlight&quot;&gt;dự án&lt;/span&gt;, &lt;span class=&quot;Highlight&quot;&gt;phòng ban&lt;/span&gt; hoặc &lt;span class=&quot;Highlight&quot;&gt;hợp đồng&lt;/span&gt;.' else N'Only one to choose allocation criteria.' end as message
  return
end
if exists(select 1 from (select count(*) as n from @dmpb1 group by tk, ma_vv, ma_bp, ma_hd) a where n &gt; 1) begin
  select 'stt' as field, case when @@language = 'v' then N'Kiểm tra lại trong chi tiết có tài khoản, dự án, phòng ban và hợp đồng nhập hơn một lần.' else N'Invalid account, job, department or contract code, it already exists..' end as message
  return
end
">

  <!ENTITY Calc "
declare @job bit, @department bit, @contract bit
select @job = 0, @department = 0, @contract = 0
if exists(select 1 from @dmpb1 where ma_vv &lt;&gt; '') select @job = 1
if exists(select 1 from @dmpb1 where ma_bp &lt;&gt; '') select @department = 1
if exists(select 1 from @dmpb1 where ma_hd &lt;&gt; '') select @contract = 1
">
]>

<dir table="dmpb" code="stt_rec" order="stt_rec" type="Voucher" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="bút toán phân bổ tự động" e="Allocation Transaction"></title>
  <partition table="dmpb" prime="dmpb" inquiry="" field="stt_rec" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" allowNulls="false" dataFormatString="##0">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_bt" allowNulls="false">
      <header v="Tên bút toán" e="Description"></header>
      <items style="Mask"/>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản phân bổ" e="Allocation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pb%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pb%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dmpb1" external="true" clientDefault="" rows="242" allowNulls="false" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="GLpbDetail" row="1">
        <item value="ForeignKey">
          <text v ="Decimal: stt_rec, stt_rec" e="Decimal: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="loai_pb" dataFormatString="1 ,2" clientDefault="1" align="right">
      <header v="Loại phân bổ" e="Allocation Type"></header>
      <footer v="1 - Từ tk có sang tk nợ, 2 - Từ tk nợ sang tk có" e="1 - Cr.Account to Dr.Account, 2 - Dr.Account to Cr.Account"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="302" anchor="7">
      <item value="20, 100, 25, 5, 45, 25, 303, 25, 25, 35, 120, 25"/>
      <item value="10101: [stt].Label, [stt], [stt_rec]"/>
      <item value="101000000000: [ten_bt].Label, [ten_bt]"/>
      <item value="101010000000: [loai_pb].Label, [loai_pb], [loai_pb].Description"/>
      <item value="101000100000: [tk].Label, [tk], [ten_tk_pb%l]"/>

      <item value="1: [dmpb1]"/>

      <item value="101010000: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="20, 100, 25, 5, 45, 25, 100, 25, 25, 35, 120, 25" anchor="5">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>Y9Dj9ROvDCThl0h/A6l/cR+y4Xc+K5QtfbP3JTiyNrN6Z5kzaGg2SPMG06bGIEiwqc4b97IM63myw+J8qWlCF3UatTYHl+gaL/2SUvf2OC6m9LKPcMtpHuqyzadFIgxTnJt3r0Hr+08HzMyduDM4ZugnH9x0Rq1+hCKVjZfmdlpq+GxZJztueIA248c77E3qPC0EChuil8L4pfmA9fmQBoEMDLmD2ZFRh9fXW7E+RIpDXxKYVgBSrKSQI+AWTnMEoKiZ0NLqlbrjto0OAGgpUYTRK9xC49KJlz1EeFsxcjEDLa6W5i2/WmebNz/hg2kKAz17hLWhj9xJIxutwYGBB/h0G9BBizmQ1ZInTAgLVtldybNWWwA547bLnVM/zMKIRk0nzw6Pb3e7zmtfFX3madWm4uqnK6uah8F+ud+XwqtPDAoA0DVAvlCBIej5LVquYssFX8Wvm9YcMeRIIc+8TFHd7ZoYlSw43NKCtz5SnKo=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &Check;
        <![CDATA[<encrypted>7jN4hgHzvCWtXWtXrGbGPDDhgNmIYWz5Bq/xNzBiOK1uYACSQvGsmuoN1vJRv/XBmYqncR2zoBeTkrR+NiR2Swlf/OEEVhpA9HGJuOlmrnZq4Rx25/h+u3/JCJ4Z/fqbQX+AHwfoDve60+8CS9HCGoAGGXKztkE4q4vDVK6J1+TC1J4PogTGvw4WCDsSWXqw02wOrMvE/LAo47Yl/bTeilYmnt3dXczbsTcfYemrsXLxw3hQNLsy35t+cxC+8jM5tx2e9Xy/aeY1XFo85shDVuHFZr3lpW0187484RojY7ZYuM/GSBXsLGnDBeBz//CvpOunWsUbPJyLS12bMB03tqj3VCPEkwa/QvJnztmThGGLB0VbV4WWcge362Wujqek</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &Calc;
        <![CDATA[<encrypted>HREQ0LW+wnMbGONMx2B/IRybHVTJZbY/pI//39r1rkE6Bfz00enmo3FLVX6D7RmCNISGHpIQxUBj/dywNkL1XZ/Japnnb32nXU6EGFMm0KwaYlqlk53tn+tnUIWInPumKNfIs9Nb0dEj46SLfu2JEmKOYy0FnG3rGqSiVljTOQH8TiiYjmyzzWuXkEI+XLoyF/if8GzHm0zOH7YCni2pdg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &Check;
        <![CDATA[<encrypted>7codgrcBW00UcnsUtB9mGVtJ69oMMiltDXz1Fu8armX3MVB4mOVUSD8U/wf1+QjOyGsS4xfCrvAPjWumNdnrpTF3X60m8FPFOQTzcq8Yi938EoYh/++4R3geKS6Q3CP7gVwmlg3fYNSr9a89CtK1gD3DcDuH5S1Rk05MnhwxFotN+tVJBAMbURw+i8uKcreJd/u9ezYhQ8UjFaF3O8RAEglIJkjArPvSkAoEEnks5HsvDK+QsvhSvnWGWJ0JRc2C5XBnT9NTdfrNTciymNnKwFLsf207NY7af+fgwF+jGbfunMPXMd7pBPBE3jMwlfgVMF7ILXuouofhFlbhzuv/gsqwYufzX5KkJdlZGNTBQbs=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        &Calc;
        <![CDATA[<encrypted>hdXMNbJ4uM30CyXRTyc/HO57eaBEgBDf0/pbEMjHFsFSfLBTTzHw0OAn3V7bSXI5a6omAxTupVXaqmsai+rCooSdHGuTvtf/XM7NvqLofoTsiXP46p4/6Pd38FaHrVsFixUK8S/g/SRoM6CMRk06jiBFSQTIElec/jdaLaeVn/eeqdigx4reXfoEQCQMce84fVCpG1IzY85yKc99pfmCsGnQCE2ctGaM4+5lvwJ6C5IfBYfzL+dYKrOhjeW6yGMcKcooiFuWrbNzsqt60QZrCQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKwzR0HOBYFf3dFF0EGzAUqYt52CY2jzjMOG7/+ynee0ONf8Hla1YBAsaSH291qG3G/A==</encrypted>]]>
      </text>
    </command>
  </commands>
</dir>


