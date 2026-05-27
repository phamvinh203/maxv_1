<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
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
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalFieldSet.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalFieldQuery.txt">
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
  <!ENTITY UpdateCurrentStock SYSTEM "..\Include\Command\UpdateCurrentStock.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">
  <!ENTITY CheckStockBeforeSaveIssueVoucher SYSTEM "..\Include\Command\CheckStockBeforeSaveIssueVoucher.txt">
  <!ENTITY zCommandShowWarningMessage SYSTEM "..\Include\Command\zShowWarningMessage.txt">
  <!ENTITY DefaultReportForm "3">
  <!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$BeforeUpdate$PS @@prime$partition$previous, d86$$partition$previous, @stt_rec, @@action, @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$AfterUpdate$PS @@prime$partition$current, d86$$partition$current, @stt_rec, @@action, @@userID">

  <!ENTITY DetailVariable "@d86">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = 0">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY f ", @taxRate as thue_suat, @taxType as thue_cn">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd86$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm86$$partition$current', 'd86$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec

declare @allocateKey varchar(128)
select @allocateKey = 'stt_rec = ''' + @stt_rec + ''''
exec MaxvOnline$App$Allocate$Number 'd86$$partition$current', @t_thue_nt, 'thue_nt', 'm_round_tien_nt', 'tien_nt', @allocateKey, 'stt_rec0'
exec MaxvOnline$App$Allocate$Number 'd86$$partition$current', @t_thue, 'thue', 'm_round_tien', 'tien', @allocateKey, 'stt_rec0'">

  <!ENTITY Stock "
exec MaxvOnline$Voucher$Posting$Inventory 'm86$$partition$current', 'd86$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
  'gia_nt0, tien_nt0, gia0, tien0, gia01, gia_nt01, ct_dc, pn_gia_tb, gia_nt21, gia21, gia_nt2, gia2, tien_nt2, tien2, cp_nt, cp, thue_suat_nk, nk_nt, nk, cp_thue_yn, ck_nt, ck', 
  'so_seri, ma_khon, tk_gv, tk_dt, tk_thue_nk, ma_tt, tk_thue_no, tk_thue_co,  tk_ck, so_dh2, so_dh3, ma_nvbh, stt_rec_px, stt_rec0px, stt_rec_dc, so_ct0, so_seri0', 
  'tk_du = c.tk, ma_nx = c.tk, stt_rec_pn = b.stt_rec_hd, stt_rec0pn = b.stt_rec0hd, px_gia_dd = 1, gia_nt1 = b.gia_nt, gia1 = b.gia, tien_nhap = 0, tien_nt_n = 0, tien_xuat = b.tien, tien_nt_x = b.tien_nt', 
  'update #in set ma_nx = b.ma_nx from #in a join dmnx b on a.ma_nx = b.tk where b.ma_nx is not null',
  @stock, &StockType;">

  <!ENTITY Post "
declare @group varchar(128), @glMaster nvarchar(256), @glDetail nvarchar(256)
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'
select @group = rtrim(groupby) from @@sysDatabaseName..voucherinfo where ma_ct = @@id

if @status = '1' begin
  &Stock;
end

if @status = '2' or @status = '3' begin
  &Stock;
  if @status = '2' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec dbo.fs_PostPSTran '@@prime$partition$current', 'd86$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 1
	end else begin  
    exec dbo.fs_PostPSTran '@@prime$partition$current', 'd86$$partition$current', @glMaster, @glDetail, @stt_rec, @group, 2
    exec dbo.fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd86$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end
  insert into r30$$partition$current select * from ctgt30 where stt_rec = @stt_rec
  exec MaxvOnline$Posting$Allocation @@id, '', 'm86$$partition$current', 'd86$$partition$current', 't_tt_nt', 't_tt', 'tt_nt', 'tt', 'cttt60', @stt_rec, 'ma_kh_i'
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ct70 where stt_rec = @stt_rec
delete ctgt30 where stt_rec = @stt_rec
delete cttt60 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec
  delete r70$$partition$previous where stt_rec = @stt_rec
  delete r30$$partition$previous where stt_rec = @stt_rec
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec
  delete r70$$partition$current where stt_rec = @stt_rec
  delete r30$$partition$previous where stt_rec = @stt_rec
end">
]>

<dir table="m86$000000" code="stt_rec" order="ngay_ct, so_ct" id="HM3" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu xuất trả lại nhà cung cấp" e="Return to Supplier"></title>
  <partition table="c86$000000" prime="m86$" inquiry="i86$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã NCC" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nx" allowNulls="false">
      <header v="Mã nhập xuất" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCamDznb5Ly4e1Ud3sWvKpSjX+NbWxFtYqQ/qQDcNwLEw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
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
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l" new="Default" row="1"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" allowNulls="false">
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
          <text v="1. Xuất kho" e="1. Issue"/>
        </item>
        <item value="2">
          <text v="2. Chuyển KTTH" e="2. Release Later"/>
        </item>
        <item value="3">
          <text v="3. Chuyển sổ cái" e="3. Release"/>
        </item>
      </items>
    </field>

    <field name="d86" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="162" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PSDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="tt_yn" type="Boolean" defaultValue="cast(0 as bit)" inactivate="true" categoryIndex="-1" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <footer v="" e=""></footer>
    </field>
    <field name="mau_bc" categoryIndex="9" defaultValue="&DefaultReportForm;" clientDefault="&DefaultReportForm;">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="VATForm" reference="ten_bc%l" information="mau_bc$dmmaubc3.ten_bc%l" row="1"/>
    </field>
    <field name="ten_bc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc" width="80" categoryIndex="9">
      <header v="Mã tính chất" e="Tax Type"></header>
      <items style="AutoComplete" controller="TaxType" reference="ten_tc%l" key="status = '1'" check="1 = 1" information="ma_tc$v20dmtcthue.ten_tc%l" row="1"/>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" >
      <header v="" e=""></header>
    </field>

    <field name="ma_thue" categoryIndex="9">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="status = '1'" information="ma_thue$dmthue.ten_thue%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XC+osNe899TCXUBbukxYa+dRI4dyGueDE9CM5i2MeHJTw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="tk_thue" categoryIndex="9" allowContain="true" clientDefault="Default">
      <header v="Tk thuế nợ" e="Debit Tax Account"></header>
      <label v="Tk thuế" e="Tax Account"></label>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default" row="1"/>
      <handle key="[ma_thue] != ''" field="ma_thue"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCRvza43Qf1tfL9ePAorX7wCMrfhaTrC2SByR25B6b6EA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" type="Decimal" defaultValue="0" categoryIndex="9" disabled="true" hidden="true" readOnly="true" width="0" clientDefault="Default">
      <header v="Thuế suất" e="Tax Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kh2" categoryIndex="9" inactivate="true">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_thue%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
    </field>
    <field name="ten_kh_thue%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="ten_vt" categoryIndex="9">
      <header v="Nhóm hàng" e="Item Group"></header>
    </field>
    <field name="ghi_chu" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBcp/bKP2DZnJhAsiU6WGcBuWg4d7uM2rB8a1HLAvIN88igSk6co7YaUvb7YN2PPNA=</encrypted>]]></clientScript>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCNUNtMqObqtxkecqasiNYn7NX3LbIryUdxTX3Ee9dL93fI5mgBh5BRT3/lKecBrMI=</encrypted>]]></clientScript>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total Payment"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_cn" type="Byte" dataFormatString="0" external="true" clientDefault="Default" defaultValue="0" categoryIndex="9" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" readOnly="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="218" anchor="6" split="8">
      <item value="25, 75, 105, 129, 105, 8, 105, 8, 58, 48, 18, 105, 0, 0"/>
      <item value="1011000-100111: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
	  <item value="1011000-100100: [ma_kh].Label, [ma_kh], [ten_kh%l], [cookie], [ma_dvcs], [so_seri].Label, [so_seri]"/>
	  <item value="1010000-100100: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1010000-100100: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct]"/>
      <item value="1011000-110100: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
	  <item value="--------110000: [status].Label, [status]"/>
      
 
      <item value="1: [d86]" />

      <item value="10110000: [mau_bc].Label, [mau_bc], [ten_bc%l]"/>
      <item value="10110000: [ma_tc].Label, [ma_tc], [ten_tc%l]"/>
      <item value="10110000: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="10110000: [tk_thue].Label, [tk_thue], [ten_tk_thue%l]"/>
      <item value="10110000: [ma_kh2].Label, [ma_kh2], [ten_kh_thue%l]"/>
      <item value="1010000-----11: [ten_vt].Label, [ten_vt], [thue_suat], [tk_cn]"/>
      <item value="1010000-------: [ghi_chu].Label, [ghi_chu]"/>

      <item value="110-----11-10-1: [tt_yn], [tt_yn].Description, [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien] "/>
      <item value="---------1-10-1: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="---------1-10-1: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <categories>
        <category index="1" columns="799" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="25, 75, 105, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="7" >
          <header v="Thuế" e="Tax"/>
        </category>
        <category index="-1" columns="25, 75, 100, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
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
        <![CDATA[<encrypted>PcRy+1w1wSbKC1sW+0DwNBRAvpjs1JxSLbNNsc/BynOY5UXnzNziE6GMSpapfzJlplECPC6YUBinXtnpd9j8bBn4dYcMpgdgn1e2YhmME5R2P+T/wW9Z3LrT4n1mLpAb92ihwWLfIAAWDpotkY+lhL5yEyT3qKmwulvGSwSkVhajI1kJ3YNAANTiWNJuANik8BhJYCo4VvAj3IXBDhF9vQ==</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>Prfg37kMJ8WBqoB5CvJCKf7bGLn7xzhd/qTwELa/vRyx2yQIA2RHENHp4ogjvxpOgLuPugRZg31KNe08ByME5w==</encrypted>]]><![CDATA[<encrypted>HHUdOgblTl0gGc0+hof9ny1Ol+w+J8bdmyO5uIdjonkfDvy9B2QZxtnpbfuFQ2kf6NGoMomVMxPgut53WLXBPqxHCS193ZndJ+J/IeBabPKNkCcWRlyCQQ0I8qSixgaGmfIxUgzfyBf+lFI5aLoOh93KBw1c13qj9ThvDeA3bMquF8AQSEn3hDloL+l9o38F+0G14Cu2N9t5zdVy83JPBel931aL63Mub0wpyOZhbDCGQ37v/DPwEuIy8x9KLlrx5UQmltZPYLewM3mv/jZttw==</encrypted>]]>&DefaultReportForm;<![CDATA[<encrypted>EKuxz3JD8XcmsO7QtYVs6h9iAyb0I+6LExzMTj4N2cWj6YbSlkPR9hl79gXWBbluOSXu6QN5RvuPnogeJhEmDUMDZn7c/MN2pyR1hI3tHu9tEIoX5Uf0Bcs8s1UyeFR9y4dDV+dzGcaPq1aE/fr+ZE3a56/H27RynyBHU5pdkBiNlkaV4ARJBDbdiVI5tmNSGj+9MbMkFN2MnxJgFIID52MA9I2MPpH0JMYNLm+nyAY0iWsASF32TWVc9j9Xsbaj1ye9YKLneURG9TttnK0kU3DQDsJPa0mp3A7SNe848wjbat8bTmBrkiqCCnNWX4JBx0IxNxxQjeOfrCQgxPkxlcymVGit1vVMIVIEXc0KoU8hcGy4Y3K81C0xzrglr1xWpoZRdY+LZKJYTFjrH9UwQs0HmGRseUf2S1HL9AczGIlPbusfS0L5vNYvF8td8Wr0pJVBVzTc1/hZoqN/ilh53dGXyYPlAw/DWIa18gVmJxnGxWGib4W89Rf9T1v0VK/S</encrypted>]]>
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
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>6EHGpr5o0PhEjz4DC0YQqWbtlGV3D6g1/HNQwT86L+bxJs5v4JNDhqkYmvWi6+ntAvGkArsi7jTlAAey8RI59j+jEJpbm+mWaCuJR9tb3aFk8J7n5FHPlBc3igDggaz1</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>mhKpq2qSToR+8esQQa+YusHUttfEAEZpH96bn1Hr93ihWUgP1OiHmxUTRusrTGYEES7twIZfy3ISycRjBs3RBBzjjENnd+Hq/R/W92mHxElc+jNGf+NxmGYqarsGjRwxDJTHZXWTEN1s/Tmhp00cNw==</encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<encrypted>FNPcyffbeaPiPZGhdxoOSMhvv5xvQlbSwur4HZjMf3dMZlSBMnlpx1JeWKS1qZ+L+OePF09Xak5Sjzsud+nJhm1BlJNNFPNb5jl1NEyYvbja74z1WlPLh4YfPKe5Fc0Mjlu9OCOQByW//ZQeU1RooROrBjGcvTY9dbrEr7V7mk5KOog6Yuu5IQSZwp7+Zaf4MZUlRqTU25APBwIN8zNzHQ==</encrypted>]]>&CommandExternalFieldQuery;&f;<![CDATA[<encrypted>YO9vH39UC9rfBjcWs2k+kdUbj9vKGjQdSORTOH+KTkA=</encrypted>]]>
      </text>
    </command>

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
        &CheckStockBeforeSaveIssueVoucher;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>j/Dm/6vHzU+noc/DNng5HvXIVtagPqXMcaexUAHW1g8CJnh5yNh7U3VkonCfWezEJtdoIGB01cMsCVe1t2FafjhBJKFDvypy7q9bxbE7xKtFTeNxuXirlfTcezMovOFcmtPR+vRLU87rJuYY4tRNm/yaQPfkrFm0+CSjK2SjVvusuVgp7lBci4mc+Fv7ha7IaERTQpB4i5dVTibbgUX5aA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPqb+S1x1UeSYt1KI8MnkUewWt9XD9FaWrHEA4kwLmJYKyZ4IxF7LgdKmIUaeG2PCJtbXzt2n3yuRvvfYFKNxJRg=</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0MVtL01/SSgXvIIkjPEpj2YQwNY1asZaw+EZzQ28ctVS</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CheckStockBeforeSaveIssueVoucher;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>4si6A0Gz+FTpca1qB+9LfP6pGmX2Mu2mwXL6h7O8a/cS1l2nbnhmZHcBDdqdqeFibTm+FAQZmqfuYt7V0dhA2C3xIlU5vLF8drAogus0Lrzk3f9eNXs0hVi5BhHFlqD/7vb6awl+4SeIvhN21cwQrU4C9qHdV0ksHMX6GsYei3afDCil6rhW9eXlO4MPfHLd</encrypted>]]>
        &BeforeVoucherUpdate;
        <![CDATA[<encrypted>aRHOPduaPOHwS3jrxJxIpmeIoe7NQvQMeTvx7P31nsS36MveuqdIU8VKs4VX4sx4YDsq8ZA/6FZut7Ip/qzhTZSUk3n3AzIt8Cw1zlIhIPQk7AmAWvIKFXcvKE6ZDiIJD8kQatjmkeyUC2mX5bq85FNOmP13AZmnErgD4yk7z8yG6dkSVKQ4kESvMolwZujf5KRHMGFtTm1VGuLY66+vnisnGzmWCd2xyIHMDtvGCy8ZU9uaBK/5swDdH3ZT9Ge+OD/ocJDR5aYSE4ZS94c+amVf6rKTzMgmA/6hVu1sxJm2sOqAAwi2khdWFWOjSsePWgSmzPW6KPersEEg0V3GZA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>klH21CizDNRDnjCdNSdiMG1MH0wZNrTKc+t4pNMTRtLgGfIN2wca/uP2V0HE6jWDpwLajXouaPKagRViln8G4MLZ+ZXFo4IhRCVwQfFR4X/A/lkYz7Ay1gebXC4Zn1M6luGYutBelnX9ubXdRiBZIJKuD5s4VHbCySvvbaYOqaB2lrICq2bONFLAF8X702imbK4GRNwr/UnGqZXV3t2jU+RHBjfgZwPUoNJMEgseaxA=</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Delete;
        &Post;
        &AfterVoucherUpdate;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>4si6A0Gz+FTpca1qB+9LfOsMJUYqk3O8acqNv6ojsMSl1i0j7Z9X+UONfCUFl7Knv3I7XmXvJRFBctiAKagyPi7RPyfyfUoybC628GnRsOM+qOz+1roYD7Eq00GqKLfloVdyZFxf5I6A2hGGfwHLpMuK0kv61OoGGi45Vi1Hzx+Xv4OoMQ+tQYTKLDoWilQj</encrypted>]]>
        &BeforeVoucherUpdate;
		&InsertHistoryVoucher;
		  <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKwxCTz4nHzU1l1XBbvJAdonmEFCtTS9Y09RPFiq+MsULH0wZGimVXTA+XFJXBAEGtNk0mVRocNVfLH8VYaeaYxtmV2uyvcac2CWUHlx228Dsf6jUWqOHTXcQ702DmbaVkYFtO1odYFjfU6enc3uiXCLP233BAFufgo7sq7SBXIj1a</encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>mlg57XtvF9BgEoEcY/TGhR4fiaQ64U6buSWP1UPaCRYiN/COSlf96trMO8HeJlXCmgP2e6ar34DB3EKpeqFVSTe/eOW2zzf7O0sK9fv6CqJlTeV8bBT/QvNUCgMsTClz0m4RBI41M6gKsW2vr+gWa0NOXhtSwb17R5HS/VR4VlesutlVLybm/wRSpinK0AODEfVkzgQc7v3073+hBz640HFa+XcX6dupq3gThWSRkGv5kEcTAcI6MtT8YFIte+l7EDA23JWrzyk1pjH874WhHyB+Z6YoH2cRJnK50pu0DRm7XjkpM0gjJmaZ1mi0voAe4GX6hGTGwIMI+NqogkCWLZHNK1brNQXC544HqjCuKHpAKh10gqNo03PFUy2MeqlrM85tkxhH9Ct5jZNSEVnWp0iUe0PVuy+moFYkIDACWjHB5UHJXBkX9jZ228D/m3A6Gu4D3qnKIZX4vnEG5cLjqRrV8qE3tIB7hm/s/7r+uHSbWqaQCE8rLHXG/16FibXoJe3Ti6I+CEUa5/UjHjCHXacn4WOK99wUFX6CnoVnPDjpQuFYMtaw+A1DpwF6rcKd6/AVMq4R0hHENvaNAQWRv/X11cKSuVDHkSaYolIeA3OFCFZGTTZTpYLYs5Z8LQHOuIJ331+KRC3fEvc/2yK39H23KfWZdxMZqFkqVDJmC2TEvYCILAIahQ4eDn5mWKoihDrPGqe9xi7F+dfax/GnB20RzS/iOhRmqhPgLQFkRTq7Ib5JLJjxTFia1QH3mIWiOF41NMsD/OV+JuFhf5wZ/LnOpccnbC4AJhRW8nq9P43XqzVm20BuqIIiAFwF+a+PWaKWmYx0/VjgUBJNaIOZOp1JXwqDR5lHQr16nt46atCFwk9gmgS57bwtgjkSCIyP3bu6QtrLf5KmaD/e8BWR69jX+YYTnq/xvW1U3MW+TnwMwhZeP5yIKKuIOxiXSnyYHPBHSHl4lI2L+EOeVT2pllTh5KSy8ULQhz1jRC/dsG0glQ3F3ZLeY6aZ7K4uJp52CNgX6h/uubEVGrn/61iasonAGiUGvGzHZOJiegKLjcsDU+CaIzdsQelD/z3iSJ5adzFZwtTu68Qs2qJ0dT+fd57sWYAAILw7Hxcike408HetsmVWRo77ahchsF7dXo59H9wVyBi0l8BLXSgcYUK1jup/9WLj6GUGwzRTC+eemykz2uy0azXGapox3k8+0jvW1FKkYA8CORQk+h36AZDSDTCa+9YDT/Tf1ArBpi9ezlF9V1T/VoL16zrWGLFLPeZL</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5YEYJ0+70Bh8DJcI81Q4sVOKIvBITQ1smxn0Yb4froHS25eW51dCwPmCs4gXLR6Ocw==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>7jXFiE39afzZ4ncvAfrxYMPpSq6JaJjtLI0uv/p7LLV07YQi1gjrB3liGd78ANvbz16WlvU4DzZQjxbKHX61aUIDrHTrfoIzle/1p98Vk0287S42Swr9z+nlEy0z6tHBhlaIELl4b8jAEbTsSoaTcx3QRuQo1Y0GmFQhcQbntQGbld5nwVHrRWzlCXuanmPEVH3n5cbp9THELOkLbrnCXhPqK2vSC9lI72CCmcJrhR4=</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>GlNezHyxcs72OQckj4rk/CnyiwbAodnUcUKG555cxJIDn8MiB00oX7rX78SOvDk3Zu7hL9FOP+doXIzJW2pCl60fZITUIVbg3miiCmm8wOqgIMciv9jBcAn2/I29d0QwRMOu+DGrenytc0teE7lih7hU+VokpK1HJpOkROIKIcY=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>qCc/EsPd8J8l9Da4NC0zqY5JM+qAEhG3lm8YI7jTJ1N73EzKYnTksMHF3g9e0YUHD1t72OLUVa9XbY7d8NtMC1Tuhz1yjg7polb9yIfiyWSSuXD8PgY0zmlrTlo1XiOnpb55degnkO0Rl6G9bWHlKvf12l63/JeYWmpv9fzVukTc2kY8hv7Mw876+EGbD9c9CkjGhEAgrFQKKCCOFfkuCEtmxrmYUMzuY3szjW/y+Ct0dCks87WAdmDONNtSY1bPY+DxI+lx+wjcq2Nt/ymapGxjAwmdqqjMoZZ0yThJYm3NX8wDyI0sgcaLXElL85lhMbczCl6y5Mq2PHgNy7OUvXgM7syAuU8nqpqX3axEE11spIH2Ha0cExh8mS2k4tKInDwI9jD91ApyXiXb1sU97VnOQ/5hIjU19nDJZkwXXPttCJJif8ooCb5TCGgfuZQsFLarHUTmUblJfPmoojoaEEB6pHNbil+HeI18lJguk5bt7eabHkpRTAZsQdv44MrrkN+TeDxE50VjJN3wtHr8zMFJreYxmXnVVfApztHyM0Kt0kJLrt1IokDSdhNII1D9Bzjse24HErj2+j7gbAN+hA==</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>wpRN/jGyK/K1sm8EAujNeQhI6LkW4lbug9M0I5p3p30YAytsy/mcEVO36RnrpyxL58z21hlvQ/prkNg8qBh4XDRGhffgsxZ+/Y5XOrzuZBFJCzAnlb9paCF37m/fxokxJHika3Sbi4ffAlMChIsPmbCqaFCpCLDxM+SFgAtXYgLZZaXsjrj7vv7HjZt6f42AcabKQEsY0l7WC6Nu4L8wNd4sgC67g2lThBZS0P2VuLrQprKXDH2bUEMuG/NVx1j7BVgcNcqcOzxJl3Qz6GkZXh+xZkbdTJa3qzcbTOI5lvrP4jjPfrqSNP6S3HA8rFsMw9VT75nfBDhqDXCdmVoINCwC3SkXsWcjuZW2eHrQcrRyxS3oxM+vmdaFU+PhR+v0DnRkpTsX5zyePDskE2yXQVnG2YUxX9ICBrlnznkFKgTu1i1AV+tmGcquttreb7d+IShxb7D1As0pjz17vAdVi0NTM0GE2FuMV2heQM5aU3Z8LSxVi6rtd+myLZybocP3wAyzSp7/jbRlHVVYPL5g5w==</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>dZuKR/jq1Bazi7Oxu3xsAV7rpfObY+d5ditPAwq/4b1zufJVGhtjY97neHGRAnEsIkGLOhRWK2Z4OUWs8bH3OGBfu0LwSkEAWsiRRwlznC2hSdFm/7ZtV2BTIKvcTWRArBynk+Pc6CxdnCXzd/NfXw5/5kwaFAUnRA6tD0fCwOM2dPVhllPnuBK4xNt/WUbKd8bzWhUL/KTzP2U4TcZD5A==</encrypted>]]>

      <![CDATA[<encrypted>UxPC2XoqSOX9gQJz5M+eN0zMGbukQbo3gkIbIM2ZIbSRsIZ4Z1nBvfMAzIldII7I0HFl8hxfy4WSz39cUjt4nxA/ne0s2Oxu+YF5irHFpWldrU4jEzzu61VbSofqGI16FlcgSl4MK+BEMBc5HGZ2HscQ671qOKMxHkIz1OzhJJOwcKelHO82aTsCxksk/bryL3OQFIeiHbKfHMbm9obswTYYMmuuy7pHltb0mVhPao4QOgN9I+h6jvDH47t3iWpHSyvtPrsPM8zjWuYRoGuVvglFj4ogy+vSH7Dpaiekf0MJ+wFQAUnJrI4cZN24VkGYnrnCRCAAo730PcGyNUg9e2AOb75fcK18Y5rIYXKe2HkZQ3stjGKgkHIYfUHts8yhNOppJv7uWjwWBk21ol75Bu+hS25pNX9IDKM3fJOfQKRIPr2os2u1bcUI6rZkI3DhbAjUc32I0xJlnhbuJBxWzA==</encrypted>]]>

      <![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0i7aXo5Qow9zAZ4XF0iDXLoXHqewFQz6i24ZPKF6tZiMmqZwpwWAc3w5nXequMTNkuPLjMXPconOQllnC89hfBLzTvi3q3x6vALDkoX/rA09</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>MTdyUV3UMgY3IyGlghiU0i7aXo5Qow9zAZ4XF0iDXLoXHqewFQz6i24ZPKF6tZiMMRFVCdIv5irDYs4Qy4vLLg==</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>qoB7ln86B3GqvYkZP+KJd65ffQcwfBFJ1+a6rZVCr7qxc/CfRKu1qCLyom5XNdD1tYQMyUYjyltlle3dKpTg3SCjU4duZxRQQpKHR7gQBLsM1UF5gdGFsKfvX+CLmn9BYz46syIFmq9k3pEdsXRwEjwhwB9cqgMkVSajf+pMcmXP8KYrvCOcDyURsYVH3Pbb9GvOhgnfyjOQ9S0Cs+MlIOLFzox/z0Avv3P3dqSUu3fZrjE7z028b/LjFMlGJqAXodEmEWaZEn2uDI9FA2NXBwKYynZcXwpXPJ+30EErni+pRfD/5yf5bzXbi9VgjdYikapxqvT7lNHhmRhugA8RFazcnD75wmhFfDu/OzIgIOGSomjklNrup+lcX/PGIiB5st6QP+SCdJ9wn0y83iUwVW41VVwX2NKiQO41kEIOP7wYTlukcfoyjFxVTM6ltt8URBxgGNZiHw6HE58kzN3B0xqHYgbHxyd9huLxa/wWMSigl4Lupz/Ek3hL1iUqfPSWi1eTe1Cbr+PadOmd+0Y8F4EC2h3fmDiev9AidCGBQFF5+KOmWWf+vDiuZADLaIghXbSvGw4MzavQ7pD7qCRcwZaF5XFozPKx0hTnLw2ZJcWMk/IIBi0a3jAofu8C/TRP7LemuPsCO4snP2NUfjfkMDw3efxbfzgWp5SskRjMgGkbuFsl/7PyDWEesaJryxUK</encrypted>]]>
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
        <![CDATA[<encrypted>96kDPLYK8YDCzmklu5JcU2b/xEbgxKtYruv/85FPtJRSMMxam5ANODxByktiPsM/Jfu2X3XUmPbfBTev8PNszvwp0x4Pyo9P62349Et7avum/jhc32w8W3Okq9MjTu37oSyp4anq/OIdDKUHvb91mw6OUY2ew5tRswpUF7bqwW0emU/36v3yhyVy6fY26gniZsdksG32reKsTxBiP/6mrCy++UKgDPSkj6Y+JQQADmA=</encrypted>]]>
      </text>
    </action>

    <action id="Reason">
      <text>
        <![CDATA[<encrypted>jno4XYXhxajsMVXDGUgKOho2r3M0AcoapP5xqhNULyH2/ZNOJkj+hdZesVpzSqxEpVyzTJdfaV9RzhVZb9DUBWFbk6N3FJejkG1eJ7Q/NDGRw6NNiYoiwG1LgTOqPLjb9btyis/wHsLt6ADqBHYV+RwLnKqlNk5b9xzFlN/CBuQnhbWw5USj8RbWKGHx0ZqkBc3qeLS8JNalYUic5oCkqQ==</encrypted>]]>
      </text>
    </action>

    <action id="TaxCode">
      <text>
        <![CDATA[<encrypted>R7ZX3QsG3TlS70KUMaU5DF9eV0BiAGUXK6+nk7vOju2Y4OR9Ulzoid685ZhzsUxoUYo9iWf149MMSY5l5OZqgo4tnIyJzXdI1vLN/lfyCXmqOPuNLpeg3gzlzlDFmWyJqgi92Wh1yhO+Zf1Lz0SXhfWkm2gk85Sve+PGLIZULlLK4ahMfkqSkphxpvz5llBOQC5opAbG73lw5KemYOVbOpma82JwScOoCI4psESdhhEdnSuNGIH98f3WfZgiljAu</encrypted>]]>
      </text>
    </action>

    <action id="TaxAccount">
      <text>
        <![CDATA[<encrypted>fzaFi+yneMQc4B5tUV0FMOxdTnIfz9+Sc31M6PkKc49oLqXYDA+W5k6QmwwJlvYk0v0/Iq/z9DqX8VtPNJjO0S+60dClIGxytip662aNlMnl6kzOgV6WAp+UH88OquQZkOAz35BPwJdnbbA/c9dHRIa6t1pjoCawYf8ywvVjfOc=</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>
</dir>
