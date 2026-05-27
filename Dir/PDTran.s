<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
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
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalFieldSet.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalFieldQuery.txt">
  <!ENTITY CommandGetTaxRate SYSTEM "..\Include\Command\GetCreditTaxRate.txt">
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
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">

  <!ENTITY CommandCheckVoucherFlowBeginTag "exists(select 1 from d96$$partition$current where stt_rec = @stt_rec and (sl_kt &lt;&gt; 0 or sl_hd &lt;&gt; 0)) begin">
  <!ENTITY CommandCheckVoucherFlowEndTag "'$NotAuthorized' as message return end">
  <!ENTITY CommandCheckVoucherFlowBeforeUpdate "if @@view = 0 and @@action = 'Edit' and &CommandCheckVoucherFlowBeginTag; select @message as script, &CommandCheckVoucherFlowEndTag;">
  <!ENTITY CommandCheckVoucherFlowBeforeDelete "if &CommandCheckVoucherFlowBeginTag; select &CommandCheckVoucherFlowEndTag;">

  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$BeforeUpdate$PD @@prime$partition$previous, d96$$partition$previous, @stt_rec, @@action, @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec MaxvOnline$Voucher$AfterUpdate$PD @@prime$partition$current, d96$$partition$current, @stt_rec, @@action, @@userID">

  <!ENTITY DetailVariable "@d96">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock int
select @stock = -1">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = '0' then 0 else 1 end">
  <!ENTITY UpdateCurrentStock "declare @q nvarchar(4000), @r tinyint
select @r = cast(val as tinyint) from options where lower(name) = 'm_round_sl'
select top 0 ma_kho, ma_vi_tri, ma_vt, ma_lo, so_luong as sl_nhap, so_luong as sl_xuat into #currentStock from &DetailVariable;
if @post = 1 and (@@action = 'New' or @@action = 'Edit') insert into #currentStock select ma_kho, ma_vi_tri, ma_vt, ma_lo, case when &StockType; = 1 then sum(round(so_luong * he_so, @r)) else 0 end as sl_nhap, case when &StockType; = 2 then sum(round(so_luong * he_so, @r)) else 0 end as sl_xuat from &DetailVariable; where qc_yn = 0 group by ma_kho, ma_vi_tri, ma_vt, ma_lo
set @q = dbo.MaxvOnline$Function$Voucher$GetSQLUpdateCurrentStock('r90$$partition$previous', 'r90$$partition$previous', @stt_rec, @@id, @@action, @Stock)
exec sp_executesql @q">

  <!ENTITY Post "
