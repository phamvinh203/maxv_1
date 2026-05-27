<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenCashCopying.xml">
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
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalFieldQuery.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY ScriptExchangeRate SYSTEM "..\Include\Javascript\ExchangeRate.txt">
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
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd46$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post "
declare @group nvarchar(128)
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id

if @loai_ct &lt;&gt; '3' begin
  update d46$$partition$current set ma_kh_i = '' where stt_rec = @stt_rec
end

if @status &lt;&gt; '0' begin
  if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tien_nt, t_tien, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec fs_PostCRTran 'm46$$partition$current', 'd46$$partition$current', @stt_rec, @group, 1
	end else begin
    exec fs_PostCRTran 'm46$$partition$current', 'd46$$partition$current', @stt_rec, @group, 2
    exec fs20_AfterUpdateGL @stt_rec, 'm46$$partition$current', 'd46$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end
  if @loai_ct &lt;&gt; '1' exec MaxvOnline$Posting$Allocation @@id, @loai_ct, 'm46$$partition$current', 'd46$$partition$current', 't_tien_nt', 't_tien', 'tien_nt', 'tien', 'cttt50', @stt_rec, 'ma_kh_i'
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete cttt20 where stt_rec = @stt_rec
delete cttt30 where left(stt_rec, 10) = left(@stt_rec, 10)
delete cttt50 where left(stt_rec, 10) = left(@stt_rec, 10)
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec    
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec    
end">

  <!ENTITY CalculateBookExchangeRate "    
declare @b tinyint, @method numeric(1), @basecurrency char(3), @rate numeric(24, 12), @idNumber varchar(32), @idLine varchar(32), @serialize varchar(8000), @n numeric(25, 5)
select @serialize = '', @b = rtrim(val) from options where name = 'm_round_tien'
if exists(select 1 from options where name = 'm_use_2fc' and val = 1) select @basecurrency = val from options where name = 'r_ma_nt1'
  else select @basecurrency = val from options where name = 'm_ma_nt0'

if @ma_nt = @basecurrency and @loai_ct = '2' begin
  update d46$$partition$current set tien = tien_nt where stt_rec = @stt_rec
  update @@prime$partition$current set t_tien = t_tien_nt where stt_rec = @stt_rec
end

if @ma_nt &lt;&gt; @basecurrency and (@loai_ct = '2' or @loai_ct = '9')
  update d46$$partition$current set tt_qd = tien_nt, stt_rec_tt = '' where stt_rec = @stt_rec

if (@ma_nt &lt;&gt; @basecurrency and @sua_tg_yn = 0) begin
  select @idNumber = case when @@action = 'New' then '' else @stt_rec end from @@prime$partition$current where stt_rec = @stt_rec
  create table #result(ty_gia numeric(24, 12))
  if @loai_ct = '2' begin 
    declare cr cursor for select tk_co, tien_nt, stt_rec0 from d46$$partition$current where stt_rec = @stt_rec order by line_nbr
	  declare @tk_co varchar(33), @tien_nt numeric(16, 2)
	  open cr
		  fetch next from cr into @tk_co, @tien_nt, @idLine
			  while @@fetch_status = 0 begin
			    select @method = loai_cl_no from dmtk where tk = @tk_co
          if @method &lt;&gt; 2 begin
			if @method &lt;&gt; 0 begin
				delete #result
				insert into #result exec fs_GetERD @tk_co, @Method, 1, @ngay_ct, @ma_kh, @@unit, @idNumber, @tien_nt, @so_ct 
				select @rate = ty_gia from #result
				select @serialize = @serialize + case when @serialize = '' then '' else ';' end + rtrim(@rate)
				update d46$$partition$current set ty_gia_ht2 = @rate, tien = round(tien_nt*@rate, @b) where stt_rec = @stt_rec and stt_rec0 = @idLine
			end
          end else begin
            select @rate = 0
            select @serialize = @serialize + case when @serialize = '' then '' else ';' end + '0:0'
          end

          
		      fetch next from cr into @tk_co, @tien_nt, @idLine	
        end
	  close cr
	  deallocate cr
  end

  select @n = sum(tien) from d46$$partition$current where stt_rec = @stt_rec
  update @@prime$partition$current set t_tien = @n where stt_rec = @stt_rec
end">
]>

