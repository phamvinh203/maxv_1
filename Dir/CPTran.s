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
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
	
  <!ENTITY f ", @supplier as ten_ncc, @taxID as ma_so_thue, @customerName as ten_dv, @bankAccount as tk_nh, @bankName as ngan_hang, @province as tinh_thanh, @note as noi_dung">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd56$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
update d56$$partition$current set tt_nt = tien_nt, tt = tien where stt_rec = @stt_rec">

  <!ENTITY Post "
declare @group varchar(128)
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id

if @loai_ct &lt;&gt; '3' begin
  update d56$$partition$current set ma_kh_i = '' where stt_rec = @stt_rec
end

if @status &lt;&gt; '0' begin
  insert into ctgt30 select * from r30$$partition$current where stt_rec = @stt_rec
  if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec dbo.fs_PostCDTran '@@prime$partition$current', 'd56$$partition$current', @stt_rec, @group, 1
	end else begin
    exec dbo.fs_PostCDTran '@@prime$partition$current', 'd56$$partition$current', @stt_rec, @group, 2
    exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd56$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec    
  end
  if @loai_ct &lt;&gt; '1' exec MaxvOnline$Posting$Allocation @@id, @loai_ct, 'm56$$partition$current', 'd56$$partition$current', 't_tt_nt', 't_tt', 'tt_nt', 'tt', 'cttt60', @stt_rec, 'ma_kh_i'
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ctgt30 where stt_rec = @stt_rec
delete cttt20 where left(stt_rec, 10) = left(@stt_rec, 10)
delete cttt30 where stt_rec = @stt_rec
delete cttt60 where left(stt_rec, 10) = left(@stt_rec, 10)
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
  update d56$$partition$current set tien = tien_nt, tt = tt_nt where stt_rec = @stt_rec
  update @@prime$partition$current set t_tien = t_tien_nt, t_tt = t_tt_nt where stt_rec = @stt_rec
end    

if @ma_nt &lt;&gt; @basecurrency and (@loai_ct = '2' or @loai_ct = '9')
  update d56$$partition$current set tt_qd = tien_nt, stt_rec_tt = '' where stt_rec = @stt_rec

if (@ma_nt &lt;&gt; @basecurrency and @sua_tg_yn = 0) begin
  select @idNumber = case when @@action = 'New' then '' else @stt_rec end from @@prime$partition$current where stt_rec = @stt_rec
  create table #result(ty_gia numeric(24, 12))
  if @loai_ct = '2' begin 
    declare cr cursor for select tk_no, tien_nt, stt_rec0 from d56$$partition$current where stt_rec = @stt_rec order by line_nbr
	  declare @tk_no varchar(33), @tien_nt numeric(16, 2)
	  open cr
		  fetch next from cr into @tk_no, @tien_nt, @idLine
			  while @@fetch_status = 0 begin
          select @method = loai_cl_no from dmtk where tk = @tk_no
          if @method &lt;&gt; 2 begin
			if @method &lt;&gt; 0 begin
				delete #result
				insert into #result exec fs_GetERD @tk_no, @method, 1, @ngay_ct, @ma_kh, @@unit, @idNumber, @tien_nt, @so_ct
				select @rate = ty_gia from #result
				select @serialize = @serialize + case when @serialize = '' then '' else ';' end + rtrim(@rate)
				update d56$$partition$current set ty_gia_ht2 = @rate, tien = round(tien_nt*@rate, @b), tt = round(tien_nt*@rate, @b) where stt_rec = @stt_rec and stt_rec0 = @idLine
			end
          end else begin
            select @rate = 0
            select @serialize = @serialize + case when @serialize = '' then '' else ';' end + '0:0'
          end
          fetch next from cr into @tk_no, @tien_nt, @idLine	
        end
	  close cr
	  deallocate cr
  end

  select @method = loai_cl_co from dmtk where tk = @tk
  if @method &lt;&gt; 0 and @method &lt;&gt; 2 begin
    delete #result
    insert into #result exec fs_GetERD @tk, @method, 1, @ngay_ct, @ma_kh, @@unit, @stt_rec, @t_tt_nt, @so_ct
    select @rate = ty_gia from #result
    select @serialize = @serialize + ' $ ' + rtrim(@rate)
    if @loai_ct = '1' and exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and ty_gia &lt;&gt; @rate) begin
      update @@prime$partition$current set ty_gia = @rate, ty_gia_ht = case when ty_gia_ht = 0 then @rate else ty_gia_ht end where stt_rec = @stt_rec
      update d56$$partition$current set tien = round(tien_nt*@rate, @b), tt = round(tien_nt*@rate, @b) where stt_rec = @stt_rec
    end
    if @loai_ct = '2' update @@prime$partition$current set ty_gia = @rate where stt_rec = @stt_rec
    if @loai_ct = '9' update @@prime$partition$current set ty_gia_ht = @rate where stt_rec = @stt_rec
  end
  
  select @n = sum(tien) from d56$$partition$current where stt_rec = @stt_rec
  update @@prime$partition$current set t_tien = @n, t_tt = @n + t_thue where stt_rec = @stt_rec
