<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="vct60view" code="stt_rec" order="stt_rec" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Hóa đơn điện tử mua vào" e="EInvoice"></title>
  <fields>
<field name="mst_ngban" >
      <header v="MST người bán" e="TaxCode"></header>
    </field>
    <field name="ten_ngban">
      <header v="Tên người bán" e="Customer Name"></header>
    </field>

    <field name="dia_chi_ngban">
      <header v="Địa chỉ người bán" e="Address"></header>
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
      <header v="Tiền phí" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_phi" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" >
      <header v="Tiền phí" e="Discount Amount"></header>
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

    <field name="d60" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="120" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="EIDetail1" row="1">
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
	 
	  <item value="110000000011011: [mst_ngban].Label, [mst_ngban], [stt_rec], [so_ct].Label, [so_ct], [user_id0]"/>
	  <item value="1100000000-101-: [ten_ngban].Label, [ten_ngban], [mau_hd].Label, [mau_hd]"/>
	  <item value="1100000000-101-: [dia_chi_ngban].Label, [dia_chi_ngban], [so_seri].Label, [so_seri]"/>
	  <item value="11000------101: [ht_thanh_toan].Label, [ht_thanh_toan],[ngay_ct].Label, [ngay_ct], [ngay_lct]"/>
	  <item value="-----------111-: [ty_gia].Label, [ma_nt], [ty_gia]"/>
	  
	  <item value="1: [d60]"/>
	  <item value="110000---1-10-1:[ten_trang_thai%l].Label, [ten_trang_thai%l],[t_tien].Label, [t_tien], [t_tien_nt]"/>
	  <item value="110000---1-10-1:[ten_ket_qua_ktra%l].Label,[ten_ket_qua_ktra%l],[t_ck].Label, [t_ck], [t_ck_nt]"/>
      <item value="11010----1-10-1:[mau_hd_goc].Label,[mau_hd_goc],[so_seri_goc],[t_thue].Label, [t_thue], [t_thue_nt]"/>

      <item value="11010----1-10-1: [so_ct_goc].Label,[so_ct_goc],[ngay_ct_goc],[t_phi].Label, [t_phi], [t_phi_nt]"/>
	  <item value="---------1-10-1: [t_tt].Label, [t_tt], [t_tt_nt]"/>
      <categories>
        <category index="1" columns="802" anchor="1">
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
      <![CDATA[<encrypted>2/Q0KZlSfdNqDfpcNWcX/w2bPbERyFrnpDY7RmpgT+u8U2Fy29yruzqWCl7tboXeQzQ2c0zUJy02PhXiniS0m9ZdvEg/tUWhI+4mVfZvph5k7m6RJKA1UDAG2NaM/EWefxGfiCytmER78WI6iSHND6J1PT5Nb9UOd5ZF9udslGDTHzkil267vKXcQN4mKvIpqWVycbekZ3jhxJ2JRbjmAOYGgUjPFrr8S6pQBwc3Tz6xlBPqP7g/2CL4G5x/SUQyiy5wLQPsceu7tJgTdxoFRFRIQlnS1yd3pyBHwkwnOyW92jyXv1p8YjQNL0565N+516qNR4C9NvroCsnxjBJdokf5bwtscPQ3548VIudEooQ233rSUprI5fbtbz0GRWtlqB5SgKenLibyoKYC5YDW1g1wsCxPEDL34wv+Rc+qx7tVmomHf0Txjfebo4qmF/74FIo46EZjNLNoBiwdnA7nkJ6gOMlgwxYqBg0MNMJeqAxTGLRKBNnYnMAwyvPrS/pdo3pxXdGoj6DfrewxBqu8IveDCLh/GRxfaM/wGTb8hsiAQxcefCNRkbopk+SUNXweXuV4qr99wtKiDKMcOW3ITC7ohQ881JzgWe8qGvUee+lD+Y1Xa2KNy6egDJhe0qfmUP5Tpl+niK9rHoie5EszkS5/7ThmXGUWVfgeJMLkhvIG5DA0+d1izq0XBnFQO2iz</encrypted>]]>
    </text>
  </script>

</dir>
