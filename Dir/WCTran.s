<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetContactInfo SYSTEM "..\Include\XML\GetContactInfo.xml">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckClosingDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\CheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">
  <!ENTITY CommandCheckVoucherFlowBeginTag "exists(select 1 from d66$$partition$current where stt_rec = @stt_rec and (abs(sl_xuat) + abs(sl_hd) + abs(sl_giao) > 0)) begin">
  <!ENTITY CommandCheckVoucherFlowEndTag "'$NotAuthorized' as message return end">
  <!ENTITY CommandCheckVoucherFlowBeforeUpdate "if @@view = 0 and @@action = 'Edit' and &CommandCheckVoucherFlowBeginTag; select @message as script, &CommandCheckVoucherFlowEndTag;">
  <!ENTITY CommandCheckVoucherFlowBeforeDelete "if &CommandCheckVoucherFlowBeginTag; select &CommandCheckVoucherFlowEndTag;">

  <!ENTITY UpdateCurrentStock SYSTEM "..\Include\Command\UpdateCurrentStock.txt">
  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">

  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0' and loai_ct &lt;&gt; '2') exec MaxvOnline$Voucher$BeforeUpdate$SI @@prime$partition$previous, d66$$partition$previous, @stt_rec, @@action, @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0' and loai_ct &lt;&gt; '2') exec MaxvOnline$Voucher$AfterUpdate$SI @@prime$partition$current, d66$$partition$current, @stt_rec, @@action, @@userID">

  <!ENTITY DetailVariable "@d66">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock int
select @stock = -1">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = '2' then 1 else 0 end">

  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd66$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'm66$$partition$current', 'd66$$partition$current', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec">

  <!ENTITY Post "
if @loai_ct &lt;&gt; '1' begin
  update d66$$partition$current set stt_rec_lx = '', stt_rec0lx = '', lx_so = '', lx_ln = 0 where stt_rec = @stt_rec
end

if (@loai_ct = '1' and @status &lt;&gt; '0') begin
  exec MaxvOnline$Voucher$Posting$Inventory 'm66$$partition$current', 'd66$$partition$current', 'r90$$partition$current', @stt_rec, @@id, 
    'ct_dc, gia_nt01, gia01, gia_nt0, gia0, tien_nt0, tien0, cp_thue_yn, px_gia_dd, pn_gia_tb',
    'so_seri, ma_khon, ma_vi_trin, so_dh2, so_dh3, ma_nv, tk_du, stt_rec_px, stt_rec0px, stt_rec_dc, so_seri0',
    'gia_nt1 = b.gia_nt, gia_nt21 = b.gia_nt2, gia1 = b.gia, gia21 = b.gia2, tien_nhap = 0, tien_nt_n = 0, tien_xuat = b.tien, tien_nt_x = b.tien_nt',
    '', @stock, &StockType;  

  insert into r90$$partition$current select * from ct90 where stt_rec = @stt_rec
end">

  <!ENTITY Delete "
delete ct90 where stt_rec = @stt_rec
if '$partition$current' &lt;&gt; '$partition$previous' delete r90$$partition$previous where stt_rec = @stt_rec
else delete r90$$partition$current where stt_rec = @stt_rec">
]>

