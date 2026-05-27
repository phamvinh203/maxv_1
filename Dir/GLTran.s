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
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd11$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post "
if @status &lt;&gt; '0' begin
	insert into ctgt30 select * from r30$$partition$current where stt_rec = @stt_rec
	if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_ps_no_nt, t_ps_no, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec fs_PostGLTran '@@prime$partition$current', 'd11$$partition$current', @stt_rec, 1
	end else begin
	  exec fs_PostGLTran '@@prime$partition$current', 'd11$$partition$current', @stt_rec, 2
	  exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd11$$partition$current', @@id, @@userID
	  insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec 
	end
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete cttt20 where left(stt_rec, 10) = left(@stt_rec, 10)
delete cttt20 where left(stt_rec_tt, 10) = left(@stt_rec, 10)
delete cttt30 where left(stt_rec, 10) = left(@stt_rec, 10)
delete cttt30 where left(stt_rec_tt, 10) = left(@stt_rec, 10)
delete cttt50 where left(stt_rec, 10) = left(@stt_rec, 10) and ma_ct = @@id
delete cttt60 where left(stt_rec, 10) = left(@stt_rec, 10) and ma_ct = @@id
delete ctgt30 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
	delete r00$$partition$previous where stt_rec = @stt_rec
end else begin
	delete r00$$partition$current where stt_rec = @stt_rec
end">
]>

