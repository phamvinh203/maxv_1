<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ct60gl" code="stt_rec" order="stt_rec" type="Detail" freezeColumns="3" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
	<field name="id_hd" width="50" hidden="true">
      <header v="ID hóa đơn" e="Form"></header>
    </field>
     <field name="stt" type="Decimal" width="50" hidden="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="mau_hd" width="50" hidden="true">
      <header v="Mẫu số" e="Form"></header>
    </field>
    <field name="so_seri" width="50" >
      <header v="Ký hiệu" e="No. Inv"></header>
    </field>
	<field name="ngay_ct" width="80" type="DateTime" dataFormatString="@datetimeFormat" >
      <header v="Ngày hóa đơn" e="Date Inv"></header>
    </field>
    <field name="so_ct" width="80" >
      <header v="Số hóa đơn" e="No. Inv"></header>
    </field>
    <field name="ma_kh" width="100" allowNulls="false">
      <header v="Mã NCC *" e="Customer Code *"></header>
	  <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>	
    <field name="ten_kh" width="200">
      <header v="Tên NCC" e="Customer Name"></header>
    </field>	

    <field name="ma_vt" width="100" allowNulls="false">
      <header v="Mã hàng *" e="Item Code *"></header>
	  <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
	  <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
	
    <field name="ten_vt" width="200">
      <header v="Tên hàng hóa, vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="50" >
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ma_kho" width="100" allowNulls="false">
      <header v="Mã kho *" e="Site *"></header>
	  <items style="AutoComplete" controller="Site" reference="ten_kho" key="status = '1'" check="1 = 1" information="ma_kho$dmkho.ten_kho%l" new="Default"/>
    </field>
    <field name="ten_kho" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" width="100">
      <header v="Mã lô" e="Lot"></header>
	  <items style="AutoComplete" controller="Lot" key="status = '1'" check="1 = 1" />
    </field>
	
    <field name="so_luong" width="80" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="he_so" width="80" type="Decimal" dataFormatString="@quantityInputFormat" hidden="true">
      <header v="Hệ số" e="Quantity"></header>
    </field>
    <field name="gia_nt" width="80" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat">
      <header v="Giá" e="Price"></header>
    </field>
    <field name="tien_nt" width="100" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Thành tiền" e="Amount"></header>
    </field>

    <field name="ma_nt" width="40" >
      <header v="Mã nt" e="Currency"></header>
	  <items style="AutoComplete" controller="Currency" key="status = '1'" check="1=1" />
    </field>
    <field name="ty_gia" width="80" type="Decimal" dataFormatString="@exchangeRateInputFormat">
      <header v="Tỷ giá" e="Rate"></header>
    </field>
	
    <field name="tk" width="100" allowNulls="false">
      <header v="Tk có *" e="Account *"></header>
	  <items style="AutoComplete" controller="Account" reference="ten_tk" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>

    <field name="tk_vt" width="100" allowNulls="false">
      <header v="Tk nợ *" e="Account Item*"></header>
	  <items style="AutoComplete" controller="Account" reference="ten_tk_vt" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="tk_cpxt" width="100" allowNulls="false">
      <header v="Tk chi phí *" e="Account Expense *"></header>
	  <items style="AutoComplete" controller="Account" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>

	<field name="ma_kh_thue" width="100">
      <header v="Mã NCC (phần thuế)" e="Supplier Name"></header>
	  <items style="AutoComplete" controller="Customer" key="status = '1'" check="1 = 1" new="Default"/>
    </field>
    <field name="ten_kh_thue" width="200">
      <header v="Tên NCC (phần thuế)" e="Supplier Name"></header>
    </field>
    <field name="mst_thue" width="100">
      <header v="MST (phần thuế)" e="Tax code"></header>
    </field>	
    <field name="ten_vt_thue" width="150">
      <header v="Tên hàng hóa (phần thuế)" e="Item Name"></header>
    </field>	
    <field name="t_tien_nt" width="100" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" >
      <header v="Tổng tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_thue" width="80" allowNulls="false">
      <header v="Mã thuế *" e="Code Tax *"></header>
	  <items style="AutoComplete" controller="Tax" key="status = '1'" check="1 = 1" />
    </field>
    <field name="thue_suat" width="80">
      <header v="Thuế suất" e="Rate Tax"></header>
    </field>
    <field name="t_thue_nt" width="100" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" >
      <header v="Tổng tiền thuế" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_thue" width="80">
      <header v="Tk thuế" e="Account Tax"></header>
	  <items style="AutoComplete" controller="Account" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>	

    <field name="dien_giai" width="200">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_vv" width="80">
      <header v="Dự án" e="ma_vv"></header>
	  <items style="AutoComplete" controller="Job" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ma_bp" width="80">
      <header v="Phòng ban" e="Department"></header>
	  <items style="AutoComplete" controller="Department" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l" new="Default"/>
    </field>
    <field name="so_lsx" width="80">
      <header v="LSX" e="MO"></header>
	  <items style="AutoComplete" controller="MO" reference="ten_lsx%l" information="so_lsx$phlsx.dien_giai"/>
    </field>
    <field name="ma_sp" width="80">
      <header v="Sản phẩm" e="Produce"></header>
	  <items style="AutoComplete" controller="Product" key="status = '1'" check="1 = 1" information="ma_vt$vdmsp.ten_vt%l" new="Item"/>
    </field>
    <field name="ma_hd" width="80">
      <header v="Hợp đồng" e="Contract"></header>
	  <items style="AutoComplete" controller="Contract" key="status = '1'" check="1 = 1" information="ma_hd$dmhd.ten_hd%l" new="Default"/>
    </field>
    <field name="ma_phi" width="80">
      <header v="Phí" e="Expense"></header>
	  <items style="AutoComplete" controller="Expense" information="ma_phi$dmphi.ten_phi%l" new="Default"/>
    </field>
    <field name="ma_nk" width="80">
      <header v="Quyển số" e="Book Voucher"></header>
	  <items style="AutoComplete" controller="VoucherBook" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = 'HMB' and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
	  <field name="id_hd"/>
	  <field name="stt"/>
	  <field name="mau_hd"/>
	  <field name="so_seri"/>
	  <field name="ngay_ct"/>
	  <field name="so_ct"/>
	  <field name="ma_kh"/>
	  <field name="ten_kh"/>
	  
	  <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="dvt"/>
	  <field name="ma_kho"/>
	  <field name="ten_kho"/>
	  <field name="ma_lo"/>
	  <field name="so_luong"/>
	  <field name="he_so"/>
	  <field name="gia_nt"/>
	  <field name="tien_nt"/>
	  
	  <field name="ma_nt"/>
	  <field name="ty_gia"/>

	  <field name="tk"/>
	  <field name="tk_vt"/>
	  <field name="tk_cpxt"/>
	  
	  <field name="ma_kh_thue"/>
	  <field name="ten_kh_thue"/>
	  <field name="mst_thue"/>
	  <field name="ten_vt_thue"/>
	  <field name="t_tien_nt"/>
	  <field name="ma_thue"/>
	  <field name="thue_suat"/>
	  <field name="t_thue_nt"/>
	  <field name="tk_thue"/>
	  <field name="dien_giai"/>
	  
	  <field name="ma_vv"/>
	  <field name="ma_bp"/>
	  <field name="so_lsx"/>
	  <field name="ma_sp"/>
	  <field name="ma_hd"/>
	  <field name="ma_phi"/>
	  <field name="ma_nk"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>WW4RkYL1Ae4iZ0LFICZq5X1rYaRPUxLcgxRUF2OZAqo7na+Y4e826SkEqSWkMpzeVtfafNOmCOhvdUTEqXSdxlVaKeeW7pgXl7KTSbFwUFjm4vFpZNMwIkMzMs7IMNs5</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>WW4RkYL1Ae4iZ0LFICZq5cmikuaP4/jhAuuw7/2kNXmyp0dvjcHJXYGXwna2GrlOrkFF5Bv4R+tdH+UrAnItey39O0o0KVxJVrs1u7KwOnNHA1x0pEX9LbrkAq9qbYp/</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>QFAGC7/U7j29rhjqy+WmFznnxmKgJAcETT3C2YmgPvpSvJos0dqs9ZvaWOutpIe8jvcEueHCbX2Z9b32Iv+dgec4Z9L0qqVTKv2tJytbysIKXYeZxBmJrjBKKWQDo4GtGMIZgggONHk9hZDEbm/4uVRQhn20/+B+BrIbkn7nBiuElvWidSLZF8vkyKwW2E3k5hEIbfqcMv9YSaN3RnrtoHzZV8WcEAU2bHKFhfEyJG0KkEJFxBmvOUQJBs6bMqb8bw1s7T6V0oZpozh9UmqQBVMVzyGQZ/Y4olNy2QYwSeYD7T3kjvzGYr3a3PE6m30trXN4BuakVBtPODpHSg8oSCSGOZtUuS9dWx0/QHGzFCanqJWi71hEe08vJAJYARSfiqDASgaRXzwDnK3i2GVP9tsu9kWLOB/c2DW/tTTv6+z5MD235nArAevO4zt4NVpwueUQOI5DA5qUuwkU0oG/f6yplg4ysAgTVPj3NsYCGooaf2+mBL3KumDpl7jZZ115amkC+a5cSF8KQI3dkvxV4kLthQ3BSnOp2C7TFCAsBFklAGXFlX2Hrsmkz/eRDlU3zTYkfmgA+bB1dWdDXgdWxlXwJP1j08xPhywofmh72AK5THUyj+j4MwD4Kl3yk7fHpZcvYQFJCWUT0uz+1BWERDXNta2564Xtntm3EcvH0kdyBhNmF7nwZiaVuIVol/YbFc5XTVqDYdfQLfZp/JVfgw==</encrypted>]]>
    </text>
  </script>
  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>LYsQP+xHunF0V4kGFNFbsPhVXR4W1f/upA5we2o9FqlO0phTVXLDg9LoFRTEAYFJye1oxq/CbQGloAQHewQFFMGHoIrpW/wViy5RAmP/hY9PLsl6tX5WNmGwzJrEbPtO2XeUK9aIsUDwABgD//RjTBiUzWmwOC+jCzWmx81CuUQzaFbG9tMN+xDjo6azhYWC</encrypted>]]>
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
        <![CDATA[<encrypted>x9J6x+fGL3k0+FImW3uVsnzaru8GaqGBLRrC2RVlT0kZD2iuJcDfBtmc7LB62+4eZTTu4AOeprkNBHx44S9M6eDD0nAHnsD7zxVLvreTmqR4WP/z5IQSYm5Mf0DIYZEHiNhc+4UV+Ku6QB7PZeXLnw==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
  </toolbar>


</grid>