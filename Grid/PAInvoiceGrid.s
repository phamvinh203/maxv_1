<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
	<!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
	<!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
	<!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
	<!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">
	<!ENTITY Identity "PAInvoice">
]>

<grid table="d83$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="" e=""></title>
	<subTitle v="" e=""></subTitle>
	<partition table="m83$000000" prime="d83$000000" inquiry="i83$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
	<fields>
		<field name="ma_vt" allowNulls="false" width="100" aliasName="a" readOnly="true">
			<header v="Mã hàng" e="Item Code"></header>
		</field>
		<field name="ten_vt%l" readOnly="true" external="true" defaultValue="' '" width="300" aliasName="b">
			<header v="Tên mặt hàng" e="Item Description"></header>
		</field>
		<field name="dvt" allowNulls="false" width="50" aliasName="a" readOnly="true">
			<header v="Đvt" e="UOM"></header>
		</field>
		<field name="ten_dvt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>
		<field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="@quantityInputFormat" clientDefault="0">
			<header v="" e=""></header>
			<items style="Numeric"/>
		</field>
		<field name="ma_kho" allowNulls="false" width="80" aliasName="a" readOnly="true">
			<header v="Mã kho" e="Site"></header>
		</field>
		<field name="ten_kho%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>
		<field name="ma_vi_tri" width="80" aliasName="a" readOnly="true">
			<header v="Mã vị trí" e="Location"></header>
		</field>
		<field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>
		<field name="ma_lo" width="80" readOnly="true">
			<header v="Mã lô" e="Lot"></header>
		</field>
		<field name="ten_lo%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>

		<field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="1" width="80">
			<header v="Chọn" e="Select"></header>
			<items style="CheckBox"/>
			<clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA1whs3wOzIi5HIUuY6KXqZqSL7fyGFj4tBTSBHevZK+ZD</encrypted>]]>&Identity;<![CDATA[<encrypted>v9X3kPSlVq6XJyW3b0ukefQ80seWRMvpS0bWQe3gWOBrOSs11y1R4J5/euozxt3b</encrypted>]]></clientScript>
		</field>
		<field name="so_luong0" type="Decimal" dataFormatString="@quantityInputFormat" external="true" defaultValue="a.so_luong" width="100">
			<header v="Số lượng" e="Quantity"></header>
			<items style="Numeric"/>
		</field>
		<field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly="true">
			<header v="Sl hóa đơn" e="Invoice Quantity"></header>
			<items style="Numeric"/>
		</field>
		<field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100" readOnly="true">
			<header v="Giá nt" e="FC Price"></header>
			<items style="Numeric"/>
		</field>
		<field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
			<header v="Tiền nt" e="FC Amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
			<header v="Thuế nt" e="FC Tax"></header>
			<items style="Numeric"/>
		</field>
		<field name="tk_vt" width="0" aliasName="a" readOnly="true" hidden="true">
			<header v="Tk nợ" e="Debit Account"></header>
		</field>
		<field name="ten_tk_vt%l" readOnly="true" external="true" defaultValue="' '" inactivate="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>
		<field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
			<header v="Giá" e="Price"></header>
			<items style="Numeric"/>
		</field>
		<field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true">
			<header v="Tiền" e="Amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" readOnly="true" hidden="true">
			<header v="Thuế" e="Tax"></header>
			<items style="Numeric"/>
		</field>
		<field name="hd_so" width="0" align="right" readOnly="true" hidden="true">
			<header v="" e=""></header>
		</field>

		&XMLUserDefinedHiddenFields;

		<field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
			<header v="" e=""></header>
		</field>
		<field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
			<header v="" e=""></header>
		</field>
		<field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = a.ma_kho) then 1 else 0 end">
			<header v="" e=""></header>
		</field>
		<field name="sua_tk_vt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec0" isPrimaryKey="true" readOnly="true" hidden="true" width="0">
			<header v="" e=""></header>
		</field>
		<field name="line_nbr" type="Int32" align="right" readOnly="true" hidden="true" width="0">
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

			<field name="chon"/>
			<field name="so_luong0"/>
			<field name="so_luong"/>
			<field name="gia_nt"/>
			<field name="tien_nt"/>
			<field name="thue_nt"/>
			<field name="tk_vt"/>
			<field name="ten_tk_vt%l"/>
			<field name="gia"/>
			<field name="tien"/>
			<field name="thue"/>
			<field name="hd_so"/>

			&XMLUserDefinedHiddenViews;

			<field name="nhieu_dvt"/>
			<field name="lo_yn"/>
			<field name="vi_tri_yn"/>
			<field name="sua_tk_vt"/>

			<field name="stt_rec"/>
			<field name="stt_rec0"/>
			<field name="line_nbr"/>
		</view>
	</views>

	<commands>
		&XMLFlowGridCommand;
	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxpgUMynXJ1mqlHw+pbaWDeSNMP0gtligVeTcbOOwuSr</encrypted>]]>&Identity;<![CDATA[<encrypted>dJ2TrE5jD0t8skeB2X4sLFYSnboI4S+TFKo4jAqpxaKnQ9xx4l6I/9g5oe60mdCr//sHMs3WWDV4iTj85RMjndzt2FJyH7ijVTrOxvKmSbsJarJIA0YHOH3yASgMjsR+n+xVhcz0WRxlCTBnP8j3SBgem7a47DFdoIz27X7ScFKrDtAhqox1aj/Sa21flNhysJqeEL8A1UUucespihcPxdf7nyfT4IN3hif2SJ19VgXZkZG35iWHOO34yRi346JrDuMzbPnbQ1Br09lB602HEw==</encrypted>]]>&Identity;<![CDATA[<encrypted>sDZX6DrXJtu6F8Wy3t0jcVMTjvze4RRMZKBr8Vpwf01hHQUAG6Gtcxs6eHWtRV4DUNxZFqB2TG4xx2o2//kpTpLKcGWI2eBLtBo3MESiLO+zO3gNnfdPoSTpr0+tw8YH</encrypted>]]>&Identity;<![CDATA[<encrypted>sDZX6DrXJtu6F8Wy3t0jcezmjj3cBLj/0tkTsMDqOSR2a4f6wN49H6V+CZa+j3qWEVdQN2yZESQu9+3c315aboAlyqJ2b4NyGsRrvqkF4w4=</encrypted>]]>&Identity;<![CDATA[<encrypted>GVla0mipLXuJg3nqzrQU5t8sxFgKN5jQQudCJV+RtStJRJ0Rbsuo92jZzsROYN3GBxJ4Z5LpJMyap0RBozP8TWkgzESAFmB7NPBr8+CC8aUmfZ6gF9azBC0+baz3q6qnEmaZ0ysOzeOhPhzjcFwUM8HqVI755vRFt2ztidMrTr5jrVm2t1WeyUcwx+Rl6w8agC4TK7NLup0r1ycUg63h2OY8c6CF/sejvnDVR8GWZfV0j3mzzyW9K1cZrTwTScU5EMdBcBZmd/TlNYpfdPlTd75XpfKzWL7DZ6YyG8Mg0h4rT3+4MzUPZbUGzmc4DoFzW8zqAwHABvR5Ti/syf8+FfU5TfTg927qfdEfsJb7cw1YEnLIfQz7ZMBNzWpeS37eCpqiGNBdiblIs7RpbWcB9g==</encrypted>]]>&Identity;<![CDATA[<encrypted>l9xp2d6SRt86RzI3iXeL3IpySku7+s4pj4sfL1GfZ/wkeG+w1dUyrDpQFecfJJjjoDHs689WMOIiEvIrdqWhuiABRyijK12EGI1cURbPqirkAo0rGutPRPB7OXtNrfSfemxfcjHEJq7EaBGr5HkPNDAgp5YpD08EVFoivYQJ4ihqRE9QFqVE0/hbnmY3bcf7AUnfRKZcqACGeyha14FvAVSz8DA0GWEZZ9P37+kN2YablwajuJaRVgtgLF2rImLwxJ5t9hj/bA0YSXS3scUeqg==</encrypted>]]>
		</text>
	</script>

	<queries>
		<query event="Loading">
			<text>
				<![CDATA[<encrypted>1f3OttiVebAUgeD5dKhLeGTnx3Ky+C4nshv4UzIzgu4Eq9MyyHC8W1rK4qrzCmgPjBLaCDx/bUIW4amHT8Y1I4ewpNYou9YEJAvTB71plfxF6DpzkoGfKhqmLHU6QWuOvybjsy4ayvKMR0gDSOJl4E34NCVdomWT0ZogFo1Au//4jnM5cRxdL7in6gHNcQakZeUaGc38ORJdARxRRcTwXlLeYo+DW4ZMUqWQ39eoFQ+wheRb8sMCdMjtLKuzQZfJJUBNgwTYAiq/AAJKj4tx3hcsc4Yi5Ie/k0SGAdQ/eQhGHT9XYPZQu+Y6+5aVmb4ig46vPrzu4fYc6KoPK2Co9RR83p75HM+5PJNLTQdnIiwGglA++ynJtj1DITSIVuJ/Rit6R/oKyb2KtS8xCB6/CVMHjkG0JoTwWCij4ZNkO/NUfgf9+bxd8UnGIgt58/MJ2GsbNK2pxIBp9GpiAl6tkSnpuLS+OAzcTKKeb0dyN6wUWr1GI8sRoSZppb5tl9iVMtTA5rX2jkcgV9QclQRldVt1OtosXKwsSu974/JJvDsbivhtJgz5aYA6X7KrRahSYouhnXmKENvrMvy1KpfKow0NQU3gCtQnXdQIIAFWxaQkBfPt1uL6eZqir/Y/ZUHLhrG1XtDSO0aU/cOduOMWWw26KgqPOOwL3QX1hfvxuoqo1Ws6bLDRHpLy0qyKfNHsAPK51H8EPmPru6hMtLo0UE6sxp8lfTpgHxcSfWUff9lXl3P4hlBUYzCdsllsM7/h8jRbjGR0o+kicj5CygmgIF9mTGKEWRPZpYUdFzMGhHh/jLy/EInKfyv9uzw+qsZ0</encrypted>]]>
			</text>
		</query>
	</queries>

	<toolbar>
		<button command="Freeze">
			<title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
		</button>
	</toolbar>

</grid>
