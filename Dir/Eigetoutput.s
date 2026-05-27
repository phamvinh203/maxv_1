<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="vct50view" code="stt_rec" order="stt_rec" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Hóa đơn điện tử bán ra" e="EInvoice"></title>
  <fields>
<field name="mst_ngmua" >
      <header v="MST người mua" e="TaxCode"></header>
    </field>
    <field name="ten_ngmua">
      <header v="Tên người mua" e="Customer Name"></header>
    </field>

    <field name="dia_chi_ngmua">
      <header v="Địa chỉ người mua" e="Address"></header>
    </field>
	<field name="ht_thanh_toan" >
      <header v="Hình thức thanh toán" e="Payment"></header>
    </field>

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice No."></header>
      <items style="Mask"/>
    </field>
	<field name="mau_hd">
      <header v="Mẫu số" e="Form"></header>
    </field>
	<field name="so_seri">
      <header v="Ký hiệu" e="Seri No."></header>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" defaultValue="new Date()">
      <header v="Ngày lập" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true" defaultValue="new Date()">
      <header v="Ngày hóa đơn" e="Posting Date"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>			
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="user_id0" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
	
	<field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="false" readOnly="true">
      <header v="Tiền hàng" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true" >
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="false" readOnly="true">
      <header v="Chiết khấu" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" >
      <header v="Chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_phi_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="false" readOnly="true">
      <header v="Tiền phí" e="Exp Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_phi" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" >
      <header v="Tiền phí" e="Exp Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" >
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="false" readOnly="true">
      <header v="Tổng thanh toán" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true" >
      <header v="Tổng thanh toán" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>	
	<field name="ten_trang_thai%l" categoryIndex="-1">
      <header v="Trạng thái hóa đơn" e="Invoice Status"></header>
    </field>
	<field name="ten_ket_qua_ktra%l" categoryIndex="-1">
      <header v="Kết quả kiểm tra" e="Check result"></header>
    </field>

    <field name="d50" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="120" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="EIDetail2" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="so_ct_goc" dataFormatString="@upperCaseFormat" align="center" allowNulls="false" categoryIndex="-1">
      <header v="Số/Ngày HĐ gốc" e="Invoice No./Date"></header>
      <items style="Mask"/>
    </field>
	<field name="mau_hd_goc" categoryIndex="-1" align="center">
      <header v="Mẫu/Ký hiệu HĐ gốc" e="Form/Seri"></header>
    </field>
	<field name="so_seri_goc" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct_goc" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" defaultValue="new Date()" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="174">
     <item value="120, 35, 75, 35, 65, 0, 0, 37, 100, 100, 15, 62, 55, 100, 0, 0"/>
	 
	  <item value="110000000011011: [mst_ngmua].Label, [mst_ngmua], [stt_rec], [so_ct].Label, [so_ct], [user_id0]"/>
	  <item value="1100000000-101-: [ten_ngmua].Label, [ten_ngmua], [mau_hd].Label, [mau_hd]"/>
	  <item value="1100000000-101-: [dia_chi_ngmua].Label, [dia_chi_ngmua], [so_seri].Label, [so_seri]"/>
	  <item value="11000------101: [ht_thanh_toan].Label, [ht_thanh_toan],[ngay_ct].Label, [ngay_ct], [ngay_lct]"/>
	  <item value="-----------111-: [ty_gia].Label, [ma_nt], [ty_gia]"/>
	  
	  <item value="1: [d50]"/>
	  <item value="110000---1-10-1:[ten_trang_thai%l].Label, [ten_trang_thai%l],[t_tien].Label, [t_tien], [t_tien_nt]"/>
	  <item value="110000---1-10-1:[ten_ket_qua_ktra%l].Label,[ten_ket_qua_ktra%l],[t_ck].Label, [t_ck], [t_ck_nt]"/>
      <item value="11010----1-10-1:[mau_hd_goc].Label,[mau_hd_goc],[so_seri_goc],[t_thue].Label, [t_thue], [t_thue_nt]"/>

      <item value="11010----1-10-1: [so_ct_goc].Label,[so_ct_goc],[ngay_ct_goc],[t_phi].Label, [t_phi], [t_phi_nt]"/>
	  <item value="---------1-10-1: [t_tt].Label, [t_tt], [t_tt_nt]"/>
      <categories>
        <category index="1" columns="789" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        <category index="-1" columns="110, 30, 80, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="3">
          <header v="" e=""/>
        </category>
      </categories>	 
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>1rQWIfTY6/zWMhKeDMtvLyRFT14zzx//4/fHLP0M5CHErv9d/T/8ZgqdLq3UAY1JfZxuZbULmT6/iT1oOgb0rmcvZH02xZYugq8MCYYfGz8KMq6rKaX0UBRhRkKhClKjQP2zoSIv8CvxAJa259J2DOja2VvcgJv1G2ZiSOm/AUS6DbF3PCA9v502V1YgznvPwRGuUcuhWUa0xnn0foU62qxWRB4f53DOSKOCUJIVjwY=</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7QU2aKRuAJBmAt6gWG5Ua4K+1IoUL7n5qogKeXcP0acRd9UnDDmA8zgnOY9VfTEOJQHv5wUwz3Dx8Urm9srECQ8=</encrypted>]]>
      </text>
    </command>	
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f1h8IuHH30pVWY0Ih8jlSK4GR23//r9+Df1x7Rxvy4fUaWT5nIzqqYkQ+lL+LaUs6TURi0Gn0dfVR8nYIBwr0Y=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>OeJj0B4YIiDOVgrTNpXF5k1ldAGgfV0TQQP5rTkl2QdmZYVp2khinaIe387zhAoQqo1IaYX1g23kwlRgJsR0PyD5pwAL8f5roOc8zf29Sov4Xh1xTEpPz3cCpVoB8DSPSCAoCLJ25vudLS7dy/TCZmfUbevnrroh0ZcoC9gCdJ/7zKmBDAP0bM/ojar6kjnZVKD0wlymY/JtwsgeqVft/1OCEVeaY/6ACusz7FM42GpQKkISB61bHEC8pdobfY/L9UkQPfU8NVsFkxBJAWb1t7GnzbuYTs9StCtehL6xvmH1kkhtV7S3h2SVrR+DwsZLwax8K6Mm4uXYssTedtqjDYum5qt/D4WsXo+Oq3eSj04qFllQLWvHxkh+K+BX34cWrEow2jHEbXHVmsWKv9qWV9yR9EboKQyVS86Ya+2UYkG1dtq4aNdKT8/X1bF4X0DJq1vTbcKVu6o+RTaXAtzrTZPtIoKtU/ST/fCJulILVz20GkICGqGkjTmd7WDU7mJn2ZXIsFnaBqzKoIJBpVG0N3hk253tfl4CVlEvc299aGz2LL6Y+P1C7l5X8RXhMghwZVKqPSjtRSHKyNKqI1Yt7/xBEG5v51gz4GKyW/9RlNyea48BABOGmT8VFwEOuZCK2nnbToaJgCuuEKXf4Iiw3SyOKQBZiYURnvdHDcPzW1Q=</encrypted>]]>
    </text>
  </script>

</dir>