<dir table="m46$000000" code="stt_rec" order="ngay_ct, so_ct" id="BC1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="giấy báo có" e="Bank Credit Advice"></title>
  <partition table="c46$000000" prime="m46$" inquiry="i46$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi" defaultValue="''" >
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ong_ba">
      <header v="Người nộp tiền" e="Payer"></header>
    </field>
    <field name="dien_giai" clientDefault="Default">
      <header v="Diễn giải" e="Description"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCmVcn8h3iz76804lWbbVpa4+qfED8HT/UON2+1BJB+dA==</encrypted>]]></clientScript>
    </field>
    <field name="tk" allowNulls="false" clientDefault="Default">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" allowNulls="false" clientDefault="Default" defaultValue="2" >
      <header v="Loại phiếu thu" e="Voucher Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai_ct%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="loai_ct$dmloaict.ten_loai%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XDCCwP27sgbW+DStHBI+U5FTRlGt+RtWQGPeBcQ3H+U4Q==</encrypted>]]></clientScript>
    </field>
    <field name="ten_loai_ct%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XDGAh4G7jSmodAiU+Ts4e5zMQx549cACWW5afFbdCh2Cw==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="ma_nk" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @@id and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
      <handle reference="so_ct"/>
    </field>
    <field name="ten_nk%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" categoryIndex="3">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left"  categoryIndex="3">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ma_tt" categoryIndex="3">
      <header v="Mã thanh toán" e="Payment Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="hd_yn" type="Boolean" categoryIndex="-1">
      <header v="Theo dõi thanh toán" e="Payment Control"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA1xjPdslTPu+4XAdjRgH5aU5GZOdzpStO4paNHMlsyHdimIjRMb32qsYlmt1oOyD6YaqbAnqqyqVXxddx5BCswgg=</encrypted>]]></clientScript>
    </field>
    <field name="sua_tg_yn" type="Boolean" categoryIndex="-1">
      <header v="Sửa tỷ giá ghi sổ" e="Edit Book Exchange Rate"></header>
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

    <field name="status" inactivate="true" clientDefault="2">
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

    <field name="d46" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="182" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CBDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ct_goc" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="9">
      <header v="Kèm theo" e="Include"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai_ct_goc" categoryIndex="9">
      <header v="Chứng từ gốc" e="Document(s)"></header>
    </field>
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" readOnly="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="serialize" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_tt0" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_tt0" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="236" anchor="6" split="10">
      <item value="100, 110,9, 120, 100, 0, 0, 8, 100, 16, 58, 42, 8, 100, 0"/>
      <item value="111000000-10011: [loai_ct].Label, [loai_ct], [ten_loai_ct%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="111000000-10011: [ma_kh].Label, [ma_kh],[ten_kh%l], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
	  
      <item value="110000000-1001-: [dia_chi].Label, [dia_chi], [ngay_ct].Label, [ngay_ct]"/>

      <item value="110000000-1101-: [ong_ba].Label, [ong_ba], [ty_gia].Label, [ma_nt], [ty_gia]"/>
	  
      <item value="110000000-1100-: [dien_giai].Label, [dien_giai], [status].Label, [status]"/>

	  
      <item value="111000000-0000-: [tk].Label, [tk], [ten_tk%l]"/>

      <item value="1: [d46]" />

      <item value="110111-10-1-: [hd_yn], [hd_yn].Label, [sua_tg_yn], [sua_tg_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien]"/>

      <item value="111000000000000: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="11-------------: [so_ct0].Label, [so_ct0]"/>
      <item value="11--------11111: [ngay_ct0].Label, [ngay_ct0], [ma_tt0], [ten_tt0], [cookie], [ma_dvcs], [serialize]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      <categories>
        <category index="1" columns="782" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="3" columns="100, 100,9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="6" split="10">
          <header v="Thanh toán" e="Payment"/>
        </category>
        <category index="9" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="8" split="5">
          <header v="Chứng từ gốc" e="Include"/>
        </category>
        <category index="-1" columns="25, 75, 100, 25, 212, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="5">
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
        <![CDATA[<encrypted>qiS0W7Z3b008x7VIaxXSbKv/Gub4KOvDZZmy8J5fSPL07/VYZ8PgyWu9m5Nqrj3k2e+4d/mStg81l1eY3mplls79rNiN4H6WWOIamx9t7msLNdxsPiihgP9Iyi5kW04ucUfFzec7HLGoYrFJr8NlLldi2VsrhAph+5JBc8BnwQy2gDbU9mmJcpLxx4x581GfwE93sYpnAELS1US5UfXGTQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPrn3UIEvQgWhwG1ml1xLK6GNpo0jh7eTwTRgCaih5NcjLI9AOmRVXGyMqtryV7KKX1api1RMXRKvMsTO83hjXs4=</encrypted>]]>
        &AfterUpdate;
        &CalculateBookExchangeRate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        <![CDATA[<encrypted>7UovlEyXxmpHiPB8rHQQBS4ApuCznVwMTkhDFkqB4k5rXqNu/hYq92dumMbnhR2FmJHFDe8zA348BEH2QsOfqNeNr4qE/Dunu1gncdf5ZCdEdEy0yRfEpZxp8bGvxnrLAZPfbIfW7uGt2YPxg7DY2QzpVaTSuh5D7vnIDNg3nCkvdwJWFxtMEZdifT/RInbjrGYnl3YU7sAke09NvBi3fno/cFt5HaYvg3mDdvoi9lC+1j0yGEQb/RIhL6lIgDd9J8JEXBcLL0WMf9gFL1kJPNtxW5Unqgx04bK1l+bUvOCoT4l8QHtO8HIg1r+agPc9</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>uORaW79PEyy0wA1i6jq3hZ3qr/QT5wLqlYa1cfdo5nUDpbvq6e0ZFKdCfYWN5b00y6gruGlHalVl6/sC8ANWeNZ5N3j5F1iCr/EIg28mV97AODRUDxuU56VlYYf5q1FNlnh7zhUwccDklKwZF0NZIb3VVbfmT+fjETdq2Wq8ubPh3ojtu+JmHDXkhmv3MueMKwIgH2Nb9QdQBvgGUmUu2A89ORyuMJP1IUxxhyyGPHHAVeU+n4EvdKGUYsYHbPnZCDzs9fPD4Oqfaw77BYt/1yY/oi5fZ8hvdaiEGnqdt0ZaQYv411u8MNmMnwZDsmcNr0NFn7ZfV6FT4e4c/MMT6EXd+Hws3eS8mCx+lQkHoefKICu6OI7xiDITEV7glKPXDyx5fqOq/ou4AbIDpRq6HXBw5TM4aMcTPNHJFPaE87VCDkfn44RRamd2LoP2iOk6rGHtcfoZzzFpjuBQhdMiVQ==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>OTunyz2blYd8MsaA18jHEUTTzo63kgrRyhPXGHb78PUnxTq2CqCNJdVk7+uC86UXHBuh8YnpPjy9KP1kO2zj9hxSDRALiczQAikyzBvkDlfLPXIW242vgQYvxKOC9wvqHxB2oVC0KOxjGeXS5hVW+h6AJavGSEqrcu/efB1Dnq03yn8Q/1UZYb3bwaPayWDfRROT6lF5NvEqXJsc9MznNA==</encrypted>]]>
        &AfterUpdate;
        &CalculateBookExchangeRate;
        &Delete;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        <![CDATA[<encrypted>bg96jG7rV/8L8XtpPcCkJBFNrAK0WuSLQ3o9o38t1biK8TgowVRn6AcGeXJwuqfvs1JGTb1SW5Rc5EPJWNIgaWTTTSB/NtbpUrv28knNXRUuEjUlL0MIzENJJaGMHShncCBd22EXqigGrKgJFOqFtosV5qlVUR1WAQ3WwxqIug9cSSDJvGryDsAGiF69YlM8lnercC41pafM6Q5UxNOgM2iwmu4iK6chknQwc1l3ACQ=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>MpXizvsEHikVCJvtLNOXCV9MbTXhMFT5GDOo8SCoh103WtzpFxETh6keeNP9jQLpDqtDK2H9VSDiz3nGVi/UmccYdaijJhamaJBWUZmTJEM3IlXbwdayGYT3wZDc/rxlUo9BxUwXIkxUumSFWgMPXua2BeweeH/9MeA/wjc/jtx64BwHJuGko+houVyFp0X7vnUCyR/rfpzbmGBCMH7vbqxAYomrt2HpuBu3dyENOmw=</encrypted>]]>
		  &InsertHistoryVoucher;
		  <![CDATA[<encrypted>+rrPk4ZN2/S2AqkvOsQGdO+djajZmtIJS4MzNNB2FzjwxJ9kmorm7Lmh5vrS4eb4UCRMNVowIPtUg/eB2t30SE/VYd5T0avHOLnh8dat0NByomlGjsfCRrzY+ZMkc9QYZQQin+iw0k4L3bjTD6bozA==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>kx2KNddPKdVWDgFtUv/z4lTRlQXEdUdowY+i7/DtLV0Bvn9qoB/8XcEoMyQkR1p/ezkMCzyhVL+2kg6zlzfhZ2q9pwkBJyo3zEqosPX8ZUVJS/40pJLEHlmWWaUlouNXTZA7Bf2Py7hVQ9t7XDNPRcvdUkq01EByY+POO1+KB1Y54E4+p7958d0ieKwmy/0CeIoLB4h7Dpr7ZOhCv9/iWMbK59qKtr8hjZ4l/yT5mmk0ntfXLKCSXKAqpq7bAmmPBk41inTz+KY/dYHnE5TSOsS0/V/RrGHfTQKXJmIF8Y+7JKhrgyrrOsCA/5eyxYGv2Jddn5mVMxR44c62ZZN43fyPZgQsxfMrTm5ZRiOWaY+ufzXimf2XlawpnuR6NDTrxcnHSj9ZPWnV2sobph4mV4OLmrsf6r02k+Z8F2WIPw73ZjO1vNIOIuDktm+WZpnoKqJWYSdv8NF10XgvLBAyuXujU6iRwD7xKrd13zpOnkEDxX2rDbicbMZ3OW4QzQfxMmNysednJGfDJnBbQDPZ45P05wcne4+v1RaBcLi/I1PtgRnr19jdwAb4iTrA4lqa/q1NvkTD54bPcr2Tzz5jqMvH5uSH+qOB9bAJ9SEuQgBh3OgBMKPHiyBLPt2r2Squ3pEcmxVuFBGDxU9OPTH/VfRFJF7hu3smFpeKeXnFGr4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS8p9nsRRanAtEXKcI5YLfU2BcbacTQenKogK2o7eWr4kwL0hPq6s5/ZjgWGKa6YHvb8yHBYbupjsySLrwJ6q78yg==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>dBa7fa+z8TE5AOFOH1oNGFzLmm2c2MQdYnbH38BMWIzdoutqvA6aUJDWLkWkmkwKvf0zoF1NYTnb6s0+LcLtNIB50hY7+cN4BCBnBkekg8P4SIUKo0AWJM2Yfj8crOlMyI9zbbM/2UDgUap4fX8LC2vXk7Q4FmFkTbE4R5eRv2lhA8Ylu49qUYVoIPaCbFMMsc2hlNxo0+nFHmRBn2PDS/UbFt5s3Wf8QCS6wpxSgwE=</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>XuJ2CkJFXlpFIg4L9hz+oGabCiiVhizVkgKCNFZsP+jA3kX8uh52CDzp/xv7u1wMtGUxNW9YVg675PK685YJkHDqBTjb1zehyzc8W61NU2DrvHgVfp5il1fiRgzhrq6jyyd5lWBQEriPzMiUUpiEm+z1uZf2i5MUnIKcPhbLAHS7001keqH1vOeMgTjVeyVuFwmKKEamHAP8zf7OUkCJhzfA51sbAmnAUMLQr6OI7Cm6Mp5Akr62HViyBxNaGm3SDu46AR1n9MpXzs9TwUN4cvT77FfcZCS/0FuUAhCpNatAMsaDLHnT7nnzmpi0i52828EB6wfhsjlbfW5uLru6bNBNNe01qLjcvaVIcPm286Bq9WznHJW+VBy5fRP68uQBlWsrJZKih6Jtbt2m+lio/GJnfxvA00uSZFGKu2gCrrFiFzcsPg48yR8c6OaAn02DHq1C0GtekW0k1ILrYa1t7zKpfM7i/MXqj/2nmT8QSyqYZtSznOTUovpbH73CLm0I</encrypted>]]>
      &ScriptVoucherNumber;
      &ScriptExchangeRate;
      <![CDATA[<encrypted>oTtT4tY+Ot5AxJekh6lPlH9d7VRhQnTugl1DXG7HaZ8+J1jAMdDr0uy+s6H3uDSU4nJD/rPQHkbFKo6sxwpdww==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>SxbxPtVu8pgUdGGmgPMdoaCWhpfkLtp1ouYSdNLZw5j+1yHQSu+Lk7UTr0tHSocPi2mrTQbtLZXRwRnl+XgaxrsGqiXmLugc0czPAnAkLKW3yBWW+7AACD7ZpstymywCsWhcoMobeY5/wSlEx1OiiINrkv13riQ/M1kO8VU+9SXUxtUNIzPYmY05ZGFjjsntvipEBL4Op+q6Ee2Hgnc8Z1y9HbIaMvLrUKcx5Pd0T2jGeyImVhk6JBtIS76BkYx9LhIu9FAdIy1U9IhcZgbCduwz5aXyoRDI+IiKdO1M37n5b9ATuyg5sF7ion4X0ciXFOaD8u4+MAMSuC+OfR4Nab4vYQg/BKAX9aRTOoCWAWKu9n0kitam/j/ihPaauArSZw48gVF2zmk5TKk/2uw2bYReVkos3lNVjfYkNflEpbmiEz4IH3t2TDRnVYat4kr6hnN2MGgnG3Eif1FzQDzQdGaFA2/BVESk8rI1jWWwgsd7zfUd296wGEwPknMomWXQIIWSMYPGB8yPPpI9MQ503h0ALtsIqmIrsPBcT0wGnC7jCOjkB2HmaJVYVPu6xfnaoR1zt5EQqtO4tobqYhYiAD8uFO7XWgRb1MVsdaxmxKJEssIUHjyh7joeR4nLpUsSCwzr8yGJF827Xs78gfuRthRbsSOg3CGiup9kBylR9bmyZBb8fVZCvu+dUkpaQGSQdkkhp1UYTnmhiSNtIXASCNLvp2DEkgBuBVC9Kf/wY6rFk6rF0l9c+IbdtGMkwJK8WYarswIDiypD+5/lyNnxBouSERF7Dd4f424syQEWSE0pRhCHfU+kmT2/+Z20bS3u</encrypted>]]>

      <![CDATA[<encrypted>Izm8xjRg0GCSgdOJ/Xa8rTumvS0+m2I6P30fcwdIFgY/ucLVf9E+A3Nnuyxp1bUXXn2diclEA9ZTK1nJC4NPHSN+1rBgevTfzM4GBvDiZ/P113OiaCOp63lLfQ4lhSTRj9I92XzJX4STFhPH4UE1auTHpXl+Dh1wWulyD6DrcKfPxZFdC2Z0lqSmzp1tNEfe40CXLaUGUD9k8Lx8msvkviIldmffWais3dB/Q4AouzHAKBqAmFJwezB5wP+ZuiBuAWScjmYGZd4kPpYFym5QGjl3oiOk2yyP9gJocko4BrUZpuqNSawuswuNpTRCt5SMCWIjZ99xKbn4A2HjzgKGuuVoEy9Wl17wjeP7g8U2DzsEFbPrKxDfDu4nwnj3jYTXZpedIAQ9qo9pYoy39wLTmLEArzy5Y9/BbTzGoboqRZAv9ipKjVpgh8DK81HQSxq4GixGh65pHNbRRi2o/d1bxPlTWyKF4gTgTylEPoV0yTI/uivDJb9tfFvzxawvIuqDqQylPnfyxL6a398A1bmMhqiaE239JMF4qDtYyoRucp2z2vdPGcNxZpelKjws8jT5TOzgVo9Vk46ubDx8EGK5IMWe7Vybbuu15ub/MlGijbVTzZ5cZUU0oYXO1ozVyNM1UCoDfHMV3Yy2kbmmxrdfA5S4LpgD9RNIKHqqP69nbFY=</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0mlrDkqToMdczPG9cJ8B1cbeQIHX1OSFRS0DRQxEAP24lcqJNKYEQqMEW4GIn34zirL0vgSnc8apH2GanHczKybqugAYiLYp6a3FSAiGHILh4NbPxVlMpbTJXZ+aJl91gw==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0oLyzU/XAvYeB88d7rKJgIoIc74oG1WsvazklGqxUR/W1z+MFWb8mN8lrGogdaR3/p2k1wUiFJ/1HETffM+Oq4lAVQOYgDaoMfjb9YjT+7To</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>c+hjB8QIRkFR9FPc+lzDq7g/6QEPjgg2hvzTymQ78w6xZBAdMbcY0S8kzYBEHOSNDJMZh0Ulg7s1EAYLsYMTvuQ1pqWmelLXhUyJYGNA9+dtW/r60vztRf9V9RcbzEwdbA4nTr+cJt0Ko5PHfKAbapLG971rnUu8oIPk1D0QQij2BqxSEAOxjBhz9pDstpOQ5gN0zjJ1jG+r9ApSUwtoIjOadPrP5rvjz+npRPeNEq0=</encrypted>]]>
      <![CDATA[<encrypted>cXePWl4J/MzWtOr63EW5ccSCOpY8do+lRq7Q4zSx7zcVQCyfV39gFs84vOtCdoCd7zJU1iq+gSIg46iZiRjCTXNtuxO0IPUh59fqKxh+iWNLd+1toWYpc7VBrzEUXQfc55PpAh3J0bxKWYk9E4olCiW5+qvTPr1EmuoIRdtV5vj95O7SfKg2nJW5fLjqLyP4zYdDpzUFlC/kLaoRDUxirdkhrB/qx2zX9OkiLdtLMo1P6zeSm5rMCpk9XlJmXUlnoY0yE27UvgpPYmj64+px1cVbzEoVVLVD01I+/SuXWG2rUX6J1piU/WVdE02NQRJsdEUhY9TuABTV9RSZSSyZxQPaQ/0P5MEcJoQRL81xKBkkOO+8eBph0Lp0/jUSs/qR/PiFFcHo2IVFFsHf75xLvCvZlEIoMwuBgTuLnZyOiROISUk6GihCnf2KjCiY+C2otFiNlF2j3O+dslfYlIzsQtc04eES3Bi5Q3AaxEDO+13E5Q7Yw7/nUfWJ/bOPuOoCsNhgzNzIU1nPIZ3m8vJEgUpHxvoCqGaobXigle+QPlTySJQ+Tx8xaftewtYKWFWOvfdZxUnULIkhIOu+FZ7xKnjkAf0ZedVdPzGXKVuyJFPotyI6r8GTbbOYRyVR/ZlsLj+ToU5GJXCsA3diIwiHwmgubgw772Eeh3wlzOtyvtPc3g+Trez/bW3Tv+iJRNYBpaBYM9uJg0HNhs3SlSs/YFsf2FOeBO1i/xQGoN7hI/USQskclim+IgHFl2+69XVq9G9S3MXtS00nQKx7fshwNhXcrLbh+l2lrFoZzE2Auw1cCYze7Kvce6sR4XEuxNC0MvKiUo661xorcoUiW+vy5KPCw+MyBmxmjz1xKCmG7LrsQbMKyWV14KoiEJlsgL7MTK62c6Jgj4r/GlbK/a86lr1i6qF912KALbxgalHi9lgprTSsBVF5RJ2ofiOXgBBiCybdVXcO/wzAgwuI8syxBSUrgf1uDdFlNofqU1MSvWcoEgKwByc0IIPRsWHJxwodxD11vysEn4+xNPcGFC3KGOuUuIwXRWDMWLwn4tAbJzBIiPypbVPYt5y37IVqZKPOpcHnK1BF1qd3M0XkkxczEXx1/4oxTM3Q4oTUxp8MvczxR8AtYGgvjH8mXS7J/FAmHc7IJs54UBwyXNcMrMpgRrPG6c3C/io0FRLV7Hniky1KlDcttH3ELdVKSJSKSXOqgx1sZ4XieSwnXXIqmuVOjw==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    <action id="Customer">
      <text>
        <![CDATA[<encrypted>gMi9VLJM1SLrRmbv1C7b1G2PBPigGvwtFS2ccd3maLJcPB2FQjQRCl/6r1EtxMcM57nkZkM6qsIoZTnvUL5j6kbc7suQCABGjWe1mbNfOoaNOC9bF2hoYNEbm1ETP1m+pSeUu4RoS1e8F7rpcu9hjdYFuBnxxZRRw8HHWIpMR5oE7b8ydf8EOGZOIug6drjLzxou2fKT8dqZcOxtMyCeS/2lM/LsmXEGDdING8o0iOI=</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>
</dir>
