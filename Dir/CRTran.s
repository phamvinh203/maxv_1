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
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd41$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post "
declare @group nvarchar(128)
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id

if @loai_ct &lt;&gt; '3' begin
  update d41$$partition$current set ma_kh_i = '' where stt_rec = @stt_rec
end

if @status &lt;&gt; '0' begin
  if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tien_nt, t_tien, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec fs_PostCRTran 'm41$$partition$current', 'd41$$partition$current', @stt_rec, @group, 1
	end else begin
    exec fs_PostCRTran 'm41$$partition$current', 'd41$$partition$current', @stt_rec, @group, 2
    exec fs20_AfterUpdateGL @stt_rec, 'm41$$partition$current', 'd41$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end
  if @loai_ct &lt;&gt; '1' exec MaxvOnline$Posting$Allocation @@id, @loai_ct, 'm41$$partition$current', 'd41$$partition$current', 't_tien_nt', 't_tien', 'tien_nt', 'tien', 'cttt50', @stt_rec, 'ma_kh_i'
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
  update d41$$partition$current set tien = tien_nt where stt_rec = @stt_rec
  update @@prime$partition$current set t_tien = t_tien_nt where stt_rec = @stt_rec
end

if @ma_nt &lt;&gt; @basecurrency and (@loai_ct = '2' or @loai_ct = '9')
  update d41$$partition$current set tt_qd = tien_nt, stt_rec_tt = '' where stt_rec = @stt_rec

if (@ma_nt &lt;&gt; @basecurrency and @sua_tg_yn = 0) begin
  select @idNumber = case when @@action = 'New' then '' else @stt_rec end from @@prime$partition$current where stt_rec = @stt_rec
  create table #result(ty_gia numeric(24, 12))
  if @loai_ct = '2' begin 
    declare cr cursor for select tk_co, tien_nt, stt_rec0 from d41$$partition$current where stt_rec = @stt_rec order by line_nbr
	  declare @tk_co varchar(33), @tien_nt numeric(16, 2)
	  open cr
		  fetch next from cr into @tk_co, @tien_nt, @idLine
			  while @@fetch_status = 0 begin
			    select @method = loai_cl_co from dmtk where tk = @tk_co
          if @method &lt;&gt; 2 begin
			if @method &lt;&gt; 0 begin
				delete #result
				insert into #result exec fs_GetERD @tk_co, @Method, 1, @ngay_ct, @ma_kh, @@unit, @idNumber, @tien_nt, @so_ct 
				select @rate = ty_gia from #result
				select @serialize = @serialize + case when @serialize = '' then '' else ';' end + rtrim(@rate)
				update d41$$partition$current set ty_gia_ht2 = @rate, tien = round(tien_nt*@rate, @b) where stt_rec = @stt_rec and stt_rec0 = @idLine
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

  select @n = sum(tien) from d41$$partition$current where stt_rec = @stt_rec
  update @@prime$partition$current set t_tien = @n where stt_rec = @stt_rec
end">
]>

