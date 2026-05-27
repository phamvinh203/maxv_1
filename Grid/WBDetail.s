<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLGetReason SYSTEM "..\Include\XML\GetReason.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\AutoLotDetailToolbar.xml">
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY AutoLotForm "IRLotForm">
  <!ENTITY AutoLotGrid SYSTEM "..\Include\Javascript\AutoLotGrid.txt">
  <!ENTITY ScriptAutoLotSet SYSTEM "..\Include\Javascript\AutoLotSet.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY CssCreateLot SYSTEM "..\Include\Javascript\CssCreateLot.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY TransferID "WBTran">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'IRDetail.xlsx', @description = N'Phiếu nhập kho'
else select @filename = 'IRDetail2.xlsx', @description = N'Receipt'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="d59$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PN6" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c59$000000" prime="d59$" inquiry="i59$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_kho$dmkho.ten_kho%l"/>
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
    <field name="pn_gia_tb" type="Boolean" width="80" hidden="true">
      <header v="Giá trung bình" e="Average Cost"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" when="true" hidden="true">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" when="true" hidden="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>

    <field name="tk_vt" width="80"  aliasName="a" hidden="true">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_nx" width="80" aliasName="a" hidden="true">
      <header v="Mã nx" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMA0ACg+oC1JCH85u5uoCRXjJn3/r998HkfNF7xISWuxXrH6iJyd9q0g8lRt/QuuQc=</encrypted>]]></clientScript>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="tk_du" width="80" aliasName="a" hidden="true">
      <header v="Tk có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true" aliasName="a" when="true" hidden="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" aliasName="a" when="true" hidden="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
      <handle key="![pn_gia_tb]" field="pn_gia_tb"/>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
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
      <field name="pn_gia_tb"/>
      <field name="gia_nt"/>
      <field name="tien_nt"/>

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>
      <field name="ma_nx"/>
      <field name="ten_nx%l"/>
      <field name="tk_du"/>
      <field name="ten_tk%l"/>
      <field name="gia"/>
      <field name="tien"/>

      &XMLUserDefinedViews;

      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
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
      <![CDATA[<encrypted>jZZo8bEC/K/ZAVJglQFU8mnKmh45+sQTZKzMz0pSPfhfzzwjYydKxv+82W5iYm5gXneLKitrGzC+ytWnPpyRys38ycUtT7JWlL7VzX482IhVdGtoRowlYPb0FbVeZOnbjnvUCfamA8Ihp5gnc1YXWgf1Mcm19usZc7p5skhox9Svg0J1oa1oZHwOQWKSX5PIVzkzyL2CigeNH7sIUq45dt3u9SjUsZtvwoYd+Uz4wOaCvYiyZvJVvTR+7yEgYUXJw5yBFwLCCQNqAVdfi9KIzAOA1dAB863u6w43LUA4wdBqflcNfa97O8qnmvKi8PbbQ8siZaz7iUoUleKAl3qZ3mAVBdpvEo5ZS2najHr1Prx4/pJB0Y9EDU1n14Nti67v9guldtL6V42Mg8srKy3+S0Oh5hUGZSLfY70WZ27aMc4HXb3+lTlgZsx2AJ77GBp5zknL3OLWPaF9r/K2n8GTYdbzR/VVBGbtXH5G1ribpJjFR1Ma61k0/PIbwXHtNIhmbyiQGnptOBAJBiVymqQT+iNyG7cZrjg2Kv5rd8HTfmCDShP7iGtSUVW0hBB03boCf3IqtdZZyJcEiHavRAnB5fSoK2h2ZPisPAZgsAGsLyafnrf1Xk4P3ZPdZLNg2XlLpONVCS547j6jBshXsSGuZJ0Bc4P4Zis+EVUXEYRXmSX24sa6rzUVpmKqcQeuMCS+XCNvqoxo/YHe+M/mFdmGVztfroGU0IyJgsOrDE5Q8EIhYr8Jd2h0ilqFKqiGfgPfCJ7ZJ6JwuxPKBFn09NLORQcCHq4DbVzCxnEb2UDFg0+Ac10aEE/mvuFLtqjnJN/aj3QyLM2tsveh84lL3mWrpRXsq4veFh10zL7ZLle8OoDcyXl615hnQp8gZpkVkDy7sJwQrB1EaDtrizhr/NbifCnFJEoPy2eu2MGu1JGPEmdk6qtxdMaWZN+7bisWatZ84gu2MWC88WoTfyqS9dlSA+vkOSqiu8J+QF9XWeS9GzB5k8d1esVzGS7S/ToaMo2vZ6aJpN8u3bs/9DJLoy+y6ybbgHGOHcViHXFfRRDelK0cziIgrXvKQhIvGYOFb65PWp4ZCwcJ8PjQh249c8w+kjijZgKpNFFPeGNnz91oUmnnLWcilBrqBPBrfijmEGWE</encrypted>]]>&AutoLotGrid;<![CDATA[<encrypted>KoEOoUYCvlLZJ+G3Z8ezs/Dz0XJiZcm8pHPKm/WiwE9imh0jx3BZI42UNp2mP+cuwTOz4uArQ0ntRpyWfwmdkJ6N0hd5SjUkP+CuJ8MRrFAyxZWSpLkHePTkoOumc3Ln2QAh5WZfFCSjMCu9sxvMrucH3lX3Ax9cjZhUTrkcVoX6og6I+/RN+OIMNLK+K/MyyKmmolT6p7sxhfxAbNVwkYG76q/SvCBy1CIlArHEWiy7GoKL2GPPKhaYMWyuOzpmNhm5dvcflJHpTDoOPl8yHzZDPBamFIP7XApddXt4EWpO33zbZw/U/bkE8v8w2ri9Giidqf8ywdhVn4fJsmEzu+kmMeBkMUvY7L3RvJR0MFNnGrqeps6yTDz9VBOxQxDJQMa5C4cqoTCn9lj6LkHqfDY+n1y2pKaD/77MREMsOGwGSADqgqNICMmNMi5FAePUDFsFfm9EqHEDvkjWN+PFGlIzNggm6CY+SJEGWmk/7jRURQeF9Qem6iPGK5ZEqLuMhJcQWMu5jaH7Ekd7animFo2UPsUzkkIIunNgaXlKafBiC1ZPFMwuJLZ8D+NRX/I1M68k/VU7fxkzGlZGKK6t/HtcdlUnlAjtM0YLOL3M2qQzBGQwWwMocLFQOCERDGyxohMoU5JfVcmFDsNH/brvQrUxmGv2EbMPKj7TsK0cPtGNkLq6qNz1mMxrUVjl6a0885nvSgq1BJkp6/qptFl0Iu8e0VS6gDZFwrvvYRFHEa73jd6WOD29LwZtOR1xsAARM5ilmVbwlpeWYvU+ow0+UNVPZSPByg497EBcyIBxHoJ45fZhdz6gnKkUnvFzwjE5</encrypted>]]>
      &DowloadScript;
      &ScriptAutoLotSet;
      &ScriptCheckGridIrregularCode;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;
    &XMLGetReason;

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

    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>PIMwMHcDQTnS1pN0VxlCw1DMTFI30cte4yHGuipTUfzN6EH5hjcv5GMi6hUk0KtvRAZUnOzyMoUSJeOn2NvsN65MJpqez8OgZHvMtXDMsEBAl+81XHxMflCcdzGa/IEHzxF3dLxByfGScUDRhR9jWgdoXVqNngutcewuqmcN388szv9mhW8VBOwg6cy7d5L7</encrypted>]]>
      </text>
    </query>
  </queries>


  <css>
    <text>
      &CssCreateLot;
      <![CDATA[<encrypted>aj7MSALopNrDuRtgQ38FlmVykQh9CDPYT9MJXD+LqJNxohg75gEfMNe8Bn9Kf0Zu/tSTKEExbkMzi/FJs/qMiOxsF4miQchcLNHsJV3LX62ydnHuWpDjgzPzSqaBy3+f7DDotwO550EQWIBVjn/p0xM4yc5BYkfYu8ZF7vJ1YA1VBusTYmN3YHHEMblCJzOy</encrypted>]]>
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
    <button command="Lot">
      <title v="Cập nhật lô" e="Lot Maintenance"></title>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
