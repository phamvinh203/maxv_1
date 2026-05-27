<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLGetContactInfo SYSTEM "..\Include\XML\GetContactInfo.xml">
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
  <!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  <!ENTITY DetailVariable "@d74">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = 0">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd74$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm74$$partition$current', 'd74$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec">

  <!ENTITY Stock "
    exec MaxvOnline$Voucher$Posting$Inventory 'm74$$partition$current', 'd74$$partition$current', 'r70$$partition$current', @stt_rec, @@id, 
    'gia_nt0, tien_nt0, gia0, tien0, gia01, gia_nt01, ct_dc, px_gia_dd, gia_nt21, gia21, gia_nt2, gia2, tien_nt2, tien2, cp_nt, cp, thue_suat_nk, nk_nt, nk, cp_thue_yn, thue_suat, thue_nt, thue, ck_nt, ck', 
    'so_seri, ma_khon, tk_gv, tk_dt, tk_thue_nk, ma_tt, tk_thue_no, tk_thue_co, tk_ck, so_dh2, so_dh3, ma_nvbh, stt_rec_pn, stt_rec0pn, stt_rec_dc, so_ct0, so_seri0', 
    'gia_nt1 = b.gia_nt, gia1 = b.gia, tien_xuat = 0, tien_nt_x = 0, tien_nhap = b.tien, tien_nt_n = b.tien_nt', 
    null, @stock, &StockType;">

  <!ENTITY Post "
declare @group varchar(128), @glMaster nvarchar(256), @glDetail nvarchar(256)
select @group = groupby from @@sysDatabaseName..voucherinfo where ma_ct = @@id
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'

if @status = '1' begin
  &Stock;
end

if @status = '2' or @status = '3' begin
  &Stock;
  if @status = '2' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tien_nt, t_tien, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec dbo.fs_PostIRTran '@@prime$partition$current', 'd74$$partition$current', @glMaster, @glDetail, @stt_rec , @group, 1
	end else begin
    exec dbo.fs_PostIRTran '@@prime$partition$current', 'd74$$partition$current', @glMaster, @glDetail, @stt_rec , @group, 2
    exec fs20_AfterUpdateGL @stt_rec, 'm74$$partition$current', d74$$partition$current, @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
    if (@ma_gd = '4') and (@tao_px = 1) and (@ngay_px is not null)
    begin
       exec MaxvOnline$Voucher$PN1CreatePX1  @stt_rec,  @ngay_ct , @ngay_px , '2', @@userID, '@@sysDatabaseName'   
    end

  end
end">

  <!ENTITY Delete "
delete from ct00 where stt_rec = @stt_rec
delete from ct70 where stt_rec = @stt_rec
delete p00$000000 where stt_rec = @stt_rec

declare @ngay_px$previous smalldatetime ,@stt_rec_px_d char(13)
select @ngay_px$previous  = ngay_ct_tao ,@stt_rec_px_d = stt_rec_tao FROM d$000000 WHERE stt_rec_goc = @stt_rec
DECLARE @m84_table VARCHAR(20), @d84_table VARCHAR(20), @i84_table VARCHAR(20), @c84_table VARCHAR(20), @inventoryTable VARCHAR(20)
  , @GlTable VARCHAR(20) , @exp VARCHAR(6),@delete_px nvarchar(500), @tao_px_z int

select @exp = CONVERT(VARCHAR(6), @ngay_px$previous, 112) 
SELECT @m84_table = 'm84$' + @exp, @d84_table = 'd84$' + @exp, @i84_table = 'i84$' + @exp, @c84_table = 'c84$000000',
         @GlTable   = 'r00$' + @exp ,@inventoryTable  = 'r70$' + @exp

	select @tao_px_z = tao_px from m74$$partition$current where stt_rec = @stt_rec
	IF @tao_px_z =1
	BEGIN
		delete from ct00 where stt_rec = @stt_rec_px_d
		delete from ct70 where stt_rec = @stt_rec_px_d
		delete p00$000000 where stt_rec = @stt_rec_px_d

		set @delete_px = 'delete from '+ @m84_table + ' where stt_rec = ' + char(39)+ @stt_rec_px_d + char(39)
		EXEC  sp_executesql  @delete_px
	
		set @delete_px = ' delete from ' + @d84_table +  ' where stt_rec = ' + char(39)+ @stt_rec_px_d + char(39)
		EXEC  sp_executesql  @delete_px
		set @delete_px = ' delete from  ' + @i84_table + ' where stt_rec =  ' + char(39)+ @stt_rec_px_d + char(39)
		EXEC  sp_executesql  @delete_px
		set @delete_px = ' delete from ' + @c84_table  + ' where stt_rec = ' + char(39)+ @stt_rec_px_d + char(39)
		EXEC  sp_executesql  @delete_px
		set @delete_px = ' delete from ' + @GlTable + ' where stt_rec = ' + char(39)+ @stt_rec_px_d + char(39)
		EXEC sp_executesql  @delete_px
		set @delete_px = ' delete from  ' + @inventoryTable + ' where stt_rec = ' + char(39)+ @stt_rec_px_d + char(39)
		EXEC  sp_executesql  @delete_px
	END

