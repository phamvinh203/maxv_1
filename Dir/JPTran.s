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
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd39$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post "
if @status &lt;&gt; '0' begin
	insert into ctgt30 select * from r30$$partition$current where stt_rec = @stt_rec
	if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_ps_no_nt, t_ps_no, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec fs_PostGLTran '@@prime$partition$current', 'd39$$partition$current', @stt_rec, 1
	end else begin
	  exec fs_PostGLTran '@@prime$partition$current', 'd39$$partition$current', @stt_rec, 2
	  exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd39$$partition$current', @@id, @@userID
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

<dir table="m39$000000" code="stt_rec" order="ngay_ct, so_ct" id="HM8" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="chứng từ phải trả khác, chứng từ bù trừ công nợ" e="Misc. Payable Transaction, AP-AR Interface"></title>
  <partition table="c39$000000" prime="m39$" inquiry="i39$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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

    <field name="d39" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="206" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="JPDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="206" categoryIndex="9">
      <header v="" e=""></header>
      <label v="Thuế GTGT đầu vào" e="Input VAT"></label >
      <items style="Grid" controller="JPTax" row="1">
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
    <view id="Dir" height="268" anchor="6" split="10">
      <item value="50, 50, 105, 129, 0, 105, 18, 105, 18, 58, 42, 8, 105"/>
      <item value="101-1----1100: [so_ct].Label, [so_ct], [ma_nk], [status].Label, [status]"/>
      <item value="101------11--: [ngay_lct].Label, [ngay_lct], [stt_rec], [t_thue_z]"/>
      <item value="101----------: [ngay_ct].Label, [ngay_ct]"/>
      <item value="111----------: [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="10100000-----: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d39]" />
      <item value="1: [r30]" />
      <item value="---111-1-10-1: [ma_dvcs], [cookie], [t_ps_no_nt], [t_ps_co_nt], [t_ps_no], [t_ps_co]"/>

      <categories>
        <category index="1" columns="789" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="789" anchor="1">
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
        <![CDATA[<encrypted>NTivEj3DpqcIh2FDHuDJ4SohiNHNZyK3lKJdp2vXSC1+RSxJPH1K1yi6Nq6sf34b82y8xzdgM/QTUCcN5/zSVQ8UNq9F2EXywhQtIyTkYWTlc9R2qiYvp7fIz1hYi5+Yk1sihVzS/Gd3tFpWBFmqhR8YNoWKg7iqHVO63hov6QvMBDzfvYaeH4rEcChZ2dtrKaocIbznV2zTm86a6jq21yo8A/B8GSrCrbYbMzIjG+4ANZx/v8WWS95qNZWdlsdsaAuJoGvRyuVmW3hgSBOHNbryDKvSFYXFQ1vquyHn0eo=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPijlkvX38UAJhWJ4ZN7J3Fu4+r/AAsheBwWtWtnRdb2WeAbESKYYzVwu2apKLL47XoNqZ2TKa510buHN6BFa30G89EPcqe8xnLE1CXZcG/VG</encrypted>]]>
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
        <![CDATA[<encrypted>CtOyu0wzzjXDoQoDrtcDWgfIN3owV2aeyla6nKAD0A8G/GPEZf1rdiMkQQiSbNXZMoBHdT+u7TSx15CSE3EtxxwRA9FLpb3kbUpYcc0sv3+BNU0TJigiKVmC+FyygrFlq3TGOdb0SjIX7oETCNxaH0h7WPHtKDa020AK9Wwu1c9GhvvKLTGAfluTWE4bLUrvwSoJyAGamGBbx9QqgvGU45Wq1YneR9cFlASe2bU9hyocosIe6bnSbksB8ALdui9ZBn0VrTHpB53kHQjhZgyXx3PcfWmiuNTxa74Kn2hRNIez7WBcmiGrEc01LsTLQQvnP1L71RZc9XqpuEcU6w506XRDof30SPWJ3KMQidtea6lisiQK2+gDXHZICOagea8DxFcrXxtWULR3L0yCTO2fW45ofEulGz6XrI3Lj/gGb+rLqDRTtrBTymCqReS4YSINBbjmczHPB9HK1j2KoO9Er8pjqv/Rk40wVf7YGPZs4Ea2Yw6PkYf1QQBMl4XDTn0zFoQpUK+AqzRnKh7u8sbfJQ8I0mL700idfiydwq9KMDQ6eFt+HKkVX9nMwmjzNgdS+48tQ3Cy5d80jvx0w7Fce/rL201JaHDkXDApT+aWilpGHr3dP8eT2b/atk5FrPlZ</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>sY7/sFYLtA3aiKJ5cR0AfOT+3OKtJzm4HHJNKcV724pu05855IM6fMBTKHJ8ZEVEI5rAyix5fW47vGvTCX0BNpX/wE9s4cD0GO2VIpioBfruYXv8Q20w47n9787g/Rnt/izVkV959sGGlu0mKCJpFLHQuWSkZ3nX8JhvBleiPZeahPZ4m46v/3wgV25/Bx7CIXgNSajfG/4QIN2DVNwWLHj929MsJOXh/60RJ6bWfmU=</encrypted>]]>
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
<![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKw0X5Pshj948LdpccsM8fd3NgRJrtfez8DkT2GaQzZjVTpc7T0n1efTjNfD0I6xZmS0A9xUwJxQE7OKgK2SNPlLT5q09m/XfIsOnFkIUmsi5GZfo+PqOwuu901ZIfS785wA==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>uoCLUS65ccRHiqBsbxn8R5Y/ChZzoLpEVHVjaukmJuyJnvI4Of24ZyR4LQola1hbaNp7tPfiGQ2CC678xlcBDUvxLOSakABBKsevA2xifsGlQXQIapaM02Qv1NJM5gRn4vBaaLMlphcNwlpXRUrviorIh0eOzT1RSJk6ZkFLNjH3Dkz1nbqTr3e9KlUCvazQw58Da7VWUjMvF+8dEsL+FuNhNi86XYqt3ql5jw9iwIuPfoCg2pna3k5pzryNgcLpIRISuNYsH0zwQKgicOTEjq6arnlaSov2udyL+TXlgszSndAmUIUCjq4DCnjWoLOxmnOdP1Gc4Hou+iZjZXhevrV0OH40SyeU2ED+rIrzDVXLR/zxxVfjyzClDAO/qaOh1uB6DRZJzSeGHJKT0ngLodYA9b+DfVIgw7agFNF+fBHnI/oBgJuvG7guDxsOI6OjrFUJiuQxWeI59aLK3yTX5yC5gQQBs1U8Kr1K+f5CakrcKlxGzdr4SLmfi8QrB6UbqkfaF5ocRwyLeFedo+qDmBd5QS20b5+0Mx5GWq7FL9ZdSjuKoMwBKtR5Dv71qtWKOs3Tk9rZT1hCxHwOj3mFGAuavOAuKPaeZLlM1jtiuFO5Ouq96dbW5fTFyAgC4EyYethHYe6Z7DkECCxq95MjJ4/zCrLb/hR+55+P3vRwq62o8n2xV/BULAcIPngWSfYFdB8C6Ux0+c/Oq0ZUVsKt3Cb4q06EAP5AazvwJ+vg/w4LQefGn04mDrAWpNl9TbNVDmPZzzjHCWqxD18IvYocTg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS8ujoq7/rjkpcL2Xib0I9otcsKQrpNfiHJMzOEP/w2pyC+Ad9/dMaavP7sypK+V8Zj</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>holZ9nnnS4fCln+Zadky2zqO6Xu1JUvaDEUNN/zMZCgVU6mbciWXmZko+sdXgGclt1k/qw++ZaSujx7TujAgakbbE+aruBBg3lJ0sWSgF86t+a0qk3V+N+ims3Xm9rZI6hwN+rg/urDQHRyks8duRQDc6h+d2Z9qKSzX0Xjz6Go=</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>v4A2eRdokYQul+1q8MvJrdH0T3diZs53TDkiKEZq81oK9iGh9T5fU1lKw0P6NAS9D5x0oQU75Dbg3klaeu3GSjFKNWY1p56lUK88b1VOdk49hU0f8SlKlM4sFF83bJ/qqpY2TBAMAt5v0pJk48gdQbkgFzQtNqMDwWs6doS2asZPEcjK7bPirV19usTBeaLvNbfA7NkEEnYfex9r2VXINNY8fzWCxpvxkK1R+hhdGLLwY/dH0gCpoFb74lkKoCCU8weU4FBzmn2iqvJ4xibIZAcAts140p5E7h6Dq+Td33iFdsOoX6b4T4ki7t/UowM/3ytytVz/vZSK981qvXURcPjvifrKKmHxr8th8C1LW3UIybx+/F2mHJyr+rleH6/GYBKE1dnpKYtUjGHS8+hnhq/SszsvoHuxdvx8qyvASx0=</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>XBoOnqMmtKykybI8eTMUKFHcIXmOzsAjnpXmEyYEUm1WFZwmCilAv27ntVhPlxCy2gVM6kuialCfNQpJhf6Ltfv0GKdlNW5RJ/Snbt+kbZb0CZ/QKmtKYgwBKZGVK9rHnm4AhuwaWP2j0M5/dvedwDRUuRz4WbYs6VnfAofGrgL6dOcXa6gnaGfDI5W/f+SGX+f14QhlsKcoZ+p9ze1y1Yo9FnZ2qmuRwH+0qBFbCrDbf7q9FSrIxHJlJ/i7o054xi3LM3ArS3JqropOWHsE0obVYZkeNisbPr1ZhLYlyiEzQIEYGRgetyKFoVv6jkeBR8l4JDW23RsPa373KcXuviA8qEibrel3UB7UZfRhDnKsThsrTWJ+Po95qbNCz9V/DucRUTY2yWlvMkOXSn8d/NZ91wB8bZ/YXpXRJdjH5GvY69Ga2EyKmyrm3KmuL1zAuOFAhqShDJanQ/ZQrSynPj7XfmVGdzcPu9wg2lslvsQDvKhxtdDt2fILVumPij4l</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>klU0wU0vy1UV9IN9Hw1Cq9yaE38ZKmKT8kREQfacUgrqsUhNkKde+N9+eymbCFw5JugVLg4TPah+O7E6l0RKfNcE/6z4ufyCUXZperNUP7yntczOIMzBolQ/nO8WlQBKcv/QLj3dvAHexW1T9eT7VuL55fBjyDXMjcWEch5jbE/uFI5MreQ7doabqfGasbWieUFrrVnrhCplERapcUag8A==</encrypted>]]>

      <![CDATA[<encrypted>1Et6MqkgNrloTzIGZFmeccLvHb5/Y0F2mOKE62Iv+Pg4oumaDGZOJ2wG193q9iRM4H6D3n1m94F1BLWCaNC7CJQJ7NMkr3oB2OIbR7xNxqVGZkru88pEISI3nSRj2ugT91s/DkI2Wi6r4zs2743CCKZoNUbLupNLNN2nYbIj5s6ERV4bnTjvt81Ndb9GsG2vLb/5wIVOn2mfzCYAAV6O4/ZhL9uzqNFCjYrTcmYLJXzSZxtRAK2Acmv3Two0hlSrUhmccaEJd7UlOPSDh8lHC22gR8ryaT4pvGaXYzzplQB9kgRxDhBXNir+ClykJ8xLg5xpZ5Whpu4WuLCamjoeDoWBytrO9xcYnzvyiugqHoMRS1iXd3zUxzqUDs6EXXNWV4rM24SAUEsUC1WUbSZiY1y0thkP+vnZGXYnRoCTFHfH1pk1uXiaBakjHFWynu7C</encrypted>]]>
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