<dir table="m41$000000" code="stt_rec" order="ngay_ct, so_ct" id="PT1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu thu" e="Cash Receipt"></title>
  <partition table="c41$000000" prime="m41$" inquiry="i41$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <header v="Lý do nộp" e="Pay for"></header>
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
      <header v="Số phiếu thu" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
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
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
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

    <field name="d41" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="182" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CRDetail" row="1">
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
    <view id="Dir" height="241" anchor="6" split="10">
      <item value="100, 110,9, 120, 100, 0, 0, 8, 100, 20, 58, 50, 8, 100, 0"/>
      <item value="111000000-10011: [loai_ct].Label, [loai_ct], [ten_loai_ct%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="111000000-10011: [ma_kh].Label, [ma_kh],[ten_kh%l], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="110000000-1001-: [dia_chi].Label, [dia_chi], [ngay_ct].Label, [ngay_ct]"/>

      <item value="110000000-1101-: [ong_ba].Label, [ong_ba], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="110000000-1100-: [dien_giai].Label, [dien_giai], [status].Label, [status]"/>
      <item value="111000000-0000-: [tk].Label, [tk], [ten_tk%l]"/>

      <item value="1: [d41]" />

      <item value="110111-10-1-: [hd_yn], [hd_yn].Label, [sua_tg_yn], [sua_tg_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien]"/>

      <item value="11100000-------: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="11-------------: [so_ct0].Label, [so_ct0]"/>
      <item value="11--------11111: [ngay_ct0].Label, [ngay_ct0], [ma_tt0], [ten_tt0], [cookie], [ma_dvcs], [serialize]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      <categories>
        <category index="1" columns="798" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="3" columns="100, 100,9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="6" split="10">
          <header v="Thanh toán" e="Payment"/>
        </category>
        <category index="9" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="5" split="5">
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
        <![CDATA[<encrypted>qiS0W7Z3b008x7VIaxXSbCv47Ahs8OcW7sgbaJvK40ZHycf9hOCAk92JPgikSbbGxLsTPkZYH7A+dOFH7XbYEtTDkJuSW9/PPSCujQ8Hi7xe/QkhKQxiHv1f0iPCuusKtIP60ptU87T1c0ktc5az1EIKfI8W0BtcJqhE6IBnDKaRrDn5QVE4IzJuU4S9/a/uPtgCLMLSeMmMMm7KVzZ7wQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPpNZ3ampN3PbB9E+IjoMHSlZeMy01Wvh+aYGyHSBIVcEDTA6SJ03VjA96hqJHYnUXtYKf98FaU/hU2HIp4g2YVo=</encrypted>]]>
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
        <![CDATA[<encrypted>uORaW79PEyy0wA1i6jq3hYGE3gIVOR9j0L7k/ey4CX2hZcj5xMQAE9MC0Z/27Xy0yOBkJXo5KI8/4QZMZPjTAi46BypKiPr6vGYKZXPSdrnzPVbJynfxcAB8tGIF5kx9a3BfUBXXovpSveZBDqIsm7ElR9myYtHYKWgHZ1wtuHXo1JFlhghYduKQ84jQGdRGPm7/RTgFgCXwvHJN/lQvGpP5qkVWcEhYwlupr6bR+f3JIEXRl9Ti27sWpuRHTeYIjh5SaHliqh2YrWi3NyEvxEYRmKhBvMTyAaFvqwDar6UrL7n1z/CcE5OSsq2dJZUttdh6HnSPvzQNPIy82Z4XJACxP5Dynlw+Knuh90McjyZY2Y8ZwiOxV5bZZ3/7R++wBOItQt4BCmLXLvrExToMToka0W6gYCit0emPnrdE5oLC59WFgL7HO7XeTCYmadkYiIBwaV//bLuJgSlqLvNbgQ==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>OTunyz2blYd8MsaA18jHEYeLTcq/2apyHr/1sDlEKnmzxR+yZvmsJBej10FCznUy5uklmFznVDPh6okFjsjheqFpXFvItnuIGvLVl1B3p2ldQ3YlwN4DRw53x4fWSM74DTEsjTsJZziOQldzrgCgYDoiSIETkGlllyFz25aX9hOdr2O9qPrv2yF6iQC+Jquy5kqELWQEzBzO/fvzqcxFKQ==</encrypted>]]>
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
        <![CDATA[<encrypted>MpXizvsEHikVCJvtLNOXCV9MbTXhMFT5GDOo8SCoh103WtzpFxETh6keeNP9jQLpDqtDK2H9VSDiz3nGVi/UmccYdaijJhamaJBWUZmTJEM3IlXbwdayGYT3wZDc/rxlUo9BxUwXIkxUumSFWgMPXua2BeweeH/9MeA/wjc/jtx64BwHJuGko+houVyFp0X76hWo4ruFm+SkDI1MaW24DiKlSNy5gVXBKfIo4dwMlW4=</encrypted>]]>
&InsertHistoryVoucher;
<![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKwxgkBaYFtCzGAY23lynNsSxuMgF9S938tDZ5iFfjyYOEXu5hGtm5egMzXiIqY+IHcTUcVgB0etwrkg8LYvhlUBY1plxOnJ1un4vkcL+SO8My</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>+qZPIBa5OfgwaKpRUAyptGbq0DVLiI68zwxVD2n68KQPhfpfT4Mvu0tTva5WEOBa4p1kpijpyp99dDsHa/oaEp/D5y4FE/nugB/HgWD1lkuiZko2eoxv0xCVEJCqiGoRoefNwcOlvqN3fPBI3adRPVOdIG9mkrWx53rTLiSND7cIdQUTDSNwvKnN9WljKYhtCNQLRHpWh+an6DPrpPniY/nQ3k9116HuwG0EDwYVWlMOO6d/4dEalSSVXq1rNuJ4r9I7uPRwy6bnDDnyp+sXRtjcX5Zra2UqmeeFGbeunRFm+0aY8qCYrQbgpBOgkk4Mpy5R1yGgkd/MAI+N6CAwqdxBaVXMCk/kaPFpRTgCD/JMP0WCuMY6nKcb1FWKglMqkY7AcMgCwpCfloolatXsNeZd3pT29hupaVpPBPoisRFRnSqzDE1Dp+X8hGnTsOjRksbjqZWhSvHTQDwCnlV3c+28pBb1wHPJ1ME8vCrvxMCiBpfYSTW6odCcyUt8M10oRV3fscaYUzPebJtOjMZ0I7tXTzqAsvClTnADdYRB73ZnhKsAz31jo7HAWqsGeEtvwZLD7aUILaYMDhP3u31N+e+IE+bzMt22QVRVmKYAp6qX1CHCR2DtLxu9YDsn+qRWBs9Uard4x6dfmJf2LzfALA8QR3YeguzrsRfMWC92aI8=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS8p9nsRRanAtEXKcI5YLfU2BcbacTQenKogK2o7eWr4kwL0hPq6s5/ZjgWGKa6YHvb8yHBYbupjsySLrwJ6q78yg==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>dBa7fa+z8TE5AOFOH1oNGCH/UwcCGtAijALXwp4qFsBCNvatAt3KT56KVv+SYRpGNUWVkhuBPAysxJX/ju5hfM3O+dMGo0dWsgo7xO/mvUwZWhwf+QzGLWXADu33hjqrMCgGvBb6iPrQPh48w8Bjw2BFEIsZjdWu4zvf55StkIPABK8Yl6ROXwiOYLTfztxr1KVuF69fLo4r8DCn1+xVK1BV6XNVYWZdl8oCB3Yed/I=</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>XuJ2CkJFXlpFIg4L9hz+oEnb6TiaTRHxXQiFH2OheyJKgJnJVHxon2QEvSGZTOsm+OfA82SFMh4xpo25Z0XZNGXaCQ5qUx1QkXSam8Rnzv6UqtfA8YGQxnUvtCywQrFlNtdgKv74J5sMkc5m0lvUT9wpjwvtbDuVPUzu6vSHRR64CHC5B5QsQU/PDEybWWg0v6RHdbfVxC2wcAkiqda81Yf0TwZObor3UrJsKTlyPsqxmWJjtdcWQ7EmGeEukhcNVjQl7p8OzM3GagEFxHAP9He/fYd/eqO4Irp7DFTxb+Gg14sfmsHNYD1dWHyhYFhQ9fTk022Si94BcEfqmxuIHmW+i/K8CqSnVU+B6Gvh/3CXMF+KOeUb2+TLzAZM9OG5/Ec1GdUInYG1N9uGw4hATTG8+XFt8nSPigLc8Y8o3Pr9IBIk25TwNQ7kBAABbnU6Xcyze6MKpnKvJQIq79eIqap2JKV6YiwjTrzGgfteiY8Ny7tot72w2XtxkYM0Vny/</encrypted>]]>
      &ScriptVoucherNumber;
      &ScriptExchangeRate;
      <![CDATA[<encrypted>oTtT4tY+Ot5AxJekh6lPlH9d7VRhQnTugl1DXG7HaZ8+J1jAMdDr0uy+s6H3uDSU4nJD/rPQHkbFKo6sxwpdww==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>SxbxPtVu8pgUdGGmgPMdoakLVMeTxT3sn7540A60BSKZDKodFXHmGnz2RYWC194D18IOKTz8t2FNpZQ1mdfyyKU1UEfOTbTUnlF75YZiIQt2eftTbS1vorMLs1rTJg0UBhjEXjhIRU0G8+Brx/Cqhr+diEViPdHl1RVaIotIQ1LkkeTfqIrc+8+wBAbaLqr2BeF8qSqi9cSv0QV35c7G9A8YcUk3iRZQijuceNHk67aqybIpoV9ccldowWKBF+f3tPJzvGZTQqBapSJdsx4tdz51FSthmf5SsGIYhX0w7XIv6g8QHi01yh7o98j2U0SeQDC9XffP9df9o//2zd4hmcGvJZTE05gGufgG4kz29WGVC4Zsrsi7Q6ITyJd/Tumk2oiCcdgqMcx8N/ZQD4+rR7Axy27HSLHvZexeUOWZnn2RmXBloB+2H8CisMkG+hzQNHvQT4YC8I0x9tDdi2uhQiVss+wV0dLjX1gLwhu8xdScTCRE/0fbh7Uv50fczCRDpxRQZZ88iYroNAFcI8D22Xt1XNTTVYcZSWwFl2bJroCoKY/t9cXebZx/Q1AJMPBfOnTXij+9bhXubjSwl2vFbq/luyKfNtgh8y4lGOzC8XIVHTpUsHKPpm9fXdIQtUnPhYPIGDiuDFEdEstx/Hzw5vmYjg0SbDOJAwmlLK0qJ7EQqZ2K8LNXmyXJwXu2OBlzMwtY6qBa11Kwfng0jJtB2BZKoKU9ciZd98M009nA84u6Upl4qxpzTaT/nAKqth+GQgr4ZqoO5jad3uj2W5NeUTItnimi7cvzowdhN0HwzFNTleiInBLczp8X5Y33tizh</encrypted>]]>

      <![CDATA[<encrypted>FpHuK2XJ1a6M0wtBtzWDBLrCjcUKNO4jYfgGrbqEm3KAjzZ+XJldIehXVJM50Z3sH/xXds6JDluVecz37PqdSaIbwAozosLEuZFMZv2ILOfebJc3alj9shYGfXBqgSHg+8EmroZYROC08TvSLcozOFJB91kOnjhUClk1I91Au1YhzaaYdUfU6y8TnS7x74x/PuP7zj9a5896d3ELlT6IwSN6tWaElKNE4CWCoxKdzvbVZ7jDNuKT3VMez0x5IgZJDki+YcXYKHPQKAs7CRpmRNTiPxhmUtcLXi0CWg8/ItTH4t7Kb1ZGbj3kkdy4TH59sJ5rw48ofceqnl2Bx3piLH9XeAix/ITy+Y5pVscr2D7ZpOtzhTcZfqFM31elq+/4HnUwHjeiuoA5DiMh4Y1/VRCuRMYBR8mcGpS5B//EaCUkB8q5RuqT+q+5uGsNs1q7bCzLNfHz8o0b6RGO75BQ5ge/RJ1MZtkB0ehmjigu4fOjAItZtZTRUr17Z3QAYOOTZdxGgRjSdGScoqjnQq0aj/GW+4PYK4WfcGZgzGPDiwvNw9vumg67LkL0SQbPPlrk09ut56DwfvkvxC72HSN5+DR8pDvHt4L+xq/68RVX4ZVzbeMtF6UjsvhiO3eYqZLOgDMy4s2Z4PQHX4Puu8lAmQ==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0mlrDkqToMdczPG9cJ8B1cbeQIHX1OSFRS0DRQxEAP24lcqJNKYEQqMEW4GIn34zirL0vgSnc8apH2GanHczKybqugAYiLYp6a3FSAiGHILh4NbPxVlMpbTJXZ+aJl91gw==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0oLyzU/XAvYeB88d7rKJgIoIc74oG1WsvazklGqxUR/W1z+MFWb8mN8lrGogdaR3/p2k1wUiFJ/1HETffM+Oq4lAVQOYgDaoMfjb9YjT+7To</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>c+hjB8QIRkFR9FPc+lzDq7g/6QEPjgg2hvzTymQ78w6xZBAdMbcY0S8kzYBEHOSNDJMZh0Ulg7s1EAYLsYMTvuQ1pqWmelLXhUyJYGNA9+dtW/r60vztRf9V9RcbzEwdbA4nTr+cJt0Ko5PHfKAbapLG971rnUu8oIPk1D0QQij2BqxSEAOxjBhz9pDstpOQ5gN0zjJ1jG+r9ApSUwtoIjOadPrP5rvjz+npRPeNEq0=</encrypted>]]>
      <![CDATA[<encrypted>cXePWl4J/MzWtOr63EW5cZZx0dnTyhmiqXgapAkO4KQN7by5i9Wt8YWd3CztRZ5p3URZav4LpFxZ5/nbEufmSDkhlMrtia7jVb+cURYRdCZsaX4A3tSCq2pqZOYPo5qvWJvTNW4GusCmRZ/WNcYE2Yt+CZ4OM6quNJ2fzdvBdD5xhpjLqalfHVlPqAcD7YgsReqGxyyWHnyXBgXUeKAjAbccx5NAjg78RbCkrmqe5rOzHiGclXKxmDSZGz7a/kHvIoUihvCt2EKOmhmbntVn8jh5G0rnMtiekudnMVXdPrkCWN8EOEM8g9EZ6Rzg7gL7LS/ZdwE5QLtvdIvJEA1dH7e7AqicAs+lTlwpUVNNINOTikAMsyZLI1U2+5dDXyQ4kSAEM8C0JayroL/HXZDnGbVFe39J0dOWsU57uk3bwd3Zr4nsiT1mMRl1xlhkMomKoJJUqq/Ecvsrwgt8l3MvD2bvhxftqHkqe0tpc6E24EkJpOiMWzmaHwCwNwDoKd2OkPwQj6QuaQMVMzXivFttD4nF6KLLTaxle6cjYb+zq/XlxUaugO8XsQQRlOmKv6TL0hA7Ht3mjDnUVSQUsCV0ihLQNWGMb0AIu1PbeVovmwwGgjayWCFSYTV49OvrlCo0g5m+OtE/Xo8//Uld5iq26uPnHvcpTMLeaOs5DTpiQ2t6tU8hvS+IsPCiL7iY/MR51QMdIfEDdvA9sGYIrleyU5A8MVm11U1Pd1TI1J+DKn7dFNMPKseSLdQXB1AlRGcP/G6s4mZr+Afx+q8FRj6NwKB1/ti8V/ZASI1TXYaYznIiYK6f88/v/tErSiJtI434gJfI4pq0GeGe5VdJ8647lo5a2n9hjbPBaLfWlg/o0VYSWZ8eWX1riN2IIl6fFCgiXRofWmi1q2zlvYDEc3ZqjqgoLmjlIFQInGZvtVs9RfjXiQy0/yP8HMVgZJDyYPAd9Iz0ezMux2ZyHUswSIZjPdN0AQO9d7A5jGXGKXCpO+JRd7OzO3Hh13G8VeagJg3pSq3u4NAitixuJKuyNbWbLPuG8Z8nmtOVf7aRWrG2f8Lr3WQ0Aqh4/vcynr5zY4nM5bi2qFM+gVikW+DfBMhtokyTg2caDWQ4ZKE6q/VXjs0EoBU9koTlKCYqtxshY0fd2I6HpMQFV7icD7Fp+VgkYbMX6w4rr3GSX64SfAOn968yhBJ9F1O0YA5NqGHufbNih/0e2rood2ZWYLGjs/dyEg==</encrypted>]]>
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
