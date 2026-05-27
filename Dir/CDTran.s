<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenCashCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
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
  <!ENTITY CommandCheckDetailInputVATInvoice SYSTEM "..\Include\Command\CheckDetailInputVATInvoice.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY ScriptExchangeRate SYSTEM "..\Include\Javascript\ExchangeRate.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY ScriptVerifyInputVATInvoiceNumber SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumber.txt">
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  
  <!ENTITY f ", @supplier as ten_ncc, @taxID as ma_so_thue">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd51$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
update d51$$partition$current set tt_nt = tien_nt, tt = tien where stt_rec = @stt_rec">

  <!ENTITY Post "
declare @group varchar(128)
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id

if @loai_ct &lt;&gt; '3' begin
  update d51$$partition$current set ma_kh_i = '' where stt_rec = @stt_rec
end

if @status &lt;&gt; '0' begin
  insert into ctgt30 select * from r30$$partition$current where stt_rec = @stt_rec
  if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec dbo.fs_PostCDTran '@@prime$partition$current', 'd51$$partition$current', @stt_rec, @group, 1
	end else begin
    exec dbo.fs_PostCDTran '@@prime$partition$current', 'd51$$partition$current', @stt_rec, @group, 2
    exec fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd51$$partition$current', @@id, @@userID    
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end
  if @loai_ct &lt;&gt; '1' exec MaxvOnline$Posting$Allocation @@id, @loai_ct, 'm51$$partition$current', 'd51$$partition$current', 't_tt_nt', 't_tt', 'tt_nt', 'tt', 'cttt60', @stt_rec, 'ma_kh_i'
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
  update d51$$partition$current set tien = tien_nt, tt = tt_nt where stt_rec = @stt_rec
  update @@prime$partition$current set t_tien = t_tien_nt, t_tt = t_tt_nt where stt_rec = @stt_rec
end    

if @ma_nt &lt;&gt; @basecurrency and (@loai_ct = '2' or @loai_ct = '9')
  update d51$$partition$current set tt_qd = tien_nt, stt_rec_tt = '' where stt_rec = @stt_rec

if (@ma_nt &lt;&gt; @basecurrency and @sua_tg_yn = 0) begin
  select @idNumber = case when @@action = 'New' then '' else @stt_rec end from @@prime$partition$current where stt_rec = @stt_rec
  create table #result(ty_gia numeric(24, 12))
  if @loai_ct = '2' begin 
    declare cr cursor for select tk_no, tien_nt, stt_rec0 from d51$$partition$current where stt_rec = @stt_rec and tk_no in (select tk from dmtk where loai_cl_no &lt;&gt;0) order by line_nbr
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
            
				update d51$$partition$current set ty_gia_ht2 = @rate, tien = round(tien_nt*@rate, @b), tt = round(tien_nt*@rate, @b) where stt_rec = @stt_rec and stt_rec0 = @idLine
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
      update d51$$partition$current set tien = round(tien_nt*@rate, @b), tt = round(tien_nt*@rate, @b) where stt_rec = @stt_rec
    end
    if @loai_ct = '2' update @@prime$partition$current set ty_gia = @rate where stt_rec = @stt_rec
    if @loai_ct = '9' update @@prime$partition$current set ty_gia_ht = @rate where stt_rec = @stt_rec
  end
  
  select @n = sum(tien) from d51$$partition$current where stt_rec = @stt_rec
  update @@prime$partition$current set t_tien = @n, t_tt = @n + t_thue where stt_rec = @stt_rec
end">
]>

