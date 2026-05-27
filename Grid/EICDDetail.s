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
      <header v="Mã NCC *" e="Customer Code *"></header>
	  <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>	
    <field name="ten_kh" width="200">
      <header v="Tên NCC" e="Customer Name"></header>
    </field>	

    <field name="ong_ba" width="150">
      <header v="Người nhận tiền" e="Receiver"></header>
    </field>
	
    <field name="dien_giai" width="250">
      <header v="Lý do chi" e="Description"></header>
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
      <header v="Tk có *" e="Account Credit*"></header>
	  <items style="AutoComplete" controller="Account" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="tk_no" width="100" allowNulls="false">
      <header v="Tk nợ *" e="Account Debit *"></header>
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
	  <items style="AutoComplete" controller="VoucherBook" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = 'PC1' and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
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
	  
      <field name="ong_ba"/>
      <field name="dien_giai"/>

	  <field name="tien_nt"/>
	  
	  <field name="ma_nt"/>
	  <field name="ty_gia"/>

	  <field name="tk"/>
	  <field name="tk_no"/>
	  
	  <field name="ma_kh_thue"/>
	  <field name="ten_kh_thue"/>
	  <field name="mst_thue"/>
	  <field name="ten_vt_thue"/>
	  <field name="t_tien_nt"/>
	  <field name="ma_thue"/>
	  <field name="thue_suat"/>
	  <field name="t_thue_nt"/>
	  <field name="tk_thue"/>
	  
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
      <![CDATA[<encrypted>A17lccGVR40l5mizAQ+S2/N4fmkqqa9f4RmVLbXfwttXo/CPzTGPKM73FwiLZv0hgmHj3DsMAhNzRa6zqh2kCo/ZxCnnB1p4QwDL69ZHdnJZQojIaRoPfOza32yXY1FIAnXQpCsRe0BmHwFDCOJkjym5c8aNd6BgVCLHWAH0CQY9SNdqiDgNzx2m4zya1GQwzZv6OybKSPrrwhXoYreR/oC6nIEVhfIeR3xU1qKG9/kTGsQ4VOvxIgDDP1eJS37so+gOn/8alvitmu4kCqjUCHw5pvhhNszQmy3EKsLki+OvT7WNs5kHVRmRqiun7nswIvKdF+XrKefwH/odRCqcqlOcC3h8ysXIGQMI3VS3dhe5YfAr1gOCub9Hb7p0ubv1ZotX8S9FVQtyDg56X8A0phdkpRTc1NwTUNOaVlSd1v96ykEBwTJ9iukM6NvuaycMeihV93g9a6yV4UA82pNs5g==</encrypted>]]>
    </text>
  </script>


  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>x9J6x+fGL3k0+FImW3uVsnzaru8GaqGBLRrC2RVlT0kZD2iuJcDfBtmc7LB62+4eZTTu4AOeprkNBHx44S9M6Yr+821vxu8SV36SN1/+jlm5//W1EEDgBspkB0KVF151Gr+956ZQ19Q55bbf1lFqRw==</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
  </toolbar>


</grid>