<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
]>

<grid table="d86$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HM3" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c86$000000" prime="d86$" inquiry="i86$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="status = '1'" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="c">
      <header v="Tên mặt hàng" e="Item Description"></header>
    </field>
    <field name="dvt" allowNulls="false" width="50" aliasName="a">
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

    <!--<field name="ma_kho" allowNulls="false" width="80" clientDefault="Default" aliasName="a">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="ma_dvcs = @@unit" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOsOqCtEJw8sjaJ5AuNCmVB8Q41yuCdKH1zOr5VMa0apGYKxfxKZc1r+KNu1g7NZfk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>-->

    &SiteField;
      
    <field name="ma_vi_tri" width="80" clientDefault="Default" aliasName="a" inactivate="true">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c$%r.[ma_kho]}' and status = '1'" check="ma_kho = '{$%c$%r.[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="80" aliasName="a">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c$%r.[ma_vt]}' and status = '1'" check="ma_vt = '{$%c$%r.[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
      <handle key="[lo_yn]"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_vt" width="80" aliasName="a" allowNulls="false">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100"	allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="pn_so" align="right" readOnly="true" inactivate="true" width="0" aliasName="a"  external="true" hidden="true">
      <header v="Phiếu nhập" e="Purchase Receipt"></header>
    </field>
    <field name="pn_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="0" aliasName="a"  external="true" hidden="1">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="hd_so" align="right" readOnly="false" inactivate="true" width="0" aliasName="a"  external="true" hidden="0">
      <header v="Hóa đơn" e="Invoice"></header>
    </field>
    <field name="hd_ln" type="Int32" dataFormatString="#####" readOnly="false" inactivate="true" width="0" aliasName="a"  external="true" hidden="1">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="kt_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a" hidden="1">
      <header v="Kiểm định" e="QC"></header>
    </field>
    <field name="kt_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a" hidden="1">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="c">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="c">
      <header v="" e=""></header>
      <handle key="[sua_tk_vt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="c">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="c">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_hd" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0hd" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_kt" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0kt" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="xaction" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
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

      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>

      <field name="gia"/>
      <field name="tien"/>

      <field name="pn_so"/>
      <field name="pn_ln"/>

      <field name="hd_so"/>
      <field name="hd_ln"/>

      <field name="kt_so"/>
      <field name="kt_ln"/>

      &XMLUserDefinedViews;

      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>

      <field name="stt_rec_hd"/>
      <field name="stt_rec0hd"/>

      <field name="stt_rec_kt"/>
      <field name="stt_rec0kt"/>

      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>

      <field name="xaction"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXoK2w/YUkJHUY0ZH43sfD4duGnx7Ohbkr4DBDNymWoBwQEGMn/qD8zRnO7G9BYAe/TvwiNYB+shLIE0UZhWfV7Q==</encrypted>]]>
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
      <![CDATA[<encrypted>+8LZmqzAoH8jSzS94dvnOC0z389gPqcqgfeJ9v4kJftdh3GQIdgBPuNUFWZxJNkd1wB5eT0Gvj/XC0vXl7Bo3eAjDEcsgX8hjdv9pSllf8mX5Z2U5VqNayw+ldpGN4iqKOSXql404tJj88RUXeLYbacaalD508j1xtBViHP0Ps9sDCrtLvwwiijJkRQJlQKn5OaNu+KrpzML/mrxVLDEd/N4mfLtYNfFy+V3bDsINPBlMRzpQ/Ffc3u8tzmOcACYlBci+fGT3w10xl66Syk60Gc6IP0CTwVcmadJYGWQ+5veGdGJFV8tBVCZwWTwpvT9gE+YIRNUp+tEi8Tqpd9pt+054IIbME1bqdhxe3Uc+uNEaYKS08MuhKpg0gITGrh+CGF02vaEGsbHh1tXqjtGorTNnDocDuO/02Dn/KXaFAdx9MiwqPgNgNE8el5YRV84mVN4LAeSHU3tGr4406OB4itE8oifZVgEszjGxYJZXPhPMCeO1yDZvM+AScJIr4v8xKL8B73nS1QSRnylFqmqyPqhnxbYEHBcCyC0GsXwpeu8BeqmvHBmKkI2aKMLi+bFS/aRA2UqD1C02ZZ2HzEmKA6Wah5c4zMnz83YHRuCa1Pi6KXgtn4T+YXi8+7IIraRWkB/rv7qNQ5cwCasi/41M6RIr0OocQurNpPLkYFjY25mtpnklLQadCXqurU2S6ElYLezIefMd/0spqm2Dqgem3aCRvm/GyoMo3PRquff9uMFLyMncJwI/74K6qITWPKpsjZNT/dw5VHGOGnP4UMR5zOHZQquNn9PDK/kKhP90z3wodJnbNqtVxMXz3rVaCjZB54htHwaoRYyaF2NfM57wJ7IT55YucSqGNXUeHx666XcFgRAPnTs2KJ5tPJSUUz2EYiOWAUQOBx0zvhcVONRi8FhdElEqKYmrfcGa6qGgIiwTSE7C5V+BruA5+gLQ+eSQCrRNZ/b9eYsQsZ2Z0jccVXQq5KFc+xsbR2AngQ8AcAVVtPXExlCFqE+DkfIBzlJDBrzNh/Itophp53MMlgobSK6RpLkfL/y4X2RvJIPKgE+oIv4lSELBZWiA6sAKl96</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>HuCLph8/hyU3vzbfANaivRbagEZ5HzZFsE1SZU0rIV/kGJ9mYwm/I/9OV13NJt0GcyXkf7bTnw20qx3ASfXZhNllviqNnGq3fapBY3v7pL8+BfaXNXVEnLJ5nXZA49SU2OOMcFLblHmTGS92THxdv/71AkD1ZlGq2MMgwUc/dzQNEzlzvHCnT9fo2dHnkU2ySSqPkw9yzd2UMBdQVsdocGAOAJyHM62rjAFJpR0qHbGB4i+TxigUQgGaVnmfQapJNODHSES7yRX20r2s4Nj2RjqCOLmj3bTh67/BSx854FH8Ro3gzPCDb4gwUUAiKJpz+tI1KjJS+iuu7v+WYbTjLbN1t7e/gMBV88shGJr+JcAneQSY4tVW18d3Y14/9UwU8gMjXH5V67DbLTS7woqEpMVz2HiRPjewCPdCecQa8j79As6TRNFiAY94+Q/xlIy8GUDnvgwzo9iiG4yHcBnUMBq2SqK2+kgVKmPF/m+pN1kKpqusIka3AlZ+ZJWXhkMf6qvDxYhbQGkpn3+KaZHZquJu5+cRxwB6eLEqBKfTz5k6QbekYp7/Ci9TlbPjtTBoxeeUwdm7HuS0nBideu1XvVgMLxQCUeuNQyk743zMv72aWSOR1z6K4EV5TG1XpkUMii1gKcGbNXcneW1B+zhFtMP0ie3TtemwQ68gujNCNBk6uURFK5CTkP9jJP++nZ2L/5UkwaLAW25dmv+49ElBDHpcHKpklB6Pd7LcEP5zD2zI9LbzuIg0j/s0CwjvDCACqSVmPGwdSLu/0Qn9brOz8a9b3FphuRH8PZuB/oxsvLeuMnWC51L9Xdx6U6vmSpxaSqBuArJDwTmGKW88Lygqu6P67STZCiKK0VxFLwHofftACfaWWM5XXPYskzGCS2zlAu0KISrMRPOZdr7CyXoMsjEscF14YN9XEep6PhJtK7P4Dj0m4lkfljFx3AX3AOAb0RdFLlEBTcxxRrIWT8BJIVItm61Hy9Bd2NlZF5K5ilqJ8sk7o/L/2CeqxwFvOi9mAMe2csMqLI7sI7lIy4mwd6KyV9YQ3TG/KthIjQCyzA3YL9tHMfrw7upEeR01OIy5yx6AJVU5UpV3mwE6NqAEQC2UL+nPI8MBNGv2fjEd2oCCMvyNrHJyovLMAbS71cphrR6yaNLQDI8RdR0a8Xgz62TqZX/n7/FkceunrzPawNn5CgsmpgCiYHuvKo2gVHIDryyOI2xwiuiDxXvCl272pCqBdwZ60Z8JYz89qSUafUI=</encrypted>]]>
      &ScriptInsertRetrieveItems;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<encrypted>r4gUa9sEPwJGDZZOLL/HmuT4ablGdersBYQyDQm+oECCKGngk4t+L/nUETWFjEBCVOomEwCENJ1oYjRJ0Jieb/RNsOr1iBho+ilYQ9S06r9+VjXl1P6IpTzTIEhO1pzd0T/fy5Gt4NPPTjVCGUCRxHm2pYsYoMzyeVdq9/tFdugREqYr6WWDcCzb5oaP2N7vXNvlDkVmamD+khVdm2iUAuU+FeVBK1Ad9TrKBJNOpFgbv1e+dXa2u0RwgknNBLD+</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>dc08hik76x5Apk6GwKudrishBL+SjRFlc+QPc+D1bG7fiviwQTbL/9oKz90Qx6DsKSD0epArIrgOkBiy8QLNXpTr7m1D4nK1nlWT8052xndTvdV9KAztZo3CGzNJi9XyI8KEJJBRh/aYh0peT1UmNluMphUgNA6t+o5SgvQtuqdyXltPk/eAOV2jhhEtDd/X06J1mQTeMD2c0arSJjcthrl+mxg97bI325Jl7/u4/0NzahtyQJXHNA6dxkaKj+iAEYV2ncL4ZLK4tVIVC6ovBg==</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>wZr+5SkHGoasluZRvYa9NeH5sFghEJa2OAC35uf3pcRtr/3/jC4W7BbmJF1AopjSDe66eFWqjqv4Y2oghUo9HIugQJ9NXuQnytuMNFFN7N64EdoJ8RwBxnmWkwfu0fQQ7AyXCnHdXlGiPDnTkNRNrNO4cfhPH42dubDXyxN1wyD/73G8inFHZYjhciTdRv6d</encrypted>]]>
      </text>
    </query>
  </queries>

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
    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="40" urlImage="../images/Menu/PurchaseOrder.png">
          <header v="Lấy số liệu từ Hóa đơn mua hàng trong nước"  e="Extract Data from Domestic Purchase Invoice"/>
        </menuItem>
        <menuItem commandArgument="50" urlImage="../images/Menu/OnlineOrder.png">
          <header v="Lấy số liệu từ Hóa đơn mua hàng nhập khẩu"  e="Extract Data from Import Purchase Invoice"/>
        </menuItem>
      </menuItems>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>

  </toolbar>
</grid>
