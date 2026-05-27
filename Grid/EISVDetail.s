<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ct50gl" code="stt_rec" order="stt_rec" type="Detail" freezeColumns="3" xmlns="urn:schemas-maxv-com:data-grid">
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
      <header v="Mã khách hàng *" e="Customer Code *"></header>
	  <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>	
    <field name="ten_kh" width="200">
      <header v="Tên khách hàng" e="Customer Name"></header>
    </field>	

    <field name="ma_vt" width="100" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã hàng *" e="Item Code *"></header>
	  <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
	  <items style="Mask"/>
	  <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMLZUNw4rNLlfqGPoayoUNZuYutOZIb1IK24EqWkB1UKXwX3NIdKxxmIjWP28bFtP0=</encrypted>]]></clientScript>
    </field>
	
    <field name="ten_vt" width="200">
      <header v="Tên hàng hóa, vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="50" >
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" key="(ma_vt = '{$%c$%r.[ma_vt]}' or ma_vt = '*')" information="dvt$vdmvtqddvt.ten_dvt%l" new="Default"/>
    </field>
    <field name="ma_kho" width="100" allowNulls="false">
      <header v="Mã kho *" e="Site *"></header>
	  <items style="AutoComplete" controller="Site" key="status = '1'" check="1 = 1" information="ma_kho$dmkho.ten_kho%l" new="Default"/>
    </field>

    <field name="ma_lo" width="100">
      <header v="Mã lô" e="Lot"></header>
	  <items style="AutoComplete" controller="Lot" key="status = '1'" check="1 = 1" />
    </field>
    <field name="km_yn" width="50" type="Int16" >
      <header v="KM" e="KM"></header>
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
    <field name="tl_ck" width="80" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Tỷ lệ CK" e="Rate Discount"></header>
    </field>
    <field name="ck_nt" width="100" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Chiết khấu" e="Discount"></header>
    </field>
    <field name="ma_thue" width="80" allowNulls="false">
      <header v="Mã thuế *" e="Code Tax *"></header>
	  <items style="AutoComplete" controller="Tax" key="status = '1'" check="1 = 1" />
    </field>
    <field name="thue_suat" width="80">
      <header v="Thuế suất" e="Rate Tax"></header>
    </field>	
    <field name="thue_nt" width="100" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" >
      <header v="Thuế" e="Amount"></header>
      <items style="Numeric"/>
    </field>	
	
	
    <field name="ma_nt" width="40" >
      <header v="Mã nt" e="Currency"></header>
	  <items style="AutoComplete" controller="Currency" key="status = '1'" check="1=1" />
    </field>
    <field name="ty_gia" width="80" type="Decimal" dataFormatString="@exchangeRateInputFormat">
      <header v="Tỷ giá" e="Rate"></header>
    </field>
	
    <field name="tk" width="100" allowNulls="false">
      <header v="Tk nợ *" e="Account *"></header>
	  <items style="AutoComplete" controller="Account" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>

    <field name="tk_dt" width="100" allowNulls="false">
      <header v="Tk dt *" e="Rev Account *"></header>
	  <items style="AutoComplete" controller="Account" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
	
    <field name="tk_ck" width="100" >
      <header v="Tk ck" e="Disc Account *"></header>
	  <items style="AutoComplete" controller="Account" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="tk_cpbh" width="100" >
      <header v="Tk KM" e="KM Account *"></header>
	  <items style="AutoComplete" controller="Account" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
	
    <field name="tk_vt" width="100" allowNulls="false">
      <header v="Tk kho *" e="Account Item*"></header>
	  <items style="AutoComplete" controller="Account" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="tk_gv" width="100" allowNulls="false">
      <header v="Tk giá vốn *" e="Gross Account *"></header>
	  <items style="AutoComplete" controller="Account" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>	
    <field name="tk_thue" width="80">
      <header v="Tk thuế" e="Account Tax"></header>
	  <items style="AutoComplete" controller="Account" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>	

    <field name="ong_ba" width="100">
      <header v="Người mua hàng" e="Buyer"></header>
    </field>
    <field name="dien_giai" width="200">
      <header v="Diễn giải" e="Descriptions"></header>
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
	  <items style="AutoComplete" controller="VoucherBook" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = 'HB1' and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
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
	  <field name="ma_lo"/>
	  
	  <field name="km_yn"/>
	  <field name="so_luong"/>
	  <field name="he_so"/>
	  <field name="gia_nt"/>
	  <field name="tien_nt"/>
	  <field name="tl_ck"/>
	  <field name="ck_nt"/>
	  
	  <field name="ma_thue"/>
	  <field name="thue_suat"/>
	  <field name="thue_nt"/>
	  
	  <field name="ma_nt"/>
	  <field name="ty_gia"/>

	  <field name="tk"/>
	  <field name="tk_dt"/>
	  <field name="tk_ck"/>
	  <field name="tk_cpbh"/>
	  <field name="tk_vt"/>
	  <field name="tk_gv"/>
	  <field name="tk_thue"/>
	  
	  <field name="ong_ba"/>
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
      <![CDATA[<encrypted>eM7luahNb2s2FB4Tm8x0ydXDr5iwyHW7SRXbIywMCabiQF2ifn3b9YPMxZEaI42im0kOSzYb14SVSmjA2ndbSPEkndNX97mjS+suUd3goi3a/6OqMmJTjldFnClR/DOAgmKa/7O+xLEDL3WfnaEXu3USQMWNRD+8a4D6K/jqu8kJEzRMfqDZ7J0SGJgtPOFL+Vo1rTNa+GBZGfyKKZFhQeqyt/flDf1dMmqJ7tTfhgWPtIfBtPI+eRSEznGCaTD7K2m2LU3APEWtlmxxtNWUmsfmC388+izbCGLRrHvc0FCgacOPialLHoRmMA4dN4jKcNneqA3btmsHQPbk+Oh3qrN4uD/OWjcUxDchqWebZj6bbz5fLZhi8WbLcX/dLtfVC0a4+FgeAzsA1ScalAb8kcc6B/1VCqCEzENZzTJruqJ+OxtyDuGDg0qqZLcGhNMfyF0p00VIWo8SYjI0h28KkPPC0jk7D7Ayy65SMlQ2tPJ+hwslqxS9foKEJfzLdFGqPAtZGjX4gFqzd6KnxTMNGAfEaMK3TSw0pYQVxNXllHukQplePH4EHt/d/k3WQRsWxrIfi50sENimw5tyuwz2giU/QIWdrWtJ11NKnY02/HFDTBGTzHUcOl4JBEqb+JujGzT6DI98/OGbc+jIql/m3Cuv2D36Rv8JW9y13yatSihHirb9ubvGIl9IgGOwVTpu6LfcwtKDysX4fGanV5YvML7BWS23tY2YUTBrYUAaahkLbZ7hjQ6zcoMskSGyklNTB8SwpF2yRIgzdgSj4gxTfDwKPT3zCrUYps+HUbcDL2aKFCsbnMRaux8XrEjgk74OsSqr5JwB4hpJa72R89JKI0sN1jrmQPdYSTA4GC28TC5PK8k4dNAPqhu1PWcNQPH9DbVrjG+st7elyXF5doGY2BdU12y8js6RrzLmlZNIFXtwkr/eVOfvuV6o9By+KqSyVJtXxroJ52oVSqonGcXb2Q==</encrypted>]]>
    </text>
  </script>
  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>LYsQP+xHunF0V4kGFNFbsPhVXR4W1f/upA5we2o9FqlO0phTVXLDg9LoFRTEAYFJye1oxq/CbQGloAQHewQFFMGHoIrpW/wViy5RAmP/hY9PLsl6tX5WNmGwzJrEbPtOpz3mFjjXyV0PSGJuWFd4P/ol1bmCqA2IiIIWob4nk2ufF3q+bEVWPs3HNukBcdj/</encrypted>]]>
      </text>
    </action>
    <action id="UOM">
      <text>
        <![CDATA[<encrypted>9BoUiqrtBldivn7VHhdhCxWS8cBkv98N2EkrancBqyTJhrDjTTM4t2EjF9M53StWMpBCMB0uZBE8nZy3rTC3E/6XZ5XBGzBLfucBpSl0MPoYpDXLwZYhHYb4ivgnuXO0JEqfJYb3oS2C+FSxM5XhzQ==</encrypted>]]>
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
        <![CDATA[<encrypted>x9J6x+fGL3k0+FImW3uVsnzaru8GaqGBLRrC2RVlT0kZD2iuJcDfBtmc7LB62+4eUnUvaCTw1OtPVoXpwkG+1EC1KLAVsN7Rx6bIUYGSGwIfSzcRawV3eZnJuUa1kYDA9pEffi8v8iBW/lee9rPpdg==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
  </toolbar>


</grid>