<dir table="m51$000000" code="stt_rec" order="ngay_ct, so_ct" id="PC1" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu chi" e="Cash Disbursement"></title>
  <partition table="c51$000000" prime="m51$" inquiry="i51$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="dien_giai">
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

    <!--&XMLVoucherBookAndNumberFields;-->
	<field name="ma_nk" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1' and ((ma_dvcs = '') or (ma_dvcs = @@unit)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @@id and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
      <handle reference="so_ct"/>
    </field>
    <field name="ten_nk%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

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

    <field name="d51" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="145" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CDDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="145" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="CDTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_tt" categoryIndex="3" filterSource="Optional">
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
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="true" categoryIndex="3" filterSource="Optional">
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

    <field name="so_ct_goc" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="9">
      <header v="Kèm theo" e="Include"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai_ct_goc" categoryIndex="9">
      <header v="Chứng từ gốc" e="Document(s)"></header>
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
      <item value="25, 75, 110, 237, 100, 15, 58, 50, 15, 100, 0, 0, 0"/>
      <item value="10110-10011: [loai_ct].Label, [loai_ct], [ten_loai%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="10110-10011: [ma_kh].Label, [ma_kh],[ten_kh%l], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="10100-10011: [dia_chi].Label, [dia_chi], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="10100-11010: [ong_ba].Label, [ong_ba], [ty_gia].Description, [ma_nt], [ty_gia]"/>
	  
      <item value="10100-1001-: [dien_giai].Label, [dien_giai], [ty_gia_ht].Description, [ty_gia_ht]"/>
      <item value="10110-110011: [tk].Label, [tk], [ten_tk%l], [status].Label, [status], [ten_ncc], [ma_so_thue]"/>

      <item value="1: [d51]" />
      <item value="1: [r30]" />

      <item value="111: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="11-1: [so_ct0].Label, [so_ct0], [ma_tt0]"/>
      <item value="11-11: [ngay_ct0].Label, [ngay_ct0], [ten_tt0], [ma_dvcs]"/>

      <item value="110111-10-1-: [hd_yn], [hd_yn].Label, [sua_tg_yn], [sua_tg_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien]"/>
      <item value="-----1-10-11: [t_thue].Label, [t_thue_nt], [t_thue], [serialize]"/>
      <item value="-----1-10-11: [t_tt].Label, [t_tt_nt], [t_tt], [cookie]"/>

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      <categories>
        <category index="1" columns="799" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Thuế" e="Tax"/>
        </category>
        <category index="3" columns="100, 100, 553, 0" anchor="3" split="3">
          <header v="Thanh toán" e="Payment Control"/>
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

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4BENPIaanQyi9CsVwpvZMAfd76pbOx2M0S9A5T+fzBFPXLmBDb3P8phyyp1a5Ip+6Q=</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>lsf9i48iCFsD7cYoW2mVrS0NGEDNnzvpno8MkwUGZPAD3nPG6nMOyfPrsRixJrpHsYy1BtZuAspNhnS8ZYcTePv+jkzhvKzSJS64ybYwu0a+rs/5ypSvipQBlZ54Q/AlFxwYQF1aSnXDrTWrfDLzRCjIvKk2JfVVlTHxjuZLuZ03v6D0R9v9q3huFWyZlbET</encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;&f;
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
        &CommandCheckDetailInputVATInvoice;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>5uKElOeV+ot5Iz18KozGr65KTgT0Q+78qlPZ3+8LGM+Xjf7S7Sf0+cjG6BSZp9A9IlcIuVT+2qWYul/2dQApNUR/qTf/zpXUsL91DhYWu8XIiZJ5DFFce8hGItFdzTiv1Z9+jumPFnCaC+Z0dOwYA6X7mcaNJqwI+5eJ78w8bbZDnHorHbsigYx2z/OukEcERG0kgMwPsw6yEJqcoHkPL2aF2BJN7Z7uPkzGfR8vyJYN6421Ypa3hyyKGnS5OjFyLpsdQhbtAajQT8lT2Ae45gxVCwVfCtSuYqA9LsWA7OHifWmnsZtqfOMX4WKDS9Hl</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPubGvu8bXfXP+IR/Qf6xONc7+KZTCXs/P98NDdO/PkwNfUK0u4+SE0sk7Mu3W0M5uLbKeEGNPaatV/ek+OAo5fB9iCUaQL5/gqQh3+Gz7O5i</encrypted>]]>
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
        <![CDATA[<encrypted>RGNHpM2GmhSSE4LwgrxiO1v89RfhFSgoYVaYmaQMzhlKTUZpMB+NQmrndxAz8NHKtSP0kELnA4CTsJmpew+vyA==</encrypted>]]>&CommandCheckDetailInputVATInvoice;<![CDATA[<encrypted>CtOyu0wzzjXDoQoDrtcDWoTd4tymVrm+n2Uh8HcJIOuliMdB/WwCorMdlCvWH83ROzaJE1vqGIjUUwl2NjGScTnJfdf2hwu0JE78+zpUG2aokUQ4LhAy4/aa4ge3i3+nAQwvYAtipvSL7B8E0ssKzxW2VSJZNFMKIObyx3El0g4I/ZPTgvjwoyL4Yz+B3DHJFSvqGplHLQXBwDOwbnBnBCVOsoytOTsPRDjB7qcpi0d/BodyQ5Pkkr92zxxOC+UbaZl+9LjvU0ZtL53tSUJSMTCMiKSfxknTFoxyhaBjzEc0LiT0yq23oeOsOMaUCS3ss4p3FwS8WHxC7Bbnd373F6FVsgGpzcsAlcqygZlODnfCIXlb/XcB4lIRbXMKtmbRWY5Y2reMqwKLLsKJNKmIB+nmBmrmSBEFalmosCpQhTP6aF0EJm2b2NN+jo5h0csLH+ypjpDFOVKPjYBwmMVhXHJHNmUEi4oYNnKf+D5uxzzmXRQn4+FUHnjIGGbwnN9Vh5hR9bPPw6N0I3K8V7nC78yHV7ylxu8pJUbze1bQH+DY+RfzdOTP3v1YbwvLEBok1BVAZvNzz2zlflHttX91ilS8t0XMIpca7LX1CJGGxyJT36TL2z5093UJnsX7Ub2YvgCLsQAPtKxrowm25fSjlQ==</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>gDBuIPbfp62l3B493okor8qlKtMCOD72o9G/+85WfRXazzz2mJqEbjA+vIqH5YOj+3LCvZJRMj99qT/ryxi5TFtwjxMeqf5O1u8X4wVbAkpP4pbojPk+PdkFL6+c5RUDtS4fAqF/uoej1+NH3ljho/i7HXb4r+YcuOHY2BRNVVriD5HpummufFFCtrfkitd4t0ofWC+60h95z2+79fCHTZgKi1a5tn1jSXTf30hZOZwCVFCW38gVeY9V/+CJ4wsn</encrypted>]]>
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
        <![CDATA[<encrypted>KN1XtRffzvAN7dv5yoO0Zi4QD8xenAuvoJL8mP/UubFJeIOaTsQ+sonE9FvS/anJDErakxbCV06OTceMPX0l8XU87HUNU34TFOGPfU6TZz/RhpT/kng/LcWiiegMVi2A9VC5OrENnhYVNKAQrHkjpN2C6AMG8EryjS/AnndtrqlAm+fTwo3R3nGqynnfaPZCn3/qFKNeA+/un5xOrrHkiYE9fuGnSI+4hZoARtxu45//F3xcy18CoUG7zKokGuAO48gD5lIK0WDlwXepOBmdpewoq76eJAA3UKwRrfSMgH/A1X21AG3VBTPsyDyUxyyKzCELzE4rixrNoNMcu0+SuAEZzAM29cLUbprnQzvILOA=</encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>kx2KNddPKdVWDgFtUv/z4jAiQ5sVcP9maDvQogHjIQ6cmBiWHM+PgLWwleVGmpqU8ByA2qM87py7ESDQgtrMRFXz5Gfwensonc+XmMlaT2yaUS2rl70K45PEkR4w3VSR9ZQI46kL9I1I0wkUhb/nJXoA6DGZBnU6iSKID/mrrbkCRz031qQiNnCH4Eg6/XE8OiIZgFkNF8prYS8OtPhtTlZzENZ2oZOPPScIHAaY3hRakntmSxyZxYd6Ml/EdGhPMBfDzb2dcY8HF1CigNEssCYpbgp06PpsxZ/qwMOB4iVnr+6h03XDTys+eQN1DyCSc7pIVwpu9T9r8XVPvLBBlL36QNUtwjDUb4rSAHEs3bmbbo+IwzuoLrZQHmySnjauMbd1THzcbgz9F4Uaac29emfc9a/5oxGl7nRpCmAYuKzDzHS+9Kp4GKiwbuF4JvEH4mvwUyuH2s5kry/lUI6osCH8FHWcvMYUp4UUKI4sRcEDQxlxY0H0xsWePtzsDVOAl4YNbHOycMvnSXyQ9PiWqjd2JqOrlcgmwieV4GpS/pfDhvKv6YN3G0bboUCCeOX4KPgTLClXxDUfKDYDE3rbdmrs+U3hq2w5SjS7cHnL5gfFlfH2Y0eosqwUaaRN3a/rTy9RE7IpdY2bclXRx3yNWOpeIr6D4/fak5m7kRhuuAQ=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS8p9nsRRanAtEXKcI5YLfU2BcbacTQenKogK2o7eWr4kwL0hPq6s5/ZjgWGKa6YHvb8yHBYbupjsySLrwJ6q78yg==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>dBa7fa+z8TE5AOFOH1oNGOU5colS/p8LOdPNI3uas6/kT1Taq2i/AMwNQ92wGkZxjwnPFU+hRY1nHZswJQnI9IXItJ0C3ieYB5Ve0w5C9akxCZiDmyRIVy/hhwE/DM7IZDRTMZcHd0yROVNQxRjhxYZjhciOG7rqm2Q211bVEc3Hxs1QRiLXWctPDG8mhloCfcm+H3yV3mrbAxR0hKsy40j7A32qQ58Bluex9SshkSU=</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>7SSkth4Ecd3E1dp4vP0eOE9P/OO7cViLa6wAVfPPYt+MXQ+zYMbyz4AacW+HxZA1cmDYyRHYBvk+eD5FsuDPwLljKj/VYc9JC4GYyYnRh3iLrmfZzn4JGUDTlW2eWJAev3dFJ8oiRrgRp4qhVgBj2gLAQTBLcGZk0mcvPss4EhcyXyAzvrOn0RGS7tgxrB1TFM0pm8Qe5RKjplmroet7rWIdFtlw1Sluf6XY5rylBxojRS5GgyUmkdX64MbIi+qPfEyjF5DgFiyrcs3DOlZlXqIMYzTe9ezc1NBFaDkH7cIQ5+ZwbAPLeGPIbtiiOBcQaLNPl3ezsGydDn3+CKxC6SY/SFyW3bwQUypmJv3cOsF0huTgzV90mdxTnTH3Q2Y8vLhPPV+cGmmeSgQmL/s3mQ8uJKZ0UvBbeKR4FCkiUNqlSZH8/oYoH9zbs0KLI6XzLhTD4YuuGyyL36R9+nSsN+TvOk+vBa7vWQGLkivmnRoPpgkSjUO09Cels/E+jiWZ+pEi3ZOawBAfRBwbBMoIBQ==</encrypted>]]>
      &ScriptVoucherNumber;
      &ScriptExchangeRate;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>WKHeDaVYiimO3bGwXKDgXC7iiBluPCVdr96FKU4HQSX5dMUTTY6Qpke2uUuhoGwtuXoIArVs5wSN0BZpsqUH5z5kXW88sQnWDK+IW+zFZPgw/hJZHr137ovz3OVP9rYXmX5vk/aOTrKls8J1H7EmTWUejCxB7ve/GzU8CrAPiy6wXyaLQCqJb48XN5eYmPfnQKUOVLrCcFVSfESs3FpsKHocHEvzQ+VQnCblVKmhlAagOxJKpTOXv6dJIUrts4wQPGIw+4BV5RHiK52ItR/v01SSuB/lvOWxktzU0PS7EMvDm2K16ZEskWhbJBeJBW7r4yewkHuK2rmhzClqiuH0ZUl3uY5NBWW3OGLjN1XtCdtHz1R9dGOKXMujoqmzMESmzDzvo5tjd/qpPIFO0peH/fYE+QkOEyXH/UooEQvqU+2atysz/fAZIFP8LnPgLUgWrPk5GWH258oj/kGe4HAxEJVHEQxJZiCCo64uuL0Eg9jNTGiYbwA3dpCogRg+zfbH8wJAm1k40yMfVj8RPBSNs4DnKJoRNB0WCdsgdVdQdsj1IV8obPBH1uL811Gzcy5bBs/ToSlChI/YRE16sMOPnxywVIcXIJ0Pv9118ELjzHf5ZZmAe4WAla3SvTHLj7Un0D8+zSmN43AYdLGjCHG68zXpLQ86Zy1zrFukjItty2Hpfn2USq+RBqVERjuAW0r0s+bQaZtsVnmjw+rqALQXR+15L6puehFL6aoGI4NodPBgkipfaDzDlHS9lnKDbnp5iYAnkP4uOk1fSORnVS8hKVLOMDISYN/Gslp0bVsabwoG8qrKeRt++MnStJNMwaMfVFExexYMxJQB+m7xgPgnMhktAooIWV1+GIxPMhXZrVis0U25Nb0AVQL4+WtrW4eq8pQxiAw1KlA7S+MmcDFLLkXlSf2v0NbsQj5GS6ySGOI=</encrypted>]]>

      <![CDATA[<encrypted>Fc/p49Mq1BNxCNp3xhl7AcM7vqaOEC9fK/zfRcjA4J8RdY0yHY4f0Su5s++T7OP4zfhVROqT0eb0z125iI0Tq2jPXOBnIWxXfiIkry4T5nt19i3/JwXgG0z5OL0j5LbPJqGgLGQhMcqJ3718/3XR3bcWX5H3kmUdUNMYfdoZGcG8gxEEedRKd1y1kED/XzJRt55hR8wG3CBVxnYKMZOsdkJcXPNM+KvI3KWZXIP7Ewl6/04zkl58zU3IxsW+a+EMiN5AmTG2kUf4T2OTprhP2BMf8PZfk+onGSe0PNXmx4VdStdEEniHL/V/RiEu1casiFdlD9v4vgkjdnSaV0LtvbGKpudjQbl0f4AVQD5i1W80qPE4gAUPXLgAAv6/8WrW0B2wCgEmajYhwAA9IfKRN9waVDzx28YeQilt98ejexC+IxWEUQ+TYaIESRFBZhpmWFJoGShg87ivkvK7bqKci5e6zxR5BjJXYc7h84zk61UgyrVt/+u4fCZl8CtgJ1aaq6EyBx/z0BBqLVdzOA7fKI6+ECaUuX8dxG19RftSpqs8uaq0owRmGQLHkB6o/xDlfxKeEtzhYH9E/AUmeMj5YOFA4GA7uggvIP3sIPbPdgPfCNQmbnsq0weMxIvJ8xFLMCKUiM2iRFPFDO2oYHfl8F3t6VysMugI209hVqcHazo=</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0mlrDkqToMdczPG9cJ8B1cZsASX6Mb/OiMGjkBM96XZNMUEqnufAR1iCqcF7EDbL6JHT7CS9FL/hxtHgYAMf4XwRw0aC9gM6MHcPUUz7LVMSKwMRaDF6Ge/clE1VzWfvkw==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0oLyzU/XAvYeB88d7rKJgIoIc74oG1WsvazklGqxUR/W1z+MFWb8mN8lrGogdaR3/qUC6KGA6D+H+mUR9wmzwFcYAneOMOGbR4W/rj7H1JmCoxDKQuxMPi3hb6//UGsmtH/y9D83jquOnXGMX662e0M=</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>UDgNjjgUXg8D6vpBl13z+xptYKsQ9XvHFLP+q+pryAbTjXfwEKvY276YEmdp17hiIibTMA13qganrO1/q0T92BQMGL0rcHPW6/dIWW9TM+K4S238Eqc1XGGxXrezRnPLLvHd+qz7VjPVfap+UoNxtYcP4AXCnv5uY8RR4YriFqUatxUbMOL7+sMHK5sxXupIC/pj9oV+oHk0NtXAfqUy/htUGJO0LJE0F3p7TsfH1ldTVY6teVyZvnDRukfwnxFBNCH3iZSWtu+B1eXVEfnxLQ==</encrypted>]]>

      <![CDATA[<encrypted>FwWO5PBm/WBB/lVm/OF5QLUSCfsAVNi24yBtd/8aJ/AyWwKhJgw4qc15J5qKzAe+RU0BwxwMDgCcwn7YT+WJwlUBCzIwE63gv+nVmiIQr4uPQxZFqeOTAnh5skBGMURiN0UWj5nFU9HTPUKQ7AX4iP6Tf1wEJIGMENM4+U8+Dbd7jnpcMJcGN7O3iownBDnjNqZQY8hO3Ny6MiNTs5+RCpvRL5/rLLuUmgCiVs5nkOksOKJB330pd0333w885DCHJD6Ul5ZkOfPMlTA20AOvu6gABLlioGuFul5Iyujhfw2lgLm/v5j3D+iAQI/MJ1qrkMBjh1OysmTZouLz86e7mqETz3Tdqo19KZxH9HbpsW31Zp9wl9HqPAzEMkhIn5KaBUoOoZEId3JHT/BbT4JLDWwmDhtFy/vcK1YygqJyqFWn1ndU9l3bCubD3Z8QMJpnDB9xXFcs0MlPKf/XKpi0brKnrnJPn3zbWnmRNFCu2QwGhwtRxxtKiGucm9SJKBGWkPplD+FlW3IEO1FPAfNSvEbmTOA6cpUE5z2TLZdmZJz8I8MSaPC/Sq418Qa5/LpZuWl8OmAGCSF8XuFjXg/5sJFpDOuezxND5d7mheCAD5fHvJyhP8hRWrJaKrS/edAycHdV3uTjMxyDzK1pjBmzbDrMBhdlDxh5V3GS0as0raVlu2q+nzEY2AAfu1GIaJUjEre/UuBMefxK84JtwdAc/EMo+LnkiuOfJ+8AiLtwL9H4dtazn3nYYvXWAnaTwcWOicNOKncp6Iv9PgsiGKRrliEqi8+pumLkAhzVxGnA/XxpWlpiZ+NL4Tijg19TbSVww/CwokqB7GyG/7e0gSot9gnUiBj8JxPKBIiAC/7JlcyrCc8EZS3DDy4m8QfBlrxnvDrwCEoi0VpHa6XUyicupohJOccI9ul+P1pTKbsqueJsCx0SN/BeXooeLWZykJiyJsYu+s0imxNSo+DnvnGboe62BrAY75ANRL1zMX8b3IHF+j1SiqqBRR0JsM30rqf6m8QZL7HgzQYtfSbumlk+4iWyj41qHQ1axPezrK/OPwsGU9U7xTRAmxGqbOGI/vnlMQRDaV7Mv9wEtlrzaNq3ql3mRCnyiRjkhHUuFuiS5bAfYimkpkrGG/ockTWwTctXn1fx/+4IE8HE5X+Py3X5S7QUX0gwkyya8eME4P6qqJ6eMwMTFevgc6MHIu5vNhEBUJQUlJzAhVyLfIgSBCIoHPb14+q7F7HrUeee5o48Kl9m/fxId0Wf77+IxwBrjp+1XeABa15SK3t5pkZTsTi2ZhgQon8V//djUbsfWVqCL/XQ7zxsJyg/GFKUffQ65/gBHN8ys4146Aael5KM/0G5EFPbCArIVPEC+3f9h0gGY4HOeJloXAnThbWQwMQmGmVRcXWsypnM5opnxr/Ogm+SjTkxhe61ItpT0VYdwU5UavV6TcIRUKaliWI7znt9Od88eO6uRoiKaM5IpXvBfAk02ja9DRB8ZZpwQEkjykmgGK0SAWO3Q5g66atL1mVh9c1y+4H7fIrnZJUY6+27fFzcgyZZGX5ZkBGiw51bavb33+w18P05tc7A+Yt4gZrfs/xAa0+zjiUqgOaHS+275TF5ihkXWvfbt8wqZiWiIIgG7A8=</encrypted>]]>
      &ScriptVerifyInputVATInvoiceNumber;
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
        <![CDATA[<encrypted>zsJXQXNj+cre7P5KA3VbEbmTp0L0NDxJw2DfSEuzj71wKH9hmf06uGbdX3mqiTcu4Q/4wCgrbAi2H3P16EMlP6JtCMBZ506tVzGUJ+F5ClK9ynYSAO/mDeQIdFm8t8BcSCxxE946gwqLReRvSXIp59P4Jyg8NsMSTrxB//QaTzfNfgytZlzwuNqLjmjMsZKx+NQYKtAfJ7luTClBW6LbTTzaZbOYM5TVB6qMXlch2yCDkhK7+tcMIgdCQd5NUE99s3X/pMHfNzw8vmzpJ/OMlw==</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>
</dir>
