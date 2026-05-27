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
    <field name="ma_dvcs" width="50" hidden="true">
      <header v="Đơn vị" e="Unit"></header>
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
	
    <field name="ten_vt" width="200">
      <header v="Tên hàng hóa, vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="50" >
      <header v="Đvt" e="UOM"></header>
    </field>

    <field name="so_luong" width="80" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng" e="Quantity"></header>
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
	  <items style="AutoComplete" controller="VoucherBook" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = 'HB2' and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
	  <field name="id_hd"/>
	  <field name="ma_dvcs"/>
	  <field name="stt"/>
	  <field name="mau_hd"/>
	  <field name="so_seri"/>
	  <field name="ngay_ct"/>
	  <field name="so_ct"/>
	  <field name="ma_kh"/>
	  <field name="ten_kh"/>
	  
      <field name="ten_vt"/>
      <field name="dvt"/>
	  <field name="so_luong"/>
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
      <![CDATA[<encrypted>b/yH6C9sHIIhaWe/b1KoB8vRDbnTg0qm9QeqSbYCYZ88bp/uqXjyLRqVj9SuNnQWXjBovBuVY8lhLjPt1DN1Mt42mOvQ/2ZO2oi4YlKe8nwPz5EDNffuQQuTqyaZoUeGSmLu5ReLFPlqfvXYr0HXWjUsvG/TqsSXkTjVjVk5m/1v/D97MGw4dBupazoA++KouQri7fzQOSrpQKSXvG9EtZGs7YS1slfYN6chc0v3rswi1ntrOLgBAutOJkt4ugtPj9PhLoxbzyVrbxVVx8FRbNW1m+HkeqnM83LW/yvNwP3tnxCPDkXjV75A26Jw8OWtLgwbBRNhGfjH1aRYeU5JrzkeqyJ6hapKsp9nfsfyi+86JId7q1/crISk/F2D7bMiELu56YtlX/dWjSDT3IZoeyuV7EBmhIxrPg5OdISi7i9d9CjHKvSj840BSAkFjyV/X6GdV5ZIyDbFffxTHWUhR1DCLb7uxFCUiRq5RZKGfaYIslFqyUFkBVAk38DVTRQRVXVv9wIr/u2VNtO6FFNi9SB/KTLyF6BszpFXMB8h9XU1VrrQCDcK5XoLL53KHVmC31djAyXL03cFHd4klgOTzc0yvZrvJ2mi21HPbhQttdS7ARJdOtrTx/CT23gt9WRbU7KuTWFJv+M4d3xFnAW8dPXDL++LJhOxzgfw+IG3UBhyFULzRDRSlW0ZpTs3u5D0vzZYHxD0AUYETBdQaD4sPMhOGGB4zhxtUeqv8lg6LE6BjBJ9kTbdQZ9zErROxnlDqLiNxohcQvUgLBhMqd1SuYQafpWtAh7kM5xDBy4dEwydSU+dN+kVfZybHMjPZVhhqJZS12anwQXOlwSulrTzVmpkpQyOgzQV+/X53AZkhwsI0PhHLCMVrO3mnxckcMIEEYMn48utCOeL+AGm2TIlPie6bmU+pIqHRIdzz9sCAR0=</encrypted>]]>
    </text>
  </script>
  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>LYsQP+xHunF0V4kGFNFbsPhVXR4W1f/upA5we2o9FqlO0phTVXLDg9LoFRTEAYFJye1oxq/CbQGloAQHewQFFMGHoIrpW/wViy5RAmP/hY9PLsl6tX5WNmGwzJrEbPtOpz3mFjjXyV0PSGJuWFd4P/ol1bmCqA2IiIIWob4nk2ufF3q+bEVWPs3HNukBcdj/</encrypted>]]>
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
        <![CDATA[<encrypted>x9J6x+fGL3k0+FImW3uVsnzaru8GaqGBLRrC2RVlT0kZD2iuJcDfBtmc7LB62+4eUnUvaCTw1OtPVoXpwkG+1LRzkygirC1zyxJ8ckzzTmrbTYp5a0svnLihYYHKNfubinyLROu1+O1hGIoNFVsTZQ==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
  </toolbar>


</grid>