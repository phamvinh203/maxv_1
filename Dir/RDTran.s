<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
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
  <!ENTITY ScriptExchangeRate SYSTEM "..\Include\Javascript\ExchangeRate.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucher.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd43$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post " exec fs_PostRDTran 'm43$$partition$current', 'd43$$partition$current', @stt_rec ">
  <!ENTITY Delete " delete cttt20 where stt_rec in (select distinct stt_rec_phieu from d43$$partition$current where stt_rec = @stt_rec) ">
  <!ENTITY CheckOverflow "
declare @$overflow nvarchar(512)
select @$overflow = case when @@language = 'v' then N'Số tiền phân bổ của phiếu &lt;span class=&quot;Highlight&quot;&gt;$s&lt;/span&gt; phải nhỏ hơn hoặc bằng số tiền trên chứng từ.' else N'Amount in voucher number &lt;span class=&quot;Highlight&quot;&gt;$s&lt;/span&gt; to be allocated must be less than or equal to payment amount.' end
if exists(select 1 from @d43 group by stt_rec_phieu having sum(tt_nt) &gt; max(tien_nt)) begin
  select top 1 replace(@$overflow, '$s', rtrim(ltrim(so_phieu))) as message from @d43 group by stt_rec_phieu, so_phieu having sum(tt_nt) &gt; max(tien_nt) order by so_phieu
  return
end">
]>

