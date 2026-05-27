<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY TransferID "WDTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ISDetail.xlsx', @description = N'Phiếu xuất kho'
else select @filename = 'ISDetail2.xlsx', @description = N'Issue'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="d69$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PX6" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c69$000000" prime="d69$" inquiry="i69$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="b">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" width="50" aliasName="a">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <handle key="[nhieu_dvt]"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPO5Vu7zotkPNh5UDN2V7J3FvVhxkFLSxLNK45HvA2sFImSqzms1JcVt8xLVy+uouIk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &SiteField;

    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l" row="1"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="ton13" type="Decimal" dataFormatString="@quantityViewFormat" width="80" external="true" defaultValue="0" readOnly="true" inactivate="true" aliasName="(e.ton13 - isnull(d.so_luong0, 0)) / case when a.he_so &lt;&gt; 0 then a.he_so else 1 end">
      <header v="Tồn" e="Stock"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="px_gia_dd" type="Boolean" width="80" hidden="true">
      <header v="Giá đích danh" e="Specific Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>

    <field name="ma_nx" width="80" hidden="true">
      <header v="Mã nhập xuất" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" key="1 = 1" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <!--clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOWXgUu3RdbOz9dgAGCqElgtlkOdLdSGcnwMpAOQX4VisTLVpcwj5LRQ4eCLYTcPX0=</encrypted>]]></clientScript>-->
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_vt" width="80" aliasName="a" hidden="true">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" width="80" aliasName="a" hidden="true">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_du%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_du%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <handle key="[px_gia_dd]" field="px_gia_dd"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[lo_yn = 1]" field="ma_vt"/>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>


    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_yc" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0yc" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>

      <field name="ma_kho"/>
      <field name="ten_kho%l"/>
      <field name="ma_vi_tri"/>
      <field name="ten_vi_tri%l"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>

      <field name="ton13"/>

      <field name="so_luong"/>
      <field name="px_gia_dd"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="tk_du"/>
      <field name="ten_tk_du%l"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>

      <field name="gia"/>
      <field name="tien"/>

      &XMLUserDefinedViews;

      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>
      <field name="stt_rec_yc"/>
      <field name="stt_rec0yc"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket; <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6iOq7a2FTtpOMAZBFA7KvHn6AZGNb31r0av4UYfyUSu+QT6pu6PDPYv27oR98mW8+qIprg1NXxe67BMlvzVAzrw92epZxPQx9R+aDt4oRsHBGan3zxJq3xFCNGeZgfldJQ=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khX63lKwmzHzjwARyexDzCpOZwlE4lOVaY8k9R24ocGHqr/Y9vn0dleP1J95VH2VAf79ctKpKvXbOok8q6nET2T8O3xDK38OIY9OHxrvW7pj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>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</encrypted>]]>
      &DowloadScript;
      &ScriptEmptyExternalField;
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <response>
    &XMLGetReason;
    <action id="Item">
      <text>
        <![CDATA[<encrypted>Q9GL8XaDNh/v5wo33XxN9/VwMalpHx2mhP+KJqjxJlERrwbjaZT8+167Euik9UXY5/+6aFHfZgpxq3m9+p3EpTQ4JeG8iD41iKtZ7zLozLlAfhbZMstqouJJGvznh12QW4ZhqLnHT6nRBcIwFWi3X4u5RG+86ZE9XZzI1MFoGO+2+Ma409NbmBtkAmt/Z3L9rMPn0xLCOkhh8ZdeKBGbLVDZmMbbXkKMP9Ay8v96gE3gywEqewVkMfjHV5yiC5NkzhHKEQRjTcdvXdHOHo5zeadOvHlwYHvJZQ6kghXWDsN5EWJ1RwtFKcDpMr215luDtoZ0ZVXVegEo5X0GSbfSreTtUFuE2PuOqNBAMeUd77U=</encrypted>]]>
      </text>
    </action>

    <action id="UOM">
      <text>
        <![CDATA[<encrypted>ITPxfetWzv2TDNhYv2wR/qzF3CH+1lpPrC/iBJgjwK8mTtUUHDQ5/HwRxisT6iUsobW/5ZnD1bCsrUTLcPQKvt4ccQNBvnBJAzuG23Bqfte9ZPvtLFEKJCOK+W8i+NNNtNBfn4r9HcxLSXmc2NT2Fs4BpcXG50Wq5s6c9SZXreJxUIZn245OduAAoYpsIwD7e3LDixaK4MQ0Atz8D79SoDRNZT4QDgClgqgGnM0Wgh5ML43J/s0X1fUBfPjAKKVgn8Ho6Pw/RFvI7rMoVCOXLbPsaWwkIX3pB0vImRorbbIkmjVI3Lp02pbO7SHZZYspGFrXFXw3OoFC993Ray4uGefXP5/t48xrJW8RBamwjJNDrTpdOhB3iUiAbYbsRx3Gbl/wZnWMHWxxbiuY0824pQ==</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>jKDL+XrsK83GhVP4R9dqzn2uI+3ml7lTVcmsn51G82aat6/sSrddnVYb6F4D4F9PLtBlaHLchGGaES8+ONI+WbEzNZt+xAKQUkYmJOl4c7ECxSRCZ+5NHo/nXVl4gHWnC5wYYfxY5iR3FQkQZ291hnZ4O23HqaZMRF/en0tN/1XNfW5LigS7ClB3130Eau+HghaQ3Sfk1yaDHsKXfdvziftg0pUc+no25PyRXxcpg4FBkk/n9s38R5J8jr0VKQf42F81/3JTXYX+/lNTRdnRlVfKpJsLhsb7ozcV0EczdPDjrzmIFYSFFJ/ZefNoZlACTKP3GMtg+iLDKl/6YXemEqQe21+86LR17fEnFDsiReU=</encrypted>]]>
      </text>
    </action>

    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>f874bmvUfaLKygwspP/jA/5IClHk+bDNJWtqrPaQD73+TlIB5MaYYQNduOmKinq4a4fz9Wwg+2hFfbfuPbPzNPOW8NWLCZuZJXtX4U26/xacuC1dVHg5sURFwu9BiH8UDwd+tGh/qCEjSpOwIpVxlvwnEcNrf8KxZKnZ6wh2vGue+4r67w4Yj4wHzf4nqymibbtS0ZBHwINxysWgfIKnOYHHWMOJRE398sXXKRnaDs5DkbaUodG1Msq4GyQpk5KeFGZbmpWa7sLJxKHmRs/PhILDP7k3Dq5pnbb4Ie3wIXuxpkqS2gVwRS8U7PzhB7+1rD6aIQgqdqCM9MrWaSauuQ==</encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FllC+E9Ib1pTnjfNFwSw0tqLw+izgIKpk9uUQ4EOt0Juf+GeQWaSaZpqlc1OwdnSYoeGbjKgHH7LRv7TmmKpfWj+QcjhUZzb68hQQbDtZAaOi7OiugW0Of19u1jlk19+j63H40tEf4XmFRcJ3J1h+YgoqTUeJUek/U4UWD9FmqJEr</encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Lookup">
      <title v="Xem phiếu nhập" e="Lookup"></title>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>


    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
