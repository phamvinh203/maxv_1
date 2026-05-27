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
  <!ENTITY InsertHistoryVoucher SYSTEM "..\Include\Command\InsertHistoryVoucher.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  
  <!ENTITY f ", @supplier as ten_ncc, @address as dia_chi, @taxID as ma_so_thue">
  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd31$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post "
declare @group varchar(128)
select @group = groupby from @@sysDatabaseName..voucherinfo where ma_ct = @@id
if @status &lt;&gt; '0' begin
  insert into ctgt30 select * from r30$$partition$current where stt_rec = @stt_rec
  if @status = '1' begin
	  insert into p00$000000 select stt_rec, ma_dvcs, ma_ct, ngay_ct, so_ct, t_tt_nt, t_tt, ma_nt, ty_gia, dien_giai, datetime2, user_id2 from @@prime$partition$current where stt_rec = @stt_rec
	  exec dbo.fs_PostAPTran '@@prime$partition$current', 'd31$$partition$current', @stt_rec, @group, 1
	end else begin
    exec dbo.fs_PostAPTran '@@prime$partition$current', 'd31$$partition$current', @stt_rec, @group, 2
    exec dbo.fs20_AfterUpdateGL @stt_rec, '@@prime$partition$current', 'd31$$partition$current', @@id, @@userID
    insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec
  end
end">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete ctgt30 where stt_rec = @stt_rec
delete cttt30 where left(stt_rec, 10) = left(@stt_rec, 10)
delete p00$000000 where stt_rec = @stt_rec

if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec   
end">
]>