declare @s nvarchar(4000)
select @s = ''
select @s = @s + stt_rec0 + ''',''' from d96$$partition$current where qc_yn = 1 and stt_rec = @stt_rec
if @s &lt;&gt; '' begin
  select @s = left(@s, len(@s) - 3)
  select @s = 'delete #in where stt_rec0 in (''' + @s + ''')'
end
  
if (@status &lt;&gt; '0') begin
  exec MaxvOnline$Voucher$Posting$Inventory 'm96$$partition$current', 'd96$$partition$current', 'r90$$partition$current', @stt_rec, @@id, 
    'tien_nt_x, tien_xuat, gia_nt21, gia21, gia_nt2, gia2, tien_nt2, tien2, ct_dc, cp_thue_yn, px_gia_dd, pn_gia_tb',
    'so_seri, ma_khon, ma_vi_trin, so_dh2, so_dh3, ma_nv, tk_du, stt_rec_px, stt_rec0px, stt_rec_dc, so_seri0',
    'gia_nt1 = b.gia_nt, gia_nt01 = b.gia_nt, gia1 = b.gia, gia01 = b.gia, tien_nhap = b.tien, tien_nt_n = b.tien_nt',
    @s, @stock, &StockType;
  insert into r90$$partition$current select * from ct90 where stt_rec = @stt_rec
  
end">

  <!ENTITY TagUpdate "
if exists (select 1 from d96$$partition$current where qc_yn = 1 and stt_rec = @stt_rec)
  update @@prime$partition$current set xtag = 1 where stt_rec = @stt_rec
else
  update @@prime$partition$current set xtag = 0 where stt_rec = @stt_rec
">

  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd96$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm96$$partition$current', 'd96$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec">
  
  <!ENTITY Delete "
delete ct90 where stt_rec = @stt_rec
delete ct90 where stt_rec = @stt_rec
if '$partition$current' &lt;&gt; '$partition$previous' delete r90$$partition$previous where stt_rec = @stt_rec
else delete r90$$partition$current where stt_rec = @stt_rec
if '$partition$current' &lt;&gt; '$partition$previous' delete r90$$partition$previous where stt_rec = @stt_rec
  else delete r90$$partition$current where stt_rec = @stt_rec">
  ]>

  <dir table="m96$000000" code="stt_rec" order="ngay_ct, so_ct" id="PN5" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu nhập mua hàng" e="Purchase Receipt"></title>
  <partition table="c96$000000" prime="m96$" inquiry="i96$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã ncc" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(cc_yn = 1 or nv_yn = 1) and status = '1'" check="cc_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao" e="Deliverer"></header>
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
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" inactivate="true" allowContain="true">
      <header v="" e=""></header>
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
    <field name="ma_gd" allowNulls="false" clientDefault="Default">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCC5XZ1IDPpaDqirJElpwGphj7k0IfLUu5dBXM9DEqppA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Nhập kho" e="1. Receipt"/>
        </item>
      </items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa44zEViO1ON2jnvm2UQgFa0g+6f4ehTzHwwk69Rc6OXwr7hWF80gMLgfB2fUvnDnc+A==</encrypted>]]></clientScript>
    </field>

    <field name="d96" external="true" clientDefault="0" defaultValue="0" rows="240" categoryIndex="1" allowNulls="false">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PDDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
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
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="xs_name" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="xs" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="xtag" hidden="true" readOnly="true" defaultValue="'0'" allowContain="true">
      <header v ="" e=""/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="300" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100, 0"/>
      <item value="110100000011011: [ma_kh].Label, [ma_kh], [ten_kh%l], [stt_rec], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110--11----1011: [ong_ba].Label, [ong_ba], [cookie], [ngay_ct], [ngay_lct].Label, [ngay_lct], [loai_ct]"/>
      <item value="110100000011111: [ma_gd].Label, [ma_gd], [ten_gd%l], [xtag], [ty_gia].Label, [ma_nt], [ty_gia], [ma_dvcs]"/>
      <item value="110000000011101: [dien_giai].Label, [dien_giai], [xs], [status].Label, [status], [xs_name]"/>

      <item value="1: [d96]"/>

      <item value="--------11-10-1: [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>
      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
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
        <![CDATA[<encrypted>4kEF9ST+464GrFUWbUE+2HxjRHO+l7X+6EAPECQ1zCBmSfps8qzMqvhlhhzYKEFe3kG/qQLAK0StD1zHKqRroQFEkNizdSLX1yh/3cOwOXGUFoHGkggfV78B5X2M9Zgo24pv/FjWzG3RiGJuyO7cZy5gzDsfKDYmf1PtgKExIT0rI3ieyMvUgTs1LmGHP/6mtsqsWBZwsB04dgFD/eKGALNwx0vZ9bf4n4zECF8opK7ZNVX6v0PU19tnluP5+7TXMxKgoucb2JePAT9gVq85jA==</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7f8fsbSzkgv+nPH3HhdA31JeJGArxRsQYyDudN7yjGI4lt0rnVWLmtHwB8/wBXRs+uu7YtxluAfjmDp6bNAZnCqwCwSmR6U8N/rfDmyE2cDXsgV0d68vffKpfal7ChYCepC/SPSBtW8jS4XFQKOOKBg=</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandCheckVoucherFlowBeforeUpdate;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX+h8+/zDkfxNKEkuCaDXg5D5afWvPREV8SxT+4cgS4spA==</encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7ZE3/7wegKNgL0bQHB5rxUHCKdWEuCuz6Y+bcJ0Ai+Ew</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandCheckVoucherFlowBeforeUpdate;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>bw6CuF9QnUPv9P28D9YjdUHZc3LBMxDwuPmFkfquFRc7tc8K8054M1cKc83H0wBhFytKGbvWqLD5jw0r4tvzhZGJ9xwUB+tIfpm3F2DzBHMFG9A/PBgNqwvpgKixQtk2MLY9MMYD9765KY6XZMTJwVburahYmPas4Yuqqv/+9ahyIWPfpBDID6Ni7wBmyK+/jdOc6vHL8Y0Newn+iVxEN1obm3iW6EUYCPv86Uxoyas=</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>LShulveQMeWQ3P4ZyXMGEDEWpeDuiokdzyGnMoPcwLySWqTS15Z4ehvPndDZpEiW/ytaWSeIVPPCIJ4EFAd2E+IPOdSULHzL6Jq7Kzi8Y0I=</encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;<![CDATA[<encrypted>8fypoaafXrd7U5MbgjkkwvEjky4VdCfJ+QuP1E5rji4csARoGI0OsnX5276IvGTnB/cbcNMfMcxbqyzMp1CRkA==</encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>UaC5vtP0XABR3L1HkzFZDO+/i2ZnBMkpqRFaYfYOzNfslNJZxX41NvHTLi4msf/2kz63rm0L7xL91e8SVfGnaRnrSupVToR4QcZK7HZTgh0KeuCSUPqi5jzXfmmv4EIMcw2pf55D0alJyp6FCfLbaWnpKzuO668LmLpoNC0ZDRtr5wEJ0ZTXD1IYotkTs60j+CweGZZHjwUbguNyaeylM/7+03gw2HyO70FQwuE5JFoLNtkx39eT0wBYPno4aK7PBLASqgQI4UoE90yQqzizFte3GkJ53NhdGw0YyG6CcSoKK8ME/KTIyx7R6/kzFdIp</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPiZN4Tsl4UFGk7levRNpig3UnRQP9QnjBSK6oDIXdfwOxJgcR94HL+E3YE7IgjbmXvAkpXZC5GYXr/ehQLY83Ak=</encrypted>]]>
        &TagUpdate;
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
        &CommandCheckVoucherNumber;
        &BeforeVoucherUpdate;
        <![CDATA[<encrypted>vo8QPVkbLD4OqbLtXPyxOiXdFq1eWYzB8XrNLw1fopDAASCZMJBdAaDEoDNf+0NxBB7KJ195wHfph5HHxvL5MrGo3QY4ahAhLXMEnUPfpIokIpID/6XO4g+ijDCh26Tg/l1glC1WOO9+ZXq0i/O04KbXrGMyYnb14letPefS4q2Mzxm1yYU7NksVfx5I7Gx7cI20x2BVP3T/+RPSBuLtH+sanvVpvXaKLOR+ixxsqXOkeyguqsitNJUDoEpKrFeMdqigBQDxOupwXcH9uZjL/vHKA1ci5BDaQ7+1lmmkAgvHYU0KD0+2rUz1nIsVDvBFxMlqbyeW4w0T5Z3VMIAjbxJkmFqM37x413EDCdlqqIQ78by0lhGz5V2z2fiVgLkyoe9PkLzbXU/zSUL2rn29bfN2pQ+rg9Noe099Z6KGu4l/PIqnja6TIz/rADGDnkEO+tYQzLZ6iuYmDTCxBY4bJg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>6XPmLNvhzFRiyVe8l6rLHS3L3E5icRqrSWusuOTull4EXsRlLrQgt5K2jTiOBVGM3q/2vlGNpZDLEd68tzJW4+YubszHNMZA28TZ0VJ9pND/8f2SOKoe//9i6HpWAfmgNuK7UrtUiuOTyc86I8t0xZ7fg6NML8toDy5hTgCGcZYYNeFll0VTGqOfx3xLtjxZaIv8A3193aFzrAEkE9MncHZzfb5QeeEmoTQast1nKZTwnTtKKDxOCnnio+mRnZs+</encrypted>]]>
        &TagUpdate;
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
        <![CDATA[<encrypted>Qgc9fX8hgb8I5+bK4u7LsU2OGhGauTmTR0sdn6Xdpv0=</encrypted>]]>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandCheckVoucherFlowBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKwxgkBaYFtCzGAY23lynNsSxuMgF9S938tDZ5iFfjyYOEXu5hGtm5egMzXiIqY+IHcaUBhuzFFQxmxSSMe4O4zCBpa3S8iQbEkm4UHROlMPkL</encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
        &Delete;
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>Q3OhhW3v98b1K94jqk+hcMKCV2Tb1FB9wNILetthMLt8CfrE1xHj40OJ1CiLhMJddwsggLXHmeGgfNQEelluef2lg73UOQDqnBSZJVVYR1gFEea9XJxRvu15MSWJdN5H+daSbPEg+u/Qrv5slZdUZoqfJmz6mEj3CR/KFoWWpMHlVKGosnA9L65MA8QARQV/ijbm3nZfg94nstqfG4hU13KNgrVHccXVZ/Iwk8fLLLdJyaMcbvCA1d3tObe4Mxi0AElXk+sBO8oEi7ABOMKcrRZRHN9ZKVeSWK3F0LZBV7Z0kAN3Kl9xtEZEQXGrA+Hmw0cZkmWC6BkmLNFOFHbGVQ1eaPl6RpldE0LX3FrT+syyDvc3YBPz4VeXBvGCH2IXPJsT+0jsB2Mtcs6aUX5+X0mBSbj1wzPJRtAeO7tp2KVjYBzJeeL2g83MHmuCQNfZbMBVbvSgfv1AxpFru9zaSzEbDE7Y6HO7OzEyaK2E7X1R372sT1caPkhRT4sZu3Qp46uMZMcjJT4MsykX/By7i7rxMyHw0pNLVmtul+VrVnCWAQwI8EmXcDMlHSo73VqRqyRi3MC14yUS5+rbabSdGozKcD0ZLvkULZQNpi+Ns4UMwdQg0z7bkzH299kruTyOY0uFT6INjwXbg/WTGvbx7BAQprbTxVronutx6Hqf8bvSqmLp3ZlC3zzCLNDsFUBigaC/DDga8JtWjAhJ7L60e2OKPnuIVo93jFZp7cz29hPwoKxS7clYMUfIKJgqIm9MqSi9LVyQSnOtFQmSr7oQ+uc67/WgLMeUrQKz5VrXiRwxsz4C9BX9aMYMng3LcFV6YgKhfBv1Wy0LfT0spU50k2tgIwd8GedlzvbvdCj5KuJwki1lURgV5TONX721lkic</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS86MfU2bvIdHD+hArj7qQd5Rjgo2Er5/TJhH0k3Bi80yJLatxlBaLEKe/PBvL326Utw8zBlj6j+r1dWFgLy7rU+w==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>j5BOqU8S3ZKXmvpa69uLKUHzqMawt36jLkAJRN6R02DhiGJe1Lu7rMgqSJFZfUdRVtKAhBWSlObqQobWOOuyaLYMlRNm7OodueV859tAOmQ=</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>j5BOqU8S3ZKXmvpa69uLKUHzqMawt36jLkAJRN6R02DhiGJe1Lu7rMgqSJFZfUdRGHFBqiJ9A+YKo4wsgZjRkIvwHXTCcJAt3YeI7IgbWZ8=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>/6Pq5JBiSWMm7sZA6oKL3Kl7y47A+KXqb62ksrPeskSl64iaaokiQIRPdfQfQXBOjaqp70tN1CyN4zbnncB/IyCUsxs/2D2W6qCeYOk3SneKf9YaSt/WT+Stvq9k+eTCJRryiohWWT/zckaBE6KrIs3/HlrXCL9P3du892EhogQOmk0duPV+Qe8v0H/sCPVGyi71HvYc0VxZKS45J9t/SrWA0VNekpHFfR3woXj3gOpL6FBPGU8c/Z0pWNo25gWfr/tPEyFkkpaK9MtkWpSX+rOFIGRB2NFSKXxpTIR25UNverw4F6tYGD8VGaFR27tS</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>uFvsUACXII1Xi4GCMiTC7ulHtOGNViKlhTgDt3UM1GSpl3bCjGsdFSWG4dNRUcATwRgTZlfiSRIe84HzZKZU4K+Q8JpAN6DOtApTSnxTURTl+ntCgIY6aG4I/Zj3kc7cj1O3vozlaGhiXemfRQfz2qbe68ljVIbYF0tz0KVm3wdIfHusPYutQ6UEz3bfJmAITsS196x5x8a3OAV2hm4RZ6IhegrI0rAPyvrZXlFOKpzOrmMsuOxs98fv7I1QrPRnkp3no3nEIjqc/5fgJnz7dJgCWzhsXwpuRoU3FBF89pSS7EOD14ne659OibUCvFmElJGK1kEjF89QgzCVMvHHbofskU5TbPtbCxxJus7pZsW1RIUtfzAfmxHHS1W0r2ocjtSSSzDaUM7tziN1jrEyzUmiUFtrnvxqm0j6z6UFSZ24ItGEQPRysXA0wh8ctNxc</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>dZuKR/jq1Bazi7Oxu3xsAezL2F/RPWJFSKEgHC8zZXM9QE5IekltZ+tR35MljrPNF3QSfeypZs81wbstEUNcmtIESrKOmEwKW8yzsE4AtJkMXGROz+3TrT5K2vpOfdeS4sxymle2VTnGZdti7L8dle3aPJm2znofKM24zKETPf7PIjGHWxKrTF9H/Az+tLqn3vGATOXrYV0Q4BxSbKBk6w==</encrypted>]]>
      <![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>oqdHdHNbu5jYH+/nZ7/phUTtoJaOVptluZjPv0XDEu+0QgaFEK2vYtkU7ciSonBYCo/wBuVtNqx4jWUoHfb7VA==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0a/MxM+Ex5ghB9D2X0riIp9iBKc7dDoPkXBBWVn2WA/f</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>WiUHok4g/AcZX2S3xOFoH4km7t7nUdyLe+xygzC85H5ZyPO295T0Xs9fb+kYbTmtY2XJ6QrWojeZy2/QjNtqqLCm4pghmDD3HIyXD9rxnykuZr5Ybr2bmJ9UzxRlZfweDLIpKFKWJlJmCNozRBDH5LB2AD3OjMfvkjcDdBYQi/K26QqMUO42hAfEQESWYM3PS+BCbxswi2QS8bR+mx4Q/qDdPX3zgdsrDDhNzTFS/UDzhx9H4CaUeltevsdwL/d6TMnxCIHrv+HP4DiA7qc1MdHS7OkpkXmIdz/7orikirLK/4VXDjPMRBV9EZEmA/e2nvqpNoH0l+YX6K5I8VxxVppJJSz5yFkYD9QiwUgzO47wsQsvd9ZmP3wQPJ4PNu36w/3pkVmC8PZJ4iyL+DuY9qsigs5zfEvmvGiMbJ0dajXxIdpS1YnT87YfN2NtVc3xE4FU9SSMe+EgX8zoQGyyBZ4Yf0fLJZXzG6RbzlueBDg=</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetContactInfo;

    <action id="Transaction">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Rhj+g7IgJdvxGxW3ZOV+kD+vDDSt6HF+9SncAKOzHSQusARmA1Dr0HMQJAZS2+dZXNEkN1i6FoiiFWvIZBg2dpoOc+UJDn3S7vTMxUEurw4WjydT0BWRxGrmxl89HAxnQ==</encrypted>]]>
      </text>
    </action>

    <action id="ChangeStatus">
      <text>
        <![CDATA[<encrypted>d7VIf1fFSlPnMN9sJmLkeJu/e6OgzMu6F4Aoro/7+lLpatf+Tl0v7l4UgposjOmthdI1YJg8uqVSRTx+VQjQyor4P5pY1ASyrSTHFs00VnTl8FKsR86aUSF2+q7eGB+7KKObmGHzHjILTGkXGIcXnqSVTV4Hv8TL6oU6GMrYc4VaEHTkCxgB2OwEZFCSEiCfsjD2oBaioJCXPx2KiECPhtltZ7XToo5IkCqVVYV/KNDICy5eLkf+4ATIhTyQb8BR</encrypted>]]>
      </text>
    </action>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>
</dir>
