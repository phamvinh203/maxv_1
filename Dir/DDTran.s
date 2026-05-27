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
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'd53$$partition$current', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGrandTable @@id, '@@master', '@@prime$partition$current', 'stt_rec', @stt_rec">

  <!ENTITY Post " exec fs_PostDDTran 'm53$$partition$current', 'd53$$partition$current', @stt_rec ">
  <!ENTITY Delete " delete cttt30 where stt_rec in (select distinct stt_rec_phieu from d53$$partition$current where stt_rec = @stt_rec) ">
  <!ENTITY CheckOverflow "
declare @$overflow nvarchar(512)
select @$overflow = case when @@language = 'v' then N'Số tiền phân bổ của phiếu &lt;span class=&quot;Highlight&quot;&gt;$s&lt;/span&gt; phải nhỏ hơn hoặc bằng số tiền trên chứng từ.' else N'Amount in voucher number &lt;span class=&quot;Highlight&quot;&gt;$s&lt;/span&gt; to be allocated must be less than or equal to payment amount.' end
if exists(select 1 from @d53 group by stt_rec_phieu having sum(tt_nt) &gt; max(tien_nt)) begin
  select top 1 replace(@$overflow, '$s', rtrim(ltrim(so_phieu))) as message from @d53 group by stt_rec_phieu, so_phieu having sum(tt_nt) &gt; max(tien_nt) order by so_phieu
  return
end">
]>

