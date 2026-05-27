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
  <!ENTITY DetailVariable "@d59">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock int
select @stock = -1">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd59$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm59$$partition$current', 'd59$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec">

  <!ENTITY Stock "
    exec MaxvOnline$Voucher$Posting$Inventory 'm59$$partition$current', 'd59$$partition$current', 'r90$$partition$current', @stt_rec, @@id, 
    'gia_nt0, tien_nt0, gia0, tien0, gia01, gia_nt01, ct_dc, px_gia_dd, gia_nt21, gia21, gia_nt2, gia2, tien_nt2, tien2, cp_nt, cp, thue_suat_nk, nk_nt, nk, cp_thue_yn, thue_suat, thue_nt, thue, ck_nt, ck', 
    'so_seri, ma_khon, tk_gv, tk_dt, tk_thue_nk, ma_tt, tk_thue_no, tk_thue_co, tk_ck, so_dh2, so_dh3, ma_nvbh, stt_rec_pn, stt_rec0pn, stt_rec_dc, so_ct0, so_seri0', 
    'gia_nt1 = b.gia_nt, gia1 = b.gia, tien_xuat = 0, tien_nt_x = 0, tien_nhap = b.tien, tien_nt_n = b.tien_nt', 
    null, @stock, &StockType;
	if @Stock = -1 insert into r90$$partition$current select * from ct90 where stt_rec = @stt_rec
	">

  <!ENTITY Post "
declare @group varchar(128), @glMaster nvarchar(256), @glDetail nvarchar(256)
select @group = groupby from @@sysDatabaseName..voucherinfo where ma_ct = @@id
select @glMaster = rtrim(val) from options where name = 'm_gl_master'
select @glDetail = rtrim(val) from options where name = 'm_gl_detail'

if @status = '1' begin
  &Stock;
end

">

  <!ENTITY Delete "
delete from ct90 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r90$$partition$previous where stt_rec = @stt_rec
end else begin
  delete r90$$partition$current where stt_rec = @stt_rec
end ">


]>

