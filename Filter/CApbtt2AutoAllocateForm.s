<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [

]>

<dir table="cttt30" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="Phân bổ thanh toán" e="Phân bổ thanh toán"></title>
	<fields>
		<field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="ma_kh">
			<header v="Khách hàng" e="Customer"></header>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4wOfZDHgrxlSj1Cl14a19XBZCjY1pO6/p+NqFQ3l3vjFmZ+SRkeDTSpB/rMZvVpuSg==</encrypted>]]></clientScript>
		</field>
		<field name="ten_kh" readOnly="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
			<header v="Số ct" e=""></header>
			<items style="Mask"/>
		</field>
		<field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
			<header v="Ngày ct" e=""></header>
		</field>
		<field name="tk">
			<header v="Tài khoản" e="Account"></header>
		</field>
		<field name="ten_tk" readOnly="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
			<header v="Tiền nt" e="FC Amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
			<header v="Tiền" e="Amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="ong_ba">
			<header v="Người trả tiền" e="Delivered by"></header>
		</field>
		<field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
			<header v="Mã nt" e="Currency"></header>
		</field>
		<field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
			<header v="Tỷ giá" e="Ex. Rate"></header>
			<items style="Numeric"/>
		</field>
		<field name="ma_dvcs" hidden="true">
			<header v="Đơn vị" e="Unit"></header>
		</field>
		<field name="dpb" external="true" clientDefault="0" defaultValue="0" rows="208" categoryIndex="1">
			<header v="" e=""></header>
			<label v="Chi tiết" e="Detail"></label >
			<items style="Grid" controller="CApbtt2AutoAllocateGrid" row="1">
				<item value="ForeignKey">
					<text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
				</item>
				<item value="ForeignKey">
					<text v ="String: ma_dvcs, ma_dvcs" e="String: ma_dvcs, ma_dvcs"></text>
				</item>
			</items>
		</field>
		<field name="tien_pb" external="true" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true" hidden="true" readOnly="true">
			<header v="" e=""></header>
			<items style="Numeric"/>
		</field>
	</fields>

	<views>
		<view id="Dir" height="268" anchor="6" split="10">
			<item value="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0"/>
			<item value="1110-10011: [ma_kh].Label, [ma_kh], [ten_kh], [so_ct].Label, [so_ct], [ma_dvcs]"/>
			<item value="11---10011: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
			<item value="1110-11010: [tk].Label, [tk], [ten_tk], [ty_gia].Label, [ma_nt], [ty_gia]"/>
			<item value="1: [dpb]"/>
			<item value="1--1-10-1: [tien_pb], [t_tien].Label, [t_tien_nt], [t_tien]"/>

			<categories>
				<category index="1" columns="769" anchor="1">
					<header v="Chi tiết" e="Detail"/>
				</category>
				<category index="-1" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="3">
					<header v="" e=""/>
				</category>
			</categories>
		</view>
	</views>

	<commands>
		<command event="Created">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7VQtv8LeCR+CXDSpONE9KJ0JF+HOxitH2tGKjYY1Qos0BvvVAnxJF+yOUV1RN99JwZieT+QPTT4BZLmF2H6N3Cs=</encrypted>]]>
			</text>
		</command>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fV8Db63cIL6Wa9pQWQxqQ5c270Lyday4oS85jUTh7MI9Sc0/x6T7rOAqcCvEJojXGiePMKpoqDcCXBkFKt3yl8=</encrypted>]]>
			</text>
		</command>
		<command event="Closing">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7eXbEfIkv6RE7kjnzH9QTtUHqT6082fe6weU8oUzzGQeumasvUwB4ezVg7GKyExocgvl239NvKIsTT/D7bcYuGY=</encrypted>]]>
			</text>
		</command>

		<command event="Inserting">
			<text>
				<![CDATA[<encrypted>vp0bzF0O1Q1IdFZocguDTsndn45CaAila7VfDt5U5J3N5ap9pnw62oS5YIOS8fLmyE5+IryLljC6UUjRGUyVK/mFASAtDltrECgMl3lYvagOqzPg/+9ntm4DB7AwYcPh95w27sTqV7GLcBBRxYY2iw==</encrypted>]]>
			</text>
		</command>

		<command event="Inserted">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f9DMtri2oXjzdywzRtXyI2xNRs4gs1YZQ3rUPzE+a2q1V6GcH638wPnS4gRNGHjtZoT6/9qsENDt1QeMIuZwHPzjJ2rFWLV7Q6rM4dvO3MnPWKPUI4xRY0xcPq0zClM/g==</encrypted>]]>
			</text>
		</command>
		<command event="Checking">
			<text>
				<![CDATA[<encrypted>3cdZgwdBV1PVzTfxGpbe4GGlLjQO+FiBL1iVEEoScAHRJxcqvxx/4ABV5qTd4zXCebPRryMuDYmeb32Fcwc4NlhlqTFRC7Le8Opufrr403cWLQF9RBHv8XX8XfN628LItrNNhWxtcaHU5vqhAacZecUXRxbFNbBVSrmdtcvRVHgOK+IU4dCuQ/rmx9jQLIeWn86UQm7bo9w1JQCvyq2NY/2xhNr9VnGvQdqyFlLrbnnmn4irSyYZ388iJJYqGAeOG9219J+F69oTmsuV92uNPQ2cam7nV5na4YoZz+CJ+de8cJMX+8sEk/2TYyj6aU2G3VFheH3s9E792eLpKRBNR66e9yQagqLmxV2TK+01JVkx3490yzsfveqaBo4IUu1feDqIj8bAWD9NQXYoNsvaO1QbIHUK4lxpLSLQKekA0kcDjvfQM7DOMCTj+hh+qdeHRKB666Y4dlLdO0IQMwojNnymGeXPeKTpIDNuD9f5JnI=</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>wcfTmQ427iyoNSt56czfTkvclUri5kjgtCYNr7wbkNbP8dHWqrKFg1dZiXmKHdJs9A+ApX2c1Pc086FhDNTF3uJOl+AnbbYhgY+5Sr90ctul7RyafIxNDcxaQi4krfmNygqX8iKO3aqXEyhBw6xb/Vt9Dez8pBUIeBmaafEW8XNOc4is9inIxGcwfCdW5w7vjJZU1tF7UjyZ0Co6L2OG+QibhNqPHSSE7Nd0HZZLjzP8GoLrfa2yYJi7Wj7iTlO/qrotD96URFf6pNpA4sRoVtbleGrSL9H8YV/PorvyvDGMtHB1knjhIVgSZfLxSn9PN8WSBzXfvgW95N/4Qici2ptLXC2JZxXpfOCUx7Q7De5wBwFA3iRcPIgvx9y8APKoFxJfUBvfrefdQeU77VhfqTDM83+qFkXSciZPQ2sOgfpyJvgbCnKiK0iI+4rpd2zYQjiaAtrTVGSRgHEfXU/SOnC/Viztl4Lth9YfMiyKgAJZKbtBdSydB+ZkEbzkkNbMl9P+xUhJp9fn8rTdhNfP/cMY8a/+XmWFaAjKdbhAT4JnMG7SigKSy+qfEl6kBQeKHu7pcT6OgaoqH849SYS7j9mMIx6DSrhIAnIxryjggErRi6OKn9hwG8aS0kWlF8E2WgMQTSdvbGJQnNvEJfR4TwJu5brXMVYmFM5msS/P8Bx9CRyI/WSCK9sLYQR96Eg45/3vTeI9zzo11XHfc2xV5L6xuH+jpZhynnVIvp064AX+RpgWTNlOqRol6kAJg+rvh0bREX6zt+bCkMawgu+5OZ4RwnIu1IxCBNbfrglkj+m/m0rC0EUKQQ6qtXLueOpxZyQ7snz87m4aLPzGubaE4bLBuKpCAPf1bZDPhnQUCJ79Vm8Remm7f8pcAUsnoZ9rhOubHjWfoW41AceD7ySJth14VD16suiR3cfsHnqB775FQRjdrO+fDWvDhpFoA5y5</encrypted>]]>

		</text>
	</script>

	<response>
		<action id="stt">
			<text>
				<![CDATA[<encrypted>PCOs/4QYuSCRfE2jl7z5/ytPeZIVcf4NaVyUCAZQwX1e5GPuLDLmIFRHT5cQEPZY9sjrSuihIWij9Xp4EcjVnDgv1Q21SjE+NcoStq0/472llPrcp/XZ/KDrEcJJ68B4dJOL301C1SeHVg0DuPzv2qlnfriAdRVmHZKZHaS+qp80J5Nu+l3/rn98/Yr/qnqxYykP/SjgPooOs1d8GyBba5kPL241mngPmIRX3FFYEGc=</encrypted>]]>
			</text>
		</action>
	</response>
</dir>
