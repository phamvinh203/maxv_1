<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\NoneVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\NoneVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
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
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">

  <!ENTITY AfterUpdate "exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, 'icc', 'dmcc', 'ctdmcc', 'stt_rec', @stt_rec, @@operation">
]>

<dir table="dmcc" code="stt_rec" order="ngay_ct, so_ct" id="CC1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="công cụ, dụng cụ" e="Tool &#38; Supply"></title>
  <partition table="dmcc" prime="dmcc" inquiry="icc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_the_ts" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã công cụ" e="TS Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ts" allowNulls="false">
      <header v="Tên công cụ" e="Description"></header>
    </field>
    <field name="loai_ts" clientDefault="Default" allowNulls="false">
      <header v="Loại công cụ" e="TS Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status = '1'" information="ma_loai$dmplcc.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tg_ts" allowNulls="false" clientDefault="Default">
      <header v="Mã tăng cc" e="Acquisition Reason"></header>
      <items style="AutoComplete" controller="TSAcquisition" reference="ten_tg_ts%l" key="loai_tg_ts=1 and status = '1'" check="loai_tg_ts=1" information="ma_tg_ts$dmtgcc.ten_tg_ts%l"/>
    </field>
    <field name="ten_tg_ts%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày tăng" e="Acquisition Date"></header>
    </field>
    <field name="kieu_kh" dataFormatString="0, 1" clientDefault="Default" defaultValue="0" align="right" allowNulls="false">
      <header v="Kiểu phân bổ" e="Allocation Method"></header>
      <footer v="0 - Theo thời gian, 1 - Phân bổ 2 lần" e="0 - Straight-line, 1 - Two-time"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XA790i2EU5H48mjanieeSaTPggRQIDcQAcMSAxv8jlg3GGQ2+7DyquBri9Sba7OAgg=</encrypted>]]></clientScript>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="###0" clientDefault="0">
      <header v="Số kỳ phân bổ" e="Allocation Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCZ4plKyXTQr/xLk723egApmfbHbqrj6aiqzr1wnqEgKtFB8DlOnZcQa06vofMYJXQ=</encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" align="right">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày tính pb" e="Alloc. Start Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XD9ewWfJ3oFXTBQLr+h8p3Du7cP+qej6Xi9dopL9Tpp0YyND86M51RrGVBAK9h+40c=</encrypted>]]></clientScript>
    </field>
    <field name="ngay_kh_kt" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày kết thúc pb" e="Alloc. End Date"></header>
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
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" allowNulls="false" clientDefault="Default" inactivate="true">
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

    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận sử dụng" e="Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status = '1'" information="ma_bp$dmbpts.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_ts" allowNulls="false">
      <header v="Tk công cụ" e="T&#38;S Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_ts%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_ts%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_kh" allowNulls="false">
      <header v="Tk chờ phân bổ" e="Allocation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_kh%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_kh%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cp" allowNulls="false">
      <header v="Tk chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cp%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cp%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_phi">
      <header v="Mã phí" e="Expense"></header>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" information="ma_phi$dmphi.ten_phi%l" new="Default"/>
    </field>
    <field name="ten_phi%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dcc" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="168" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="TSDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="acc" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="168" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Phụ tùng kèm theo" e="Spare Parts"></label >
      <items style="Grid" controller="TSAttached" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="tien_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right" categoryIndex="3">
      <header v="Giá trị làm tròn" e="Difference Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCT98i4Sw2zVORY4QVkomAxOpdU2Mx85Mdl9BslJ3KA9A==</encrypted>]]></clientScript>
    </field>
    <field name="t_nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3" disabled="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3" disabled="true">
      <header v="Gt đã phân bổ" e="Accu. Alloc."></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3" disabled="true">
      <header v="Gt còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3" disabled="true">
      <header v="Gt phân bổ kỳ" e="Alloc. per Period"></header>
      <items style="Numeric"/>
    </field>

    <field name="tien_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right" categoryIndex="3">
      <header v="Gt làm tròn" e="Difference Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="3" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="3" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="3" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="3" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ten_ts2" categoryIndex="9">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ts_kt" categoryIndex="9">
      <header v="Thông số kt" e="Parameter"></header>
    </field>
    <field name="ly_do_dc" categoryIndex="9">
      <header v="Lý do đình chỉ" e="Susp. Reason"></header>
    </field>
    <field name="ghi_chu" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="nh_ts1" categoryIndex="9">
      <header v="Nhóm 1" e="Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_1%l" key="loai_nh = 1 and status = '1'" information="ma_nh$dmnhts.ten_nh%l"/>
    </field>
    <field name="ten_nh_1%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts2" categoryIndex="9">
      <header v="Nhóm 2" e="Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_2%l" key="loai_nh = 2 and status = '1'" information="ma_nh$dmnhts.ten_nh%l"/>
    </field>
    <field name="ten_nh_2%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts3" categoryIndex="9">
      <header v="Nhóm 3" e="Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh_3%l" key="loai_nh = 3 and status = '1'" information="ma_nh$dmnhts.ten_nh%l"/>
    </field>
    <field name="ten_nh_3%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_hieu_ts"  dataFormatString="@upperCaseFormat" categoryIndex="9">
      <header v="Số hiệu công cụ" e="TS Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_dvsd" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="9">
      <header v="Ngày sử dụng" e="Using Date"></header>
    </field>
    <field name="ngay_dc" type="DateTime" dataFormatString="@datetimeFormat" align="left" categoryIndex="9">
      <header v="Ngày đình chỉ" e="Suspending Date"></header>
    </field>
    <field name="nuoc_sx" categoryIndex="9">
      <header v="Nước sx" e="Made in"></header>
    </field>
    <field name="nam_sx" type="Decimal" dataFormatString="###0" categoryIndex="9">
      <header v="Năm sản xuất" e="MFG Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" hidden="true" defaultValue="1" clientDefault="1" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="238" anchor="10" split="10">
      <item value="100, 30, 75, 21, 100, 8, 100, 8, 100, 18, 58, 42, 8, 105, 0, 0"/>
      <item value="110-------100111: [so_the_ts].Label, [so_the_ts], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="110000000-10011: [ten_ts].Label, [ten_ts], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="110100000-1101: [loai_ts].Label, [loai_ts], [ten_loai%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="110100000-10011-: [ma_tg_ts].Label, [ma_tg_ts], [ten_tg_ts%l], [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110---1-1-10011-: [ngay_mua].Label, [ngay_mua], [ngay_kh0].Label, [ngay_kh0], [tk_ts].Label, [tk_ts], [ten_tk_ts%l]"/>
      <item value="111000----10011-: [kieu_kh].Label, [kieu_kh], [kieu_kh].Description, [tk_kh].Label, [tk_kh], [ten_tk_kh%l]"/>
      <item value="110---1-1-10011-: [so_ky_kh].Label, [so_ky_kh], [ngay_kh_kt].Label, [ngay_kh_kt], [tk_cp].Label, [tk_cp], [ten_tk_cp%l]"/>
      <item value="110-------100111: [so_luong].Label, [so_luong], [ma_phi].Label, [ma_phi], [ten_phi%l], [status]"/>

      <item value="1: [dcc]"/>
      <item value="1: [acc]"/>

      <item value="110-1-----------: [tien_cl_nt].Label, [tien_cl_nt], [tien_cl]"/>
      <item value="110-1-----------: [t_nguyen_gia_nt].Label, [t_nguyen_gia_nt], [t_nguyen_gia]"/>
      <item value="110-1-----------: [t_gt_da_kh_nt].Label, [t_gt_da_kh_nt], [t_gt_da_kh]"/>
      <item value="110-1-----------: [t_gt_cl_nt].Label, [t_gt_cl_nt], [t_gt_cl]"/>
      <item value="110-1-----------: [t_gt_kh_ky_nt].Label, [t_gt_kh_ky_nt], [t_gt_kh_ky]"/>

      <item value="1100000-1111: [ten_ts2].Label, [ten_ts2], [so_hieu_ts].Label, [so_hieu_ts], [ma_dvcs], [cookie]"/>
      <item value="1100000-11--: [ts_kt].Label, [ts_kt], [ngay_dvsd].Label, [ngay_dvsd]"/>
      <item value="1100000-11--: [ly_do_dc].Label, [ly_do_dc], [ngay_dc].Label, [ngay_dc]"/>
      <item value="1100000-11--: [ghi_chu].Label, [ghi_chu], [nuoc_sx].Label, [nuoc_sx]"/>
      <item value="111101111111: [nh_ts1].Label, [nh_ts1], [nh_ts2].Label, [nh_ts2], [nh_ts3].Label, [nh_ts3], [ten_nh_1%l], [nam_sx].Label, [nam_sx], [ten_nh_2%l], [ten_nh_3%l]"/>
   
      
      <categories>
        <category index="1" columns="789" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="789" anchor="1">
          <header v="Phụ tùng kèm theo" e="Spare Parts"/>
        </category>
        <category index="9" columns="100, 100, 69, 60, 40, 68, 100, 8, 108, 100, 0, 0" anchor="8" split="8">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="3" columns="100, 30, 70, 21, 100, 8, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="6" split="10">
          <header v="Khác" e="Other"/>
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
        <![CDATA[<encrypted>29lahkwyiDNF/Z8HkEay7PnoMvAYwNYvJwW7oc9OOIxy4cec4ZFbMfVpv9VMgKj4MId+hvR25UWNjeVeR6iuNWbMX2nR6liKiZ/beuUldyDmDYIoPTkkEogmyHdY42BfF8GHVYrA0eGw73NroT1W+gthfgTBog6OrTLeYmW14/dO5K/WwEWNrx+KWncQ4lUKkvJR5+iD5gUSIYM0fA4CgoHG4VVzjKT4Zs+xp76oO5uVhSNP9XMSl5jPQSbWwzHRV7Gc4txqGGf3jSw0aAVr6Bew4xg/pYz1rkJj++TLaakm4+xiWvnIjAgsS94l9L+7WsbDNut+25wNNO8K0CVFLIfrLGUtOn7XEejruTq+b7LNi8qr+izFMcsns1tzZqFzD4Ac+YgY+9c+YeXW65g4BitoQIQjBypiWyrHawz/plQHZMPTKzC0WeijwbOy3gMXH2uwD/siYU09RwdCaY3tsQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>l6gHdkKxwEPMnfUUKohYce7j1zh0JpT3E7CIwTzkp4dsu2kCishsoW1S2Ztv+4FQiXeKyCZH5rGjvgprt96uzmTqjTsLlrRgDfITmj+YS1eOMFHcbMR3DLqVhCZk46UZgcjNqs1gqimlg7JJwme1wV5HgQsYrNKIZg19nWfRbujEj+4t9Z4Muu9pDcPNq7iNndYVqWj528tYOFiaT43rfPvY8EoBzlPDKe2w1QZYvbD08YPvJv0778MQd2UeQAJENVc1CBjQYLXBEfWjl8r6G1knDwoxYgN7R+6Vnk2fVw46QpkSrFliNnMP6odoXE/3OmmCuw2OGWWwdRxJlgruRXA0pKOMJ/+1eY6K9WmKV2Xhptq5mZ3qOzXDL+FIkFGzKQ4IS0r6b+TWeAcDioBSmCy7sqomr4DtrWEZWI1Xz7g=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>i8MX44LFLL1bzDxyjDb4qj4AkMf3qQODq1gmVXHb42IzoBYtKKM7i1R7UvXa0LK3O80NlLPvli+MBxD/0pe/d4U3q1as4seWcFMJ4nq9SpE=</encrypted>]]>&AfterUpdate;<![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0MVtL01/SSgXvIIkjPEpj2YQwNY1asZaw+EZzQ28ctVS</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>6UwzO+qjvWsRoxH5lfd6Hw6mQzfcudLJzVmL4IbZce6gT9Wfm/x8N36Ap5BLj9CJf/F4OaXNhLePwQtq4cKzu4k8x00vWkKi9Uuv97j70IACNlad5fVevpJjjmwT50q2MONv2pKPOnojAWjn8wVqVv8A9b5EQOe66nntOHyN8zwk7OzuLrfZ+FgwFxLTcfq5ntDtIw2qbaUJ0ACrHfvMwfFqezS1jC4KYP6WHU1RujtWZGddY40NxJfp+Upsgt/gwFtFkzXji2cQfWhe0IPwVT0kGIasFz3+WxWvVbVH0WnXfMXVlzLtUNvs4K7pfhPNZ2Caa7vn/EuYZf1PvDtdIiVdUxZ5Ob/lnnyicy1z0/Ah57HwJLXwusyisWVs/ZbS65tFOQZDZYqUqyru63g3wkpt/fyKDocJisHH+ac7p4SmfQ4TDGhrMZye0KoHAHdlRmEF0pswylVI3/l9NILsQ7gNep6gpgdVKjtQO05cG7F5RcGQF/rIh5Vwa4nO4ponaJwUPGZ6aCPRBZeBvzDaIF/mZ75uguDBoouH/1o0ztQeFVntrBUID6BFe2nOCftDYu9MILawAVmjzYBVJ6g3OLV6PlpKbWjvdgtoqsMgjEA=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>MsdPs1GB6Wrt/q//Yk4xtX9dPZBgmoNo3pjqz/lnFuX+fn/+jA5OWppz9bMsJZttY3P3vkvMOr/taaW3AD223+VWJgnGC2vR6fAAd1CgtdM69xs0qZx3cGJI2DQVM0qORQH2lRheSSv4Gv53pnZBIeHI30tM6/OcsiWbQLueK4fQvk+uB6B70RUuQSFokdq38ouXMNxJM6PTzQI9SGVlyoObTIb3V/vzF+PeIP+YE8w=</encrypted>]]>
        &AfterUpdate;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>nj6CkdbuaeQkRCVVjfX8oJcYadoTw3RBtru6raWjBwgTYbYXPHocuBkx4zn9JvH9dKZiLlzQYgHlUHWIVuj+ZlAMyCuZFBqkSEux0TL/+pfhaTSZ/vEOJDhEk61d48KLtJUJbbQ8y7otFeDvz6IE8K9V//jPB+ZxNMDfM3fSSxKSn7mkoTpM9DYaqpYT0IObW6lYFWm/QjGxvaoVEoy4ygJOmxIFdCUuxQdyRLdH16jyrY8o7CSxWhQTG2vnvd4z2Ber3Vwfr2igiqGq8zqevA==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>pcmubAy+wsP5jrV7mj5wrvZCbiq2x3qVDpBtn4ao+OGK8GP84Un/Lu6xKRd85W9S2e6LMV0QflOEJrvN/aW3Vi+Um083/WF/7xGs6rCz4BQbgPm0HIY+fd+aIRKy/BpktBa9asjBLWQUmcX//LEqrdt11v9G5uOWf9R0cQ/ihjnM2plJ/BIc3elVSbm4Lw6OmHDxPzXIsrZKf2IFjBiszCvC+rdP285WKvjwPdpEmNSZR6kZzimARWJfQdeXrk3R2UW5G/jyewMVr72r8E4aN9RY8uqiAIfIpgLRdKmDm/Yz0v4I/2MY4jZnNPIq3gy7cjMCELW+ftdlHqP/K7X8fLoZZZ8QT839Loj4tpceSr9P2xCTMpW3b3qQCKIGNtkS2MGBvOYIZmMVxvKxHdR4cr+o7AUekQzQNyIDKW+A6j1rKfR5kM6amYOewWqf34qnrKITlMMxoiLdLenL+YxrCrWUzDQUiCIwCF0PrQvb/f9odep4zQwO7cH62fKYua5rfpci2O7KzFD2Us3BwR57YgxZF8PknqkJgOpDfn41yDyu6E+YwK39U6Dk3JIiSRgDGDWMnlGI5t/9NpIB6ota/A==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxgt055BcUWJJ55gLyJ/LCldL9wuJ9I0FR8CY0m+mu1Yg==</encrypted>]]>&ScriptActiveVoucher;
      <![CDATA[<encrypted>gba35ma4z39kn5gExiJS3NVrUJt7yUVXWkB5bQ9CY2BAEtKLCq6vH+tgBI8GERT6petrCTx5Z79bXDzEue/3XTkme8soiqi1Bspfq6NWVH0WRpoKNx+wimD+j83Cm6gP0SCRhDOxXTjWZgY0tR8OLAa+fKNRGWhRw3Fl0ZujsijDaXqd7etiRhpGqYegPVx35YKhCU95ZkdzLK6XfDqDmijsj/OMs/rVBarm9p6zNuHlYPi4YUsizAlgwGc4z33VyESUKaIKtJAJkBX2bxEVrQ==</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>0NxAKwuVy6vilzPy3tVhBR5qbSTdmPtmXU9RfHEOsaT+5UgW2N+c6KUzd/ovuGHc9lQWaXOvjW79R7YkOYcJkrRroBJHp27P/ijbtKbUT04=</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>roKu3uX9zMuQLGW1Z33X3w7uAWuUad3M5PPuzBIVHaeJWJt6KZuhypubU61AiuTZflVylsGcBzVv4dZ7Jkhi0s/rAvfB7sp+zUxa1+HYmItB5zNYtll+icp45nCb120unOeKo8t+U6dAEtRZxcOW8m4elpbmwqRLfhhRUw/xfXZcp6M/0f2awUGQW4mDEH+atL242rxLximZV2A45JsvtHvdcF3vadaXmcKFiWQ5sxk6w0S7qRB44aE+HS51X6APXhqw7libbnnv/abiRnKwXe3x9axZtlf/I3pUHj+Lgk7eO6ewWeMMkj9weUf2ElWZulu/nGXII4+tPVp8Ta165+dnPn5/ef78ixUjtXw7t6OrzdpqnIV5ff2aO7W79T7A0mdcb7A0baNq+4ux7gYapnp0E3rcrW5jm2KOdXZuC43qa9t4mlq3IB+eajAbCNhUENml3zwQi4HKzqWy2YCgBZ7a97ypBH4bX6ZuQlydv/CoTslFP6hb1qLYN1MIW0+2</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>L+/3uAIQZeB2BbRT+BjSjts4CVSg1sYnq3d3+pxSuWuyeB8JbpdFrj8LSi9WIOX6xxv+S4pNz2RiBbFmihflaQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>6g3EA2Q4jneKs6mQMNfdNvLDjxbxI8C7Du+bonnFawcgeq/HhEPJrnRPye2P8LNeQo1OBeBA5k8Cfz4le97hlIChKJMXvYLHTasZmfIFsouJzBCLAdn5wYWbq376GLrwGp+fwlJc2xhDkMxuwppXr/EHLK/GsahYKVq+Zl8CWFogNAgzIgHFRHS7zCLDPFBc1KggeHPfsKpVmBEaqP9dDmPL78A9L4svOiSZfFYfJs9cd457I7hGBQ07u7F+1OXdvESzy7aYy8pCiFf8IrHq9bwXjAHi6p0DZIPiEwIOJLqk4wg6LQKDxlw5xMS0wzgnvKyHDMd564eAlfFoVHZDKV04hIj6dKHEFfOT3YxyjPGPlU26s8Iw1dS5iegGYDHvf7Nu6s7i+4yRAW74suuY3IQbcWXSOb8slYOG/AxwekQNiQ6Ga3bs2WN3tqW6gyioDSTJzhhmgF/gy9C+H0pGxjSDonqh+BcWFAhD7i85woR1WECfje9GNxewUUGS9igKZ26xDtd2GLUz+4wrgaglv6T53qbB7Zt/BM9kKolZtlID5auVRoyZX8zXwa9rgbZENyoVwblCapdgEqqr5cf4Tg==</encrypted>]]>&CurrencyDateChanged;<![CDATA[<encrypted>TkkEH0xwndolPAXjb8VMFEJCUkwuAM6+JqCzUT1pD4fjbDd725jPg0W64Nh25Yj4Dhme9Qgd2W0LdUNmIYmTsWJStAd9TxQmP8Tm9GKZO+L636TDWCCAGCzH6Dmy9HNpp1BkAUwNwLo9izJ3oLnAlzuRo2GNsLXX53xvOyu0BPQZeQe8liOQYdQToBEA/m2d</encrypted>]]>

      <![CDATA[<encrypted>/vqqGfcrvgQtjv0JdpQppiidHU2avvHH+YEEWb6aYULjbowy4+qHXdmq2mUp+lfvnev+IO9Nedto5H/8OuOfQ49jagOZX3lbxJAeAHD0JKpWtI4bHCM3Q3yUMR0779scChizKKsjWWUyWxjgjXUG66R4tE5z/tCbrPFjibp1wp3wj+VseO3CGQfQ61F7GfnPNCvH1TeVVSNduEVu7oupBE1DtyKgJKkUU4zwQ0GfmZgimT6dNsAcq2v8hMxjKE1d9dmGOD6KLXhDC8KHwYBtbEXfrtH7vm0tjMLbcWUY6kRGQsoq+yQY6VxY1foDNJQLv85CcoXtBFUooqE2POuC68xO3xx2j5iTayZFqDPzQVLJHvJ2wJSvntNZC2/l9fWw7H9kxF+PpwwgSpA53lNX9wPGbTFVeSF9LvQkB+Xk3RoaSkky4xx5JOoacSpDTUEyeDFH3NHu04t/4ZHSgRZ89ooDg2HrqfDAI5q7BJVbMrl+iXYbEqki1LaFZKBhotnkHdXzvocwLsHFcwSMWgl1QT+hVYL0CrqqAkm9d3ljfi6BnemiAsSuoqvkqnPNU07/vBMVqibgp7+lfREoxwxAeOz6EWb4qxPnGZg1KMQYh7tPe6Fs/ooqwP0lU/upSfzAKwepYkexWnEzdlkK7kN4Ye4+Y2PsnyVWuueYwL5mo0qw5OqGjedT+fLl0mWs71xqMLhIDUbAo7ZtoQD5v+9/qZYH12H25nLqOHo5l5ul0SXHbV1NhveOFmP3jsMfMSZM</encrypted>]]>

      <![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>zGNq8xDNl1CjQvQ/Z7G4XzHbAG+hwlfvK7V45D3EqditOAMi4tIPz8xaByVXGunTXwglcZeqbEeJKqGiuaY7ZCPx/7kEASKAIopJhvvvBM/In8VBsjmX/MPuxCy6i9f/1asyQ99x1wgOYg1XCE0WTsDKFh75zGIxdwaSlIOXaROAptZC1C5orvcWUp8zewtCxAsGXG2FIchg8dJR9pLwDmfUoQm2Xl7GU+xbjUKA5QPIOwSiTrbhdLx4lPzO+PMsntyAPTMBwPNarYEnqBe5Vs6FsXdiCsiZbqpPFm6hTpDvy3ozBhHB/qzIoujkYIw0f2DxZcfzjjvZ3abWw5vjb+WZ/ScwZ0HXOr4HQrv0VO9gKSYItWBZv3k6JdFgAg126F058Yrn/+UZ5EeiYa/P1QsOZzGjRSS2Pl84ixr37JYp7JJK5P51edCaTgOOiQ8VGH/12vEGlW2fwYjhfgh1eBdXEjJB9RcUWh7P6Vtqo8YiXbByJODTuUCprYW25st04t6FyB0jth8KnrM/gW2qNFeAQncVbmrMecCa8J+vK1+cVAaTHeSDkYRFbwe/YzKKKUT/HpwBAhQY+Oni2rwDR241X78HUAx+Hu86KVu/pMvBdW0rhmTw9HnIQ3TMsTonE5FglyEkCvkp+FfAVcSPIaSoe3gwxKH/pTEIi3qG5usmLhyyb5YvVJixlgzobldOc14yyDvXKMlyvcrjZEETsUa1iJr7xPpV3GS+ZV3hR5dMY0cPnm+6+0hIrssQmoSbinXz+ee6gErSjwBpo8OF6r4b176iRUIK/VbyLUXWXfIpsDFMfppu5kInP78t43kzcwWuQBQPxDeHy93hR76x2g==</encrypted>]]>
      &ScriptSuggestion;
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLSuggestion;
    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
  </response>
</dir>
