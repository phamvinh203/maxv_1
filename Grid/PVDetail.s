<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">

  <!ENTITY AutoLotForm "PVLotForm">
  <!ENTITY AutoLotGrid SYSTEM "..\Include\Javascript\AutoLotGrid.txt">
  <!ENTITY ScriptAutoLotSet SYSTEM "..\Include\Javascript\AutoLotSet.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY CssCreateLot SYSTEM "..\Include\Javascript\CssCreateLot.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
]>

<grid table="d71$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HM1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c71$000000" prime="d71$" inquiry="i71$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a" allowFilter="true" allowSorting="true">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <handle source="dmvt.ma_vt" foreward="true"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
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
    <field name="ma_lo" width="80">
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
    <field name="gia_nt0" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk_vt" width="80" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_vt%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[sua_tk_vt]"/>
    </field>
    <field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="gia0" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="pn_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Phiếu nhập" e="Purchase Receipt"></header>
    </field>
    <field name="pn_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    <field name="dh_so" align="right" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Đơn hàng" e="Import Purchase Order"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[sua_tk_vt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="gia_ton" type="Int32" width="0" external="true" hidden="true" aliasName="b">
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
    <field name="stt_rec_pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0pn" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_dh" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0dh" readOnly="true" hidden="true">
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
      <field name="gia_nt0"/>
      <field name="tien_nt0"/>

      <field name="tk_vt"/>
      <field name="ten_tk_vt%l"/>

      <field name="gia0"/>
      <field name="tien0"/>

      <field name="pn_so"/>
      <field name="pn_ln"/>

      <field name="dh_so"/>
      <field name="dh_ln"/>

      &XMLUserDefinedViews;

      <field name="gia_ton"/>
      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>

      <field name="stt_rec_pn"/>
      <field name="stt_rec0pn"/>

      <field name="stt_rec_dh"/>
      <field name="stt_rec0dh"/>

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
      <![CDATA[<encrypted>TYBUZON2/CSPNjVYRtvQeJwIMGj2Cqo9KGdvcrJPOOY8lu2eYCJqU//sw+p1tpyOUC1aYhhAfBXspxAwahBQptkFjfl8NSxs+mV+6JmCiFFdsNEsCXNnQKGUtBuILkE8MwAjdUr+LUbESaxqP7yxA1I9UvOBYA6yvK67tDROpjbMsOPujnaXvIW2Gg/dXr0au8z31M2qz/nf/zPzW+arM46wZcTShLJ3srB/uwP4FujqROzLs/evF3pSK8WZpYFNtxf5t/auTxZWvAGVyhbsz2GiAf2gm6QldUM/ah07DLSe931VXnxpBgCpYEla1TyzMoMwOurcVNb4sPxiAO7myaMWtNkNUIPZ4dxe2W3ZjeLa96/W2huUKga1M3PlJ2wB86bE4V7CedOCMzWda19SbKH7R92yGYUKNsim7SPlsbl4cvInsb7PbyV8FgjYW8LC7vHanirCZ0dvoDahredt6PiYL/WrA4aIj7RHIGSybQeYZMhCNIKwO6IXfDd0UdGyFk+kbAx2MgWVWg5W3v4HiYJHDuif00Fn2OzgBEo2/ia4UXMVJosWu35yS0SVNXATJG+9/5+xD74c5xuxKHD+6uiJQk0Ml81YjkhGQOe+q52dgUa6auhcQ20wSbBgsXGLvvYg7DpMkrm43ITwjFn+KzEUFokH6E2vc3ungzIh8gDoAWcPSFwo9deWX23Yc5UjrLMtrVWK+2UOmL4cNWPiGEoB9njRASz+tQeaPQKhseAacenzorLi053OzNlip8+NRTndGxihr8nCk7D/2pxlmUbNcEi+rksnT5Apj4NzMozjKvPkkP5lLO+uqmt+GAdtUkzlavubbwaEGnaOXn3Iaib3C+BvKLufxU8APSstYwRiMhuS7ylOtgQwOGRpWBkBG0E88ibPZJWrTbyw1KXmT7mSLWw488aqILJPjHn44WMXKo1gus3q66U0WSpvKhgVWH3ZmsMS6gLCVQKGmaOWu3pVpyb5xCV8VesBKbfsJlCAmEX7nQk3iCvlQA5d0qNbLqcp/zxDVoRVlQbbrJuhKA==</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>J8NtoV2tT4KjB0KvJ0t8HczPHXCZS0YkMmdlIyCwjV7lyS5gdXCz2O/yb9pIInxAOD7mkuqfbdvuis5Ak15k2eoOIUT1AaTsS+fgDO6Aq/cvEGAFEtlX9FlbmNrllFses1LMwTtPxw9hs5EwjbnQuaLrwVqGwVMBR3kD1YCCOB5sLK5zxWZlWSIlxBpfF5jJvl9WfBQffBwkk3Lzs96bWR19J6NK3ALQfuQxXuJhSlgp79YSqCYwv2QkgRszAD8qOZIzs+I89x7Vao1N81WbBSfMNpvG1YjYHigS1mcTgFOYxlR75LtNN3yymQjFDryvxLm4RNU3hv1qjknH0pbRRTFEfqPTehE9Wx/djtPv/rSktu6uJ+DUKCZUhpPa2bljStBfr8dDtEjb56qzJNYnqZZKBS+QSJba2HaJYH/LghEqIA7RZbb2IQ0qC7E9g1rx5wlU1VwqLnC6a1DcZVP79TGVH4EWkIZALo2wlTy0/KNbNRigm7vsbep0WpLjj6l9WK9K4s2RkvOuKe175tXHgTkFdck1pRPMTUf+XmCeluzfNfFJ1OxlatUM5UQ0/EjxnVnwCPiRY6qvMUe//YkXbM9c4nte4JO3zHY2MyUSzgW4ZHoj33gU0p8I6c1bqY5W</encrypted>]]>&AutoLotGrid;<![CDATA[<encrypted>TaHWmecISiWOQhfxpLjPEYLXknijK1ejWGQEbcY0f527TR8Oz2sTyyLsQOugg/irpf2l8jT3RWpJIg3RL2kRX3FCAGOl5f6VQHNWodOi0Td6a8pVl4kuojQmnhIJ1WjnaYlkIwwrnXqeiGaNXzMWbquSZw8GSpm7550+61NU+yflkcF9caOuCxjHx7mLt93a98baatyzSSqG3kStN2tuDcaVE06QKdDwICq087X7WkMdMJjbKO6Uw+edXM7USt/sjxNtGohYaXrvpl5UtpNQ6Fo6gbDP9h93/5rNLglPYotcDRtkey6y8lova8yjLxYrZ7spsEagQHHLFfsICHWGTde6dUieTY6j2qE28xn8PdLhCI6N3uSxwdzrCloOMIh25bMvpwo2+8yJxMRG48d6uEGvdM8twrAcF1Euv/alP+ianLl+9GkrCNVDmoC4ltFOPC6/y1cCs4qkO/j5Un/l/TrU2DaYBMBSwewqW1QD9yBBaOZMtpQwoNAbKWuCeGotXC9bcSddtoVt+2ThQ0AuVF8FNLH8oDaDqF/VvHTe4IgT3AHGvK13U/7tI8UcNxJCenir/rCTVnMaCxpHH9LP3pSMcpY/+zXDl4xRWtOaKVoPACyPQ++6KIqO21EOolI/wsXPtM3an1nb8J43k6DnRp5oAILv632JK82b0bAsGLK2OYoqraURM8AkkafwsX+p</encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
      &ScriptAutoLotSet;
      &ScriptCheckGridIrregularCode;
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
        <![CDATA[<encrypted>PIMwMHcDQTnS1pN0VxlCw1DMTFI30cte4yHGuipTUfzN6EH5hjcv5GMi6hUk0KtvRAZUnOzyMoUSJeOn2NvsN65MJpqez8OgZHvMtXDMsEBAl+81XHxMflCcdzGa/IEHzxF3dLxByfGScUDRhR9jWgdoXVqNngutcewuqmcN388szv9mhW8VBOwg6cy7d5L7</encrypted>]]>
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
        <menuItem commandArgument="10" urlImage="../images/Menu/PurchaseOrder.png">
          <header v="Lấy số liệu từ đơn hàng trong nước"  e="Extract Data from Domestic Purchase Order"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30">
          <header v="Lấy số liệu từ phiếu nhập mua hàng"  e="Extract Data from Purchase Receipt"/>
        </menuItem>
      </menuItems>
    </button>

    <button command="Lot">
      <title v="Cập nhật lô" e="Lot Maintenance"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

  &CssCreateLot;
</grid>
