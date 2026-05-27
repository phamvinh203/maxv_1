<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\CheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalFieldQuery.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucher.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">
  <!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd29$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post "
if @status &lt;&gt; '0' begin
	insert into ctgt30 select * from r30$$partition$current where stt_rec = @stt_rec
	if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_ps_no_nt, t_ps_no, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec fs_PostGLTran '@@prime$partition$current', 'd29$$partition$current', @stt_rec, 1
	end else begin
	  exec fs_PostGLTran '@@prime$partition$current', 'd29$$partition$current', @stt_rec, 2
	  exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd29$$partition$current', @@id, @@userID
	  insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec 
	end
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete cttt20 where left(stt_rec, 10) = left(@stt_rec, 10)
delete cttt20 where left(stt_rec_tt, 10) = left(@stt_rec, 10)
delete cttt30 where left(stt_rec, 10) = left(@stt_rec, 10)
delete cttt30 where left(stt_rec_tt, 10) = left(@stt_rec, 10)
delete ctgt30 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
	delete r00$$partition$previous where stt_rec = @stt_rec
end else begin
	delete r00$$partition$current where stt_rec = @stt_rec
end">
]>

<dir table="m29$000000" code="stt_rec" order="ngay_ct, so_ct" id="HB8" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chứng từ phải thu khác, chứng từ bù trừ công nợ" e="Misc. Receivable Transaction, AR-AP Interface"></title>
  <partition table="c29$000000" prime="m29$" inquiry="i29$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCmVcn8h3iz76804lWbbVpa4+qfED8HT/UON2+1BJB+dA==</encrypted>]]></clientScript>
    </field>

    <field name="ma_nk" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @@id and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
      <handle reference="so_ct"/>
    </field>
    <field name="ten_nk%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chuyển KTTH" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
      </items>
    </field>

    <field name="d29" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="196" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="JRDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="196" categoryIndex="9">
      <header v="" e=""></header>
      <label v="Thuế GTGT đầu vào" e="Input VAT"></label >
      <items style="Grid" controller="JRTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_thue_z" type="Decimal" external="true" hidden="true" readOnly="true" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" defaultValue="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" readOnly="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="256" anchor="6" split="10">
      <item value="50, 50, 110, 139, 0, 110, 8, 110, 8, 58, 52, 8, 110"/>
      <item value="101-1----1100: [so_ct].Label, [so_ct], [ma_nk], [status].Label, [status]"/>
      <item value="101------11--: [ngay_lct].Label, [ngay_lct], [stt_rec], [t_thue_z]"/>
      <item value="101----------: [ngay_ct].Label, [ngay_ct]"/>
      <item value="111----------: [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="10100000-----: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d29]" />
      <item value="1: [r30]" />
      <item value="---111-1-10-1: [ma_dvcs], [cookie], [t_ps_no_nt], [t_ps_co_nt], [t_ps_no], [t_ps_co]"/>

      <categories>
        <category index="1" columns="829" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="829" anchor="1">
          <header v="Thuế GTGT đầu vào" e="Input VAT"/>
        </category>
        <category index="-1" columns="50, 50, 100, 129, 0, 100, 8, 100, 8, 58, 42, 8, 100" anchor="2">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+h8+/zDkfxNKEkuCaDXg5D5afWvPREV8SxT+4cgS4spA==</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>Prfg37kMJ8WBqoB5CvJCKf7bGLn7xzhd/qTwELa/vRyx2yQIA2RHENHp4ogjvxpOgLuPugRZg31KNe08ByME5w==</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+h8+/zDkfxNKEkuCaDXg5D5afWvPREV8SxT+4cgS4spA==</encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7ZE3/7wegKNgL0bQHB5rxUHCKdWEuCuz6Y+bcJ0Ai+Ew</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;
        &CommandExternalFieldSelect;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGEDEWpeDuiokdzyGnMoPcwLySWqTS15Z4ehvPndDZpEiWN/JK0qK8UQraui47JwdsMxEKM+wY5x0EuF0FyoYJFKE=</encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;
        <![CDATA[<encrypted>YO9vH39UC9rfBjcWs2k+kdUbj9vKGjQdSORTOH+KTkA=</encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>H3u+n02nzX3HDWbpoYhFmUw8G/59AdFCGBOceN63U5VuO8bQsxi0QdTjHaJ2kE38RUIAbtxUC42TvumYaz6UmOkqHDOe4QhOxFMZriGctOf4pXVihLV2gLmH7aejB1J9vFco8uj5EZv3PKA4fz8fIWxsG/4lGMtmXqcKnKnZNmxUSnsrgYBpXMe5i7kB5Xj0VjdMJA0DHks3vNk4GQBxg1/eSRT4uplLsTUoXhKK8FKYJ/9L+D+0gAhfPV7RipYJ89n8DUqyofYRxpSspis8ZKexh/GtL1KJeZmTaegtDXt7xXctpkwXiWnnukwiV9KGZ0VwRkC7NHFxqn7iNzVR1Q==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>NTivEj3DpqcIh2FDHuDJ4UBiuKSuznpiO4xBNGE1KguNqDg2q2/zt0sqYBkhCteHpU+9+MeTElJKLZJUQccuORTYarugYltgEeg+4li+Xc7XWX1AqQ86mp4/P9f78z8XrzhljgaKmKhbnqnRF5Q1D/0w02h/6eeYSJgBcRLRC3heYyBqOYe7zvaouv3OBDJemRaQtlNqlOFeCdBSollxBJ6iHyqhhodLPSlwQEVRNBPg5BG+M3T3C7+jQYM2SWT19UODV4TL8G+Yeb4vlQTnwTNIFJC4I6+xDMzceyJHYs0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPsI8XfpK55edapYfbELH4gmyZAQcxad4N68pf+qFkJCa8WtIfFV5vV1zgkGELJxydZDwDv3AVjP1j+lVyMuQlaU7nwI2rCdt5hYNz8pgBz01</encrypted>]]>
        &AfterUpdate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0MVtL01/SSgXvIIkjPEpj2YQwNY1asZaw+EZzQ28ctVS</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>CtOyu0wzzjXDoQoDrtcDWpuJBBVPrdavRBuSJScx4fKDHuTHlP49t5irTg1a9j9pSwvNFaVPFrRywcKPFv+yDOX9ZRj0W+sYV0qaDlC6LVwr/ArWJ0SJYwxivNovm/ZH4wShiOjdp6TY9c9P+qX/cnQIlKLmBo3hjo+rUNdsejcqzFNoXW3byjqaBHNpj3z2HRyator0hcQjytXyDphU2bAlrGN7WDAEt+A0cAWKULGWPhFp+M+62G629iznymrn4ev0aAHeJxBvAk79L3gei4exxQSCXjMVRoXGhVPfFr+RHhkHhEK9pNkBFNHXp5mRugp6PsRiEd+VLGg0P9UdISNYNvCi6N7m9ao+UUQSgSk7vTJfK9cgi+Ban4GtdG8zOwVjAf23hKlsctmldDj+vZwOTMuRwm9puzY/VQG+myNSlixktoa4xJ75QQc8u6Cfoi2gxYRO5N+4hZTeZ1yRS9DrseUUJzdRsj/BwzyRAJcZx/iNnV/u62aGqU5zrIyPA0Hvn8LWZ6xZmbvWP6s7JFopN0YxUeM3c+Z3LH9hvbMUNdY/+IdwVLlFjdqYJrGenS939NLmyk+SoRlquOwCByDuelYBcBa54ApiVdw0dt5bS/xe+dcsnYT9RutMN1vw</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>sY7/sFYLtA3aiKJ5cR0AfAPhL2elhGPDI+waRo3ixrbATAo//8HxKvH69DfEx/XkkrBaxDkj0kp53nL+CJqvkP5ukRbSyl0HVP5CBOYHualprvf2nqDm8aaftRBrYtixrG721b5rfs1bUeLXIAueluap1RrHNt0v243vyriNc7MUhJBPh01SxXJS9wRZo2ulHBhapqZuvUAd14wxuUs0WRigYYMOGZVcnc8wQWutZY0=</encrypted>]]>
        &AfterUpdate;
        &Delete;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>MOhwnJIgOhfSrSXMoBHMjEB0Z7wPMugzwYmuHbSD5IkQiOvUwWRNf93aDReAQL/QyTS66k+zJx900tFg1BxSs8ermOzrBOzvf4FfYvu3zAMkf00JzgD18LDvwd8FjZrvQJHwolfLIFW8yIw6Xx2Ko8ITMK5+NxYWBOXuYnWGpPvbggw9M1d65+Snw6jiqu7Vos/+yrBUDGYlr7u3UTozMg==</encrypted>]]>
	&InsertHistoryVoucher;