<dir table="m53$000000" code="stt_rec" order="ngay_ct, so_ct" id="PC0" type="Voucher" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="phân bổ" e="Allocation"></title>
  <partition table="c53$000000" prime="m53$" inquiry="i53$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <header v="Ngày lập" e="Create Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XDGAh4G7jSmodAiU+Ts4e5zMQx549cACWW5afFbdCh2Cw==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ma_nk" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @@id and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
      <handle reference="so_ct"/>
    </field>
    <field name="ten_nk%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="d53" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="307" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="DDDetail" row="1">
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
      <item value="100, 105, 345, 18, 105, 105, 0"/>
      <item value="111-111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110-111: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="110: [dien_giai].Label, [dien_giai]"/>
      <item value="----11: [ngay_ct].Label, [ngay_ct]"/>

      <item value="1: [d53]" />
      <item value="--111: [cookie], [ma_dvcs], [status]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
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
        <![CDATA[<encrypted>hNAJHrX15q/Tj/HSRhu2O9cGVV25QzYbAlOxIKlJK+RjdaUBOiiQ7QXzKxhknx2BGOnuwAlGsRzgvuJLqz9L1rzohLRkKqGWRSdB4hKOZC+8SpV8sfZk5d7SQPrVFajePOvCPuW6wC4I3jYyj80/kQRtQfjSrtbbFi8JPPF6KML4QUrYbfZHDXCbiAZ8Y+GAJYBeKZAIztRFXuSq/A/LWw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>n7RJ7WLNlwu2emWCng8W2H0n//HWr8XH+u7qVeCOR3H8tGYTKUn38Gi7GuqaY05EsgZw8R9nX27dpxQfGHpgJjxq+xnjsXOcTI1jljeMlE0VHl8y2czif+4QVYwytzFjm6fejyBFya96iYlVWPHcp5umI4rbA65BEO01ZBA5Z5sxPps7sQV8aYlry56EWCdO</encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<encrypted>6qd2FeDm85VF7Aoy7lu/dLlfN+um/esB3hXA4Rk0aS5Sn4gtTyPCmv7Ewb444RIULX3KlS9SGxdbBtKwXh2oIPaBOh0QubgMa/KKrRDngoX3Lf3xLUKFF+OBvEkkrQnoUNJ/dk/CaffoLr7BYKLXzjYO7nYkpoi4O9wWF6BuqS7xTKG9OKh3M+L1rm9qlZOKxQkr/CTm+SgJ3gPaprSjm0fE5ba0FZqVDA6WhU+MXN+1Y23IgqESptW8G33IOU3rX6BC+zeTp4XaWj2e1lB87g==</encrypted>]]>
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
        <![CDATA[<encrypted>aRHOPduaPOHwS3jrxJxIpvkqCqBeH7W9gBCCkLQUOlwbaueLAbrh2KH8DHwsOx52FxIDt0APRn5GmgQyJgP7d3zHLKacDQL8k66DzwAQbRCxbFXRI9XlNmBb2KgGsrMPgp3vLevN+b9NObXPwAt6vEJt39oygCAsgEdKIgaiuSs5rcAWinxfdFGFWcxc7++rgFRcome8WL86hKZ1GKoWsc1KyNPfIldokUsWQDvwYoj4xLbuoqYYrgzlPqLTFjJqAlygQ0q7P8B5akEQacl9kWfL5Q2Ek4eA5R5PCtc4X2rBBTQOuGQAgLSReXEvExLEAydz2NVfgSs/fGwjriKtfw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>klH21CizDNRDnjCdNSdiMD3Ct8LuDHvqDS23WxMeLnqwtbOqGnTkZLiGhCFu8MOu4Gepg1UoI9FWVpkU29dub4fL15y3BaMrbDNCqfDF57Q/A9aEOsXqGKBbMoVHoUKzMESyIl/H13vaq8ec2VEHZVM2cvsYULGr0MqbQPd92U7PCCZ9vwkt8fOnqZqqQJiSWWL3HHwXrSxW6bdJGcUT8A==</encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<encrypted>Py22VrQcc47DEIsMo8IE8u53d3qy7Y3eDoyf+/5IlAPKQQN+7hYVkbjg8ZWWfzzvCuMQ+4PPsXDHRpCznWU0/OZLYOH5F7Kzrcs1DdCu4Ls4rY89PyELjGOaIPem0ENvfUzC30o4AcDZmL905qGuHe98TSWSZlmbIZK+Wh9IgFKE2Zb8Nu/A393J4DtSEMozjjPKCl9FvSstI/i2G5e6pvA4WxgZa2khPw3IDnMow4WcZdWSfLLTiN0CBrSyVzFvSscjL8ZKepjiSMtuPuhZowY4O8jhVQXEVN2Qp0724B0=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &Delete;
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgc0h44o+C6ODLpjkLLwWkiC/ARgtTj33Vv5vP3i3alg8u6i3ur9zk2zCNWIAVJYvJGDROs+Bz55JcT5poqgNS51wVXuPJzTgv6oTmmbrxlMG55FOR09kQQRm09Gf2z8dUhdPO2FWEfQZoOX0GkOIb8=</encrypted>]]>

      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>wZpsgbcgkTU1wdxCtWiogFRz97UHKrRjVvk8XtBjKWCxU/tDHIB+7VN/TUUle/m0aNe0w+Oj11oIBEJyB+qVpxu+NOBkeZONZjo0QXRKQBdl8kUuHAnkf4qICu0jHBzuuAB5/6hJpCbgZRUI5+z/hjnGSQN2vtSOqegR1S69ZrPgNnSXR/WhOZepydPcvfEluKVSozykzOR1UaWu15A+tGIzPQrdjkjSvu0rDguHTcCgiKvvQ8VGsQ2T3wGquAbFxtxnQx0XpiycwtqQ7Vmfdj7B06Gc9YKkkB5+ZD8Y0JNSQSxMwQTxxxM+3Ra90FxUoSfA4hJnnBwIa6AtGN4NW8Tg5SQ4kbSOkeg505YE0Exk3x9AttBYvvc06Y+LZgMg6aRon8MPbnLoZci/m2P4K3C2lzJYxnpxxx1rInZurEUeWkHj5+IXj+7krAAOm6gCtlWlaw6lpNnFfilnT9wpRVdRdegPospXUkY0kdCdpERRE2thK+5IBHfBVSDXUYTh6eb+wreJDNrk4f3qHzLT3Ce4Aqy0fbqCqItUIFD2tP0slhzw+cwgozByjf48W3SOO2lopxm62y00R+5hcZROo6pxePloHaLMKevKK5c3uU0=</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>jNE1nJmksfPetXWIR4zLusSumRNjLK1jhZuxJsCR+CKfvfmDvCeciYUMuPgG0Zl9nsQBdvGSyQ0k6GAlxUR7oA==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>jNE1nJmksfPetXWIR4zLukncFuT06eeeVRbrdt+JPU8=</encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<encrypted>ssj4jqa7cUMG59gdMjMbyIXk6oXDp5qzxriNhy+1D56MQoRNgNZn71BJgSMZkekeUK1Avd5VTa1d6/nJ+0WlGzxZYuyYTlxTERIXlslF2ITX/h5uUKYsdBCnIOablRfUqLyUBDsB/7SYB2baYF7fBt6xERgVYLevsMIHV3SyVqTcUCUUiNCbR1mFZMjnyJQk6voBP4LRWpQLVfCSbKCajIsHvO0H45LQWXGfzeMrD8nbTDlOx+89hyzhjf50XRH9TwcqKO4Rma+Ss9na6epHTrSHO1FXVkVoOxpIpoupq+EQdYFLoBVT14soZDLqstFYtarbnBhzxV87GBT9cp6toW62gtkDhGqj32VqKFxx0UDiBiOCKyoZJAW6yBiQNGkpDkr1TwvYWfMYl72+3o71Pn/PLoqdAScPFuHRQ0MR+PENVxBKaFEvhsSKd05QzF/lVGI+TlIWSifRBg951tXVwYAinsJjg2qcw+NU9fgLG7/2Mt3SSbrfjSctVgRd0h9+iRiuqEetWENeWH/1aVJPy8yhHhWvtk8Ww052jLCSWqcv+IKy77oqSAH3rdlR4Q+fGjmwY9UJCVx/iOgMvelupdzifuXeVOChBhUNFht6NSVFFWdySvJVPltbrUQg4+29gqcqt1Pgr7UkMPiTS62SMg3ujI5Kvwjmf1gMCPN0Wh0=</encrypted>]]>
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