if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec
  delete r70$$partition$previous where stt_rec = @stt_rec
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec
  delete r70$$partition$current where stt_rec = @stt_rec
end ">
]>

<dir table="m74$000000" code="stt_rec" order="ngay_ct, so_ct" id="PN1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu nhập" e="Receipt"></title>
  <partition table="c74$000000" prime="m74$" inquiry="i74$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_px"  readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao" e="Delivered by"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
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
      <header v="Số phiếu nhập" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="tao_px" type="Boolean" clientDefault="Default"  inactivate="true" >
      <header v="Tạo phiếu xuất" e="Physical Count"></header>
    </field>
    <field name="ngay_px" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày phiếu xuất" e="Posting Date"></header>
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

    <field name="status" inactivate="true" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Nhập kho" e="1. Receipt"/>
        </item>
        <item value="2">
          <text v="2. Chuyển KTTH" e="2. Release Later"/>
        </item>
        <item value="3">
          <text v="3. Chuyển sổ cái" e="3. Release"/>
        </item>
      </items>
    </field>

    <field name="d74" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="210" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="IRDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng tiền nt" e="Total FC"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng tiền" e="Total"></header>
      <items style="Numeric"/>
    </field>
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>


  <views>
    <view id="Dir" height="250" anchor="6" split="11">
      <item value="100, 19, 90, 9, 100, 100, 0, 0, 0, 8, 100, 8, 60, 42, 8, 100, 0"/>
      <item value="11010000000-100111: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
	  <item value="11010000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [ngay_lct].Label, [ngay_lct],[stt_rec_px]"/>
	  <item value="11000000000-1001-: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct]"/>
      
      <item value="11000000000------: [dien_giai].Label, [dien_giai]"/>
      <item value="11--11------1101-: [tao_px].Label, [tao_px], [ngay_px].Label, [ngay_px], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="------------1100-: [status].Label, [status] "/>

      <item value="1: [d74]"/>

      <item value="-----11-1-10-11: [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien], [ma_dvcs], [cookie]"/>

      <categories>
        <category index="1" columns="750" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        <category index="-1" columns="100, 10, 10, 10, 100, 100, 80, 10, 110, 10, 60, 40, 25, 43, 0" anchor="3">
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

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>j/Dm/6vHzU+noc/DNng5HhM2z3kZvL90tiFYyR1oBxLDLJQ2F8dDOG/N2AoG55BOFG6/iCxsJKPYyj7uEVRTd+gB6uJfl9wXzXP6qIyurg3oCfuyHtSkc/aYqjk4f+WYfzdadZ/rSNNJA3Q9Q2urW0uBge2ascGgGgqTMhgArkHtaXwWP4RH7z2EKiIAGTtpJBus19iHj0u2g7BH5LoxYA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPlOgzlozg4hGpbFaxUyw4bOF55pKEVuXjXdvPw/YKzxihSNNJ7uvOnsimFe/rytDI4b0YG4rjsgVO/FRQ/lux8c=</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Post;
        <![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0MVtL01/SSgXvIIkjPEpj2YQwNY1asZaw+EZzQ28ctVS</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>aRHOPduaPOHwS3jrxJxIprDUejw/QN3Wev/BMsC4se3lMQ8PEaqmkQJKEFWxWxPz7kTkov/hGHO9yeypteJwKTI7Mzgiexrdo1f3Fo8FSiY8zbUzZDzCPqueZOc+Cf5FiAoMbmjnhytzhWNchcQ0hOMaoAfKB4uDfZAHR+o0QJRt/LzXCigieHgUXvbb6KNpbVdtd2dK4T0wVYVKJ32o+V2kJZYUeBT16TXxp+gC4mol8r7E81kkykAC3Gxk1Rwm+GQNkPB/IxC8pYMG6TInDO4V36Ms+/flF1Pl/KhmFVmon+fMZ2WKx1kwZyXzCEsYY8OnoFm4ty+cPUM7ndt4DQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>OTunyz2blYd8MsaA18jHEWdRwQM9kix2bjd3Tq0/518NllsO9pLgYF0A2zYAAs2pcbdYWFAinN7psHDJURvPk0YfIAU+R2EVgHUy9xCifTVnyRpthKoyE1wAxCcjeH+Hdm/Kixuxn6N3cWbg6YMoKX8F+pZmwmAAHRS7hcitz9xOb3cM1gb/XuJ+l7KW8UDb6fBxO2qjsbHrWdkibf0W/Q==</encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Delete;
        &Post;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
		&InsertHistoryVoucher;
        <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKwxgkBaYFtCzGAY23lynNsSxuMgF9S938tDZ5iFfjyYOEXu5hGtm5egMzXiIqY+IHcXNfX9FnHOCvOo8b3P5ozp6oGNmOXDNC8UkS+PFGls/Ejmz+IPDWrJ1KudJ0RoYPVw==</encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
        &Delete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5YEYJ0+70Bh8DJcI81Q4sVOKIvBITQ1smxn0Yb4froHS25eW51dCwPmCs4gXLR6Ocw==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>c2Uxkhp8dnFad+svGg+TCAPMENSeuKt6ihA+vm4Vr0/G+tGZ2ihdzamIfDjDKUKw8HOoVkSPE3oo6BYivqLiPtRQVFVShsJeSrdIqwoCkiVisY0k0x0OLSp5zl12n1AT</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>/6Pq5JBiSWMm7sZA6oKL3AuK12UpDLDa+WZII5IkhX+RLvMlQtjw4EvWiBrX8FbwXj50Y75r/ChV8wlZRfu9RuP2YjXJkeKLkeK81HkP1uQCGL3K/RPOYXHWEZ11pFyUzLyBxqDIqMoPp8Hp+aSOXQGOaqpTEgoBlC9+I46RKhM5WkOORj/4f4kDzn5Bv2C+7Ay2UYA7ZQMh54RtaqOgXIlboEUhjl5w4Ah9ju6hJx4RZl6rwpY0sCmHLcvlG9QvLIeQpQcxIPQ87GpnpqAVJUfw8Uj9q6WU1GF+3QP68Lq3Q3cB+sXZ6LaZx38B4b7G</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>K9z5ct2O3FsXBzBIMGlYA3JJRHttyoLB+/8fpSIl7+a5Vka/zPBPq+sGcx38CIYzvqRLMQwT8UDRV06Xfg/sPj9FL43ehqmYwPAGyu1vplGW5RbPgyZPuMKhqBy9s2tgj5ry6n3MaIAZk+u7tmJ68C3QmvpVu7zqjqFP9v2BqJXinyKE0NgVd0ILhV0qITbGZux844MXsQEsc2xGv5JoAjqCjvwIwdq0iRBsuBl8OJbby8miDtjz2Sbd+wh7vSU0z/bjDcszdHoxbWvPilZQFgPkUqwfdsRlDRFtTrVnunYPnGzTSnUdqYx5CuVWgmspqYq6LK6D01NGG9pnYewP+6rmGf5KMMUluTnNX/3t9VFH4sGpXMJeM7uVrSqVfGBCEMzpjI1UD1s1+tprPIOOQdpzec1pqBRBEjbFPisFDYc=</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>qkcFnOyPONoEtzTELZg8WJNe5e2nOxMvdBPOO1jFp1xp8hqzas/obqljRzxRnFF5YwmUAhrTqXkEIqZZUo33ERT/0BLEkq82mNUsLtszwSLw28oDWOgZ1OD0FCEyzvyq8H1d9EDGhQe3yu1fHUlN9PqEIVAgULK/5nm6oSr9nVkCmziGfEhYBm22edXRHQOw</encrypted>]]>

      <![CDATA[<encrypted>SYAWEr/8WVXMnmYyGrPsj9FJaUf2TjrIYRNyJTdJDcVxFL6cKJCkrw3T/Wmsb4aqAQ+h/rXG8IEnEbensDrLMfkH/q4JRaO0yDOwjIPUbVwknlCJyZPyfi9203HjVkiPs6ABzvB7NIYXTWDnZ5+SboIESXjJcfDY77WbB6V9zk9lBG/bT2OnIljhEGUQAN1PNuaI3fnz3aoQOSwEhB+JMkU7Hk3Py3FAKrcha9p94FfyaMnczVRX/aVlRWN5e5iAnXp0RzpOzuhdwqOFTT4u+g==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>W4RjEYDBGNgXxlpXHh3tyzHOgJtDx2n7G/MAtIp3mD7/LFPpy2Dqa6J8VjytlhuRG7l7ErXWkyOlVeUWwR0FWGIUttQUGALjOxd5Au1i8g7oOyHc62lb9G0T1L96p/zzGhB2Ab80pS+AmBATl+/6oVbiUNLy14RaSPmvT/DsloFQTjCbSu2YIBcFAVjh54KdulOP4sGocglggFAUzKdWlQ==</encrypted>]]>
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
    &XMLGetContactInfo;
  </response>

</dir>