<![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKw0X5Pshj948LdpccsM8fd3NgRJrtfez8DkT2GaQzZjVTpc7T0n1efTjNfD0I6xZmS6MmB16mBhscJ8r6ywTV2nke5etK+n+YbgKVDNClV4Of/nyuHCYqFvwJP2laz8c8oA==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>uoCLUS65ccRHiqBsbxn8R+RnXvu58i1Qkl/1bAR8YDKZBXFpNTlyGFQlc84gTZqqwfMPq2W51VpLMq5xW+b3IwtJzLx9JIFHSRwvVMEfpj0/wrDSxHL8oeOi2uPHmR+5Jp82UG6gyK8gzTGJFE6Vz1/UBbwVBbYXiLFLo91/nKIb4DSVvadPr+nSWns7dAySVfwtmZ03m3n+i4iWlrQaWmseD8Bm9k46d9FeaqhBfO2bbM0WMd/WILF2EoIxxVLaHcetsq3j7N3v8X5sXZI/6Nnxm4PNpXqbuqy/FVoFefuk/SZpCg3idHvq1gfdAC+TiTwwVy+/5EdWY8Q56V9SeuHjn72y3f8ilmmE6mTpzAEi0eJ4jmE/yUWj0OgxyiYqdvQ6J0+zrFlU2en5q/pZpwev7lmeIyL3xd20OAwd2ZYBeNSfXqQCig54zonM4BI9MLQnGS8X22WrCIrPW9z1bkZ18nrRvmRcmEsZ3+1PYLTKicfe5iPauMSq9tfkpLeWplPKWWwb1mBH7SzUvNYkxxwx3DR8UPNKWRWTlJaOZvwwPSkA6ZGojDFB9IZOKuLPLD9WMe8bVhXz65EDUeeel7L1AsvNX98s2R2cvFagAPSJZUqiqFkozi+AyOqXr/9fNwVD4XQuy9DcOYw33kfP2289DSfz0k+PS9RRbr9UTEBUZ+ORKrr1A/EcPq6AkiBv2e6DC8ad+dNCOkPOaaXu0EyNt8nIZzO5BkA+2RBLQyJWqkCIiDeVCUkoD1z9T1FzIfsEz2GqnFHNpEdARc/AaA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS8ujoq7/rjkpcL2Xib0I9otcsKQrpNfiHJMzOEP/w2pyC+Ad9/dMaavP7sypK+V8Zj</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>holZ9nnnS4fCln+Zadky2zqO6Xu1JUvaDEUNN/zMZCgVU6mbciWXmZko+sdXgGclt1k/qw++ZaSujx7TujAgakbbE+aruBBg3lJ0sWSgF86t+a0qk3V+N+ims3Xm9rZI6hwN+rg/urDQHRyks8duRQDc6h+d2Z9qKSzX0Xjz6Go=</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>9XZS5blo6O2J4yFjjf95ETztTgKBMJCn5aTBWxEAMJXrZxb3ma+oYZJ/ZeS0Nb2zN0KUUt/4Gky4UneSb9GxHdojeaHEF1idT5q9u/ukFrjHZu3sWgKEAkfO+z6YoOW1fsO3ojYIrM0WUkADbr7/snkPcmD+PES9zgmHNnaJftsVUAjIm5bZMcG6DlpP13OnJMd8HesbZpC1XFVO2KvRhbw59bqL0Oz2U5y6t3VDLT4BLE9gMCRnOi+JtTrC/bkZZzblH6eFa4k8lK6M3Vv3y09OOqQKHFDim5lBUJ78g+f6W7sGG02bt1ukyBEOGpsali+QuDeXm44LiGyTll/tEsyVDUGbLYWKmK8t1VBW8iXoYrF2UbxfFlq2RgNZA5iSSCP9Iv2lSwVjsLjeFScRAy8GAbFbSsMNz6vGSueXZpc=</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>XBoOnqMmtKykybI8eTMUKJVS1bcxfRGoY9OP9TofBz512WjsLGuYhUAo+16W2fjAK3aOSSNGBN9NEypUNmA1UMdqlpus39j7AV4Fiedk3yKyfE1e2q8JumKgGT3TRXTjktyeXHLiz5GV9GI3CkRGAN6YQ78Q8BP6mRNM6xr+179dG3OqJI3E3E3RVtc8IQoS4TYN0sIyozq0S1lh6GZmEOkMdeCiBOC6vg0zEnTsoVVOYn00RQBLd8a4OvvyHSMd3mLL3x1lkSQC+RRWqoWtNMh03rIlqGlQc8BBEfNhQtpxcsJaVdoSvXYz2IqXLRpbGcFZADEUFwldniMBBTSkI6F4+7pVdNvC21g0jkPtTOkuv/2wVO8oTuBU5/4BBDni8wQAzqImYmRMJ7p6+XwsikgL+TM0xlFWJ217Vuyh5UbcqOvMM5zuHPNyZJKIqgrsYungoa6vjjZJk60ARxWbKw3WIOZ+e8aG8AzmgBW8Im9xn3zZgV2r5no9HY66XbTW</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>klU0wU0vy1UV9IN9Hw1CqyetKxO3/E7l+EpvdX82Qt3intYIh0Iyx7ZQB6BkYqM3peBAhx5FPBGDLwWy/ZzOlmwXajC5/2r3fW8DGJ7VQD+sL8U4rGb+HYrhXsClToU/dRN5yfG482eYEa6cLMEvKl8veR23aKkzc8lkixVR9EVQm9ebe5QbsmQY9yLZUzyunZUwOAwCSzidM8xdvb2ojw==</encrypted>]]>

      <![CDATA[<encrypted>HJwK1aXSjXm3JcSXdZbcQES0Y4pDMQatzAHMhVaP8UerUPfkxqDaADyd0lu2DVa08s1I/AMAORwUfYXur4bHhINzSUw+qV3Sr543Kb4lpyYY6Xq4AFP6Yyb7pRpac9d0jng9n9AAjjYQy7Kk+3CWi/2CaoPw29wGUm8nWeR/5RGWnJANtiS56WCciXkJ+Us9whknnR0G5pg4NpMo99lXCox+r1X58QRtd4FkkeKpvB/9VkLOZ+J/g3CnqMuxVwjMmRedwVXADP2JcRSjrgB+gb6eaXGMABuzFg2bSxrpF4k7E6MvnsC93sDmrxL4DGtLASKKNAw6eHGXiJriZTgyaoM0aUmgH8+1Nhwb49wCE6wkQK0t2tJCMixrQCeLPZM/r5TcUKfLrXWXPLVfT+RG/kkYOczZYZvtU9Bp9owDFlTcvuOJfxdFiQMEUE8DziRA</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>MOilLNFBc/xPdyXPU2+iPbZx8hYxmR+0wM1AcjyWQKg/XIdMVWYtfaaVtnb0t7IYahrRtwsqpXpMrq7eSYLqYLJC855XEpaRAiP3q9KYNSoSSandsBiXXZaCl4pZNS6ImTKqGBVYZddbYdAKVQPX8q72/RHa2n5cw2knkMINc8XaEDjeE5X1GNjJkH8Iw6PWgoY286K7jdrUCQxzoBwU1bQXCmntGqyG+e+Zs2i8p+ANwWQ2+OF9iSjGt5/x0Pj6A7V5EaUznpJiSLReaoOjvQ==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>
</dir>
