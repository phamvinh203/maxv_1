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
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd44$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post " 
exec dbo.rs_ARPostFullyPaid4Invoice '@@prime$partition$current', 'd44$$partition$current', @stt_rec, @@id, @@userID
insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete cttt20 where stt_rec = @stt_rec
if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec
end">
]>

<dir table="m44$000000" code="stt_rec" order="ngay_ct, so_ct" id="PT9" type="Voucher" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="tất toán" e="Write-off"></title>
  <partition table="c44$000000" prime="m44$" inquiry="i44$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XDGAh4G7jSmodAiU+Ts4e5zMQx549cACWW5afFbdCh2Cw==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="ma_nk" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @@id and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
      <handle reference="so_ct"/>
    </field>
    <field name="ten_nk%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="d44" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="297" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="WRDetail" row="1">
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
      <item value="100, 110, 345, 18, 100, 110, 0"/>
      <item value="111-111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110-111: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="110: [dien_giai].Label, [dien_giai]"/>
      <item value="----11: [ngay_ct].Label, [ngay_ct]"/>

      <item value="1: [d44]" />
      <item value="--111: [cookie], [ma_dvcs], [status]"/>

      <categories>
        <category index="1" columns="809" anchor="1">
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
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3OqmDartyEUr3ckuJgmUD40pUbpsccuA5fVd1xrpxDOHQ==</encrypted>]]>
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
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>hNAJHrX15q/Tj/HSRhu2O8b2vYqLNOYRPH9HvNsndXF9QjzZlsTGSAuqtc3Ae4SQ8SL+7pnTXTGEZaQ87OZcnGA10dfU7ix4T3jWWVE9YokZf/tmdBxaT5Yj8VnOzWYrdTaoBm5Isn7M3lmpLJmowTdAubG4pd8ql7H5cxmVpGBLFv+4ecdZM1ODAD3DjG6hpx4yVC78QxARw39e7wLUVA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>FFheiTy+5Vkq6wF14IjLS9R2rAEmZlAGb5g64bBKZzfX/f7b+NSsrzW+wwi40SoB6MDvd8M+oqiCMC/x6GmoNSuc+CMHk1JduiB407euoOA=</encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<encrypted>6qd2FeDm85VF7Aoy7lu/dLlfN+um/esB3hXA4Rk0aS5Sn4gtTyPCmv7Ewb444RIULX3KlS9SGxdbBtKwXh2oIPaBOh0QubgMa/KKrRDngoX3Lf3xLUKFF+OBvEkkrQnoUNJ/dk/CaffoLr7BYKLXzjYO7nYkpoi4O9wWF6BuqS7xTKG9OKh3M+L1rm9qlZOKxQkr/CTm+SgJ3gPaprSjm0fE5ba0FZqVDA6WhU+MXN+1Y23IgqESptW8G33IOU3rX6BC+zeTp4XaWj2e1lB87g==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &Delete;
        <![CDATA[<encrypted>aRHOPduaPOHwS3jrxJxIpq720NF/9Mqdz7x5h6xzgpebEU+z3WS7180NkiXYDpwdy1AEqApjuxxPJPaVg3sP064o5Z6MB4zm5wyxHcf5Im3VvlG0cpzVo4HtvSzwSAVYSLEUcWk/sJTskO2u7DdLEHJIqvcnekd9MriSCa4FhX9Y/I2Bl5/P5vz7AGAukPbJbj72Aw7lcvjPDEmrinUAx0YLASpwHrZ/OGUctKXd0YJwO/sL++AbZ/dVNs6Q6L8BWyLSmsZWRd9SxNEBgSc+UAYb9neJoFmwd4LmjD/0QFxSmWcsGdeqAQLZfWJpnMK2/rxyLeE5nRhUkGzrv53jOw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>klH21CizDNRDnjCdNSdiMFvcML9GEfV/u1bYHs9bMubLW/wP5MzdwRI4kaJ2wcnGRr/U3xnPhjjFaOAEFy8WxixEXPrUThPCizjG39CD/En9o3JQHeKxZLIeMI985u86csRp3Ehgllw9YokDDPfv8DjJMzroQ3YHaBBCeQIcd7E6O5Bx4xt7/apdh1QiRvmeKK05VnKyWCaxHWceq3t0XQ==</encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<encrypted>fU0B0TZC3aDwFoklC1u1fCs4UnmF2ABvQ4r8fLE2sS0pOfKfBkoDPJ7Ut+mB69E00Y4EYRRWD6AbYzPuLB6w5Cx6vY3PgC7VnxuprG1QH2F0Q9nfwQ1iSgQp/uzW93cc3Qvh+YYd4AqfRZYGQhvED1iN16evvz8W316rcq7i1k3w+eQZp7g4KYTNXRJjYKiG</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &Delete;
        <![CDATA[<encrypted>lZ7c8T759zlEdnQCsgOOvXDBFIArbbAu4jn5yvhQUG1Bd8cnFfK2S+RMzYlVF1uJN1yTGP59zWAD/CgtfxaTTl2olfdFcswDuXoKkuzrSVg33C/oUdlvdlPMiXSxCSK/</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>wZpsgbcgkTU1wdxCtWiogAETbC3/suRUGqqoH1GSo3KaeoI0OhqOk1APf6VUhpbIQQda58tWnM2s+gLs1GvUb7fbMyHyA+qMUoey9hycqpjkclV3s/GE0AAyywJ56lPPMJLybFT9aQZGcmRnkpBxQSFwbsu3kQuNN6NkbvluHZizBUPWBxn8FqbJOa2v92dSL4JvFnmhMYUxToImI711z8FwzO2wOF3MkLswpRreVas5NCZ4qKfdJhee0v1eymXY9tHKnv3FvTs0I5dT3HL/SM5X4+i4wK+B5b4SeJEhrRX+NL2e5lIBXPXfbTHRcAYw7+V4DK2sA3rLHhrlWJ/3ESoyKzg6jfiFRmbHEA+LrMf8bCkOnC/eC//UsuFYjJaI7nShIKV7NXFIb29qKNE5riDlH/UmDvmYVr4Uwzs9tgjPoXrgfcS5ssb7CbxBTq6hb95YOQayKKUuk1AHiw9frxr2yOTqEzh3f4toeni4BlTbQPj0Nu5PVrxWrljQQN5zHmkITgZbkIwgi7KRa5dPPo0ppmeuyZASerUvFEFqAO5BWtIs6h68B4pMZB/Obz3mq/daj2G/6k6qUYjw7pQE7znDyg9X4aznPPx6JYk6bY8=</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>jNE1nJmksfPetXWIR4zLukncFuT06eeeVRbrdt+JPU8=</encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<encrypted>1chb8eRtgbDhHHylYjxMxNblFZWT4w4BGIzDuRzAWKqToBOzlOGsa3TwPs54SJv/jFLJFM89HvHU+cteRx+C5PPGJOZ6vxo6tuIJgrNmxnub2GvW6ekMs0x4xb6pAwWZaXgdfWF+lGa6nOP0puqF74/IkJfCt9bFbpgzsJyml04K8sVBk7WmmY8HMl4ySdBWZ+x+EVGYcG5Vdpu7feDbP3NRf3scMBS+ZkVK1ZrwkXTcp48haiM8qHeM43dGZSI3JC/NsALVUFx8QuIs9DauvJFmn14Gvu3ZneqUmgztNZE+eAbKVjPp0xZlvNFakdcxO0yGnUJFNWs7OEUDny+xkO+JvUsG2/ktVrr9J5gG/V+1iiwCNWgA0hmh9xck0ZqOzbqAHyXmpW7wy8HDBWTv2Y1G9fMPZBc3MdOFFOdvbScDRYRcJyXULmAl/zTAbRVeDKhCvZhWkrRhgTK61FjuhF2HZXdX76sUGQ5g0L7OCgQXOXprLX78+3ri4DAr8B7elrflw6LDH7jwtFZ5ko7e+ojuNRtJxEwJyeV/qJ0TNYDiw4ANOLXIU6VPsYAt3JIxpK7r3knJm760bKzfnW/QGNrLgo5C50XpzUAPPXcQz+8OFvt3j/j/78EwgkeZRV287elgYmRNaioiw4a5t1ZZgS0l90QKI7BlRnfG0axfgv3P/Z5V3acWwV60sri1fTqbnlu58QmAmMNnKc533I+kUooEe55/MI/5hXmVJdaFauswWAj5Cg/An99ZOKexUVMlvgHUCoEYQADB8KFyCCbyFUBLnBtFR7h0nqvtqDsoCZYxzbz92mTl2FIo/MusOr5PVYrH3UXgEvLswmIhlKsowA==</encrypted>]]>
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
        <![CDATA[<encrypted>iBTRWCbeva3L2KcXZV5y+9uxQejqtFC0oxgSM7aMD25r6RolYRLQplmUsAohvbTHAQ1kXafPfxAHCYQp85wW2Sw8iXhvyBNgXq0lFse9HQzOEI+xeQZK8Fj/DUii/gVLlVhX7Lv782aS5wvQ+nExNw==</encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
  </response>
</dir>