end">
<!ENTITY CheckAction "
declare  @e2 nvarchar(4000)
select @e2 = case when @@language = 'V' then N'Người đề nghị duyệt chưa có hoặc chưa được phân quyền thực hiện chức năng duyệt hoặc hạn mức duyệt.' else 'Approving officers does not have permission to perform this action.' end
if exists (select 1 from options where name = 'm_duyetpcbn' and val = '1')
if(@status = '2')
  if not exists (select top 1 ma_nt from dmdpcbn where loai_duyet = 1 and user_id = @@userID and status = 1 and ma_nt = @ma_nt and (tien_nt = 0 or tien_nt >= @t_tien_nt)) begin
    select 'nguoi_duyet' as field, @e2 as message
    return
  end">

	<!ENTITY CheckAction2 "
declare  @e2 nvarchar(4000), @status char(1), @ma_nt char(3), @t_tien_nt numeric(16,2)
select @status = status , @ma_nt = ma_nt, @t_tien_nt = t_tien_nt from m51$$partition$current where stt_rec = @stt_rec
select @e2 = case when @@language = 'V' then N'Người đề nghị duyệt chưa có hoặc chưa được phân quyền thực hiện chức năng duyệt hoặc hạn mức duyệt.' else 'Approving officers does not have permission to perform this action.' end

if exists (select 1 from options where name = 'm_duyetpcbn' and val = '1')
if(@status = '2'  and  @@view = 0 )
  if not exists (select top 1 ma_nt from dmdpcbn where loai_duyet = 1 and user_id = @@userID and status = 1 and ma_nt = @ma_nt and (tien_nt = 0 or tien_nt >= @t_tien_nt)) begin
    select 'nguoi_duyet' as field, @e2 as message
    return
  end">
]>