<dir table="m43$000000" code="stt_rec" order="ngay_ct, so_ct" id="PT0" type="Voucher" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phân bổ" e="Allocation"></title>
  <partition table="c43$000000" prime="m43$" inquiry="i43$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi" defaultValue="''" disabled="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Create Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XDGAh4G7jSmodAiU+Ts4e5zMQx549cACWW5afFbdCh2Cw==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày phân bổ" e="Voucher Date"></header>
    </field>
    <field name="ma_nk" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @@id and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
      <handle reference="so_ct"/>
    </field>
    <field name="ten_nk%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="d43" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="297" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="RDDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="status" hidden="true" defaultValue="1" readOnly="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="378" anchor="3" split="4">
      <item value="100, 110, 345, 16, 100, 110, 0"/>
      <item value="111-111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110-111: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="110: [dien_giai].Label, [dien_giai]"/>
      <item value="----11: [ngay_ct].Label, [ngay_ct]"/>

      <item value="1: [d43]" />
      <item value="--111: [cookie], [ma_dvcs], [status]"/>

      <categories>
        <category index="1" columns="799" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="445, 8, 100, 100, 100" anchor="3">
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
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F5TO6PUvuzECvgYM/jXufIR2sbQ7ePOYID/27RY6ohYT6mrheop2Zvl81qxGfIbGgQ==</encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<encrypted>Prfg37kMJ8WBqoB5CvJCKf7bGLn7xzhd/qTwELa/vRyx2yQIA2RHENHp4ogjvxpOgLuPugRZg31KNe08ByME5w==</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh7u/oKtoI2Jct/atPcvdSHfrbM7qdzC0OS8g4IVC9xQWQ==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F5TO6PUvuzECvgYM/jXufIR2sbQ7ePOYID/27RY6ohYT6mrheop2Zvl81qxGfIbGgQ==</encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<encrypted>jsguT1F3i8nGtqLMkxZj7ZE3/7wegKNgL0bQHB5rxUHCKdWEuCuz6Y+bcJ0Ai+Ew</encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh7u/oKtoI2Jct/atPcvdSHfrbM7qdzC0OS8g4IVC9xQWQ==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;
        <![CDATA[<encrypted>BijPyNwaVrFHj97im74mjiDjoroxI5atk2rcAwo6RV9uHhNTpHE1f4HGRpTlaS2re6nL/UnaIPeW+cgP06DoYjNbTfXBdT30gd4HYwaENtXkgsKBYR9KJWU0AblhDWmFzf6JVAGPVpC8lKbaC7RBLyPAfdwt9d9inAEEMt0x0fpiYAog9mZOigKDwitrb9bb</encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;
        <![CDATA[<encrypted>k2qhto8vJWSvxhiQMYKj++6ijvwzOl9xQI5YWlHO0Us=</encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CheckOverflow;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>hNAJHrX15q/Tj/HSRhu2O81zh61Q3Mpl5CrgN985YYQwKbaYO3V42AqU5qkNNGIUd/h9bRcmDrrFYcnABJGJkLG60+EPR/CmPpRTuqKQ9hRwbim/MF3x1DKBIl/ibvQxdEefSocCroTcTJeaoE4tFuwyGoMPidBRiSa3GkC5aPDATJ+qotCIhs6ONGmEEAdM36Rocm8aa1TJhkcsXQXrtA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>n7RJ7WLNlwu2emWCng8W2IBV3rJQ3CCtyHAMwQKJcUa8vQonaIRC8Xl/b9Q5IVRW4J+uT5gp+9xzrlqaRUQgF3uHcIEkiIndSu6Xkx5NZaLxQjXkn9CooOZR9TXW3hlzoNAih5xgrtrRbSn45p7Lb3q3CM+IWUI2YQUjFBncLF+019OXTIrD4mOxHhywnyVo</encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<encrypted>6qd2FeDm85VF7Aoy7lu/dHLHPAtdfURFWaYV06OQF4Rpu8bRNf8nVDPokg6+BFbnVNhpm4BzAqAEA3RfDKatI+mA9K7H5NOp4DO/kHUFNrbnmzEJZH1ITodC5g9TqsWlUtdpxAuZONKFL+OoiiqClgwjomLAPy8IIS2ZSoND8e5Xl09taMKQK20apCrd2gMLceM1YQFnhzS9qQBkRxQ3zNwnjgQV7A7K5mCOJonKbpUGh5+0QY8Jz/om4oRl37d7G0C2Zb+tjfNK5P/jRS/S1w==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckOverflow;
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &Delete;
        <![CDATA[<encrypted>aRHOPduaPOHwS3jrxJxIpnte2Ulxyku6F0H4sGFN2szz/QvL4mFaCF4zpcEwAXS/sCyv8V3+VRwSzZ9FH9Rg+DLG1DkRF7djomMBXA/xes+qFd8j+cDcq/nEwbJF/HQJUdAEG+LeWsFcjG4Tt66yCDNPKbO8ap7fGarahcBPWeffx7j0nRnaPunuv2zsu7nFI1wOnhmJv8jrPHcoSIrqgSfK6JEj+aQry2WyceN1FdS9CGQu+2Xl04JzY2vVf9d68vR5hEYc0PMWRgMBpC0f/TPn3f8VkeKykIng0r5kNj2FtEwo6wFRwnWFqkJIE2RtkBfrOKaozYTy9Q2rmogf6g==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>klH21CizDNRDnjCdNSdiMHQoaRnkArR5sQUeMWga0D9nuWaltksfK01/6ha6cd950ocad+SFfhD0/GEgc6NYzcUAyl95WbnuPdUuVOS3Up/Ael/SNlcZBjg40muXCszYpYHXatL010q2OSAwgraamvKBLBqiCTL0a18Yvx+mdtsvMLqXGTQDcVwnusqIiZLp3AYTUK1PSdWtxsB2QFNChg==</encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<encrypted>1/Mw03HpSueUolW+djmoCdI77y/vOhFILFY6zdFBOGB1WOoe3I8QNdBhcKgoIbXRZPXKR+NEzIEelWugBcTyDKqGp1KB8HCupRetWDw4iZUx6rRN8LxCZbLDDYj/jD/8+9SVRm2nnsztnkF/JXRG58X3Dqq5bqnHbQchxmD9ZPKUEGoYf+LOgqzTMsHPnKfy6xe71zhcAudMQosbqSA008c38TszkTh6x6O4NiZJvN9o6szGLL36IRvfLq058pKLxjwnZ63jSGFF/Kb8oM4Xz8L5n0dVXeklSLkofEfLRdI=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &Delete;
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZlSgSeZjO2i9fACgWDzlrnCxciwpyiXXlWy9owsFGyv7Le+p1dQ2F70ANLcD5KsAfgpO6ljIeesH8A44g/dMBDiDCxXrkRj8GOxQ1L6ZVtPqL4ek6/cX2+PQkqnngx5DhB/w3NYH1wMtty8QutUc8kw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>wZpsgbcgkTU1wdxCtWiogBWu6T5O09xMLzgbGcfhtEhd/NuAJrvNoQkmDCYy4KjW4LlllTCIx18KwobAC3GrRctxQCOb+vGz+H2oJJXU7Mg/51hFt67r6MZ+1AIS4KMACvSt3nbRO52pBXApsP1//DzbU25/3C6m7KZ0EzG1IVY0wo17Wn1bV1c2pqeYgcj0MfEnLl7+R/mPmB++yAGU5uzHqrqUvw7r5k35JKxwYNgtBwoKJG00cxeFJ6hkLj9O+N0ndHzwL8M5K+lqJUjgHqcwJu6K1kulf1vsGdFuLI7v1JcrtjzC9f4az7O1GzNKYOSQ5b05Vta3TgC/LVdlDIeIhDGS9gyxK5l2Ellm04vuLMylBtQox53EvZT9eS4QwAzMNE4eM3eQmFgk3Cy1s8VYns4QexTejfYFcFn6+XV6nIRfhoYq/XAMMjflc05MjLbjEzTcPVApAdRKfU0MbnOrvgkPn7UBvlt9mdPLFjcZ9xnkMuliqIkma/UohC60BUn8InFkqz7AhDIdYc4vdrOhmjUm8GqW0T11TwEZRXb435btrgnI6DGW2kBi7n+GGuKvOOm532zS5N4CJLb7TRnsto699vAj5a/lyL5Q5+M=</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>jNE1nJmksfPetXWIR4zLukncFuT06eeeVRbrdt+JPU8=</encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<encrypted>ZMUvnq5KdfWBPMn1xTnZRWHfTDw4o9Ky1QX+YR0G8etzcedMD10F3xq6cOVvozn6GEiQlmLFj+KQNu2ELnxAPj8loeEy94ZgehlaZwkGfv4ow7Ev2BCScqR7I+kgKKJ1JsK6H/sjSVXeajETtbErjWg5F8hIGjYDeJE5MCH1F8ZHw335+9VZztkLiANplqmd0tdL/ejTkxoM6x3Usn8FdecvICIeCj2dF++QfyZwMNXBzCdLGnJD11Y+1XqhNQJMsB3dV8VAh55VQV7hdGa+9fCv7xmNwgv51DJMWIaugNL7pjrE/IqfPKqoFSqywnTi+Du1+seZmp5tVTTYJLiRKT+JecdlV7AElU43L52y+JM/+HLagKECwKj2KBsHQfVZ5MuKD2EgxOUvdlYf3VpCQ+BGWoBgBz/cKR9nSWV3+U87bkyjn1EnNamSF6bI6qWpTpSIusRMIJdVa0YkRx/j5Zxgb1wuPgGaGDHmMISSwDubeprvOjWoRd19hzGCRrFSQmGraJnz/0iP042RssHZcJ2XP/UjavaG9TD96eJl80FJF0MUG6XjsY+OaJaEQlTe1VkK1UdHRk8zg2O5tT22aTCeajdPFuTvChKHeSMDdpL+c9MTn2gV7MEkfH0u95Mmu51WLQWvY6FoDf5+UpWQyj3rlLZCG/hdQQ1pTwSK8Jo=</encrypted>]]>
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
        <![CDATA[<encrypted>bDqN3g6biGZbDO9vMPLU1br5t6/tNWSUSwbwhxMG0MiNU3R5udA00dxPW/SJ5cAJz20Y99+Aakab3Ta80fRgcSOsQtoJSCrSvI+DkArqL1pr868jm79WVu8doxBJGiAUrdBobhDJMuTrRnDwzWxUug==</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
  </response>
</dir>
