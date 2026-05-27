<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
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
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY XMLUserDefinedMasterFields SYSTEM "..\Include\XML\UserDefinedMasterFields.txt">

  <!ENTITY AfterUpdate "
exec MaxvOnline$App$Voucher$UpdateInquiryTable @@id, '@@inquiry$partition$current', '@@prime$partition$current', 'ctsx', 'stt_rec', @stt_rec, @@operation
exec MaxvOnline$App$Voucher$UpdateGeneral @@id, 'phsx', 'ctsx', '@@inquiry$partition$current', '@@prime$partition$current', @stt_rec">
]>

<dir table="phsx" code="stt_rec" order="ngay_ct, so_ct" id="SX1" type="Voucher" uniKey="true" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="lệnh sản xuất" e="Manufacturing Order"></title>
  <partition table="isx" prime="phsx" inquiry="isx" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_md" allowNulls="false" clientDefault="Default" defaultValue="3">
      <header v="Mức độ" e="Priority"></header>
      <items style="AutoComplete" controller="Priority" reference="ten_md%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_md$dmmd.ten_md%l" row="1"/>
    </field>
    <field name="ten_md%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_kh1" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Kế hoạch từ/đến" e="Plan from/to"></header>
    </field>
    <field name="ngay_kh2" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Kế hoạch đến" e="Plan to"></header>
    </field>
    <field name="ngay_th1" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Thực hiện từ/đến" e="Execution from/to"></header>
    </field>
    <field name="ngay_th2" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Thực hiện đến" e="Execution to"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
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
      <header v="Số lsx" e="MO Number"></header>
      <items style="Mask"/>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Kế hoạch" e="1. Plan"/>
        </item>
        <item value="2">
          <text v="2. Sản xuất" e="2. Open"/>
        </item>
        <item value="3">
          <text v="3. Hoàn thành" e="3. Completed"/>
        </item>
        <item value="4">
          <text v="4. Đóng" e="4. Closed"/>
        </item>
      </items>
    </field>

    <field name="ctsx" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="182" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="MODetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="MO Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBGGptSZAg0ISnyAth4ueJXHEK8TNviRiWDvX2/1qN5Ag==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" hidden="false" align="left" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
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
    <view id="Dir" height="254" anchor="5" split="6">
      <item value="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="11100-100111: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="11100-10011: [ma_md].Label, [ma_md], [ten_md%l], [ngay_ct].Label, [ngay_ct], [ngay_lct]"/>
      <item value="11100-1100: [ma_kh].Label, [ma_kh], [ten_kh%l], [status].Label, [status]"/>
      <item value="111--------11: [ngay_kh1].Label, [ngay_kh1], [ngay_kh2], [ma_dvcs], [cookie]"/>
      <item value="111-: [ngay_th1].Label, [ngay_th1], [ngay_th2]"/>
      <item value="110000: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [ctsx]"/>

      <item value="------10-1: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="100, 100, 100, 37, 200, 8, 58, 42, 8, 100" anchor="5">
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
        <![CDATA[<encrypted>ugUNeyq5lmPO55BDelh2DbnTibjLo1JM4ygRBeTO9R0EwnGmQFB5smL9kQAeAFuAoKeKIlU7NlYgsCD5//VBsql+CRZydFCUPPFu0F0CvcA7EAth9nEOrgmDwu0emuPJOie26yCRiKlLsQ3B9xGit8XYeGpRBZlyh31h87nbj8XRlF20bBUd+PdXpSqHBzQzaRFsFRRF4YLZYiFAydTTQA0zDXTULu4ondMR55ZaBzVjUQqdmvNbuqcdQmxjbvgrHerrze99W7K7Fy+bEDgAIC61nkwWAEzRL5zvN5ZuSX3ifEyA9840VjFuUQvPk1dXO5rzAYNkBfj3/wQYct73y4Ig9Dl82d1o4/98ODrkpEPZOvm6P44+BM/omBRGtEhO</encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<encrypted>q32UDDhMnVozGGe9qogeplpDw8HiJQEb/iuy5WByfj4jUCxk3LYfyxKJum0hBcmFs9ejIPlV6Axws8sj88Ot6SI08wUzYwVXERLmt5SMSQK3cqOxZTV3a3y+PW/RW8REQvoHpzsv8xk7sZ+OmGeApnyJFyjzGdoCQZb1371U3q06LRV5pl2yPejTu7iFBh57cJfmz9DyQSucN4UcJDeNDOo5jDbT6hFFwqlhBYzBk84=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>8Vhb5ZBzyozjrUL8B7QiPlVv0RJv7zo27yYqz8HnXdu2EZFQQVQmHxylXqCrNOS1c74ZLKsV613x+50LlWQSaA==</encrypted>]]>&AfterUpdate;<![CDATA[<encrypted>EMoWhgcR3HcdnUf9Cp3IjNM5DJ9nuOA785bKXqt9ViKX0KXllerWVcqK//gDH6sU6+cB0/Cg4zCuf5+pR5ZL0MVtL01/SSgXvIIkjPEpj2YQwNY1asZaw+EZzQ28ctVS</encrypted>]]>&CommandShowWarningMessage;<![CDATA[<encrypted>FTgzG0Ebn58SWQYsf65nyjIIGuY/GZ6oxX0a/PwjGKzviKX5u9uIEUIVQbbNJofhdxu3S4ep6ls4RjJCLKh4YlshfeCbWblD3/5LcHM/Og0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        <![CDATA[<encrypted>4xorlWGJ6r8g4l99+r94l6s0oSX2Fttpb/+wSrheIf+GnF4SitNbqI873HfiSG3hSvY30azqQJQRnG/iWfjdJOYH+aax6/w6RHu7rFurbBIEbHcJt1hAafa7s3RiNFOnEL/uLM3ZBcAUIrZI8f0PAZ4XbHd+f2d/HXVzJbvwrLk08lFrTmbpQ5MQfXe9PRKrJeM8ZH5qsjfhCCi7JKAGVw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>b67RfM8ydoxh1JXxWGqMinA5OLzqdIHFuFgusQPiy9p4zN7cMzhFlGBc/n1X4iqpkV1WPYoKuXZFjYz9wR2QCklzlGzCnxq3ZLmhRrh7Avt5ExKccnZ+w2HeAsG8r7V9Q6hvo9gqU9/fOywtxwv1RGXpQjPhitQhxyeV54Q+mci+YSpyU/MzxlIx7XcPawtAhaOXAqF8lyGNKZmexb57cqGaUbCyq6g091W2S+6WV5dIpP0wDpdGiK56gYNcytev</encrypted>]]>
        &AfterUpdate;
        &CommandShowWarningMessage;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<encrypted>N48N8EMXpHnLcQdkuCcKw52tFqxsJYXIWDcuJT2OGHw18J8deqQxoe5ObGqu/VGXOvfF8eU/wR7aSSO3xNrX0hQMXN59j0t5YBuUCXMGisM=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>xZ3UDzNDWPh7qOpyaShoF3SDe9X/qj5in70T46eAevpoAy7iYuOhT7qINZWOh0IE7/UC6AlTjZgJjtlcR9YSrmUF3mdcErLSd4P4O0NcUmlJp3k7tukbHA4V6G+LftEtratvq6OuG/ieFwmQAk8ZZ+0lGEdXJqT+l9+YvRltY2mxTBwz9AZ3nSt4Onj7D9J86nM+HoCfLhWIVdTvvZwZDvI8jMGuaS41hql+vojqOil4P7R6CZwdhLlMcQwkgqVtMGHEElGeU6cunq5+lZj9jfGdYEtNgzNnuz10NNuJUjTwNoHU7as7DYPe8VMvqen5VZl3a9DLupy8PtLzoJv9rEaSB2YEXFxEVuYUk8UKMJJWsexXqNCSva/PP8TNmY2n6DqqmBQ/tX2wSvZVqJ7jxNOk7dTkZ0gTHn70/bdbqPMqiiipw2a2dFnEXn+ymTk8BvT5z8L2rptChQSLKqBDsWugoHdxyzUUhYvEcp4pNt6D4sHnY6CgqE6OdFr5+0ojpjiSLEJ/HZZmsRF9/oFF82SRO3Zsk0zMRmSkkUP503gFE97qPpUVIIe7UULQ1t9vlmKdRafSBF9J7sRD6BKIEjfZzNH7WL7CzagrEL5vs8pSIhee5H+1KL/54iqBtzvJUmlG/dAgOhkYMfit0HEGWE+F97UbDjIArQVKoJKAfZrZyLaz0yBSM1xPxNd0Nwb1KO9dylzrWB9xVbVJh4YEnAmulNRvAcusRfrzyosVJZhqIZ/P0HF0AOXXPuiwzMf5KagTaEUXhDjLyWeCgtFA+v4SAdWSHIryOcyaa7bOJaIj/ZtdLbY/5FOhLIdzeLcNLQXP7/rMM7UhDQIB99rcQUxGxvPnMow+gXjPRksHgRNzFG6tmCwzZoxA2M880NqYIraaCNiIKFax79/JRNwRwvK4EeFdNdxrdhUCfqdgKbxPBSVU/ZFJCkhBa4Xz63l76RaSQuFW26j/le1DXUnACMDEyqtX44GkR+rANVaSTXUL87KcNh/+TIL1DuCI3Q/AuDu53SBc37UPb9jWzEONe1PZ96Z6mz42vZe8ovy2xvSwH+Gv1yexGg+SnrfP1VcBmP2QNG3xa/5cvSOqrJXuOOQXYV1RZn/WPR0jVx3GoLkUab5EgwxWp6wUA5V8xEqt</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>dXcDQbSr/64nCrz8eh7GkTY4/5UZlGOvjdGEATsR2L31im1HLFBvTWv8KV+Q1QZlnsd0cXpVGlT7Q8a6T2qPLInTnpVHEMf9w2s/DJ+axWRb1GiPYHAPxE6d8nSQrVHebFYib08AjBRk7D7vXbXuPDd7mHOTZhVRTo9xWa021u1SGreC22Aeg9KaVnB/TghI6+lOrCTalK0CmEFBtEzvPsw1zVRls3V7HdIBkatofOAdjkOj2F0pvRa3hIBam04rNAQK8TNIX4Cw4H8mAONy3WBCG2BLqjcY1smXH7Gs6vp18aVne2Dm5gML3u271+5pWoPuN5uEp9zcArqc1W/tJ2SQiQPKjyhcRnuCB1POlDeaW+JUS1+spuYbfwiJZUj4wbdHXL3jLWJPFPncVSA1Cagz43aStk3qZaKAzXwkPJHWgpQr/8Nog0ABl0kmdxuWUhW1/WtKFeNeBc0YJ9j61ufL2wb82c20uau8k2YdpUNZ6OYMibT317lSn7t9/+xDA3Xr/Ngvq9Kp5h3PLyILqrlXQ9TdzaU0V9Q2+ckYoRAa6Yv/w32rPtQJ277imKqtXkPKhCnsO60Ex++KOT+Ol+yvl4foz/RwADSVh5tUlK3+R0WUCXY0CAhEik9JbpLltuT9wVqOmECwXN7r72UWyBMIDYX5QXEpI5rEMocWzkxPSwqOSvolMmjgvvgYY4+h</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0Yl4GRYPDS0MuXLN27S6/3cFwzMsEBFt3R6CSvunM0eeS4anhDFyj3OeX9CoDyXnLQ==</encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<encrypted>z23janWwWpB6TmyQL5Kn0SVG/ZIFBAaT8lyFwW2eU1YEm9B/nkodjj/qIJ+aRz+i</encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<encrypted>WEbvWz3qVer6naiunAyPLkYVbLp2mAdMM78cjrANCLXXWw+sYrvIu6XXI/nZg4qA4xr1a8EzNsgpdAbA9sncAhYj8jJmeG5WHVs8vRtf4KfFzt4A7Oa3Xf7NYXVrZmp1sBX+aaP5/qboAC0DGqNinZ0bNn2XO1fl34jr32wM9i1Vn7ZDpn7r1PJi52EF61o065iPM8umD6vHy5KTAkkG5eT/+tFwiQHngobJWDfRqE0Le1h4tU4Awo4QHHIo3VRk</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
  </response>

</dir>
