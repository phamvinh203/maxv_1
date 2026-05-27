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

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">

  <!ENTITY AfterUpdate "exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, 'its', 'dmts', 'ctdmts', 'stt_rec', @stt_rec, @@operation">
]>

<dir table="dmts" code="stt_rec" order="ngay_ct, so_ct" id="TS1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="tài sản cố định" e="Fixed Asset"></title>
  <partition table="dmts" prime="dmts" inquiry="its" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_the_ts" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Số thẻ tài sản" e="FA Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_ts" allowNulls="false">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="loai_ts" clientDefault="Default" allowNulls="false">
      <header v="Loại tài sản" e="FA Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status = '1'" information="ma_loai$dmplts.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tg_ts" allowNulls="false" clientDefault="Default">
      <header v="Mã tăng ts" e="Acquisition Reason"></header>
      <items style="AutoComplete" controller="FAAcquisition" reference="ten_tg_ts%l" key="loai_tg_ts=1 and status = '1'" check="loai_tg_ts=1" information="ma_tg_ts$dmtgts.ten_tg_ts%l"/>
    </field>
    <field name="ten_tg_ts%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_mua" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày tăng" e="Acquisition Date"></header>
    </field>
    <field name="so_ky_kh" type="Decimal" dataFormatString="###0" clientDefault="0" >
      <header v="Số kỳ kh" e="Depr. Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCvBnLn64xkY7SZANp0JAnB4apUm4j1s6c5fHtcNP3lJ9U5jRvZiGpf4HiWToAP6qU=</encrypted>]]></clientScript>
    </field>

    <field name="kieu_kh" allowNulls="false" clientDefault="0">
      <header v="Kiểu kh" e="Depr. Method"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0 - Đường thẳng" e="0 - Straight-line"/>
        </item>
        <item value="1">
          <text v="1 - Sản lượng" e="1 - Units-of-production"/>
        </item>
        <item value="2">
          <text v="2 - Số dư giảm dần có điều chỉnh" e="2 - Declinning-balance with Adjustment"/>
        </item>
      </items>
      <clientScript><![CDATA[<encrypted>xzicvXvFOc6ffQeZ8kkp3YTFDsmdQLr1ofFAnwCxBN5Snj+B0aOKkIXrVxbpOhCsjmA/3nQExWugO8fRc34O84joJDEhUGsB2uXnE/OTDpZpO3ALNR0tFi85bXipVGdCo482uML31E30i1lNMeObOgY/PdgdE2elgI/0hTEpy/1YftOlEtSLfFOzv3E9lk4x</encrypted>]]></clientScript>
    </field>

    <field name="ky_kh00" type="Decimal" dataFormatString="###0" categoryIndex="9">
      <header v="Số kỳ kh đầu kỳ" e="Depreciation Periods at Begin of Period"></header>
      <footer v="Số kỳ kh đầu kỳ" e="&lt;span title=&quot;Depreciation periods at begin of period&quot;&gt;Depreciation...&lt;/span&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="tong_sl" type="Decimal" dataFormatString="@quantityInputFormat" align="right">
      <header v="Tổng sản lượng" e="Total Production"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_kh0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày tính kh" e="Depr. Start Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XA8KuWSzzcjGf338fUIjjiAvYCkIyYFfaHQUgiR7Rr9541MrYZ4s8lHT3wu0usvdkA=</encrypted>]]></clientScript>
    </field>
    <field name="ngay_kh_kt" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày kết thúc kh" e="Depr. End Date"></header>
    </field>
    <field name="tl_kh00" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right" categoryIndex="9">
      <header v="Tỷ lệ kh nhanh" e="Depr. Rate"></header>
      <items style="Numeric"/>
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
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status = '1'" information="ma_bp$dmbpts.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    
    <field name="tk_ts" allowNulls="false">
      <header v="Tk tài sản" e="Asset Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_ts%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_ts%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_kh" allowNulls="false">
      <header v="Tk khấu hao" e="Depr. Account"></header>
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

    <field name="dts" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="162" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="FADetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ats" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="162" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Phụ tùng kèm theo" e="Spare Parts"></label>
      <items style="Grid" controller="FAAttached" row="1">
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
      <header v="Giá trị đã kh" e="Accumulated Depr."></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3" disabled="true">
      <header v="Giá trị còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3" disabled="true">
      <header v="Giá trị kh một kỳ" e="Depr. per Period"></header>
      <items style="Numeric"/>
    </field>

    <field name="tien_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right" categoryIndex="3">
      <header v="Giá trị làm tròn" e="Difference Amount"></header>
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
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="loai_nh = 1 and status = '1'" information="ma_nh$dmnhts.ten_nh%l"/>
    </field>
    <field name="ten_nh_1%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts2" categoryIndex="9">
      <header v="Nhóm 2" e="Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="loai_nh = 2 and status = '1'" information="ma_nh$dmnhts.ten_nh%l"/>
    </field>
    <field name="ten_nh_2%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts3" categoryIndex="9">
      <header v="Nhóm 3" e="Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="loai_nh = 3 and status = '1'" information="ma_nh$dmnhts.ten_nh%l"/>
    </field>
    <field name="ten_nh_3%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_ky_kh_qd" type="Decimal" dataFormatString="###0" categoryIndex="9">
      <header v="Số kỳ kh quy định" e="Regulation Depreciation Periods"></header>
      <footer v="Số kỳ kh q.định" e="&lt;span title=&quot;Regulation depreciation periods&quot;&gt;Regulation Depr...&lt;/span&gt;"></footer>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBmGEZk+ulXZ3RWlGRs+VEOVpxKErhjwnJt2VdPkfrBiYlvONEDqDdiM0nLct0rHCI=</encrypted>]]></clientScript>
    </field>
    <field name="ty_le_kh_vm" type="Decimal" dataFormatString="@quantityInputFormat" align="right" categoryIndex="9">
      <header v="Tỷ lệ kh vượt mức (%)" e="Exceeding Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_hieu_ts"  dataFormatString="@upperCaseFormat" categoryIndex="9">
      <header v="Số hiệu tài sản" e="FA Number"></header>
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
    <field name="hs_vm" type="Decimal" dataFormatString="@exchangeRateInputFormat" align="right" defaultValue="2" categoryIndex="9">
      <header v="Hs cho vượt mức" e="Permissible Exceeding Ratio"></header>
      <footer v="Hs cho vượt mức" e="&lt;span title=&quot;Permissible exceeding ratio&quot;&gt;Permissible Ex...&lt;/span&gt;"></footer>
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
    <view id="Dir" height="235" anchor="9" split="9">
      <item value="100, 105, 21, 100, 8, 105, 8, 100, 8, 58, 42, 28, 105, 0, 0"/>
      <item value="11-------100111: [so_the_ts].Label, [so_the_ts], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="11000000-10011: [ten_ts].Label, [ten_ts], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="11100000-1101: [loai_ts].Label, [loai_ts], [ten_loai%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="11100000-10011-: [ma_tg_ts].Label, [ma_tg_ts], [ten_tg_ts%l], [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11---1-1-10011-: [ngay_mua].Label, [ngay_mua], [ngay_kh0].Label, [ngay_kh0], [tk_ts].Label, [tk_ts], [ten_tk_ts%l]"/>
      <item value="11---1-1-10011-: [so_ky_kh].Label, [so_ky_kh], [ngay_kh_kt].Label, [ngay_kh_kt], [tk_kh].Label, [tk_kh], [ten_tk_kh%l]"/>
	  
      <item value="1100-1-1-10011-: [kieu_kh].Label, [kieu_kh], [tong_sl].Label, [tong_sl], [tk_cp].Label, [tk_cp], [ten_tk_cp%l]"/>
      <item value="---------100111: [ma_phi].Label, [ma_phi], [ten_phi%l], [status]"/>

      <item value="1: [dts]"/>
      <item value="1: [ats]"/>

      <item value="1110-----------: [tien_cl_nt].Label, [tien_cl_nt], [tien_cl]"/>
      <item value="1110-----------: [t_nguyen_gia_nt].Label, [t_nguyen_gia_nt], [t_nguyen_gia]"/>
      <item value="1110-----------: [t_gt_da_kh_nt].Label, [t_gt_da_kh_nt], [t_gt_da_kh]"/>
      <item value="1110-----------: [t_gt_cl_nt].Label, [t_gt_cl_nt], [t_gt_cl]"/>
      <item value="1110-----------: [t_gt_kh_ky_nt].Label, [t_gt_kh_ky_nt], [t_gt_kh_ky]"/>

      <item value="1100000-11--: [ten_ts2].Label, [ten_ts2], [so_hieu_ts].Label, [so_hieu_ts]"/>
      <item value="1100000-11--: [ts_kt].Label, [ts_kt], [ngay_dvsd].Label, [ngay_dvsd]"/>
      <item value="1100000-11--: [ly_do_dc].Label, [ly_do_dc], [ngay_dc].Label, [ngay_dc]"/>
      <item value="1100000-11--: [ghi_chu].Label, [ghi_chu], [nuoc_sx].Label, [nuoc_sx]"/>
      <item value="111101111111: [nh_ts1].Label, [nh_ts1], [nh_ts2].Label, [nh_ts2], [nh_ts3].Label, [nh_ts3], [ten_nh_1%l], [nam_sx].Label, [nam_sx], [ten_nh_2%l], [ten_nh_3%l]"/>
      <item value="11-1001---11: [so_ky_kh_qd].Description, [so_ky_kh_qd], [ty_le_kh_vm].Label, [ty_le_kh_vm], [ma_dvcs], [cookie]"/>
      <item value="11----------: [hs_vm].Description, [hs_vm]"/>
	  <item value="11-1001-----: [tl_kh00].Label, [tl_kh00], [ky_kh00].Description, [ky_kh00]"/>

      <categories>
        <category index="1" columns="799" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Phụ tùng kèm theo" e="Spare Parts"/>
        </category>
        <category index="9" columns="100, 100, 69, 60, 40, 68, 100, 8, 108, 100, 0, 0" anchor="8" split="8">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="3" columns="100, 100, 21, 100, 8, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="5" split="9">
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
        <![CDATA[<encrypted>HXxTt7WbL9P/bCrUP+M9QFFYJ8zgm/DBxIr/HL64sr6gPbQ/3m5qXZyI6dRAUzzOcnR353gMQl0HR40a0YYn3W2657b8WGdLD8ldTeTfNTEkY9Scv0JpESuDGL0n0i2Sglgq7X0aWdSYifesfEWq9KGzBBz+ns2LOrSjtL3iISuT1vyxz2jmNv2j/4BT7Y/WBnbRHZGzjLVXWa+/3yjLPRdHcgt1f7akwd6UF/cC7Ic3md7On762jK0wUupZ9+2YoeSRZDDwzzb7bIfEZfGw6IagJoLWWl1IAfPA2uvocfcgYRaWRi6oC7jvw9l7sJRPlG3qrDYF2LvRpNtT3c0553koFHferTNPZH2133vordDkPuCzRdFKvwcw+VWCphx+uqSvEjoBdML8idjrMdprcA+hIOrvaqqsCXJrVzFU9M/EWxVNzKJcgsNdYhG5PBeI</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>l6gHdkKxwEPMnfUUKohYce7j1zh0JpT3E7CIwTzkp4cdx9XkXK17lzOu9wmM/myLLU012zkpsvpAh9Q9DXVNkB8nmPxiCNyMoJ17Msf6xJu/LEIi8YofKtsKUmLk/x32csjvc5XqQXV1Yn7YP9UhMGiDH0lZ8IkYF2ZwLId7MzQrZDirefEsqccYr8FA40xDVZX9XtTBbDLG/vOlxrhmvXwtNytL2hMK8mILHeIQOEQyV5FIQHLkSOeIVi8eMi9CqDIF6byF/wW4lY2o7ERgCq5/jWEueV0V1zLBQur8a43tNYj1KN7Eo7mZ1sx4KRyYpQNAxsm1BEfNdMt5KBbYgVw3SVAkHbuc+ntpIkT3CiC8IXd5JEtwAVLt3ahl6IKm0hD0t6SXHG+sqoevOdi3KPtOagjKSNfnarEYRsZDY3g=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPs6IPK/qykSR603M90AOxHDU/jglVOXHgQF0322/ojTf+WBreM/O/4ESh8v5XhDFbFF5myAsMmUPcaly1M5+pGI=</encrypted>]]>&AfterUpdate;<![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0MVtL01/SSgXvIIkjPEpj2YQwNY1asZaw+EZzQ28ctVS</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>dFko7geX4Mjo5Eao2jRvrlCxtc9IOJPHMxkFvxaBKHzfzOFaa8k8iyzHQd+fZkacopiJ2COdq+xD6QbYe4HkeDS9NHmMTVLwm1faRVHXzta7SmqmWl8ppXx+g2DrsEupoPWZuWvz7yGq0iguknMNsMUbIRwn7enOFi5+PDESry+X22xgvyMvM0WQjTmx+sYw9jkqpYgR8mVwhriYQv24UzFMdgj0MrRFvaJ6ZMkjRErqDtNck4b4mcxReUJjzz0Ik0EW0HFKRa9D66nXu2OhqDO2Cf/ysKarpUDVPBtwPms3NGayGoxrMYBCRZ8iy3ElvaEAq7gv7LPsLd+YSTNYGS49MZVG3jXdyZm56Ks+3Cfys6OG6fDIBD5XUE5IaZ6Ev/t+h7Okw4w8UhdCcw96+nF/+VPfqvWTL8UM6q85hdptYGTeQt6XJHlWOMDs+cdMvi9sSCHhBTPlTBPe2PLP9kD4Uz4Hi1eN7FqtwUF8B86+east+DOjN/orUVxUNBLTOiMNk3oavKmN0s+081no5iJcJhN1gHvg4TK9kETApIne6UzwdcI4B4BNWsaYDDoRDlNrg0j3OnpZed1WxRrgV5Gsxd2Zz4Fj1Aplaor7cII=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>MsdPs1GB6Wrt/q//Yk4xtd4LtHThGG3JNPc9WRtkUo4vkj3KAsVh9hQVbVpd1nIA+8GTBiDUMKxQF0i9ABHGKO6uRtUYWLDLHtpuH+tG/bsKaOdrRd7eaTrvbOSo+g2Ve0u+2DiBjU/9Qo89BoMn+A3fPzHm0ix+yaTdSFWYc/RRL9uP2EMveU4qspOt3WMVHfl7Jt0GpBl7zF7pr59OS/aBQsnhgdmRr8NeKYi5S3U=</encrypted>]]>
        &AfterUpdate;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>lEW+lxaVuMuiKbEOcvZAgKD+GKMfbjbaIS4HYXnhRamuVKWWQG4zEYqpPW3A9y01oxRKosv5IaDvpvaPTBvpwXL12Ymw+VM5EWVd2t3ssrYWDSy0+nDEY3aNMhKkUZMqM9y8ysOLpI3jMv/CpJIkeYk81dZ44vV8WQb5gqGKEJnUcQP0bMzkWvCxMtiMsobZPOr2qfMoXJ/mXFuoNqb6jswZVDoWDJ3+OGHVr8h6aoK+t7xxnkK9DqX15wODxtoRMG2sRD/m8nFfNHj4eU1l8g==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>pcmubAy+wsP5jrV7mj5wrvZCbiq2x3qVDpBtn4ao+OFOpRCY4TW6oEzUSMklOcQtDhvId8xe8grXgT/RDB9UjHBGjtUpQkmsDe7scupiAmjk05rDt/FLOptmakU43CErqslT3Fn9sHcpKssUJLRlGdlyNPy1bapXjDtnDuvBz7aNuAnKYHp7Qx4j0QlIiYymNY6dN1leE1ok3J2PoH/fOsWrrixLWH60TdZSEU9IsLoKbl4bcOMdxKkiMC11O8Xu6D6RBUChQ0T+IotluFqKxuGpkbMfBBieh3KELOk0gusiRGyFl1nmd9VM1z4Ppl2hB72A0paOx7Ij4/2Gwdt/o72MlhkRr1PavPIS3hz32Cq9mpCtJ3/IYXvLhWvez8rTCTnLXqpxxwpSvABqwzsL8zxZzEPS1Uh8OhhNDs1UpuYqLZxwTnRfWnx1NZVJdRuqVtpIndAt6VYTTSe/1+G6iW8Kq8o0yCeGiSVZuliGyHW/Q4mvr3e2p9otQG7djURSD5wwAjYhIULz17HFNv9voX7oOP7+A/2KQYiWwnwhl/u3ibC+07Qg8HIN+Edw/JJNq14g9064TIl9TSE2QSa9ug==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxxMsceJOca2knPZHhSNxUxgt055BcUWJJ55gLyJ/LCldL9wuJ9I0FR8CY0m+mu1Yg==</encrypted>]]>&ScriptActiveVoucher;
      <![CDATA[<encrypted>Tl6cQQw3S7IhMGWxxdCF0lqiSNotQ0LbP5I0GarZGY7SPr1sd9cWEuOslR3GLL04pOTeibpMRHwR5D+vOCh7hkMLoKs1dNu4dVGZ5MKGBeCqZWu3GLSBLPft1GJko/lt5eKH9Yk0B4SV4AGpdC1EefaWJlOMAL0CoJo6lCZi9py4OJAEwq/B1aDtMWKi+toEvjYbX6C8S6tnZEgPwRF3iwpAPbsVgDs79VSVVJZpneVc8yiryNs0TnpM6335eqDb1/XOZr4nBaY/QCABaKal6//K5iRqRk2mdNfVHXKttepmyaGgk5ffv7b7M8i/tdZW</encrypted>]]>&ScriptScatterVoucher;<![CDATA[<encrypted>j5BOqU8S3ZKXmvpa69uLKcdmGi0HcBrhZwH7k7TAhsPNl10ZOw9OAlgy0fLmHVjnNqf3oZpYnIvhBJXOlHUHkkzOnrKnlADAxz6hbR4sueXoa4C7Y2Qg1NahkLrYCpUI</encrypted>]]>&ScriptCloseVoucher;<![CDATA[<encrypted>YEwqN+O9QO7LagF/rJ7ZajzBpAOn/ZxwmpuHb8+y9ysgo9TiST5TTzhsl49AGPqs9wmD5IPt3R4Z6eMZ7a2EnRv/JNHV5YyaTRV50Scva0vOKzC18g21s1dbxnauLADdWeRvOzqJWwn8pmgMZJPejgn1MnXbQEhDmh0bG8mCt8MIKUHhgZRuRFIpWV81spUNd14zWChqYgOqFkO9x+n5hhj2k0Wdriw4mCzuem08IF0w/CCgyGOAF4ksdoiFbdrHWiuZUXkQXA70qpkieHO8E9of2QVAUsikZIXJPLDKb64lPnbFt8LFBinDgk/Plx9b4oWSpMESOzNJwVoqE8/qWqQZuyN0Uk6Hfuv88/587Yj7ANZH3osLtrPtR4yi3R7MCH/y1hUfkiXZzYJNecI05Dw/J9Cy4pepfSRuQwBF8ZzssXhVXbMi0hD4JA0On39YXBnZCVixADESXJk2JMUJ5al7nFEoWjv2HfPajtNm1bEygHphALRCTQqPBD+tJGoaB2YmhjLhFHppWQuNBDbHNw==</encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>L+/3uAIQZeB2BbRT+BjSjts4CVSg1sYnq3d3+pxSuWuyeB8JbpdFrj8LSi9WIOX6xxv+S4pNz2RiBbFmihflaQ==</encrypted>]]>&ScriptCurrency;<![CDATA[<encrypted>/wEui5z0lBxLf+A/x9oTxe49BO/OWSSp819YYbQGYW/1TmZHOhSDLUgE2zmfgBNCBVxtltppfvLGzCl7FNgw9tFlWqxYk18f9m1w2xScicSA2mZt0EVqPhEP7f2KqwGdqZ4ESmdxjjRLfLeJGGPRECb2Yn5rxQMOPvi7ocRFoMwfabbr+XEFH/Qca2jkqZz6Nxy6ktCliYPig/xFrFfF769oNc5LfXSQFd+WA5CU3lzAU4RUruv+/cS/0N1EkFRMSFbYHFr2ATNeDLoBvuoCW3eSLLbK/4cZCwpbVokHN+VWFkB6isOn3ruRzJ4V5G3b/RtWJ/U1fyj2yrosAZBtjU02MfJdokvwSSu3ozXLYtj1J0K/AZhM6QM/Y51zEi4RUw39isOWBQfAprnNxgbEomgwnttCCkuOu8nAFLfMSX9SlPnWM2n+VVCcQhLJELoG4AYFDGsT6b1Y2zY0EoZYLgS1W3wcHC1mldiIhyA8TzFq6NtzEAIpW7Js4uCNU18kjaByASEfV4rhIb9xyNy/qo4E82oM63yxloxVL6hqBj8Js6bEB2kVy8pSIchGJzSpJDzG+xIwmpRiNqf1zshgfIL7Dc1kcBCLuNfswVBvWSmQv7YEUyLW8qob2G6UWBLbcbfOwUJtTBT+s/+D6XeEoAELFAJJTlPrQYGqnSCzNaRmPaUPaqQ6aQ/QSOXFO360nLiHH5XvUky2BUaTT4CfImMeDWUKX+70jBgZ5wHpltH7WDiTMEB/YW/gGgWjDMZY0lFlFdBl85opa1XqpKUKWwvkeSkL7VR3U2N76/bd92eGaOVW/xd+rthqUWA4Kzx+NXkAkFxaId93Glez1vzWjZHEKh2eyltNFGq6MtOkcCYg91MfwlzubyzKZe8KunLhcKXGkEpEdnWeCwT3uQp+SzJqTGrniMVhv8+Xig/ejAWtryd39rV6ndoYRbnVyOlufZO2pSbayHr+pCC5XxmfDA==</encrypted>]]>

      <![CDATA[<encrypted>JQO87NIESHxcur8M9lpd+pygPXAotz+RwmfxB4BAU6PiStAt+emmaTq+aj+as3DU4cQ5EDVpxtsp97UHfKueDHTSz0AXOmyfPdcIjcu/MtRB9/GHHkyPcg5njm4BrymIx6AjUvfYe68kiG4o7eHA/cPwqQCEwZl2te+r7GMT0Ff1VgvXPCMEPU44nekT0BY6zKpZm13ZW0hhH/TTMnY6YDRoOm54JvoakuC9f9yYgfgZd3SdxE4xWwVoBLJGhFYhJtu6TWLoWqcf9m6ES2Dv46RmDmD6MxKK1LicEcH24OPAXdudlsbYUWlLo5AN+NwCQ31eP5zEw3ltIqoT5EZEQ0C/bNK2VCDOYcXw+cLlf/GWvVHJtCL+eqfS4cqL2DBGFQyu/vB94UULdtJ++HPaC+gdvfnP70mmYdrEPKUw9QDrgCz0LOj60N91AIbNCUxOUtuuCIJxEvL6TXgiYSgP7wLaM/oV3RZtyuAggRKaQDf/I77MgTs3S5RMausrzvZJs0CmqORQ5Ag6/yN4Pa+AZGjCsWtrrRubfF6QJl5VgsGfGSFQBiROrrYh56x/u3cNnWUDKwCyHpwkzxzIa8y0zWWZQ8N4ox24/FhQtqzZyBw5/nKK3uTezJ0KpxbzJmF17EWasSeadSacXugEQq+TPSnuPnq4CCUw4VSeGL+x1jgLJNyUmm7+vcTP7N1ZI+DBSRgr11U+Qlrr9HYFmThwO7XNcU2IMqPtvLOhhxtku++4X56ORifF26Mt0WpvIoUHlnG09Tklcdn4AalZqvTP4zdGATAC9BHMlUGl9I+LOZZ5Oqy8VLHKiixDhJ8jDwZZa48yE/5ku7InZqlhdEVQyQ==</encrypted>]]>


      <![CDATA[<encrypted>v1mcdMOMviRdgI07lhNNtZAi6r89u4Esb32okLcszZPbBl/+xpWXZfECB07Z8wGYcuaoLrVKx+evRIQO0aWjuMLXpfjd7VwTVJTFlAyigl/6weZxNJca6eXaKKJu3jPDbXLLYkk/VGiwuk3hYCVGHvsgwGJ90kBI8QmroRMQ3a1N3nZmt1KDXVpgfv6YgZgTUcdb4TvLo9G4yXzbD8gHaA==</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<encrypted>VsJV0hIC7xI03RRfZzMDPL5ixN5JEKfxmozjtSMmsiEyVxIYE0Npo5Gnq1xG7zTZUvzEmRkTd9AHJNUK6VSWYLWLoF4W6z1+PLoFTn4Pm+fiBVqls8ZUskiE2e+lPt1bivIqxZ+/fLqmh5yu7Pb8yQuMH7gnBhF4ikcH6LaNrDyzlusMyS1u/XYZvG7YkH4ru0lA9SZgqLmN5LhfS996uHsWfLT8Rp1xJGqv6623JFjJysIqktM1o+Xap/G3vnJLiM8NWatYCW4bHJn6v9CpU9KAWzX6X2F+6ylEGMtPuDNwz3QusUaP8yq098tRpHLlBWfv+iJ4eXxu26msQYkqt06u6CPQN3h2kaiuzXJbQpe4GMHBUnbWzrEZiF/EOOnmW1lYz6ZAr0uVxy3VBRVXMK1AF+3wE77vjN4V/2jjtoavnm6WGZF1huH5BfBtSOTs1kitbgFc208KOZPUux+X2VRvswtPEJDNSDT9yqFwNi8ZkBLxtzmBmTFCO5wAEO4th8+zWRqifLVuaLGirMLJmt/MUr23IC7Z9eiG1QSTMU9Ib5OJUybh+bGDtieu5HC6PbjM+GSUewbVLkRp/HMnMUOUjSyflewHn37z33GhJ2NdeET9CKjLPsSaHPhpjNYcgMdNoPfoyYxa2TpBlDbH5Baf/19gOc9EP1uxc501aaa1jhkkwLrbgwscG2WIQ4Fdi+aY6QMgCSKzcpoOIiqYrifa3+G0bDYqyYZPsqb80HNnUDPLqF4QW5aP3Cdlm0XwSwmMYqBn84aP+zrYSsUk68e4p/+zCazzwXbTJgo+ngJq0gaFVzD6xwt0WMHGbbrX4btK2rsNB/0dO26QuOU5KLZkcGCDzy1bxUfHKq3V79nLGE6NM/sUcTqxoNvMMN96b1q825DCd2I7CSEeytq7zL6uKgOQCwWwGbIY37aogqhLsWfcmP/WQ3TrQ+GzjkD538xgyk7NKvRBC+avTCI4bQRlEECXI4W7DjFgX2x6o8Xf7zqA8dyWwR05TwgVAf4SawvJlJXwy+txoB3KuiBIzEMX4IY6t99UTXs6qPcjs5xAjc1XtdRofJbYNf6VFgnuUD3eoOJZBPJN3Qq/h298Oim7h2xfYjLBa5ESaiUJg68=</encrypted>]]>
      &OutlineEntry;
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

  &OutlineCss;
</dir>