<dir table="m66$000000" code="stt_rec" order="ngay_ct, so_ct" id="PX5" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phiếu xuất bán" e="Pick List"></title>
  <partition table="c66$000000" prime="m66$" inquiry="i66$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XCC5XZ1IDPpaDqirJElpwGphj7k0IfLUu5dBXM9DEqppA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(kh_yn = 1 or nv_yn = 1) and status = '1'" check="kh_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="ma_nt" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default">
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
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày lập" e="Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="so_lx" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" categoryIndex="9" disabled="true">
      <header v="Số lệnh xuất" e="Issuing Number"></header>
    </field>

    <field name="ngay_lx" type="DateTime" dataFormatString="@datetimeFormat" external="true" defaultValue="''" categoryIndex="9" disabled="true">
      <header v="Ngày" e="Date"></header>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="2">
          <text v="2. Xuất" e="2. Issue"/>
        </item>

      </items>
    </field>

    <field name="d66" external="true" clientDefault="0" defaultValue="0" rows="242" categoryIndex="1" allowNulls="false">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="WCDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
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
    <view id="Dir" height="302" anchor="6" split="6">
      <item value="100, 100, 100, 37, 100, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="111000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="11-----1001-1: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="111000-1100--: [ma_gd].Label, [ma_gd], [ten_gd%l], [status].Label, [status]"/>
      <item value="110000-----11: [dien_giai].Label, [dien_giai], [ma_nt], [loai_ct]"/>

      <item value="1: [d66]"/>

      <item value="11--11-------: [so_lx].Label, [so_lx], [ngay_lx].Label, [ngay_lx]"/>
      <item value="------101011: [t_so_luong].Label, [t_so_luong], [ma_dvcs], [cookie]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="100, 100, 100, 100, 37, 100, 8, 58, 42, 8, 100, 0, 0" anchor="4" split="6">
          <header v="Khác" e="Other"/>
        </category>
        <category index="-1" columns="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0" anchor="5">
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
        <![CDATA[<encrypted>bA1x4AtqygOUxmg2ggpjgWCEcpM4CVYZTuHcFZ3YlNCZxwMpUHkfM61Mv6PSyTgB7X44jIZBFSQJBzX4UUXDppdJoLfYbWFxoczkmgu/QD5uaYubRrkgI951xp3xZiqbweF5wf2HLQxPdXNqm6JMGz5VoCOU9O8oX1IBk3pkEJTwPEeOKAOHLcjVjMhVjxYs1ci7ovJ2wIgLprc7syY+jd2JOJexbDj9jF0jrD9w0CDbgWD4fQfdUGcnDh2RMovQMUjdECnjkSBB/+XaAqYFZKCPo4FKVqxc5p8JWSfqNnrOL2bkhJNvEu1LRE1vyiY1ECsn9lw7wctGqaFCDj7XJjcAg08m2RuX2RVf58LhEwMYLu64ClwMcUo8zKjwuNhSfmz5qQZkDX2pZHVuncAuv8T9AIH9krssP1F/HBl9OAKtqea4TmXVRFNLJ7lNX/7jp/62hG2K2ZCWoOCnBfeSXFLGf1Wnlzhmc1wbIKHRUbphlkW9tIs1tAGnPcg2jjWYxlHOHnfBehm4T9a2Cj6tBg==</encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>Xdg6J+Hsxor/VZli06bT7oN2mrvoxPc+F3ZMo1nmZip6g4PY4QNwMckhDEjlE43z6+NYTJ8E1fBmoP+l3y/Si/eYnn4fPWcJkNucTNXvxtKRwav4P4Ug5sDUCwVsitN87zaK8EYSlikZBmGM4hq4i+NsiFwRitc7D2fWBgQlRll7MGbQ/X9XrES6Gu1Em2xHh+PcU3aB5HMfxRKkjnUEpg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPs9HkrQ+atu6r3f+xK2oMGn9Q+8pjbUKKRwzVRAiH2IZy6Q3IhBCrPvSUWpmArokKMntnu7WJuLdeghZMMj6Lyc=</encrypted>]]>
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
        <![CDATA[<encrypted>aRHOPduaPOHwS3jrxJxIpnZDPVFGkJo6Wk2B4LyQ2uksb0PyNovrwiZS9r7gThA1w3aLhuJoGLW3ksk8B9UC0rvIp4MRerQ52vKJ7+8Eq70Z5HZUghkDrG0zOultdKW8JwrWZi4YMIBuzouSFYz/yM+GVCCJGqPOclOhKnecfggToI2U7gqLVN/9gVcY0LAGvmbXt+LV2BjIK1WLGxlxs/q8HiTyYzmrueql/3Bv4klLQX1Qegxr/Z5oiVa8gDuVY6K5oDqhrQLl3UgVImuMU4IQbkZ2zg7PLxd9tx3F2F+31xkv7zVvnmYV8X/ImfR51jSGoKBcpbbRW3lUQ6X+BA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>IfQ7eeWdSnF1gkjbJ4olhKij+Qg/4UuA8/1unIujA4KTkWxXY49dOD+qX06L/z3zOr7laYvWMD6RRSr4/bSvm6Utbvx0AjPRTjs6XhijItB1KaNz2qYQTHjLWh0rKM+Hdnl5YF3w+tDYs2JSbdFHir/SMZ4PwjcnUUT47oi43WskAezln7OPnIrpi0n93/W+s629rBvZOYZ4V5WXw6ByUkfYfHBae7lN+mzX8g1e6k3glJTYPHLJxEFWF7ut5KTT</encrypted>]]>
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
        &CommandCheckVoucherFlowBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKwxgkBaYFtCzGAY23lynNsSxuMgF9S938tDZ5iFfjyYOEXu5hGtm5egMzXiIqY+IHcfujAJbn4XYY0xCEypm/zQ0fMtrr6dARV0ZnGZ4H7KH+</encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
        &Delete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>mlg57XtvF9BgEoEcY/TGhfK25LgdAqHRM2B2exQcZ4dhAU4QW8RcVLkm4bZOIhlYa7jJKyYDOmSW52WDo/K0adtZKQkXLhJ+n+x+u5bFuRq94pkmihkWm03bAXylLNEtsrB1F1Bo/gVpJRi2Qn9AdVgGyCwwt8F2q6H7lcbhsv9+D/BFd/mohV4DYaZmHFyr7pzGYQlgjlG5nmsJkojEG1Voh/ho8MhIdObbkvjVF0ezrjOgFdGabKTaUisKUaDr/q/Fpv3oX7Z+3uCyRcjjkh709wqQzeQljP1uPfBFGAKjU/YZIbarQtzJv/jDZZV2pvD2+xAnvLswdNcEvEL09ooTdWjNXaxkd63ZiRoveq3+AEhY8ec/m2XHyVHeOhicsWXOEQQmO+BYHoa+Omalhok5plPCWhr8ipV2icFhgkj0FyB2VL8XcLM2qDNYZ+0rjJezJ4FWW1NNvJsFLVBKZh2KPsYwDp06OwRCt32FhKPoEYgoNmU/lMzE/+GFdkFw4iTtNk9Meuh/Z/N3FUYhahYCQmC6lybe83EjgqxudwxEy9FsSDAx+IF8t/dFgySSAC4Ke7NJlrFI55/v8dgC4H8ZyWULCONDZ4/IkXCxaoETOxs9zRVgIHvKr+b7/FEEijxCE5C/vyNTp/njCp42InBMbkyysGCHWm/Nk/5wY5E2Lt7Bniu2kQbOMHJJv9F5rnHAMkuIwrVvgiPlZoeYxQKjt6r9+whlFt1IpWvIzBdV+6ZhRuxyHvPqPjxWibJJ3C7I3PjVbr53NieW3MU8HtfEvoMybf4SGoVqkCajlgvXbhzjAmeXTrq4FlgO91qnLzv96wFTFBqsY5cm9H+bJzZ2DTQTs58snqNJYwfRzFen4Dl97SET3fcYFjXcnpwL1A24kvHwR7XsXIlmolFBqIAxx68JGzGbSyEDEck3YP7SiWbxMHZUFkss07Pn0EXmCiUYvrKg4EV65xYcaECKavwKyGe6sYkrF1y+6vPzCvumUWKjGA0YuGSZgRxc5Ky+Uf1Kn6n2tcMVIme/6v3UELYboMLLouMN+pFn5AhrFcxYdeGvCCgbzsFRohwztDfEMjSwlhia98He/55fLYII1DEleA50Ome0JciZ1+KPK+1Niadf0/Tpx7M2nEKjEWtcDP0K0J0e06nIGmMwFSaj76pZPe1sGftCkEhYj8pCvURu/SbR4f52GwqRp6zWMUq8NcqyTtA6suSv/l54qG5lX3QGQnj8Ofsce6jFOynIDGnqtkSfR7pWXnqKEL1ApXumBg43374gsl0RKOzDjfAfD7wNUvo69imNB2rpEyfSjv4EXuIsPUXejEBMKJFJca0MFc1orA2F4xH0X+XZtoB8PUG7sdMdyxSUs1awhTqRzYlSWg7IHlNRtr4vX6hzU/5L</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>vBHDLLB+MdCH+9fhsnFG7TtdfcS7ADqBOg6UUEyjsTdMKuJ/XZ1dDF6CTOqaLzWH9arn9uGAenN/AjfIqu6lZvyIww/Y0zpUytHTJVraGv/kwp6ww15LbV2w2Q4nwoKegZKsh3yZZSkgC8gA+G5grLXP5AcUBeMn+eDA0y6jVXVTYIJhnmyfgjvW2c+zfu7EVYyZe32exhf+QkVV+PfkGX5xKnAvAm7XGSfxpJ1viWP/4WJRMVNjIf3kKUrphZZ8eOA+qCDNsATnUlh0O69395w1ISi8chEhpHm+WgDgv/aFNqr/jx+vlcTAKuvLKezTIc3Psvu7627m3LIoirBut8cEf/SrWeyh6foQLXbwZDUCR9nNdTM+6bb/Kw24Q+oWk4a706NPp12zYnN7CTt0zlMD3vY1q3nXMGZnrCwq24qZXaWjJKpj49cHZIpHgnOwXLh0AeJZAm/Va7viniMu3EP5oKApPQzFt9/4gPYUe3jeQayciZGt5y0xvHeDjtpGG8NGM5GUj5ef8cy6RfegajXcUhM2T6QzX3RFLF53fga34cAdC6LQGkwYqqinKL3qEDlie5dyItCtXT6fjyaPTiQb12r7INPGXovPLT+KLcZWCJCRe0Mhtozt1/7PdaE2IfkFyfP8yVVC5CEeVxPQXT1cXInOHMSf8nJK2c8OX7TEx1Fms/NZOIwwYy1SBH6LM8zmH5OY1S2tlbWjmaVcfuzBgB6suY6ZBYEyKlosnvQC3EkbhbKyS4cC2QULVd05REveuiNoijltNsIFCI5U66/RMsKNvCIx0wHT5CA8J2k4cp1wr+mnwUWLF0rX/1QFlWsajsh7hJ+iYKtbFjhc/iKQ5CtEeiGiS05ikp6nG4DOAX6m/g/Kudwz/zacxbnz</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<encrypted>Aca3PEmSUThwfuH0QluqXiw9h3Ql0NxpuRYhS0NaoO3LQZLPB7pHECPDnuC/Rc8U2Ntway/g3tDMhicx05hGaLms0MZScnHLFHsIZIoQXOQ5s6CUfOpY438GHyrbQV/WzgQ0px4QP3tDWc+Ky8vH56/uaFdco2HPTd4/8wmSTUDvDmf5YuZUqMJhEwPUoL384OwjHg7R5cYVW266nYymdBEHXlfJUWcR+F4Zt1TBmjHeX4SanwCFuu2IxH6n0UKZ9OEVnTh6ILl7NjAXetl4iTn4fxbzfU5OMxvDjNZ0Hfqah0DYyc3kU8grHMagc0OsypA//3mEkMEPUnqGxaLIb81YfiMwEb3mO3+uYwBJ+vInAzkvwsoLBhUALqUA5hyTTXFN9WmXpNyY5AMtJsGh9CF46aOVjUDwneGOVFF9m7HRueksnGNPw1bN2iVy+8/DBP6aWQ5XsxyW/AOqWMaWr73f7URjUivMtzb3N4KnSEUfgbxQrH1mNdPHDPVARoEwKqzRf2Jg6mHH1UVede9Zq9UNm7KNYlvQxt52mWj+av2PaQxWR/y3CGa40fN9mdqqpAFufMutBulc1L9eW+n9T3TjHD6iE5YFpeDlXWhLASg=</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetContactInfo;

    <action id="Transaction">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Rhj+g7IgJdvxGxW3ZOV+kD+vDDSt6HF+9SncAKOzHSQusARmA1Dr0HMQJAZS2+dZcunr1l2Y++l5rs9txTpDn2G5/mEXxzyVsiv1WChLjoLZeP0FmHtNKg+oQ8HLcaLXA==</encrypted>]]>
      </text>
    </action>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
  </response>

</dir>