<dir table="m59$000000" code="stt_rec" order="ngay_ct, so_ct" id="PN6" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu nhập" e="Receipt"></title>
  <partition table="c59$000000" prime="m59$" inquiry="i59$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <header v="Ngày nhập" e="Posting Date"></header>
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

     <field name="status"  clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Nhập kho" e="1. Receipt"/>
        </item>
      </items>
      
    </field>

    <field name="d59" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="210" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="WBDetail" row="1">
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
      <item value="------------1101-: [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="------------1100-: [status].Label, [status] "/>

      <item value="1: [d59]"/>

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
        <![CDATA[<encrypted>j/Dm/6vHzU+noc/DNng5HlcxVySqEafw3/GqHqSx+ivzGXonWwf0CZJj4CyDsyBtPvaK8xF0yIY92Z0ME7bfrmFZtuUEnRPzLl1w3h3fNfFtqOowD85fQpvA3cFyTVNUt7WO5bhFNuE32d9sBP5ASu9siSPuLOjOwS7XCUvnEMJfZi8qlHAVAh44DS2rNajG4skwGamUEYBIcDCsUpNtVA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPr7DxM22T2ZinqGhqiwc2bFVyw2Jndhu2LWNzFm0L8ShL/obsqgUX8d5/6MWaXcNa+E/00/g0njOgqtPyUa8NoY=</encrypted>]]>
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
        <![CDATA[<encrypted>aRHOPduaPOHwS3jrxJxIpr2RFaKVKKRbDJcBGcmfNXSvXEpjjMZLuZTqdtj6CixzJJz34TbySddU2RZLoYgLlKrQ6MoztDR2jlYwL9H7wt/tKaHyThf5sKwMdpZc8NNAQLOgz2p8ml4mPrUDIeEF/KwhqrDr0NQqekDgiXLvHkoPrq+WwBz8yUlhPyLtZhFJGicB1PqmsiAGA/lpqsYqR6jGVL9k8ZyAmCH88Apec22Nw2EpacuR9wb5DBKqVzn+imEGuQ2hIA3Q/0X3tek8TW8unYJIZuYg05C94z7V9E5IcJMhppIBln3re2AE02r4ShA5PjZ6sxiv8VPFG9Eueg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>OTunyz2blYd8MsaA18jHEdbDmCOVOK515ljOqx7h9OG85OHUpeEDck1JDdMUAk/zfdjvPKid92R8DfT36gUh93LwL9lZ0ZEQpE4Cr2JaNxlXRwGVXvVEFhBRCkzUcV19rnXuTIb0b6Nt5UEp5nWhknXMSfJNPcjZ/9etKBWLYwUD1P3QbtEeNQHfawuLfB/Hw9PGxRdIY5hwE2VN/1puVQ==</encrypted>]]>
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
        <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKwxgkBaYFtCzGAY23lynNsSxuMgF9S938tDZ5iFfjyYOEXu5hGtm5egMzXiIqY+IHcZAKzHUjiN5AnCffnF1idMyboMLBWhdTnuOG1fGXKzU26Ny4O9DdKIbre6xgRnhE1w==</encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
        &Delete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5YEYJ0+70Bh8DJcI81Q4sVOKIvBITQ1smxn0Yb4froHS25eW51dCwPmCs4gXLR6Ocw==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>c2Uxkhp8dnFad+svGg+TCAPMENSeuKt6ihA+vm4Vr0/G+tGZ2ihdzamIfDjDKUKw8HOoVkSPE3oo6BYivqLiPtRQVFVShsJeSrdIqwoCkiVisY0k0x0OLSp5zl12n1AT</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>/6Pq5JBiSWMm7sZA6oKL3CJU+1N0hdEewdPY4R5fmT7/XoheD8fUNf63Uh4GXS1sBJofuKDeYaxwxgIIMPbYtbsVDeYijgWKAwPgBnuUVDWFauwKHc7ZGMVs3UrpWoB7ldA7Y+Fc6lC2dmsBxng2C1wZgpYuEO/yMkqwaQZa/0cotKkINMclafUlbo7vPeBPiLSdvVigvRsiEdeEtassrEve9qItC+uU07QJ12VCVqIwjQ/Sq/2nZXHxHxozLEthwBCM0Xz82QecX5kbHB31n66dc/NAoVzj/Ogm3jpH17oCstJ+PU7qp8CfgDlOWWdJ</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>K9z5ct2O3FsXBzBIMGlYAx0xax+103QESi05D9lS+V/+KR741a8bmZfnS3iCy3l/LNZfibVsZY6AVzsKs3bnF8F/XM6mA78fcS0nigVI7qxgcAsCoPMCCcccNjXgHklznPiHh+8rSJ9AP1qm2xBwk9FBVgUvT2ayAgHKpmTQ9DBjMhxA0S+xwzrZLAtlat6Qd8lK/ffY16YETZDOHtaLl8bDiEEQSR2sKiNeJaPqmql5130JLBfXq3a9fQSplSGbHSHhylTfRdCyrgvwG3zXxC+7Q4/uTjI58vv+E3r++t5YuwoN166I+/0dQRYrNEKuQq0nyPViITbusPW391YPXsWJnqzoFs3kiDF+AYaD1uNfuBCjhYFip5ZxVRkRaSg108zqqoizNS/1lCadzzNbjA8HrgTHzegIONFxV+WyvO0=</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>qkcFnOyPONoEtzTELZg8WJNe5e2nOxMvdBPOO1jFp1xp8hqzas/obqljRzxRnFF5YwmUAhrTqXkEIqZZUo33ERT/0BLEkq82mNUsLtszwSLw28oDWOgZ1OD0FCEyzvyq8H1d9EDGhQe3yu1fHUlN9NfY2mtjHjLpsNDXBMH5ZINpLWlKERQoG//dqGQdc2Fz</encrypted>]]>

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