<dir table="m31$000000" code="stt_rec" order="ngay_ct, so_ct" id="HM2" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="hóa đơn" e="Invoice"></title>
  <partition table="c31$000000" prime="m31$" inquiry="i31$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã NCC" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and cc_yn = '1'" check="cc_yn = '1'" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao hàng" e="Delivered by"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCmVcn8h3iz76804lWbbVpa4+qfED8HT/UON2+1BJB+dA==</encrypted>]]></clientScript>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" allowNulls="true" hidden="true" readOnly="true">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" allowNulls="true" hidden="true" readOnly="true">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="true" hidden="true" readOnly="true">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
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
      <header v="Ngày lập" e="Voucher Date"></header>
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

    <field name="d31" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="146" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="APDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="146" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="APTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_tt" categoryIndex="-1">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
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
    &XMLUserDefinedMasterFields;
    <field name="ma_dvcs" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_ncc" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_so_thue" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
	<field name="fcode1" hidden="true" readOnly="true" categoryIndex="-1" >
      <header v="" e=""></header>
    </field>
	<field name="fcode2" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
	  <footer v="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateCashDisbursement();'span style='color:#0000ff;'&gt;Tạo Phiếu chi&lt;/button&gt; " e="&lt;button type='button' class='btn-inform' onclick='set$Voucher$CreateCashDisbursement();'span style='color:#0000ff;'&gt;Create Cash Disbursement&lt;/button&gt;"></footer>
    </field>
  </fields>

  <views>
    <view id="Dir" height="192" anchor="10" split="10">
      <item value="100, 30, 75, 21, 105, 8, 105, 8, 105, 18, 58, 42, 8, 105, 0, 0, 0"/>
      <item value="110100000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110000000-10011: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
	  <item value="110000000-10011: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
	  <item value="110100000-11010: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="----------11000: [status].Label, [status]"/>	
	  
      <item value="1111110000: [so_ct0], [ngay_ct0], [so_seri0],[ten_ncc], [dia_chi], [ma_so_thue]"/>

      <item value="1: [d31]" />
      <item value="1: [r30]" />

      <item value="--------1-10-11: [t_tien].Label, [t_tien_nt], [t_tien], [ma_dvcs]"/>
      <item value="--------1-10-1: [t_thue].Label, [t_thue_nt], [t_thue]"/>
      <item value="1110000-1-10-11: [ma_tt].Label, [ma_tt], [ten_tt%l], [t_tt].Label, [t_tt_nt], [t_tt], [cookie]"/>
	  
	  <item value="---------1100: [fcode1],[fcode2].Description"/>
	  
      <categories>
        <category index="1" columns="799" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="799" anchor="1">
          <header v="Thuế" e="Tax"/>
        </category>
        <category index="-1" columns="100, 100,9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="4">
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
        <![CDATA[<encrypted>J/HRvCI3Jvtsk/jf7BU5i4hb0gSDEuLI80I5yi2uP8NKJ4VWwhMaiNNGDXh8E/tSlDpT/hJekXHsZpTlddRgMsEjc0mS4NTWB4du7UqCMGMfN9Y9VV14uws7EHFrgMqSlE6OuBaNgKWf5sE1YiI2P7QRBHFVBnX/rnEyFRZC+BIMMEEfeb9WhL+nPvl3bDRH</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7XhNigvsfrjcl+I623V+NqEiLq1pCZUy3ScJRnRuoN+eLkLNzIatj1CAgCgsK1jkI1alCrakHjHe4DiCI6U4lzKKv557eyuVZSN2nQZfrQt+</encrypted>]]>

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
        &CommandExternalFieldDeclare;<![CDATA[<encrypted>gJoFmK0sS0RHBg6WicanqfW8GRTAxWMtvLxF2lGmq4BENPIaanQyi9CsVwpvZMAfwkZzbejXMAVbSkF0y5wRqb9+I5FC2Dh0CssoSkJ72MA=</encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<encrypted>xtpsVzpDOO4EX7tUqx1S6zYuvYvLLDRVU7uAa73+Y74iHFIQaIDcyrdIn9gri8j1SFqgoaimb7m0i8XPZ2tVE1WVS4ojAJgjjsM53l+YcpQiRc+XMOsPdfWNXBVs+X/Z+E+hXJJ6cXRs9OOYvDz0GItRX+U+lLnP0SL3ChXQkjE4Yg53AHXgtNCKhZK8vLIyZEM4+fo045V3TfiDCMGp9g==</encrypted>]]>
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
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>B8JKsc6jU1SgU1ijiSW8FPE791KH/wagsBDwgMYbXf0I38/OFipfpeaPgZoZ6DwmSx0DEKHONovnb3xjCAbx31IRp8yoI/8yfz1ZJPzP+/Om332J8zMcI4xDaCT8oomyHYx97D9h5ArR2XqMaVlPwLTyrWj1r09uu+1HLsnnjp1Emb86T8B8P+Ivdo6IpjwXNFr8n1ElPgf/MQrr/6iu6uAyNLWL30tp2LQvCt6acA3KYWqdRPKbeRME034Zo5FfDnpuEjiCZeFP/pG67BeleLmrP7mem04VcNjqYGIgDFk=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPspc7nje45C+rNpy2Z0Na4eQdmqS3QqrrBkpiNcsPOMwhw3K2kI3X7CMizmhBP0R1NfB7W9BJZ5tvUsYLo/2QX0oYfbxliKq5Q4uaImE19vK</encrypted>]]>
        &AfterUpdate;
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
        <![CDATA[<encrypted>vyxp5F4xOJ/kou5OBM2TUTmQxs7N49r/Rff2rV4vGa10RKiW7Z1yQl71x7D/ZTfjXnO1ArYBj1T4IolXntgisjMQ/XUr4TKl9x6elZjOR2as5Wqeqbr8kVJ0dvw9SBzicT2Jni/5Dlt/h7TaBpfZItsUz5iELMlZGuZi5j6S4igwGadzNaWPoIHDUVkM3IHM7oIZ87gIdDw4rdTybHmujPiCccu/HRgM3Sb4bFPSwf423BHRsJZY1fRgnymlc4OK/eZ1n6PdL+sAMP7kO0GQ9A/tXl6w5+oTrHBojJ1YdlvQvZSnQCXJUsxXQfy5apvYtyr2gs/77pLftd/C2GtPDQWmcwdrf3SjiTdMPX4xrcfX7nCbU7O06BZbajdMSL6XYhHs5mxEPvUEmg4KDyL88THFTJAU4yhYK5nkbm5n2FWI+gcVCuZ/veuUdNzcrCLe5uc0RDZtCATXzKQWRXD7Umu0FvYd4Nq3w5x4RZ3GJhpLf+pVyHd04J/VYs3pCyoBOhjDZuwH7qNdRUlfMmrS5ToAPSj0u7yrtvZBBDeAOvwFEPMxLtfXNKlVSb5gh19JrcMOlfqVmKg7hPstlUX7QSZVOk5+YxfD9zHpL3QTzmM=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>gDBuIPbfp62l3B493okor8nX35gBp8HyXX3Fx0+VBWL9i0lQWcBTdZE2WPnI1h5NNFxJbXzd63qHvIPWHFxhi6AgMC/c8piqogOMqn5U8tSjfROwF18BK8JkVqC+oJxS9RI6pK8Wx1CxAlk5on4AH4+4O6CYdtFB9qfbVCyCx9HygtagbQNhlsHZWskbaRs87GZMYV10LqEwEeDmrZHMR+D967b7teSrOVg7CbHTbG8=</encrypted>]]>
        &AfterUpdate;
        &Delete;
        &Post;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>E+24mMpVOgcjxxYHYzFvwRvLCXHJmFi9/lWQf+5m3t67zYrVRcr4EvaNjM2D9CX87FCPY2RZCWmMNtY/BQq0pFI/IjudZDA6807TN1LcIoBkxawn9j2EYoTHEYTmU9Q5baUnSvkbAfWXps3LPzLnihbCDAzXHwjDGBZTwCMIoTUAbrLgi/wvUrR5JHY2RBC087VHuMZTnaNRLeEry3+m5MtdaLqFzX1p7DS2439vO45BO/1kPC8wmkCOg5fa1MRh</encrypted>]]>
		  &InsertHistoryVoucher;
		  <![CDATA[<encrypted>p0mkacsM0N94Xef62E1AWd3yykuvnVd7FSbl2/F/B1APfZgS12GjJmM4N2VoEGhA87E1eSXh9x+EEZ3S92Yxj+V+9lHwZj7gtowP4CYPFMDJH/OPTUXzNZXd/NdWEE0U041pdwrQrLULdRopZf6TedYvTWYWYGtZVNh7QVYKrGg=</encrypted>]]>
        &Delete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxdP71bBdm5u9Ehhs4kVVS8p9nsRRanAtEXKcI5YLfU2LTEPj7kP/stj6JSHsKnX2e8zxSujBYhoW8apCbsnZ78SqxqkCDWz9QCczSKWrVejA==</encrypted>]]>&ScriptActiveVoucher;<![CDATA[<encrypted>EK1JiTcFbgps1TYryNybeOGEFx/R48UDVYvyhpas8IvHTXkOwBiXi8cswySXLIlVG2A/aGMvtlT4KS+291DF3AxL1r3yS0RKIzEByncuP1kw4/lI1KY8Z02dBT7Xz7ZDPDMAq9+08uJDM1vup8gV4Z9XyWARxnSxNkaprEUnmp4fzkChx1CzNskl3y2vuctX</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>S306XDTuzLrc8Jzckjo4t2f/Xq9LDTc0WntjEANcc86IifqIULcqQpmLhBsN4K7TiaGjBkYeTj/Tm/Z+PeBCPQ==</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>9XZS5blo6O2J4yFjjf95EUR/HYTmIXjiMxmACUaL8XKJ+q7LORp39GVjNQZeL7vAymHSp1AK2BX/YRdhXD2epEujTmCYoV5qDPr9nP+kBmi13FRamCOUoeZLToN4t/NII1yVSdg6wcOZgx6pmU+wRL/Xrwsc/MWZmzrdS3DNJYnkda5jfRJjux/GxEn+6ubN4TYGRlGxIYZdEQww7kc53IZ2S37wTOWqtaZOwCiVQT8uQ4FnRaEmOYFo+5xtrwzfxE0XOvMcrdqwFSWDRKDK3VOM8njz4JfOPmGb1MGqMZUVgJKh13t5UQ7+OMAJjGEs5eYcGvH9QsUccfx4zxWwKp6D74TsWz+U5uQRHyCKb6e+d+OExhMkCcPC31YkGciF9XbnPiwYXkWiIbfHa3IDQw==</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>RjfnShfRnmUAOqIJwPBFfQWGUoxMQH8ungZuvHLZ5m/dwF1vzo1uI7ozx8hPZCbcPYqhSTTSW3KvEgkvau2dwQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>UjTn1+mEW2aOcM5nDhhd1AYjxRWPsJqeYe8Bljbl3GJsQeaM9vvjiV/MggCxfjfjTbGHH0BYsCVr/L19VChZSMAzOCmZLmAXynfTbwFD0pEmA1c6W5YPancA0jgASMbEFewFg6qGgYN/pQF8AL+4Jrbmkb8uYHl1/FQSF/eP/QPWMNb71rn2vWJPC/mKv5+8N0ArPvjrWSR8DdGLHTf8CFkR2Rxz3/+Li1wg7C89SR/CYfcNtZwK4Zob9Rst1WCNHojbTbvp8uufVOmiDZ4YUrF6rqdcLqSLmBaROij7TZ5nrYZjJStaNxinH2M/3MjAREs7GNImnd/dUDi8sy1yO8rBz0h7k7yN/kQlswJuOzPirPKNM1L2w64issr48zxpgxAUa6gi2z0XHg+Xos4DXp9dwnO5+XwgAncKRpB4siInJMWmdTfOeONeyIgPiipvX5DqVknJGciMk1NiBC4LobAg8NvEZrtYXRrlsBebmNU+9cDo+KLaA1MlYv3v+pvnSlofrSik9FY3HuQ/ykYzacIFQMn6LNGWZ3TlFoeKHZO2CjsAJV7FsdHx0S2eGCQAn4H7ndXEI5U+vMqqrMZsU7GSs0NZ/Cphcat6rXwlsa8=</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>TjoRrUlAcjNhL+7HIhvZCSI0JMsbqnQALzdKjCuSxPy4cQsTNfjVAVQRYkSBgzsg9hHlwK4XiR3X/wdL7NopHpCVqG43JseZDN+rtMXsCTDyz9eEmIqkg+fhlU1KBB2xzfuAvkKhJEDuk3p2wpwZFoDVD0lKfmF34MVnRaUUDz5HIB/qiukRf2YDqZtZtSlhMA3AMphcwtzlL/O08B5hiQ==</encrypted>]]>

      <![CDATA[<encrypted>1Et6MqkgNrloTzIGZFmecfgacr+4QcKzZDLOFO6lFd0Mx50zH+91oqm3Fl5451p0lrG6FWZJ55a6RiHlF5gRSHoj7JyxveOIuV85QasYGzI/XFe5mwuVmS54+EDpJGcFnOqBWiLh7FFvvrQsJpPESsqhA1qFPwHMHt71IrCbdN4psZHDPWoa9isNuKOGaMxGLVe/oTxE9PtLOHAl4VY/NWjaarQ6QNR8GgBhy8xx85aw25B4fypjxsC3MKPA8tv/iPB+MUr6ASbICBrmZmhW3U5aM5hXXcCZbaXTAN1UcTQil2OVfPsi0MuICl0Z46eTnxl2wo8i9QdpYRAJp3q8D9lUGzwVwnBNvphxoWzDcPyUvA+OUhNadWtu10bRCm0xTBDPp2sQBZkhbgu9fHs9k0Ujg+UuMgZJdsBlZU7uSbFM9nkIee2HEuKOchuqoL+2CSWYqZntajyXv8URiXsTzV19F/6P4/IDeUxGH00xh2w=</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>Xpgze6Kh77o4fNK9OtUb4hCpa+me9zptDAtuT3dBpWW26OVwznYQIkTe8O4mp096DW1viATYLaaB7PEWlLqxmJmGcprttzkhS1iRuvnm38fmmxcL3TLlNXJOqv7MC07FlHJy4pte4wef4gJMkJnhh6XabFD2aNgkoGUBm5jl/S2p77XSt6DGutzuBP+tg+Sq0FuwFm0aK/CO9vlc+Ar683lQwjmGO0r2ykfWQUdQy94XcAuv+RLg7z4oKQ8TkRgkesXzfbIc/l3QOR0I69/VMQc2J7vf7vUuqx4N6rDXDzPCoNgISL9x8FIXzyLwhO2EXN0cl/c5UHhL9q7Njr3ppQnt4CZmvO/0HWFkasZt0BHyuYwEjq4Kx600XJErd9toEak4oVJx57xtmiyE1MAymxytKVorC7WQ/+j6g+xB+ah431UHHSvzAxau7rgP4ZvTIFGBNq82ltBJc+VEQpxwq9TDnUuC5N1BNJrIFIOzWZkNnWaoLJsRjB6INrW2EFM4hgv4tgi1d51BDQnG60rnlQ/i+ZYV3BdDh1bZ7fUmGSNwlJGpQy/+dgrCqFAdFxYo3zO4gWfFdTJ1Wn4h6zHcvwCoYibfJfpwoOErNsyOHNa7r9RWliX0gKpE66EdGzM0J6IrOpLMmmROeA2pEbW9Yw==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>
  <action id="CreatePC">
      <text>
        <![CDATA[<encrypted>FAWBMBQnc+K2bEJwiN5QximTwZFbDSLuiJ8gXnmlBfJrs9+hkBtIvpRdpxhD7NreHPITfoDx/bGbYKVT3eHyROava2c64CkJEq4hSh5Ivz0qM06j5DOgRk6N35yv0tuqZtnHbs+Y7RpvvStmVyMt8M4+CkCiKOP2PRTQBddb9KbNndP/8ozrUoaiaP8bvRZ7Z28FZQC30DizkiKaeb/T6ld4iukPf28NPI9ljd3OHp2gXdIzQwTtWLbMHOz9RZtv6FxqZVs/cU6xNZSxUSTB7F6U68IzrFBm/ly9vNagKrN0Az7JqRXwQxOyPZIG5mpeW/Va2oXrSTCuyCgr6avyIbxA0O2YRlLYYrPKXn9uGE8nT5wA/DhlHVrXBTJvtgWtQoWZtJwi76sbMcbwDdEbBE/Dfy/+DdHA2m2hpt9/Bp6OrFtCnFh/WuSAqZSBQRjl</encrypted>]]>
      </text>
    </action>
    <action id="Customer">
      <text>
        <![CDATA[<encrypted>opx3vUPmEzooRko3LZrBkM91EggO0/vuYdtdZxnu/n3zvbEUvTy64EtOacvH8syKZNVe2+G67wYMnjcZk447WjXB/70I/T3GJf7Z8JCf5Na9iEoE+xO+XAIq4B1eWFMffzzWirj/ohS/SChL3LFGSc9x7wbWdn5qxCqr1QkwdE5BCQXRK5ZO1MaQ4qtt8dgS89ybi2ZGD0YdlUDy0dVYWLzSQZFc07h0stnWb1jkJtPXCOwWMQm4SrlepHQNoXbiBkFYfdQdDqmTrJOqkGZTaArv91ImKc+EkEP9vKxT4lHnrx7b7Xf7JKOIZcoXvyfC</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;

  </response>
</dir>