<dir table="m56$000000" code="stt_rec" order="ngay_ct, so_ct" id="BN1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="giấy báo nợ" e="Bank Debit Advice"></title>
  <partition table="c56$000000" prime="m56$" inquiry="i56$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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

    <field name="dia_chi" defaultValue="''">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận tiền" e="Receiver"></header>
    </field>
    <field name="dien_giai" clientDefault="Default">
      <header v="Lý do chi" e="Memo"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCmVcn8h3iz76804lWbbVpa4+qfED8HT/UON2+1BJB+dA==</encrypted>]]></clientScript>
    </field>

    <field name="tk" allowNulls="false" clientDefault="Default">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Loại phiếu chi" e="Voucher Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="loai_ct$dmloaict.ten_loai%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XDCCwP27sgbW+DStHBI+U5FTRlGt+RtWQGPeBcQ3H+U4Q==</encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
	
    <field name="ma_nk" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @@id and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
      <handle reference="so_ct"/>
    </field>
    <field name="ten_nk%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
	
	<!--&XMLVoucherBookAndNumberFields;-->
	  
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu chi" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XDGAh4G7jSmodAiU+Ts4e5zMQx549cACWW5afFbdCh2Cw==</encrypted>]]></clientScript>
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
      <label v="TGGD" e="Ex. Rate"></label>
      <footer v="&lt;span id='idf_ty_gia'>Tỷ giá&lt;/span>" e="&lt;span id='idf_ty_gia'>Ex. Rate&lt;/span>"></footer>
      <items style="Numeric"/>
    </field>
    <field name="ty_gia_ht" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá gs" e="Book Rate"></header>
      <footer v="&lt;span id='idf_ty_gia_ht'>Tỷ giá gs&lt;/span>" e="&lt;span id='idf_ty_gia_ht'>Book Rate&lt;/span>"></footer>
      <items style="Numeric"/>
    </field>

    <field name="status" inactivate="true" clientDefault="1">
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

    <field name="d56" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="142" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CPDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="142" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="CPTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_tt" categoryIndex="3">
      <header v="Mã thanh toán" e="Payment Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" allowNulls="true" categoryIndex="3">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="true" categoryIndex="3">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>

    <field name="hd_yn" type="Boolean" categoryIndex="-1">
      <header v="Theo dõi thanh toán" e="Payment Control"></header>
      <clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA1xjPdslTPu+4XAdjRgH5aU5GZOdzpStO4paNHMlsyHdimIjRMb32qsYlmt1oOyD6YaqbAnqqyqVXxddx5BCswgg=</encrypted>]]></clientScript>
    </field>
    <field name="sua_tg_yn" type="Boolean" categoryIndex="-1">
      <header v="Sửa tỷ giá ghi sổ" e="Edit Book Exchange Rate"></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế nt" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán nt" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="ten_dv" external="true" defaultValue="''" allowContain="true" categoryIndex="9">
      <header v="Đơn vị nhận tiền" e="Company"></header>
    </field>
    <field name="tk_nh" categoryIndex="9"  external="true" allowContain="true" defaultValue="''">
      <header v="Số tài khoản" e="Account No."></header>
    </field>
    <field name="ngan_hang"  external="true" defaultValue="''" allowContain="true" categoryIndex="9">
      <header v="Tại ngân hàng" e="Bank"></header>
    </field>
    <field name="tinh_thanh" categoryIndex="9" external="true" allowContain="true" defaultValue="''">
      <header v="Tỉnh thành" e="Province/City"></header>
    </field>
    <field name="noi_dung"  external="true" defaultValue="''" allowContain="true" categoryIndex="9">
      <header v="Nội dung" e="Memo"></header>
    </field>
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="serialize" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_ncc" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_so_thue" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
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
    <view id="Dir" height="196" anchor="5" split="5">
      <item value="20, 75, 110, 237, 100, 20, 58, 50, 8, 100, 0, 0, 0"/>
      <item value="10110-10011: [loai_ct].Label, [loai_ct], [ten_loai%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="10110-10011: [ma_kh].Label, [ma_kh],[ten_kh%l], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="10100-10011: [dia_chi].Label, [dia_chi], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
	  
      <item value="10100-11010: [ong_ba].Label, [ong_ba], [ty_gia].Description, [ma_nt], [ty_gia]"/>
      <item value="10100-1001-: [dien_giai].Label, [dien_giai], [ty_gia_ht].Description, [ty_gia_ht]"/>
      <item value="10110-110011: [tk].Label, [tk], [ten_tk%l], [status].Label, [status], [ten_ncc], [ma_so_thue]"/>

      <item value="1: [d56]" />
      <item value="1: [r30]" />

      <item value="111: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="11-1: [so_ct0].Label, [so_ct0], [ma_tt0]"/>
      <item value="1111: [ngay_ct0].Label, [ngay_ct0], [ten_tt0], [ma_dvcs]"/>

      <item value="110111-10-1-: [hd_yn], [hd_yn].Label, [sua_tg_yn], [sua_tg_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien]"/>
      <item value="-----1-10-11: [t_thue].Label, [t_thue_nt], [t_thue], [serialize]"/>
      <item value="-----1-10-11: [t_tt].Label, [t_tt_nt], [t_tt], [cookie]"/>

      <item value="1100: [ten_dv].Label, [ten_dv]"/>
      <item value="1100: [tk_nh].Label, [tk_nh]"/>
      <item value="1100: [ngan_hang].Label, [ngan_hang]"/>
      <item value="1100: [tinh_thanh].Label, [tinh_thanh]"/>
      <item value="1100: [noi_dung].Label, [noi_dung]"/>

      <categories>
        <category index="1" columns="779" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="775" anchor="1">
          <header v="Thuế" e="Tax"/>
        </category>
        <category index="3" columns="100, 100, 553, 0" anchor="3" split="3">
          <header v="Thanh toán" e="Payment"/>
        </category>
        <category index="9" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="5" split="5">
          <header v="Ủy nhiệm chi" e="Payment Order"/>
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
		  <!--&CheckAction2;-->
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+h8+/zDkfxNKEkuCaDXg5D5afWvPREV8SxT+4cgS4spA==</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>Prfg37kMJ8WBqoB5CvJCKf7bGLn7xzhd/qTwELa/vRyx2yQIA2RHENHp4ogjvxpOgLuPugRZg31KNe08ByME5w==</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
		&CheckAction2;
		  <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+h8+/zDkfxNKEkuCaDXg5D5afWvPREV8SxT+4cgS4spA==</encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7ZE3/7wegKNgL0bQHB5rxUHCKdWEuCuz6Y+bcJ0Ai+Ew</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>
	  
	&XMLWhenVoucherNavigating;
	  
    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4BENPIaanQyi9CsVwpvZMAfrFZGfq+pbbunXItthXUWcYqISfiadyP6Y66A2QySFGUGwI4YuRcch8XpXEXpl0XJd30eOSbAbmdujRkAjxVaop6WAENHXzmTNTWZKoyOgls=</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>cBR8DmD+SjdOeQIij5ObdmEURKFnZ4EmzYwF8iH7expOTHwlDLbaZ4PpD3mCOBFQmFz+V930oRdIQFOcc0sI1LEqMvgVBaSRbwOVFdhScl7zs8N0K3kHjR+dEduUKrRHnxOwrQATUEO6dL+R+AmFGmlyYNfeLjCLqXpuAiMvnpA5ucpVW6gN43evR2GQ3CvoeUZ2f2yyFi51xFdl40T0QxhByBHe03oOP+Av3rtBXQKdXenEsaiv/obcmPmujoFp65Qnk45AuBBJL09TniPtxQQtpODkygAcC/bcPSwOKDEaxEMWUvpd2kNs96WdOMmsNQH/Tt+3JXkjHobr0tSXmg==</encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;&f;<![CDATA[<encrypted>hwMrBmCiiEXbK2aR8FD+fqm75T7lIGcE+5pAWinuLNYvM6rbHOUG9+GCGyoTcNP4HXb45/DY5Wr1+Tkj7/ke6yv09gTlkvtEfgunaJr0ufApMCRuIQ76AgISkn/ywWRxq0OmYzikNbv7f+772fKINw==</encrypted>]]>
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
		&CheckAction;
        <![CDATA[<encrypted>IggICJcUGsLGQzMkLr13mbKvHl60UTo5ROZkeGmYbGG6QY45fan8djYyW6XHtuCWs21h2yTO6NUNuUMobnXWtY+4v09B4BnrvESlop6GSFJ/hEdJq4/bSlESEowcuyrWeZb0/jYqCMlRGzH93YPIssyS8mJwtIuw5Y7W5ArUpGKhAr4CbL0Ajr+VLHNWYcrR6OyHDG+SKIi/x+mTHvDaGC92sJomXU/rC34gI8lGsDUZuGVDZ9aq2AWQEYIjIoD0wb+hN2TEV0p+j3JAcyUtjN6n6Ljy3ztZTHoFRUzXAVmMDZ6Ac/TEwvHrsIjxh7Hxzq/viuoSq2xWShcHCokBQdaSm4Ceshva7+rgr3kpY4RFRKI9vqo8uCZFWJ8iW0NUNaXDCTU30AKZZo2ML51EiQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPiAoILUNgHxSM+UZI8BPJjPGbMB0iVYLNJyDazvTZmEBd4EWPn9VujP7EwbPLosFSk6dgBgTX60cbqZEv2ZCoBHC2nWIEYKUR5t0Rh1NJP/6</encrypted>]]>
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
		&CheckAction;
		<![CDATA[<encrypted>LD+bd1ruWrnOuZsPGaa+aPBA+HsSRM009jIomOWr/dh8Byq7bIMmoR8g54MLuePC6NIYpoN6rp8ymCLWEZudma6ybJuDpx52/A20mJ/JSEpPRDbEVPKh4SO8mmEzWsNqCkxWirNafP4vM8tegkk4gaiMG8+GUs5wlrCXBu6/ET9EWBvtog9MnrZKA9AvlpNdjpDd7WwTa6Pvn2M67kiHVPJY4K3KcXgea6C10ht55CBJrsZr8Zxx5eHlVo4IVXAZ0SjRTvSyof4ef3FvSyoRHVCBCuTqb2RgikKAgrv93Rvks2Q1D05g2GW21akY2+mt6wKGxLpsWCW8BcvULb/yiJ/6fWSp81ouu4iZS5dFyzdV0rnBUZDxTh8mUiJR2qWBJUPcEmTBB6wrfKwI8AfNBjT5ERoEQUlgpP0RhQ7GidctqS7GrxQ+GHiOfeSPIIgrQR4CgfXXCjLyT33HwvRULdmwHv9KKQYM/JOOCWKpC6dq4LoV0nMVzU1xQ6ocwz2/DKOU7LB7gpPcBT1IHbOM8PyLjpiF9mqyloIF9pvjjm8+b8RsuwTA2AjQjhhScL+ciycrsTKvAbDozgBTPoDkMSFmNpXeteOpmXrjCRLe4RSiD4/rKNdhxe2+dx+fdFnPQMnj/pZ4QvJkYB5j3GsHCzB5bWDPC49mG3lcUSs9NVL6loArc2B4pq1wpQfbpk/HUc/9XSQJIZc47veVtKonkRHGE4kni5pwFpSkiD7Wsn8Y1l+SJglGFAta4gnX9OCk4rgGOPZ+IJa1bz7RZ7Eaww==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>sY7/sFYLtA3aiKJ5cR0AfMshaplz4n8RpLDAe8HWn7eXY0OMLXtw9C8qUGORE4WcFY2EcF5VDM9ZF5yVg3a7ypInbUC0oORM0FZZbq5/bB5jkJx9q2Gl2cHDM7CFmxgzRAgcNyZuMbupvJlMTf77i2xB3yYRrT1EtzDa2RDpbAYNqaI8moiAlOUeJ8MCLNPAY0vX91GhTbLW5w8idcVbW/39G/lfCkgTmBZo8KM0HuHJ2Vfxcn0qz2HC42oe/r0G</encrypted>]]>
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
        <![CDATA[<encrypted>0rn/Qnz1+chxz3LDT2QKOeOgYyQ03ogVh3wd6A6EJb/en9Funuzg7hAhEGbDbUPF4nvRecQaNWML5jJ8APp9Jz3EURJsaregCezRPlcd4mNjgtadWa+3uFe9YZYne8H1NGIqsQr4RvW7C5HfXnxfWvV9j3k6ZhaBp0VfaIWnLB6j3x8kRx+no5oXv8FfjysDQN+VlzELNLrCC3obqqB4fqEQRtLvs/WYsI3mUL0u8YQ=</encrypted>]]>
		  &InsertHistoryVoucher;
		  <![CDATA[<encrypted>7fjNx/6xcEJz1emrxjh6LotpcmHBtq4frgtHs37oJI5zb1rhsBC4bIu9jMIbqFMPidGBphPh72hwHlrfP8amJP00uRwEAavLbbhodTfFHLonE3dV9sXckYBRC2aiFCzzwlkPdM6mQfH7qa7kuLytMQPq/vuPvJ6WlmsDGbVK8rt8CCmJqq98LjfJ2E7o12iethK+rKzSmvFT2w3WFtVjnA==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>kx2KNddPKdVWDgFtUv/z4p1++dTQ91bEMBUyE7lxFGQW1RQTwm+bLNw5G3cXvmysFe6oJFAd8KhNMLo3GNCRzcs1T69xqsfTze4iBdLTStB6X5NV158J17ZD5jv5YSOOpdpt31xsWWLZKj0K/BOe1W9P5UL0xiBn5SkMggSSUGPTfjbfnKE/lpTB9YphhZQeYV72cFz1fGkkUOdZQL92ioaPITCnQolD1zyWw2epjfe/mkFhbHsGnk3c4nM3wZ7GuKiwp7BPhic1fO9aRy015At9BWtz2+ISz1GbfjvpC+pitbyeHmYnWihj02TFUiR+ObUqBOqcU9zqwzCasn5MsSAm/33GYTm34Ip6pwwWj9JqKoOqISofHIHj4svBfRMMF0NthuSQ4xV2LJKIr/0U4IdueAdPZI7ybQldlEF4uYx3h1EJihzWw/Uk0Znu6o6NH3oPzwP59k0SWgUUCnzyLZR1Rn+nS+P7wSIViq4W1M7MHEXV8aWiV/KfVo66pt8GhlLwwNPeEkdsNGQqcd5BOSUVbHlWqxs5bk0MV8Rn78muam5PBVj/mLi5VW5DVS3M14lLXaF+Xi3/6IlugBXtAK/b+dxuRvAnK7RocbVM4z5CWXGl+KQl+5Uu/rb8WOtShqJMV0qx6UgH2caW6zIaVL0TlHlxkwFCcXO2YqbIEJc=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS8p9nsRRanAtEXKcI5YLfU2BcbacTQenKogK2o7eWr4kwL0hPq6s5/ZjgWGKa6YHvb8yHBYbupjsySLrwJ6q78yg==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>dBa7fa+z8TE5AOFOH1oNGPbrzsQetVh1jk1oWdJfZY/h8Lh/POdv5j8HfkEYnCfFq93rzoCRI6yw6g14ZVC3bdUB+Ck1i0nMPOJx/7bH123S6dX07TNGwoe4d8mOcnSYEw9zht0H0JEq0efATJ7q9/sMrhl04UJ1O4UfXfCI7nTmFDlPsTAJJa3fkoewgESu91CrVoV20nj6TGSgIcoXPE/84hzbRVYqnTMYa7fB/wE=</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>7SSkth4Ecd3E1dp4vP0eODlO91a+A0bHW+40N/lzBMZjyQk9RlWh009H4QpJ2urrBCijKvM8SFnRcUQwfNIuJMW8Uv37CsncnQ2yOhhT4ZbX3u2dPfa/TqvJfHn2BKm3+ZPDsI3+4S+k6Y6orjk4QZeAULSraGmabrj8gH+X6tVoD2mV0HOrVKGVP7fF7XGGOXSno1xwv4YIY+d/wCywnO83rlOM/rAd3xREcjXovIqyxPgiRXAnQ0tS+0BDjUG9dx3mzY5QioNaLnhJVw4fvuBSm0p3QQMP7EmnKkhEzWpsYbPjqOcokqkV7RWQEP4/x0iOgbmrbRgFiZwulvJU7zHY4y+qN3Oar+IXR+gkrimK85/KdBXxh1dzh7YlWAh5j+9UTYYOqfhkRfm4xifK31cy3i6sPJuyauGcGSgw1owCjBDQiI2DjVB33kFk9hH5DioCqHP46aYZETzNFOdsHugyxOzjN0RJBm0sXPaM0CHZ1dETF9gIq8AbjYZunB/7o+8dQrjnn6gd3G5VbBIeFg==</encrypted>]]>
      &ScriptVoucherNumber;
      &ScriptExchangeRate;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>/wEui5z0lBxLf+A/x9oTxbtpQsIPHCI6dWJDghOI/FkZaqXjQ2vNrqqtttWH9oBdTUCn7FcR1PiTNu67OIM/n1a0zFu+hN76g5C43Z+pkPBtrp8oNcXpQwHob1i9G97+EpVVJ8ZCu8ummGCg5hNo1cdc3AETnh9dMg9anyo1wDX6Q6mV1UqoXKfJ/+jVDqiVPju+Cvg+6VAvAf2PrGTrWH/adSEGedAxS6cFuvAzI+kxXTKw1t5A+OibCNOlk0kn0ZzLssafcZfntvLKxNetA7mrFwhMTISURxsTkgJ1OxNmJh/Pnn6UrToIG/2ecmqJlfpYR13nzJvTmIgmo2A027xzcjA0XWbmGqFwfwTNgckOeZ1nJTe14apXjzcd8Lzvo7xlPFPSsjobjv2PDwMDJtM11VNXGnyJT/dCE+R0T9h2I0PsDiRhIfQQPUzeS+dIhDHmMzoiRmMZ6OGlUTuib57pT+bLWoJJaDJcgia/yK69cNkevuprP+BFXdO06KvXtNJk2TX1FTkt8Y3N62OT06jSnJ7zhCY0TO9gPSpeF4J6Qb3o5xTEa/gJNaY/iue5KsuFJggCwQve8cuOlSR2SfWbLiYt/mIBZIIuCnW3cce9yRl8LwTHoApQindNIheDVdSJ8m0XZ4RrF9HM83uPRf5z6ZGDeEfOBrUxrvmLl6QmxrCfoIX56QI6EzzpsT5vrg0Bc+bYwu5hCNYmuk/DGNeoJKTS4BKk7Pqp/R4bIC/AlKISVpQfmgzTjPTPqjW3/1GqZlBlfZ5VAT3C4UzH0TGS7qkH/ZTzsD5N3k4eMiBX7hx2/dmA5IcHZFtY1wkkiouwP5s7Qu5nNBd6S9eZUmB+KlSFMqipOihUcFQBcZovZWDYinZbqpPk8CmX5ckMY6sQox1sSpUyNbhd/7KC/qSnDS1LxMauAVOPMlbkg0k=</encrypted>]]>

      <![CDATA[<encrypted>JctsL3MjuslC89G5xOmlEhrAYFpCK9xgDvBOggLAiktSBe0jBIpNNTtJ9lkiiXyRJAFw1NQCshAxAvvdDtVmtNzAqF2aogwsZQ3sfRa/Z8bvIOn7OfEYkhwhMQKS2P0hGBygavbA8IGJdXgzGxF/0hcFbl469KKtf8kUrhWD7YJZgmNCrK+C8BCnTwNLkLnQriJ52bCcVOGkkcFt+cXibqTCClhgSL15wOuDiA6EITJk2vnboR/hrVUkYmMZCd354Ea3aa2VFeNQZiYT95aAXt4C+VWGpfzI7BFZytnbqsfHaUwOl4rmTrCD2R58YZEbJH3Dcoz4zvJRD+04Pvs49qoJovlgqF8OGukpNwzcPj/0ot49pBJ/giKesWqlS8Q8gjDzD+ccqv1lP9O3OtWUE9T6Tm41nuUPpcXjuMfg5xB0ZRvxwuXA1i8ZkI/mlrluSIHtqmPexhNuBp1X9vMDO3RJ7dFbMFFK6qLoOPVrPenhRApeYYKPR+tWcfNPwN09p1mpU84hE47G5X7rdBdjVx/CohSn50+QwvT0vs9IIhbMM+U1jkoGEOOd/2qmktaKYxNtc9v77MDvxBocPiOa3MWR5AKqm8fxxrNcf/nRX5m/wGciptHrQ8TXcZA/VBd/Ojf8oz+NGGAIwE/6KHvtCQnJKVuyCMn4JtvVhBxiG4XhKhHEh9SA9pIlA44qV/0mDD/mNB3xodl4VvCdpklS9w==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0mlrDkqToMdczPG9cJ8B1cZsASX6Mb/OiMGjkBM96XZNMUEqnufAR1iCqcF7EDbL6JHT7CS9FL/hxtHgYAMf4XwRw0aC9gM6MHcPUUz7LVMSKwMRaDF6Ge/clE1VzWfvkw==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0oLyzU/XAvYeB88d7rKJgIoIc74oG1WsvazklGqxUR/W1z+MFWb8mN8lrGogdaR3/p2k1wUiFJ/1HETffM+Oq4lAVQOYgDaoMfjb9YjT+7To</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>s2MybQD9qqInfweyaby/fiEBWbW/dUAODUDs0r1VrO9RFBVu8YhWpqfDQw3MEvWEnpvGCwC8ra42e2pBpQ3g2VxBy+CdTCjdqXpufdvM4i5b3b9r/iIo7ClnD73RuOjagCvFLEDQBmRd8r4WaFfy05FNUd5pCraHjWsb+Augs1sOS2q7hScMWvP7JgILuPMXu5iw9jrAA4or0keaO3XOeZBGMdnm/NuAv2BxhTHQiqA9bIt9axFTJuz9xtKdR9hVZeyV6SdEnfn7X25w8fc/e4nwV75keY+bg5oAYM61lLF3RwY0XQon+neGOdRP1lOr</encrypted>]]>

      <![CDATA[<encrypted>rkieEZ/eKOYZfINnIi3Ljalkq+au3LlNDJEqz0nl6Gi/xQmKT720X8SlalnkQx6YNFwJa254rM1a+xCTEpEosu1NOFJxCmvtcAQbFOCHW1GUPR0HOHAghyqrw0dZYn4FnqsoQCLU51wdbhKsMsU9QHJf09aGMGy+2p/3HaRvNZ3LQb2VEuAsiNUx/HLE4t3kFfV/NBfsc7CZeWmef37qeLZEebJIMgCR6xqSjFw6rhicqi3ZK7ac3AhrpRSvEF96bkNaf8tI7DxX/l/GqWDOjfRkygMLEUjrzv5OLt14z8rYC/ViE+ZvjA6Q63Cm2OcRfZKbGAnZ5us6LCPE0yueySaMcAM3qmoFobn9XvWS6Pvd5+5iJWhTGX0zbkBZHGgYP7Os48NgpWiImAT4hcM/fBu4ABTgfiQguiQl9QfpE/qGBrtfHTRdxJtsbaLBLNGbtCkidjmfrHVmzEz+1Wpy82XiGZX7aIfdgNeyKYO1YxEDYsJDwBtbrr7YdgsvpDmxXqqA7u8xt1JBoHT6dIzppgJaHokoBrf+HabRXl0nkzTYKLHNW+YWe3nyANIyx0kDKkzI8/hFBeeBIcuBzvH++kbVa3flzWjsYebn0D69omv3Fueeri9otQZPc/f/eZqInUEtkJa6WJECJ3I9IfekgyJPUTcO+PFM3S5sAka60Iom0WweRyrIsE8sZSe+M97bQXFxpUx1Wx+un3wXHu/H2/t13IZhnVfELwLY/2UViVukvLWbDH7nZ8xOQe8V3LCJroiGBXqEe82EsZDX3ozGo2kq1Y3iREzL5eLlTc1VsGGDweY2kdUlAy/Bp9TspM8BZIn/hRxgtISMQzNc1ng12kcbF++NbKVbtZqhWot5CNxAIusubjeBM75zJVAWkI+MWuunDtklyHumhpJ/N+uqnWet1yjjmZRDo5aVZE8kcjMX19lFw5LXtyhllJxFCVG+qmIcqx6f9QynARmMvvZUAn/oFhA4Mqv9iWMOn7uMTWR90oZpYfwFBqRXIubVke5hwlIVcjjhL6684EUr/Q3zursQ/G2mw9dc/DukUM56+yzj39Eqd1WCincbDPJeX2kxMxHG2YkSEIiXbMELXbUAQgpUmVb9yfFwhDhGbih1EnX63YCv5wnCAlaGDKGA0rvsT9r7qau94o5SwDs/yftINBvhd84k3bCFYuRE8oSG0cMx7IRFOp4i0BKFx2BYVcs3/X5gR5477mhBIEKbr5N54Pc692eqKm2R47yYCLZ9K358JLjHmgdVqk6tpLp1GW7wQSiYOkSveV7ZsrVgezlMMZwslf5+30suaoSL9R2NyDLFTl2uTei05Su3dqNwYKanY5LLtF2qTObgsyCGSoInYoXkUi7I19uaAev3mvD7t8SjLkA/9Q/sOYg0LrDDxujcjA5SC57Ke55kcobByK8jEBTFQTMaiMhoyp4PxjBtR6MZ48Iu1FtdHMCfpBU+rRGmfmtaYIjrc6ygPBEOalq3chX5uO4DF9G86O8Z8eSVDVKB9obbqNJ7hlaYt3mSnn4UArGHSY/4chcRFDZrjsIffbhSkF7Fh/G/LEYhU9otmBX7yX6mJW+Yi4A6MufXtSwps0nr93CyupUlLz7z3Lwzjw==</encrypted>]]>
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
        <![CDATA[<encrypted>nCJfdVvXBpEKWUgGS1S5b65ER+pUtLAXA6ekEnkvj38zFplBQFxj2X/fX8sga49yweEtRcGnSN8cy4DGu00ehEh5wOQaSiC/pWGamnxanGXKUvmWi2UpeOOR/xrlmM0U/De+tTiyLcBpVrsugpWJPRxpWhIxjNATPUzk7nkVYVoW6EYDxivGEbycNKPi1kpmcX/Smjwjl5ERk5b3hu+gGYqNWr1GPOhYNsVDK7XvJ2nWO0nH6HCrMn5cIfT6iMjEzadPx/4hhMiTDYIxFA6mOdvH/VNrvy10/Fou7BHYrBw=</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>
</dir>
