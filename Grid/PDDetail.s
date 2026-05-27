<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">

  <!ENTITY AutoLotForm "PDLotForm">
  <!ENTITY AutoLotGrid SYSTEM "..\Include\Javascript\AutoLotGrid.txt">
  <!ENTITY ScriptAutoLotSet SYSTEM "..\Include\Javascript\AutoLotSet.txt">
  <!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY CssCreateLot SYSTEM "..\Include\Javascript\CssCreateLot.txt">
  <!ENTITY SiteField SYSTEM "..\Include\XML\SiteField.txt">
  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">
]>

<grid table="d96$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="PN5" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c96$000000" prime="d96$" inquiry="i96$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_vt" allowNulls="false" width="100" aliasName="a">
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
    &SiteField;
    <!--<field name="ma_kho" allowNulls="false" width="80" clientDefault="Default" aliasName="a">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}')) and status = '1'" check="(('{[$ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{[$ma_dvcs]}'))" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPOsOqCtEJw8sjaJ5AuNCmVB8Q41yuCdKH1zOr5VMa0apGYKxfxKZc1r+KNu1g7NZfk=</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>-->
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
    <field name="qc_yn" type="Boolean" defaultValue="0" width="80">
      <header v="Kiểm định" e="QC"></header>
      <items style="CheckBox"/>
    </field>
    <field name="sl_hd" type="Decimal" dataFormatString="@quantityViewFormat" inactivate="true" clientDefault="0" width="80" readOnly="true">
      <header v="Sl hóa đơn" e="Invoice Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_kt" type="Decimal" dataFormatString="@quantityViewFormat" inactivate="true" clientDefault="0" width="80" readOnly="true">
      <header v="Sl đã kiểm định" e="Checked Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
      <header v="Giá nt" e="FC Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="dh_so" readOnly="true" inactivate="true" width="80" aliasName="a">
      <header v="Đơn hàng" e="Sales Order"></header>
    </field>
    <field name="dh_ln" type="Int32" dataFormatString="#####" readOnly="true" inactivate="true" width="50" aliasName="a">
      <header v="Dòng" e="Line Number"></header>
      <items style="Numeric"></items>
    </field>
    <field name="xstatus" width="80" inactivate="true" readOnly="true" aliasName="a" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="xstatus_name%l" width="150" external="true" defaultValue="''" inactivate="true" readOnly="true" aliasName="c">
      <header v="Trạng thái" e="Status"></header>
    </field>

    &XMLUserDefinedFields;

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
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
      <field name="qc_yn"/>
      <field name="sl_hd"/>
      <field name="sl_kt"/>

      <field name="gia_nt"/>
      <field name="tien_nt"/>
      <field name="gia"/>
      <field name="tien"/>
      <field name="xstatus"/>
      <field name="xstatus_name%l"/>
      <field name="dh_so"/>
      <field name="dh_ln"/>

      &XMLUserDefinedViews;

      <field name="vi_tri_yn"/>
      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
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
      <![CDATA[<encrypted>L6WKsiLe47okyyaP5Qy5wtWuzd43gYsQl2Ml1hvrjueHlpxPvgzuVHGhZIvHvP799uPPCaathwGWz/pXs13CDUFgo8EooS70E36969w3HByugTMBnhB7gDqEHc/l7sWugcTxBma2wl/388fJF6/4AttUkf69rH1pUFl/9QNuLi4C3GJqLjgu6vTahMVghiDlOFFa5EcTUp4cQ/r93upKUki3XTpKeV5J5PaRGqTxNC7tYijRy1msAg1sOMOZbi2WKF5JO0kyz1a5Yl3HNeAhUv0xXoYiC1BwvR2BFPAMDmBuUaxfFQrL5Jwag0JtxRUR7sCBLfyG9XE3xQrq524e+9lng5BJ+j1w6I3hjZSlbKavucjaG/oa4rBZuUiQAk+pjL43H73d1YPhXA0anTREJRIspyoUohS3P4l9eMgjlVCsDYuM7UnxuGsb1e+Z12yN0Mzwu/OASS0f4SNLaN48rTm2pDO//r/8KA6N+WOem9qZi1NX3g1OXskXoyG0/VdW5RjjPIxxRSh91C7lAjMbBlsCi8rX9DJLGmHuBxSCyVnMdiTxk47pBg132UcHuG7mcjmCbpz3M5wYYLH9gNi5sIVF8xHrQWqXai/VosHUF4pTrXME5vpvv2ZYxpiSvD+BFPixAEUMqBpWvnFun5tOadmhTk2VtPaApqXfMRrF98x2x+sYMixFaz6DXDIbCzeOo56EdnYrd8o8O3cB4lfrfOWFJVq8+jL0Fmc7u1Z3Jqwac4QJ1VDb7rdzat7TowLqXR7HRpoqOItvIv6K5oEp/0vl0WeEtf/QLL0gkhNDUJwYR56touskOjgEYt3k52W0</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>xJg7YoA+W4+gv3ywd6l7Q1EJyw6cOBOJGwsQVONut43MO31jWUyjhdno37GJiNqIwuUyXmZiiSaxX+/SVZLz9Ns4uxQ5W0Cam9KoZ6M9M2NhDd64ed6zllKRbR/KEWBq5J/d8F1hGNNeHLCwM/iZNfleuQmPl5VFp0og+JqpHDWMlFUMRVIEtZ02vrnGkGI/LAJWxUOp+byKVOw0Orcc0Zv4EFR+MHtL4nfROMSL4nyEE3SdWpwbosFxeCiqZPVTKDQaWZGzdySZUZlLoKVwqqiIMYQyLZ/i8MgpgpfpAZSo0p/vekd3IwZSdKCGsw2HANj6yGo5VP08uQCcvuUiUjPUpcbVLsJBYMp4quawSBMckgps4GlZcWrauwUBpEmJoMyyVR9yNqq7CqyEptjPWDNvt/WJBoZiLkPUe89JKFMQrXqVLSbcvRG6ArTGLYoDJNY0SNVtmnuqciasqKlgeboNxqKqbXQUEVwBbrlasCU=</encrypted>]]>&AutoLotGrid;<![CDATA[<encrypted>6h8Q6zEeBPr1lRH/9ZDlWJNGBXTBToIQ5Wj2BKGR7+kxe2uyBhtDt0fJF21LZnyrcc1jczvB2+yHYLHXosQVedpHd6r/pmwoltu3gfosQ3LFoieHgL14qqdvis9D5qkNPYVf8WnR2vJ3/ym6/85o/L4rBYmhfN/OM5tSY9o6wPM9LJM5JI1NJ8gVTzz4UVmeKS0l6e3ZLxQ3DRoAHDb+ZeKUl60us0PG1SSft621jU+2rbQlth7ODZ1BnvsSn+NQ89UdKqu0hM6NCFeXBSrgzf/koBtwqajdnX4bDEpgJV7PW8ywps+PVy714U64nVEdw/MeeY75WYQXFRuMd5VQXGgDJU0l9HZSCfmNlvZkATlgPjLt7De3fvea6OAWUbr0w2l4qfWzj+ib2ZEFl2StsHSc28PBKi5OGmxYG/eG4UEOOrbqjDGdzxlnEQs5frCihqYn2/CTiAj8+oIaDuhn5rK23xkaJUlVwmjTtJu1omfP2d/i+XTBbUzhE4MTknG+B7pHEi6IxD6fRLTT7+x6eyuDy09huR+DKzF174bAMDTcZU3LBBlbKOUAaBZdTQYj8IElnWXIQMdbtXHTzpAFlH78XmgjXjZ8nvL77sivH2HYJsiL805EWd3nzd/9n2Bq0glfYk9yIR1nTgIbAddwr/zAldMpuySadk55nIQ6QTCd/NLDF3OswIaSByQiPRFkUdHjdIOZ6EtkFzRxol5GxiLwLGJTiOKtwfJaYQjVj/4VQx+ghmlS7cYLhSReZcdU</encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptAutoLotSet;
      &ScriptCheckGridIrregularCode;
    </text>
  </script>

  <response>
    &XMLGetUOMConversion;

    <action id="Item">
      <text>
        <![CDATA[<encrypted>b1nXhVk0Kx5OU68CGbmED0WIC4CYku8vFOMmy5xKp88pQH+zr60l6Q77i+S2w2dqb+tBOt3snAjVWxm99hJcfl79+k96U8LnGOJtMeJoUW9eOPNGakSYSePcjrxyMqShaulKaWCXtb2XSTEr27UxSoISchYpCqXKm0kOuWhh3g1cu3FBHnRyUd/vyNQA6QNsnn4RohzCoM50/6kfdBjBJ/9dySBnE6z9AjxiuszGHfUei4AgkcS/0QZ6RBJCrKvw</encrypted>]]>
      </text>
    </action>
    <action id="Site">
      <text>
        <![CDATA[<encrypted>Ngit22LEB6MoFkFUpH1QwqvVe4JWK5oATaVtkbXKxrnUeBMRptYlKp5/oH8Ofwu+mtOUHFDaZ0xh6sSL9i9J+P9PfWCRv98l7pu/ceS1pU379GbwVeTO9Qgcnp7Sb+ZOVPgso/pEGAChBwyeL01L+uTF4Thq/8OP4y8lxjFAqEqPHuSskYYNA6O1cL5jT1RzhPsAwZVHIuPGxKChIPL/LmpKI0aUhysBi4drNUMAInE=</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>dt36FFXWeSi59Pw0qWXqkmM+1WPna5ic25CK+cGxUWM9lb3grJ4P+ajMe4pRKoNq7vlke7Hs074cR6BNKqEI/4bgooSgYnm07elbTe6XMTBpyiR1qCIgMQg7uavUTJ8DjS9E2b4Fa7X6/IN5tviMOVEjf/KR4x/Gyq2TbcCkDUj0F6G2XdPMQfLTeXajUNaO0nXY8mRmxCaKGbbSm61W1Q==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

   <!--button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10" urlImage="../images/Menu/PurchaseOrder.png">
          <header v="Lấy số liệu từ đơn hàng trong nước"  e="Extract Data from Domestic Purchase Order"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30" urlImage="../images/Menu/OnlineOrder.png">
          <header v="Lấy số liệu từ đơn hàng nhập khẩu"  e="Extract Data from Import Purchase Order"/>
        </menuItem>
      </menuItems>
    </button>-->

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
