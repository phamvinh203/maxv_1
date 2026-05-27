<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">

  <!ENTITY GetUnitCode "declare @message nvarchar(4000), @ma_dvcs varchar(32)
select @message = '', @ma_dvcs = ma_dvcs from @@table where stt_rec = @stt_rec">
  <!ENTITY UpdateConflict "declare @$updateConflict nvarchar(512)
select @$updateConflict = case when @@language = 'v' then N'Đã có chứng từ thanh toán cho hóa đơn này, không thể sửa được.' else N'Can not edit this voucher, It was received or paid.' end">
  <!ENTITY CheckPayment "&UpdateConflict;
if @@action = 'Edit' and @@view = 0 begin
  if exists(select 1 from @@table where loai_tt = 1 and left(stt_rec_tt, 10) = left(@stt_rec, 10)) begin
    select @message as script, @$updateConflict as message
    return
  end    
end">
]>

<dir table="cttt30" code="stt_rec" id="PN0" order="ma_dvcs, ngay_ct, so_ct, ma_kh, stt_rec" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="số dư đầu kỳ của hóa đơn" e="Invoice Opening Balance"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false" clientDefault="Default" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l" row="1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hạch toán" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="cc_yn = 1 and status = '1'" check="cc_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNMJ46qpkBZmfqcH52vOcsDprX4DnnDKe6ZLY27R2ug0QQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản công nợ" e="AP Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and tk_cn = 1 and status = '1'" check="loai_tk = 1 and tk_cn = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="Tổng tiền ngoại tệ" e="Total FC Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="Tổng tiền" e="Total Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="t_tt_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" disabled="true">
      <header v="Tổng tiền phải trả" e="Payable Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_qd0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="Số tiền đã trả" e="Paid Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="t_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" external="true" defaultValue="0" clientDefault="0" disabled="true">
      <header v="Số tiền còn trả" e="Remaining Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_tt">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tat_toan" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Tất toán" e="Write-off"></header>
      <footer v="0 - Chưa tất toán, 1 - Tất toán" e="0 - Not yet, 0 - Written off"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 25, 50, 330"/>
      <item value="11001: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11001: [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="1100: [ngay_ct0].Label, [ngay_ct0]"/>
      <item value="1100: [so_ct].Label, [so_ct]"/>

      <item value="11001: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11001: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="11000: [dien_giai].Label, [dien_giai]"/>
      <item value="11001: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>

      <item value="1100: [t_tt_nt].Label, [t_tt_nt]"/>
      <item value="1100: [ty_gia].Label, [ty_gia]"/>
      <item value="1100: [t_tt].Label, [t_tt]"/>
      <item value="1100: [t_tt_nt0].Label, [t_tt_nt0]"/>
      <item value="1100: [t_tt_qd0].Label, [t_tt_qd0]"/>
      <item value="1100: [t_cl_nt].Label, [t_cl_nt]"/>

      <item value="11001: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="11100: [tat_toan].Label, [tat_toan], [tat_toan].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>l2sGHwmuwjpITwFgrQSVTkt32cJTgtMgCQE4lerO94gOLhcf/B/sMYi4bqp5QuPyXm+PtW+dcTCfNmqhxMSlNT8AQgt9a5OGG4muvojfnb6Qj72mBCzu5UM3P8a4wFd99lRpX+tnqYFvEhv4MeDKO0db5Sp0932Yj8+Rjx7qoVQNm45I6qiay7VUOfrTKf9wEFmC/S0W0dGm/vEiVGYfPV0+xZJCuQ7hETnnyZlkHBN7P1U4CvxYwKOOAFFs+POJSlsJXnYt3+R+422moxmA3MO5b40DjFt5H3ie+zShA/vlHlnEu7WAVqBBkFvP24USvrx1syIelrcb5mz4ezqyU6Sp6gDdIHuO/drrg9A3sSc=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &GetUnitCode;
        &CommandWhenBalanceBeforeEdit;
        &CheckPayment;
      </text>
    </command>

    <command event="Scattering">
      <text>
        &GetUnitCode;
        &CommandWhenBalanceBeforeEdit;
        &CheckPayment;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kvMjIHE7AN+O0V0eJ6/TSZemhHLOmxXkL/0alsdxtq6W9Noks673h3Iyh+ineSDD/pA+yWjBqZ+KJBKFOZNOldo=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>nABbYkwZlz/4LmNzENAxp1BrS/FWWk0r8T54tZCusRhxRIDY5vKGHBs8rb3zji/cZJ3tBZcos5Lns1ZeQekuTkLXIDS7mfpv7GSBFlbREOplyiaijJarVr6X7feaqgk5F2x3RbkEESAE6s2u8QOfuw==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        &UpdateConflict;
        <![CDATA[<encrypted>eOmQnpqhO8hILDEuv9DASELkl0NHS2kA+RiIaklzXNCv2LnvBIpxphs9/PV6HVBkOh/JtEGsVFVSjHoCv/4gLuPZms028q3/VOobb0InS07ru2MHhMBDd21SjYmyiVtIARLaimw6sWTAoIypSk6A2szx6F2MxiogMs+jkOP8fhgjh/39vy7PQwzL6yuHApp6Iu8kxvv1b1/2HShuJSTFbyjYbw1xh6/vIVE0i8ldGdeB8nCOZsEBNNquhB/dULvNkHotWEwtujlL7qZIXIw+KIfJIKLajq1H7OiyyT+BvrB1W7onlzvJIew0T/yswAG+ihY9+qXvD6bynjwhb0HLptrM2yHpSqc8fUXDjxYyFKr4djyjtSXB3sq3hH4d6f53BKX3BhyY92KM4Y1qk2NQmOysJ9J9NTXdjDohuGE7A/No8pfs9F7Lz8Pc8IZ1EDkJOuyDLPH5TJJA8+H2H/bmpcoW261zH9/wAOSoAXyX6NEux2N6lpkyqdAtXUAcx0eg1PjyokCQU8my2K975YCpJMt6odR0/4FdfcAqAC+cT8ULj0+AOe5He46+o1vrb0OY</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F1HLuC/gfn2C4Ky2BUkZAdI0iI6oOrrDNHX3m8BQvMk/CwJ/4hOU3220gu40ozDlASY0SHZYUk0EQxJTjoVGSkE=</encrypted>]]>&CommandGetIdentityNumber;<![CDATA[<encrypted>8WyZbM2sYa5RsMomu0gPMriMcSiv1m50LXhvH0AHC2JWPvjcLp5aPdyE04VQWOCzjEFra/GBlNA822/kvoz3Fmt+F7UjbZ5zxkJHP4DNlRJiq5t2HNt1RRNPW+uSffEJEOgXCPBR1NlzJqyvfNB2adpj1gycLcvAldqfNzFeZLEAsmNMogHnqQHsdOG/r2r+6slsvBa2KybvNYHcU9X5PigMvHoHSJhjN5riwSPM/3cEoYecxoEPawafHMCuVllHgBoY3D22A4DkIjD3ra/D7Z2Cc7utDFtt8XC8hp7px4A=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>MCiiHOhG6tLJlCo+XvfPCzJyWijn2casXlWQ/3BoKv3LeAu+UuKwG4Bt8dkbqjNyY0JdPDDWjI10aPyFz+6WGdfqLCg76Uv56Uny86TDUbe2VjvztQJVaVs51jQUNZ3YGu+/eZaYRK7nxQhMlPTJIpdnvaey15yIVIG5NmrpgKg=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>rgdGcCOvikOFzDFgQ+X49Vx8EQnYphKZ3bLzFoV9BEqXHwnK9G/wMhgFWcxs36xxxqi2yWHenBsOWXXDmcQNadQbLxX0WEQbqacuqX83roWjA9SqbXE1It8DIIv7FGFgVIIqlSlWcGWmb0yz8iqZ1fFDVvf09+d2czgPq9HZD8Xh/nFbEXKKbMvy890R6QQvOW/WezjgQT06dAXt+NncFiRHva8HpJUI5zqcQnPm0DQOAnR22M0ZYj8lS1qvwG5R</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>sZ7wTeV3AoV8zyR2lGhtrUDnwW0YNH0EmD4YgsM9J3UT+wq0vvgKb0vgyGP1NvsK6kJv5rLKS7Fr6d6QshXTJNxYuOp8cvgNBtSv5fbePIvOH8KVy33zMU8dOgfUoi4sPeBakP4dlYqMOOXjdl84pP2JoWYR03sgwg4CprKujtBrCr7L+t2vpKN/Cz/sMjfWsqLEjRiiL2W3bVTRtx09Lh7KtxkiTpB2beSIyVtics6bnFSz2iqkZqNBBf5RdAeinIjwcC9F9u46gx+Qmj42JOTC5c/T9Qrwo7nhAphTW/UQoE6CB4WYczbzOHXjdAT3Ch8FWMzqKY7NhhJDP/41L+5YTm4Ydyl6jxfI1DP932+tHjtcj9tLwvfY8MVH/1qO</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &GetUnitCode;
        &CommandWhenBalanceBeforeDelete;
        <![CDATA[<encrypted>rCwvp7lhVU0nKh4mD6DZepmoqMMng9gurWXdCYAW6DM8Obu6L4VEoQrvOQv9sMkFQ1rQu9hofixuuWrTuXjVthXchFVQLwosrEFVotLXNh9VOOMoQaZXs4UCgpt6jeXsTlR0Il3ihI22PNF/bbKs1rlpMlvuPH8BxSHd+vRMtIQxnCJ01RCjFO5ew0NFqnWJ</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>dbyxEIXLvfq+YB4vVLT7VBNhh+tUX4A8jIGc6lQ8q1/1vX22R0+jUWa1d8oAkAAkIWjEenTg8AGrUXNl4bW6scjP0oUhc7Fpz7mMDBUj93HV2uas45o8llCVW8wmdal+i0FSvxthaxLqEjBWVHi/QrdYIP8CqCCp165L5Lok3VUcw/k/16biXZVtplgShObhA9+1FJA56F7zSRThxHPLt9AUPyycZcVzTAuP4H6wAtYAVmy17axx4OFtu3kwVJzz5YRDsk6eKkSjqO0Wj9qdscEfwqKTSDpDdHRYzklpRI2mcNbfwt3tUbF8e+zekFc+33xmL9Z/Xf7BYB/EV3cHgpYOPn7tVuQx0dwBJeFSFabHG/5KQg5z9naMhgNSnlNHDaAA63sj+jlueIajjVsN9UQmHg38FqH9vEQh/UzWDw0xtw6IpW3DEMCN6TJPNEEXtDg2SL6JlCyhePr84yKBBEFT2xgPsZojFrcUFSC90PE1a4zKlkCBfep/rs9sFdtCGCyxi4W1/U0J7K9pgFEyHtFuqTDAiXJk+dhBrRcy+r2HmOrvErHz8r93PaBNYa9mwPcj4sqD4BekzezcFk9cg6QCPgSV0f2hbZGkJRD5lkYWSg8FIMKhjjxGWOA6/puHLNbsC2/mwAcVTDhv0AkZLoLDVrGpvdOx5KtmntYEVdxTqxMXqjDiCLxQWqRf2yHTFiuUS9ca0vvu2xReyIQqMBQ7AcoeFP1axY+fAF5+04sgBR8Fxs59n19AXyHwxGKHne02Bhp+2g4u5yht2Ik70bdAN/1/gySBOHXxevWjZ25Ew+X3VFfOP7nGzPlzs2pxhETJo8fro91wVlAoord+CCHXL1CLEYYmxTIPj5CKdtVBGsfX96wTpaFFA7uock98oM8gEC5X326++G9pPtRUGgqK9zN+/i2IcYUmhGnm755gyfA4+vWnxm9v4AxbS9IhcqmGE+GzER5igaSpqBIZFc09ZZsbsaju25LruitlhT7vStjt2V8ICisdK0RvvlcJtNg4q6KnnE9We+GHvaJng1IcmH/n8vkHs/NFlWHAZ+V/CUtw5+lHbshDtf0z5bYLUs5KuSm7p7j0PntBrKnpNmE2NlVoulHwlc4gX86KdkNrXi/N7xDIr864EnKv3Qcf+HyKg7QZvs3EGmpPA4GY5zAUR56KXIFBbTq/IYUTl91OVzFMGy7TP5kQ70jllRJAvPsZcLm3Mkyd/Ht/d8Ob5gNroY9WZrdYRhfkT+lnQacOIvhL+P+AkVWFaYznuP0lDv7RJ6jzyjDL6D2szXabL3zaK+sftapni0hBfMhhXKI196vrDNLI4z/XSZU/IE6z8WAN9H020S9CDqBg0PTocBrAvAATHZcj9CwluSzsUdk=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Customer">
      <text>
        <![CDATA[<encrypted>ste91IIyltKa7JxclAzloSo5cdfafIHW9ah9FsOrEmzl/YRE+TdgedTGuWm/CHvzTIquKr3RXZy1kAILGTRTODBzW/LsCgeXbMYdRSJ4yAUvu0rj6JJaaM02zATQ1VhY3dhFzwTm2yQ5+SQqsFv9y5uKl36L+TdrMkxnBFT4ph56kaa+5Iai6Vsv2tC+4tulwPp4ATGDpsE6WP5/XAe/0KozT1ihK/rwehLYSHKE2St1heIIUBo1rv73Na7agx7uus5Qa2jOX9WOvFJgyAxOnA==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>
