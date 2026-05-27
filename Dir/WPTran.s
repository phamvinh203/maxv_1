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
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd54$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post " 
exec dbo.rs_APPostFullyPaid4Invoice '@@prime$partition$current', 'd54$$partition$current', @stt_rec, @@id, @@userID
insert into r00$$partition$current select * from ct00 where stt_rec = @stt_rec">

  <!ENTITY Delete "
delete ct00 where stt_rec = @stt_rec
delete cttt30 where stt_rec = @stt_rec
if '$partition$current' &lt;&gt; '$partition$previous' begin
  delete r00$$partition$previous where stt_rec = @stt_rec
end else begin
  delete r00$$partition$current where stt_rec = @stt_rec
end">
]>

<dir table="m54$000000" code="stt_rec" order="ngay_ct, so_ct" id="PC9" type="Voucher" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="tất toán" e="Write-off"></title>
  <partition table="c54$000000" prime="m54$" inquiry="i54$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <header v="Ngày lập" e="Voucher Date"></header>
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

    <field name="d54" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="318" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="WPDetail" row="1">
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
      <item value="100, 105, 345, 8, 100, 105, 0"/>
      <item value="111-111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110-111: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="110: [dien_giai].Label, [dien_giai]"/>
      <item value="----11: [ngay_ct].Label, [ngay_ct]"/>

      <item value="1: [d54]" />
      <item value="--111: [cookie], [ma_dvcs], [status]"/>

      <categories>
        <category index="1" columns="779" anchor="1">
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
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>hNAJHrX15q/Tj/HSRhu2O/CATpQfLXUOdqLnzr1ULJB1flxdIdOBJnf5hA0hk0jc7xnNfrai4Su8NV7fs7h8w9kn+mSMVooJi+RxMYcseJb7xHYgSC/+gm9Eo9bCYPwtiQbM74uQXn1uqgPcTVZqcpHgQEH95qc2+sJrN8YIYhACnsOvMWY1HR3ZVoBxBCAKdNgXvpLlXTkJ3IH5MUg7Rw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>FFheiTy+5Vkq6wF14IjLS7BmBCUSYUmhlWEQC1jzdQaBUPPdztRd48wMLDR+vN8DJhGJ3gvgYin0NqWk/kAjZk9bAPv3IOHwrROo3yTbmsM=</encrypted>]]>
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
        <![CDATA[<encrypted>aRHOPduaPOHwS3jrxJxIphdwm29guSKThVHfbeVrIINeAJYG5COxwSOxUnbGAO6VbXzHVJ050c08tSQTN9tJi2JDMOQ+krdxKDJXQBkeCaSzAmsxvwCo7NezPunrMAhUoBL8z7BGKep+rKFRX88GgHthPou+wz7d+D3VrSs6KvMGWOxxAcTCPmwCqVCoao1qlmRK+Ccuji9W54RZzj2cYNCNJRVpmE2WcDs7eMTwZSVnOYuzyll5vr1+u97Q0zaefwq2dju4e4Dx9TfVOvB8aAo4qRU6JUXDyjPQsiUjwWRZdIKzH12TzU8oGDLvRh+uAaqenAiSTR84vZEKVlhgiA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>klH21CizDNRDnjCdNSdiMCpk9mwX02inEBCjGMHUCPL7QQSU28l5K8hRkIIijZpeKNiWxP9Qe+b0cBE/iVvYmRVMHZdQ/PLqSrO0AqByoJfwa0LOU49HJjDmQfEZhwJ2qaFlJbE9Eu4EzsJUjZ9IREwlhjeSK+d64ZuoimYy8B+8TA9lZn+tHJTeUUk92xBabDUQClI4jOlY0SJ1NwBlHw==</encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<encrypted>fU0B0TZC3aDwFoklC1u1fCs4UnmF2ABvQ4r8fLE2sS0pOfKfBkoDPJ7Ut+mB69E00Y4EYRRWD6AbYzPuLB6w5Cx6vY3PgC7VnxuprG1QH2F0Q9nfwQ1iSgQp/uzW93cc3Qvh+YYd4AqfRZYGQhvEDysSd70lxSZSnquNPFe3691kCEy8WbPOjZZcKz/JbOXu</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &Delete;
        <![CDATA[<encrypted>lZ7c8T759zlEdnQCsgOOvXDBFIArbbAu4jn5yvhQUG1Bd8cnFfK2S+RMzYlVF1uJN1yTGP59zWAD/CgtfxaTThEfUB1c5MYCzyIJzOkt+JvRjTJrYQYhU76j+upq2nCF</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>wZpsgbcgkTU1wdxCtWiogAGVZ+NNq3hetQ7VwaIE48iqtmk4vYPV+ljcbQ5SW0+J9eGKG9o6KSOxjttrTzeDLVu1joA1U6P5qlM8UbpoBZg1yWPswAhJY4QvZz004qcNnzovpOU0pwQPC6SUL8TbpxgVN2DEwYs9YS+rwG1iTCrfmrc8UIpsZ9cViqEEyluTSjjXspgIyS5xWFdvsHNLP/LK8xqVfLJXaYZTaGPRdtj4EXfYYBrHyBnpZkHyqbIrkL0sNRPO4FjLVYZZC/DUNFllGRjwX57bM4+Av3lCk+W/0jadExl7GdCk8BiMRGuxjJbQT/8CS1InVI73BIGDiVqSeTL8OTfRR3WfHnteLJMILBiqCJFD4dQPnV+PtvLWtZ/sQCZiV4WK61fQXT6upOQLN888GV7Phv9KdPQbvPhUESKR+T9jn49shEBW36Ohb9P+KhgGBSpJhioyulw07Lz/3nJem/yW5sPztUh8nDjGCRUiwjhMJIo5Quojz1JCqNdyxtEomcRlVd/2KK3m/JKqVB0rCpj6UYE93aSISsbyM2Pj6oaoUhMoUP0XnNioLQJdxORy0l6KgHOYCQ6u4f+OFXkWu2KD9YpHf2DufEs=</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>jNE1nJmksfPetXWIR4zLusSumRNjLK1jhZuxJsCR+CKfvfmDvCeciYUMuPgG0Zl9nsQBdvGSyQ0k6GAlxUR7oA==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>jNE1nJmksfPetXWIR4zLukncFuT06eeeVRbrdt+JPU8=</encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<encrypted>bt0lB5hbQLVanw7hFe/ySw+qcNO2pKrsb3eLVHAQ45v85DxBSxPoRdXLUsiTgZTznh/UpgJlcX+7Haz6Vmb9IMIUNMhb0PaDF9E3R93XAO6LbzIBVtZWQFTgNoU/7MVydLgSOG4gNk7HHTzfr9ePbXBSCtJAoHtYDaFcZ1GrhMV1HbWOseTmQqk0jls34CQofa9pdqnxf8iZj6c6VYNNZS0WkukuBjYYQI8EMf23SgGEGGr/Vlv7vlJtDQdWUyU1ECbtG4jZ/VwbY2jDmmOYapMl/j4daTdi4wOTKOrOFGySAJMpN+nmZhYG1b4Rza2MFp81irAFa5bgBQxyxaBzXIx2o1d7Jrlv3m+1eJ2+6BYZUFzSUcENiOQRC+9HZhI7f5UvFgdf3x6ceo2k6+EeGD8UX0fsLmHaQXuS+q/0PDRKMYD0xXApt/aYNbSXKj2v+w28VzzyZR3TzfKsKtuGwFUjjF2N1kReiLEUwkQRwJSFyQruYUck4F70ngiB6kurtd8SPcGA0UGKT+a0G+QRDa9vCQXpK3z5inDfAvvU+YTaLKmU9XHxH+Fh414v5XMIwbUO1scFkKQ6N8aB2M7MDNOnnehcr82hrWuLuF93tRvr9G5FdgCnKiSuuhb1CSwtGDh5H037lpT26fFQWnbpEQ+hxZ16x5KZLI8prYzTeWjYYpVjh6wSr2gxjst+xl/tKT5yA7J9tD9a9lx4+Gp7qKxiS6Bo/p8rwDTnfK+nl1Hnd5TJxopMDaVM/oHyLiVkdkWa+X5lYDFRSgiYDBNoJzKR8O6uOhTvoZzuJp+ruLp578Xu1gQ0FyMbwG+lrj0KyihiFUPscF62itsvkGy1Rg==</encrypted>]]>
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