<dir table="m11$000000" code="stt_rec" order="ngay_ct, so_ct" id="PK1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu kế toán" e="General Voucher"></title>
  <partition table="c11$000000" prime="m11$" inquiry="i11$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
          <text v="1. Chờ duyệt" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
      </items>
    </field>

    <field name="d11" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="209" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="GLDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="209" categoryIndex="9">
      <header v="" e=""></header>
      <label v="Thuế GTGT đầu vào" e="Input VAT"></label >
      <items style="Grid" controller="GLTax" row="1">
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
    <view id="Dir" height="261" anchor="6" split="10">
      <item value="50, 50, 100, 129, 0, 100, 8, 100, 8, 58, 42, 8, 100"/>
      <item value="101-1----1100: [so_ct].Label, [so_ct], [ma_nk], [status].Label, [status]"/>
      <item value="101------11--: [ngay_lct].Label, [ngay_lct], [stt_rec], [t_thue_z]"/>
      <item value="101----------: [ngay_ct].Label, [ngay_ct]"/>
      <item value="111----------: [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="10100000-----: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d11]" />
      <item value="1: [r30]" />
      <item value="---111-1-10-1: [ma_dvcs], [cookie], [t_ps_no_nt], [t_ps_co_nt], [t_ps_no], [t_ps_co]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="769" anchor="1">
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
        <![CDATA[<encrypted>NTivEj3DpqcIh2FDHuDJ4XfqT+ziFM3K+7sKNu363Ev0Qqh6hik9HU3i1rsf66TpeIUViCgbqQ7ADxOBlp/VtxNuhSzTDM9oPV9s69qSBTHwwQa12wpz0p1KrT6MlguhXexTJsxcxFSmeivOXMc3YCjSj7rU3OHr81wUiK3KJ6yfLBx10aZnxGZxyqtI1tqNzeQAFkueM6ucUjaqw2XTIZsHujkOWwMh+MIT3o6qcXwe0sfmWMA9B/HEgndADxhzr9b8hV2R81ejEFmE9Bn15Sv0WJYTkFZa8jEFqxZ/fKI=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPguxOmX3/RvoQQ+pSzE4eIVeE7rnvROOX6+U7aCY0tjrJEIOmIsHhl8e8+Rleg4FRzOet9uiWcKNErUhp8RyYyWbg38GYs5AnQ7nyQAa5tDc</encrypted>]]>
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
        <![CDATA[<encrypted>CtOyu0wzzjXDoQoDrtcDWqTyhaWtUIIDhyb/gb18UzO4/8L/AxQWMx7Uh+80nOJl+kox0ceqvl+F80O35sa12XHvsQjfrFfFmB8GLZYUpWAj2BJsFdIHJmepVhhSv9JqbmLUStwklmyT2sB11d9OGouWCOHjDDZCH4RROtBDZw7BAxGa4GvhSNrTxEV8wDxvqUwbORAu84LzAocv5YJLpL+Bp5oE7pJkR2UrWAPNcLgLf5rQZVCEHXzQLc1cr/5cSib9Uko4nQotcJ7YOZOUs5rCPfwtQkFnmAnVxZ4jFb0wDh9T+6sR0TRT1vqOkX3RU3NETz1ezGt+olFbwUbgnWFB3EpGQb+Z6rvUfTOgiqygIOXqDKfYWGqvC3f9paPi4uQolHQyr0xRd0bXnMN8RHqfcIP/J9JqZxX/pA6q5Pdt9H78MPhBMrUKkCOEDleileb0DO0PQY1QkWGB5PzH/oZMvgbtzrEH9SOLTanOMIY4w10benL7glNZxmpcMm+/FC7LWxeQ/MXAYASOCNVfbGhVqbaDXqKPnyseuhtU+chP4q5dAAI2jNKM1B50j3Er3WaCVRK28owkUOj3U3B5GU7UHJVwEFsmwa964d/yBkShWBBbTrBs+pothh8Xe7CE</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>sY7/sFYLtA3aiKJ5cR0AfBwHtIms+RciwSKfvOJHIb1gYvGRmmlHdd8Ss/fjOTX8eTZdDoRh/DyqbfhbyuKIuQ0wqOzzWX+SHZIrRrhGwUMIYfi4D5VUJ/SXxF5RpubbfXGUXZpqY7vgBkkxBWc/2LJioqfwMZpR2f6KFsCR70lZ6T7/7iXWBoK9sepWcFTjVJCMT7oykfrt7bxuwBmDnFfqdSjnCmP+l72Pg2empT4=</encrypted>]]>
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
		  <![CDATA[<encrypted>ngrovuqwmlrPKVK7IpqDGLb2RHqHkpu36ujp162tplHTp1j043h9JrIxZ+ixPM0nZCY88x/8r4GOGRmfLDQJOf32+UEBT3rgPrjrJxRTkq/YVfEmj8Q1BsBZDpxsjdKbhcWsXJKM3tHcstWjRkkQsQ==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>uoCLUS65ccRHiqBsbxn8RwklqxzzrZTuyEN0zONwCplIkmhampu5hPIR7q1oRtAuoegylYmah+yPo2/AbdiJl+6Po1PleEbpmSgXA9U+ANr46OejzfJk06hBlw1luadwasELUdYP2hzKJmpXz/CeFqWQSlKSma0fTp7ji6KEIvUXNHofDhoKZ2qDpAi72vw1lsLIxZyL33gbdBhCHpVhwvhOhn9h9yDxMyh06a7FaL7jRL7zdX+7FOFtD5RdhdMoXfcWjpL3ErJe/zKVuQ7kcXbhZpxcrC00psoC/Upj2xXHvHKDrGss9Ue+GRyjVQaLSaIRnP5vL7uDJWpsDf9lMfJ2pqROZNSUWKjMJloao1eMXmNcV9qfmyJqi9a3UpiWxcB60zkmdnDLWqWC50pa4Ff5NxnZbFYnXS+4X/rAqv3aSy79tH7NKqfZmb7ZjiVzNQf5neBityDR8loExTEqV4WZur7Hxck56TFiUcPvgg3k7sSoaI6d3E4Hv3CujfxV1qEMWL1k5nntYswOUpShnOiX/ySOttaky7baPMDmNhP4DtaLf1I7EZa27wzl6bH4cawsXwmDFx2P+3I6qYS5NAn4utsKuRyv9O8KKmCpFampYMxXvYDLFoi9RfUVSQ8YNaz1R2yj58wNvEjV+nV8TrazE1YZZNZAD9Amp1Hqo995G2ESF3KOTp0dHl284kG48niGNpux0GeEC9NJCREOUzNp6Txj7Q4+zeot35ESrMwLHwvFovSdr3XfSOC4HwWvMU/hUQJwhgr9TLBEMq4+FQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUwcAj6tgmYHyCZTZHZ6HByzXoe5FU4bOr7ruhqaID7TkSD+MxUGmYTN/OfJVobUEsoVkiuYbMcZ4Co/BmmwJR2R</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>acqsVXY9xq75Db90cJc2iKN1jpleXytLrBIp9Y03uA4I/ulhwJuq0e07/lWGUkm/LY9Ck01WKPKJpep6NQAgHHZWZ6iC7SaCMRPeqxhIcYb1k0ugAlEnZi+49YIfqXrzA4AauXDXjo11xbD6OFpS232FkKUiY6v+YtbNlAP2CU+zeXqQw0g8O1a/vq+OhSvyp4N7eRv4Fz9p2wggjvGKQklGzjb6MmFUXJ94YEZGPnir8MJD0DAYftnt+IuNicqvBKhCRARgeqHyxn0pVWIcDg==</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>v4A2eRdokYQul+1q8MvJrZLFkBlx2gW8y6H7PYYDg4mUgtM/hVimTY7B+DIB1rEJljxnMIBXdPhnhB46hHPLqWbWTJaYM6EtBdY0JbjGso5HNNWkr2nJU2Sm0B2DpGj4FhuxbdqNxhsIvAgUL9QQtgc++yC8fhPmG/dsKmXZAPdgiNqWf1H4h4idb5vlahhHstFc7HVYThCwatDZ2hMS7QZqIBIUnXmGAXVNs2b58ituQUsjIUX95nJS7qo+Q98dsI2n7zraYNnZrK/K6yYTKeYM1L6EuP2RW71O/C92fB4hQGhcd+rNrfvm+9MCCCfjZFvepAzmLGaYrFsA45JFQA7ZMEeqiunzYfd62hGTdpUHb2Lhv96AYTxT9ou+VivHb66rUBfcIRzJGdInMR8GMAyrbFXdKDizI+k39SGge8g=</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>XBoOnqMmtKykybI8eTMUKNTA6ARa2IRCR3qDVoV8Ep7lw1KvDA1RILtght77o/AgB2pt7JbORbAjWxJaEkj3ry+IbNPhfav82mnEeDnDCbfJTA67eyQKudEkKXlZJ7MZeQ58mtcmBJWpy1bETAcEZrEcy2bRRGCPHXt1rkoQdKNrKeYhgSvPx4OUp4KzfYuEd920HFaQCXG/8K8G4ocTuGr6KcnUPdHcnrRgAZ9O6IMs50ax0eLH1ZvrBGoFICBQwT2svZQy1gtcd6Xz+08FUBU8rf0T7/pkX3LNqxQKtkDz1uWMmlQrEYxlj2mUdkq5hlDPQeHSWmaS/uh755k1eywwQ9CynEPOqytefnaMwheVsNqKlYq+qqkSpMPpApnBpP0e/x4qTQ8EIOvcrN8Id+ISQ+h3d8hns2yXQXhyvmAbk1WXt893HrQW+WF8C4XXPmvl4ISE5iKXNotVM0KGXwys1c7JJ9OEPnNlvaghRsAOp31s1T8HGfNCb4VXAJa5</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>klU0wU0vy1UV9IN9Hw1Cq2qaMbffT+YMZl12//2n6jWQQoYUztCyUVuiLNlBZP5nfYIjUluevTadVdqMGT77T4mKQKVABL4rUAscn57tRralnx4vGkMYaI+6m9I4eMb5VlCWGppVzbMty+pqNXd16GyaeLgdJKyh8L2Pm9Vf9FeRw31TKjJh/Aip8djFHk3xTfykID6AeSrikymo8RcrEw==</encrypted>]]>

      <![CDATA[<encrypted>1Et6MqkgNrloTzIGZFmecc/684uilzjm3vULrznJq1qBZ241eHCpNl30J72uWENJXgZ5mhBTLguWSjJdm3tpFtnhp5rk7v7W2mr6/lcw6SG6MYmMg81wIXFFmZBfwoQn0l99GMWFKI3U0Bkr2mF2CuldKTj+ERpXvlBVUyDQhv6iNRPNSHjAPQ2/bY2t1q4quswIKvogenZ4nO3xRu8PgTjjikoYbiO8OmmIKQb89hKmtNZL97qdKxaFS9jUjBAdVfboZ1dqOuhez8pL7OeaWohPs8WqvSS5rOCnrt4GJKn6diZyv9gKLr0UkGEQudcRLfmVqY26u2b/qsRTl485jcvatBcFqtmKTF60htKeiL/JzFoJ31Rm+RwUYR3ck5x5RjL19XUt63BXBjBCQrjrZF+n/br3fH+tv64YgVImlaXKCv3mbhotIXXX1ryMiP3z</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>WO+MK+Tof/XIcB9mnxLho8pDl4xDdShhk8w5XjpOXs0hYx4DrARr5wiMqzXada2bFJJ3oXEDuYK5q0hYht3MdZyFkUZHnT9c0PKQaui5nogUQdIZbLxT1oRpXL1iFudMGZAqmzgygYiPtyzf2cnnVx0o3isB0Brvjgn3b0weY+q2lKZDhxhd5Q+u/65498hwG3x6X/4niHQdPpjqDNMdq39z2BvwrRxZpiVXys7BMXPEuHPTnqW+jov8h7+ZPZWyJL/QNB6/FaSKzv2b9KltX/I+988CM3Q1UiCqhtPGVYxfiU9bfa8e2TCXFFX1Y7asaDjU339be6/wZ18MTCGp3A==</encrypted>]]>
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
