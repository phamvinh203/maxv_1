<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
]>

<dir table="m22$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Chọn hóa đơn" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hóa đơn từ ngày" e="Date From"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hóa đơn đến ngày" e="Date to"></header>
    </field>
    <field name="ma_kh" filterSource="master" allowNulls="false" operation="10">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="AutoComplete" controller="SDInvoiceLookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="130, 30, 80, 100, 230"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<encrypted>9d8l1+Sq3TLkbnW+6mUrRXFI0r+tPqhRYOipUrGmzY7+w4BxQimoqKZ1HmYkDVodOWQGGZ4+gBV0Z34j6dVlM/pdJosqLT8phyE+4UNTwTIf4mDAPWubGEueHDPAIzX7</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>9d8l1+Sq3TLkbnW+6mUrRXFI0r+tPqhRYOipUrGmzY6cDh4ZIjy6cKnGVVzaF4ppWn9779YwdBR8hg1YzZq4r96wJgjAfctCRyUlryKRCOu3b92wIOAoe4/QwobsKg+u</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>9d8l1+Sq3TLkbnW+6mUrRXFI0r+tPqhRYOipUrGmzY7Rr7WkrU09wBQA3//TQtRhhFXQz2/IKayLKeZmsE7NWOfthaG4zVPuPvbSYX/2d0PNS9je7kPxX/MEVfXBSWe4</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>FYciQ8tvqbi0H82iRRlE3WXCgxidTApg4dCv1Xer4/fLhihAQDhT3wkIzMYgq8L+wO6E0sOT52WRtD1YX0d9XdSTyMGMdB1aLPtxZ2F5jBghFCXA++E9eFlLiIQDD74goHdie1HJSyR2LNNzsPFvovKgSyZK14HZ9LkDzFXKZ4OFvP9nx0Mge16bHkYUIWz5eopZTbE66pCbxpN3ih+1Wn/SNFpRo8YXTZ20To2VPhzchxYvxGXg1ZSV6t1xsvxOWO7VJ9UABYS5YpGu+5u/xwhXgGKC9yqgfpRP2A8UOINpymAslxTk/qhJNsmJm+YfeuuoyFxqzy0/HHNNIGMKd2zNSsAgxZAoPdWrFqkdglOtwYyFrERm8epV8JhKzQJUMSJrxjnxmds4J4n4YJ5W/es7B/SFMej7o2ZIctZaiYLgFBfx3wrG4ZslxfMlU+GGysBn5BN+05+kqrzGJbmfTgpBXzisk1aVeGDSaGeatOYGiQK05fsXuMAUiIpe2uIIChU1HnkUXmIFj83CK5V/MmjPo552r4/dgnaiInFecqMeTGHNKp+1BKH3UOgttCqRM1WXoRV+Cy0jzue5YFRvGiOz9JqMmWs2frhsLI5UCEfHCIWITnrxYjICoKau+9/XmLicPzzMSOsLCGx68gw8l/aeGmoR+K0+QpDjcM0EA3AD98dyFeNIU3G+IN6Zuh+QPhbnOTs4mBpuhpBc1XkqGY3SdPWGM1yhyfnkoSOLd0kForSRmAjQOlKpDe55Oks6yhD32ccxgerf4RPL4N2EUIyBw6x9Ln6zOx2B62Y7xHmiww1kdAtzk6PmA1WdvBar/Ofe7fbfhAx7W9/4gBgXrj7vtLSLUYNSEcQNroJi4kLwHLjWcyG2DlwMkgw7WlK4/de/kwjTfwsg2x6PRhI7d8teycEl24fiwypY2q8jYXYFS84g6MBhaNX8OgA9hlGoGUZD2TprTJNEJnumLg9va7BrlX2YIpcpyAH/IkCiMWIec7ig9P111ip1JPDVvVjH2akO4WvvrEAmHmuMOxkmnOfEcs9MtjhKAjl7+tJP/ef7boBlJSowph/dUrXOBHPnxXIKoXd5+aynVf0p22xCOg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>5tx/+zNTDTNAS0b3+PcPVAju9hf9EBJfUG9ysDuuZmSteJ5zXly4lxjF1ElBDKUp7bYUzYuLp5v5TNC+6ty32VNfXeoymTsXjOO9FwQwPVKchPsAgJycwMH88z/Kdkg+n+aII0gr81NLMreoQ2nRyvagMJdXiqG3p8PyJtUN+PTQGCb4zuzvnKa9PemCWdHQnztcOc17fyVIIHQF1uqq8vdinnRNE6B5f17cN3JOgzoxLzjBQVKyPffYsb+FbpxOIYEnDUarO04CqpZRpinrp0cv+4zfUSAgggbxVbxmHUNCjRFS5JLCZEAVbKYsNPRB3Cab7wu+gvWDDU2kHJUOo4EIjvDHUevLSWhSdxV7Y9IWB+mQetBLR5FXPvgbGK9x8PM2RZpFkgs/K5CpQz38ODJOVTAj9IwPrCEXxygmROBF+xjUJ4+8s9yhShWlkg/ZXEp/hNmvYzABrD8OBbiZTxijs9pUAk2HVr+GZcaUGqP1TgMc4QTca8HEUGPGJQ/ZjG4Osc8EuE5HNl/x+J7/lxpUHvSWAwm68IU3UQSMpc/NI/rTFvaGxHBzHDJe46DXETXoxTR7WuQuIOeOBtkJ71lnGNuFnx4wpnKnCFfROhKu7YWmHien3phS687qI0prORJJJTD51LghSxNltgP8jkAqPVBSBIQGCI7rULT4PiQbNx0XYc4uH9UmoGLEW9GcL8PaJU0rWXEpR7dnBhQn0Q==</encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>
