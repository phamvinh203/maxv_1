<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">


  <!ENTITY GetUnitCode "declare @message nvarchar(4000),  @ma_dvcs varchar(32)
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

<dir table="cttt20" code="stt_rec" id="HD0" order="ma_dvcs, ngay_ct, so_ct, ma_kh, stt_rec" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="số dư ban đầu hóa đơn" e="Invoice Opening Balance"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l" row="1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="kh_yn = 1 and status = '1'" check="kh_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNMJ46qpkBZmfqcH52vOcsDprX4DnnDKe6ZLY27R2ug0QQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nvbh">
      <header v="Nv bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status = '1'" check="1 = 1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tk công nợ" e="AR Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and tk_cn = 1 and status = '1'" check="loai_tk = 1 and tk_cn = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false">
      <header v="Loại tiền" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l" row="1"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="Tiền hóa đơn nt" e="Total FC Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="Tiền hóa đơn" e="Total Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="t_tt_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" disabled="true">
      <header v="Tiền phải thu" e="Receivable Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_qd0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="Tiền đã thu" e="Paid Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mlmdK+IHRKYAMFDr+OTNPo58pxkOIh1mgr39H9fIkdrBtfDhMBU5xZ01joOrEMNA==</encrypted>]]></clientScript>
    </field>
    <field name="t_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" external="true" defaultValue="0" clientDefault="0" disabled="true">
      <header v="Tiền còn phải thu" e="Remaining Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_tt">
      <header v="Mã thanh toán" e="Credit Term"></header>
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
      <item value="120, 30, 20, 50, 330"/>
      <item value="11001: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11001: [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="1100: [so_ct].Label, [so_ct]"/>

      <item value="11001: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11001: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
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
        <![CDATA[<encrypted>7PAD6dley6/MsM+rLOa/4BViOqExEJY7khADaZTmCDH8gnYxcd7bEpY93rmFAyzulWXol1EfkMYudAOvBD7Az1DqY5FI7TOxzWa/5q1a5U5QzBT2r2iASKp+GEaZ6TJj/Ny8VmQNY4AQ+Ju8HjF4wXyHY7IEgrm1HXsR+cpPjDbZu79bKMeHxUft1g5DJNM4iPnblRx/7U+4vr6/5x41PltJ/skMwizL3c4d4QfDwzSbBE5q3Qp8aj4axqZgiLxHReKhwtpGVfPKUYpShbSKylVfnGef0antSagR6Y2F6m2e9E40jRGU2DElyli0+FVMPUDNGhrZfQlCQgZAbVjZHMnddmvA0Euqnfx4HEqFwSHYivGiPZ8ZqSpoxj2uqWdVdrbE9FY2j6GFiGEbAVFptCAS42sc+UcdSXxtjPpHzlDxelC1TRZM6tswJrZHG4m2YeukyteLWtNZmntR29bd81460lUibZyJvDOMz05yOOH2L8VvnLK22kVVKi/gt1KxNxQ79EpeIDKtUvAEoC5OLP2ymPDRR8zq69DghnxO+JXu9TUUDpKdqoWJCV269rCe</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F1HLuC/gfn2C4Ky2BUkZAdI0iI6oOrrDNHX3m8BQvMk/CwJ/4hOU3220gu40ozDlASY0SHZYUk0EQxJTjoVGSkE=</encrypted>]]>&CommandGetIdentityNumber;<![CDATA[<encrypted>l7ZiCm8iHEiFTwycQFGHEvaa4RrdDu/DdVC0khoOeY89t69n0oO862dThDExU/1zi49cCm/r+yS0xOzDSO2rYI1w6ez9AAwHilv+OutkpqCIfD5wKZzsGOT5CGzLRyEv6jFxxKPyg/D2L589y6w3tntwLDxqBepvldX2Gyh6o/avvnM9M8Bbytb3jIH0G1klRtOGJVmXUqiiX1H39PtrtnMM0ThPaqpLwg1Wdfgedz7moVIThSadFese5IvtMOFL86V0z80Jw77GKGX2geyW+zW08Z6io5YXxFNDAcks5J8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>4oM+4ATFja3vSbwL9c5jv5h/QJf9ZK2gfbIwddZI282JfStddqVvFTD9pC0ObIDqA0UtgNha3hAlyW3PO6gZKFBz1VrzXIzBK/OzmV7DGNo2gPshkpMRiMVy2y5saSUhHLvifOtekP1uMwrUOSdPrwzTEOKdxhWLNpDbnUHVfcBvL7Ex7TKbIb4dwTzwKPu8U7gdduALt5nEuwUDzdVedQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>inBElqnwzoeQzooFhD4rLaa6AeOYobnRGGX076Z/T4aBGn3dfjGRMActr9vsZIKOs8Y6AONCIYPXHmzdKioGHYbJkIpA3NrBvasvABY1rp1iecIttiA7Z/GOiM/yxLKAXWPrMFPDf/R1TwMDYcuRiFtK5CBKDJMKtoKHTYLFYfZvH2/vc+/mFonudM8BYYk4uNqKCnZ1KggRKwtIVZFDnBGWJj7ZbIJJaVcY9+DJ5ugjAH/ZTz4qovTPn1RV4hcU</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>jWeVETvSS2Q8hjfp92KT6Kxh69G1y/v1jzoTlGLj4QBrZ/bD4vbDPRK5GRcW5asUTxDWHGDQslszWrdOWS+/BvsWaiOQgGrd1BKpMzAwL9q7D+sbiHFI32cjre+qReyjUhTo/EfFI8UONcIJx/ZZ1ZS7HMsui8/RUFJbTawZM613NpvoH/w0ftC7rjZRNB4MKNHes5xB1azqWB/maMHr/E1eBrOfKd4DGPghlVhVMvPtaiAu7xeRiVXK1f+xdoVa7pxmxp+jx0AJR5yaUk1E0X9vip+MCtoXMXfOLnIKkq4FMP4SiYxjMV4RgCAMfyD2/O9SnUvEKg/u56YYmAt/uoeAJYFj+nweeZolFSRxSvVk3jsHYBHx+dJPvLS6Ubxp</encrypted>]]>
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
      <![CDATA[<encrypted>Dntjnq2w9zaV2jjj49OQR41p4E2IuG4Hrb+Et8bk6yNTgqXEmnDm4rEyzU9ZG0YXL9MFivm0643p5lMs1EkJ/8eXnc2ywIylYLnLWeL85sQ8kzE+bBTjVCTxDNvX49YLe6yM5SU5gWDFUJABQRhvvyL8BT9FiFrxVF+qXtbuGHImJ32lC/PteMeHaJDxVM+gEO9Og5U+w10lmRqum68A943O7aYvl67V67Geiv9Nus9DdVzO6i7mPInYP3+JLxE6EdSTas+yvYqTtmSsTXMVKpnz3Y74AAzT88t4wnbFPbdx6GL7pt7Y0lvCIXSyAN+uckJmao3syhbaPLCZIZ7BUiVWzAJZvp3w9fNerbyG9+rmAfk6AUouToslrwD7irKlMvpvqvFz2cIxgsVJV7cSuuQkBdOSDBSb2xZvdcPWlOZIM8r061tBq0JkbjLH9Nog1AtnBYx5naaarpEeSW5lXpgdbJ1MBGF0CHJv2z4S+27p8OPkSqr6FY7EbnLXiz71IwRyKrHafOPma53RH44zqGabHFOdpomETx4yyrG00hYi2Dy6HRyIocEt/lvos4JNqZT3pJjgB0g9e9a12O39WmGuHUJFrRBzmPXG2UjiXPgFl/4jggQovUcq3F5/rhdXW6Bbh5nKhm9hMJ3B6s9CMiOaCqovVo2PAl33JQmfNi4rCLkaJUv3d+2n42mN2XcYrFF+7S/OmUIdFYrfrOoTLIPx4hfemtsw8Bd8m4clZ3FhzAi9kphpIlzKMR5zEysfLGkwnVpgI3NY4ewlB3VS/1YrlD4xslk4AzQO28V7OPYKlNAUBYDfBZEACUpBjoj2TBaMqyzJLPpnMfjmZtcHK/n22agOTBNz4gh8K6Vp6Lb2Nkg31ztvKCQPeqCYYxwAnx8snVegdy/lXZ6RI9fKRuzaWTrAOWNXak8RO7eQTabEphEWgXnfS3GeiWhsRfSr7V1NR9BBnMINvDVJ2Q1FUKJelU/fKxplcWZsqg07+8demEmUwFBikJWDDFP4cijTTXvKcYH3IBqIkqORzSO9uF5HHGJwVW2Ymq6z+9nndEyRB06gxciw3iJBIMNs0CrCHhoiqYNX/jIFhNpdzM2Wppg5Zzi2Gyk8WL4ZeiRY/mlbUoZ7HzRO7KzqTkCiFKAJN0T1IZmQDYCe9uV8PdioyCg0t72LQDAwrJ/8/Ob+QO71ZeOqMDvBdvZAmrOtAyo5YcC3HJdd0peXcRdwQpvXg5/5UAYPFMrPqa7W0jwSLNcYCGF3bCg7I063VMJ4IOMtTPO2NqtB9C9MNvENES0e9JV6KqCwB/Vr/YhYSmxNMwr2MKZjdhdZBbZ34lXMzi4tYks80CUH/BvLmQ/ke5b9L7lmL/C/bynBJ/cYVFkbYl2IUqHnzXPthI8NJTt2n+bm</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Customer">
      <text>
        <![CDATA[<encrypted>ste91IIyltKa7JxclAzloSt7bimU3XKrumICU5DMX4OnSbvuRDgkuU5VOFaDtflo6Lvgi1+n7nQA/nobzkk4pehI9t8iXxPcZacC9L8NTanuhQFtL3YyRLqy9tAZu5tIHvuZK11RLs8+FlPnWvE8BRj1KrEoP0sYiUp1osnID04Az4HG8EJWvR6Qu3X5FY7z2ywlmPPC0AxnNt4V1CFclj8wNbkYsP0GgsdOjQhdbT8ShJGe9ObnaprH8jvw/cdNnfJ9pSHiS2wBJvnPUSgBBg==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>
