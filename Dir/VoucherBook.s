<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
	<!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
	<!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="v20dmnk" code="ma_nk" order="ma_nk" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="quyển chứng từ" e="Voucher Book"></title>
	<fields>
		<field name="ma_nk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
			<header v="Mã quyển" e="Voucher Book Code"></header>
			<items style="Mask"/>
		</field>
		<field name="ten_nk" allowNulls="false">
			<header v="Tên quyển" e="Voucher Book Name"></header>
		</field>
		<field name="ten_nk2">
			<header v="Tên khác" e="Other Name"></header>
		</field>
		<field name="ma_dvcs">
			<header v="Đơn vị" e="Unit"></header>
			<items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = 1" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"></items>
		</field>
		<field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="loai_hddt" dataFormatString="@upperCaseFormat">
			<header v="Loại hóa đơn" e="Kind"></header>
			<items style="Mask"/>
		</field>
		<field name="mau_hddt" dataFormatString="@upperCaseFormat">
			<header v="Mẫu hóa đơn" e="Form"></header>
			<items style="Mask"/>
		</field>

		<field name="so_seri" dataFormatString="@upperCaseFormat">
			<header v="Ký hiệu hóa đơn" e="Series"></header>
			<items style="Mask"></items>
		</field>
		<field name="so_ct1" allowNulls="false" dataFormatString="@upperCaseFormat" align="left">
			<header v="Số bắt đầu" e="Number Start"></header>
			<items style="Mask"></items>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa44QPOPRiekt328s9kHAtLA9nubLRUasKm3LVLWW6OLdekq9wbrXZsqAHegtxWpw9TQ==</encrypted>]]></clientScript>
		</field>
		<field name="so_ct2" allowNulls="false" dataFormatString="@upperCaseFormat" align="left">
			<header v="Số kết thúc" e="Number End"></header>
			<items style="Mask"></items>
		</field>
		<field name="so_ct0" allowNulls="false" dataFormatString="@upperCaseFormat" align="left">
			<header v="Số hiện tại" e="Current Number"></header>
			<items style="Mask"></items>
		</field>
		<field name="trung_so" type="Decimal" external="true" defaultValue="'0'" allowContain="true">
			<header v="Kiểm tra trùng số" e="Check Duplication"></header>
			<items style="DropDownList">
				<item value="0">
					<text v="0 - Không kiểm tra" e="0 - No"/>
				</item>
				<item value="1">
					<text v="1 - Theo ngày" e="1 - Daily"/>
				</item>
				<item value="2">
					<text v="2 - Theo tháng" e="2 - Monthly"/>
				</item>
				<item value="3">
					<text v="3 - Theo quý" e="3 - Quarterly"/>
				</item>
				<item value="4">
					<text v="4 - Theo năm" e="4 - Annually"/>
				</item>
				<item value="5">
					<text v="5 - Tất" e="5 - All"/>
				</item>
			</items>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa42I4CJdPnCvp2Kr0AwhwKJFfUbDBQPDKlBbsxDkFTXWOPUsvkRLkbbiDgRdowfZicJqCOA6dzu/VqeKYFcfMReXq5O3J/CYUUNsBP/ohGNMbVmhZwl25mTOiZ62EE7oAYdG9+qH4wLO49t83lbag7yg=</encrypted>]]></clientScript>
		</field>
		<field name="cb_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true">
			<header v="Chỉ cảnh báo" e="Warning only"></header>
		</field>

		<field name="ngay_ph" type="DateTime" dataFormatString="@datetimeFormat">
			<header v="Ngày phát hành" e="Issuing Date" />
		</field>
		<field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat">
			<header v="Ngày hiệu lực từ" e="Effective Day from"></header>
			<footer v="Ngày hiệu lực từ/đến" e="Effective Day from/to"/>
		</field>
		<field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat">
			<header v="Ngày hiệu lực đến" e="Effective Day to"/>
		</field>
		<field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
			<header v="Trạng thái" e="Status"></header>
			<footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
			<items style="Mask"/>
		</field>
	</fields>

	<views>
		<view id="Dir">
			<item value="120, 30, 70, 100, 25, 25, 180"/>
			<item value="110: [ma_nk].Label, [ma_nk]"/>
			<item value="1100000: [ten_nk].Label, [ten_nk]"/>
			<item value="1100000: [ten_nk2].Label, [ten_nk2]"/>
			<item value="1101000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
			<item value="110: [loai_hddt].Label, [loai_hddt]"/>
			<item value="110: [mau_hddt].Label, [mau_hddt]"/>
			<item value="110: [so_seri].Label, [so_seri]"/>
			<item value="110: [so_ct1].Label, [so_ct1]"/>
			<item value="110: [so_ct2].Label, [so_ct2]"/>
			<item value="110: [so_ct0].Label, [so_ct0]"/>
			<item value="1100-11: [trung_so].Label, [trung_so], [cb_yn], [cb_yn].Label"/>
			<item value="110: [ngay_ph].Label, [ngay_ph]"/>
			<item value="1101: [ngay_hl_tu].Description, [ngay_hl_tu], [ngay_hl_den]"/>
			<item value="1110000: [status].Label, [status], [status].Description"/>
		</view>
	</views>

	<commands>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>TnxBFbTtAUeYzudGYs8RxEoatgVOE9WXOo5j8j6Bw6ZJ56OBSPoVr2VvxFqUg6TbbvTSZh0uehcr8nFd2vAxe+no8i0jqlTw0dw0/XXPKjl/J3AtLU5VtaGc6IXplLv9e/UCy2p8u7N+UnwrXZVT4Jh2zixVSajePu4mWtagGHe81xF6W1iTEo1fzOIv0IpbhJ0FEU/p8BlPEMRrPnTUL7kExIpa1KHIGVJ9vlAFkNP8m+Q81Ae+z6Z9/IIs5I4uQJu6eB7XTbx6cTOk58eRxL4OD6lDdU9vTmMQm3RS8CxBSQrqdIbHDCR4uGDU0SYg7aBIWIXHTL1PDhXW5MNmiGaTtfC4DQCXSCNUbETJpM+hmyu3MjjvnxPxmrGIG1sT</encrypted>]]>
			</text>
		</command>

		<command event="Closing">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7UgcmRKcBwlzfRspMq4TAYgbUI6JB2GBURUT0Lw+/q+WVO6hP34Afn79xQXF+alRVfzMy42de6H4ES3DTEu6AXsis1BihUdFPYY/EKR9RQTG</encrypted>]]>
			</text>
		</command>

		<command event="Scattering">
			<text>
				<![CDATA[<encrypted>3HrabRLCohfNsIV44pzJ+g7GLQ+q3Rs5S6BwlQmCVYUdjSLloGXldfR7hPOOTV0oY/aGzgKyVicAW+8YOvabYSND8cQhGyxKTfZUQpi0poIhN4OOeYmpeJCzNclPvWYDDsCSfzhB9YGfO2xSdd4T+vmT2J6KWqETG2ywdwSi1sw=</encrypted>]]>
			</text>
		</command>

		<command event="InitExternalFields">
			<text>
				<![CDATA[<encrypted>anRcA0eXP/GmfG1Gz6MyXazn/kNwC0LKGYBDrA7GsRzu2oPCVapyl7uaBn/YBmEv9JOwmmddT83gzSG5b/yA7ELA7hbURiLkfgA4HwKLJ4XCXy7DnOm3GE5JysvPm0oYrC7USlzRYMSUDW3EkXZJDIrqnFixfsDuMJA/ZAV3Fz447bVAYQMtJlkL3vuoqw3+HuVTvO2Sys+lH9nBggps6Q==</encrypted>]]>
			</text>
		</command>

		<command event="Declare">
			<text>
				<![CDATA[<encrypted>P2D9QXUkGseli2+1DxijPFhLUdQQIh9htdR/umQUuiCjcjGqSQm1f9qqwnaJgMarWRYYxx/PIsostczJY/a3svAGzuFNpmibY/I+etbIABPtTENlyHyqtYq5Wb7JGFp9nDcwcG20nhNqbYovBBiN2cTCjy7p3zWT9X/RFlfY6mywLuo40lRgx1qksrK89h1vgHqu5l6lq2iY6dnwSJA6KKVe2FpTHKGHN//O2e/KE+BHvdCWUh2uq/zFgR05saucO4+pdb3Ng5ybaBA7JRYLecQcela7+t4mN/SMTHwPPzQttyq4gowcFvM47W2dJoh5zriQdcgXDMU4GADbGvutsc3ZGtpIHxlhvYYVDYotIsy1ciWUobyEj/Zp++mExNzQDrrRAAXbqKZ2NqAY8EnYWwHXO7NAr1h39fQraxdatcPlpLIk06iDnmILLr3X/vaFXnE2KOWL8ghaOn5bgGTsJzEMqt5CjYrupf0jclagw8CWA1Ud7+BqNH8d6xHsXGW42Eb/FhsrCs2qE0INnbz9SVRnXZJ3n4vOVaHmqgxo5HidnCNUpe4dZW3KwvrrfyqBIVqckVywrTl+XgahZF0W56sm+gLdVkYRgZuEeJpzU5M=</encrypted>]]>
			</text>
		</command>

		<command event="Inserting">
			<text>
				<![CDATA[<encrypted>ClTD//+nwOCLyvNghwOLTPWsFE33F2IqWTcA3hlH68Yf8VpkdqT4HXqpdf95rnuZkJ+pP0/jkXtnsZIEKdY+tdTWbSiQxHfyJ2i2iv1zX2o9JhS5y44Z38arM/WVJB6S6Han35jfjqCKOEfIfrrwEK8fXLPQkdRAb1XPJJTCgYkTYE776JQ4B3W57GtI+cMEC/PoAWnAz5pmEfFPFz4nqzu3yeaIycWsKQ/ObcyfxdmkqjT7ikHuA03eUBC94LGKzJJJzAjvyu4qpC2tLBBfgB8XaHII1qZ0+9TZ4CStYPhjEak33rJ+TLTd3VYoVENz</encrypted>]]>
			</text>
		</command>

		<command event="Updating">
			<text>
				<![CDATA[<encrypted>kLBIDnPDMmroNd2l8rtJ9MlwvLLLxYbWCCbJ/Md2KeJ/YkJit8rkXD601MRGOVQOq97rUEoeDYSVZ/p/Lw0P95J1l5bmo4P10tgcKJ7/2CAOarICzcQMI170VWLYRr4bTe11msM9gDuw9T32wdvaMtGN23fmiacdnoPCEhs+p1DJYXvasFRqqYssXXXj8Cc2/zc7gLnLPOuMz+04cAKnUIAjOXSQ5Ytzxa/keG9hf/EX6s+aQyYwsgg14BCBdvqQ75nz/2qPUIjU+hUaB6dexLcXKTQ9HB/Nq5XcjnlRoxMhWHZ0G82+MgiaBb7R6erLQPMRP9C53LYf4p+ctu9URYLMYLWo0cR0z/+tDzhznl4HnjACGuik+ITPTlX2lXQA4L06pdUegzDDd1SxXqWUOtoBBnCD4/7pCVaUfv5SQi7OVoQhe9b2D3n6WZ64nMHXJ1QvslBgPtI+FT2IO+O0XoZaQAqS/YoXPGJMXyLLjPTRFMV9PWUQshO6q126V92g</encrypted>]]>
			</text>
		</command>

		<command event="Updated">
			<text>
				<![CDATA[<encrypted>PSIrdBmyy+4lkc0WnfFd3yEptXOWtWugcwZPdoryj6ypohE13O/rAeOgXW1DizdLDBTU2I2aa2ZSN8aX9xRjOmoZ2YPgZ06kzWB7/CIUjuVWTBxiinKR8tdprk063T88MhKbPfEQQoyv+jA4mu3K7MqxVfvdaj7zYcDbIj0XvlWDQ0jUIJREBQu6XEtGlXyi</encrypted>]]>
			</text>
		</command>

		<command event="Deleting">
			<text>
				<![CDATA[<encrypted>Z7m+0QFYICb1S3t7UvWgDtz7ho3jTKECMWm5T7DsXwyEhXSkrmOoswX6LspshsYo1zuM17LWvb+UglTBF4tAmtPYlp9sGchWwZwIvkWfdRDKxOt9NyvyaVug6QhHVT1N4MQiCtKGjMc6IEHoRI4dB2VuqdA/BMlBeqi7JE2/I39ciRJgHmPlUwuGSCjYkrj8sA9ktn7wFfnjaci1jm9N7H0PQbxR8tTCpmvPSx/5ETs=</encrypted>]]>
			</text>
		</command>

		<command event ="Checking">
			<text>
				<![CDATA[<encrypted>z6zwAEtxRJtZs/Bk7jjoYX4NJOVS8bpOad/ksRyHEh5uANoOt+gLkujLYdcfHBnBHfu469mUt8xlSKv1EVQiNGRSs+NJjsBKMwUyRTKezq9kDZuBXDmSaJ+p68OUkm1hn8nm+HBkkaH00aJs0qXQ9MlqnYFlfpZbMkTJi4S3LFr8morQxbaxPx3Ow/hbYqgPU7CaAOwOP15cbPP87bEBjsc3o1oZICeqpH/spR/vdnAyXQWvqTs6fJg32mqff+PgqeclIyxNF7pPpV3TOFYyVyVFulHwXzGglXQFzAE2uOUR68AZuBJNyRyqjScl2xVwdu1BI89j9Coydlvg9EUV8uonR0o8YDOH4JimnH2+r7KT1xxt31pJm1WmIAWAZn+J</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			&OutlineEntry;
			<![CDATA[<encrypted>KtrKiEWd/7B7q6HGNdUVzRq71uvpb6UD/wk1ajF/CSWxRwRWbGGQMqQwjI+DMCs68c2piCSx4QNps0wo8UDNbOzvI1NiYJu7SHeJFKCiXZjipN9sRUv4T7/alQG/WDfE8Pb4KXTJB8BQGxp//MvnbZ8KaKm/iKCIjwN8SXhdbff69k65DPhAEmOigdTyLcAGS0PubDSUu36IQ1mflAjoOVONH/yR0xH+YKXLTBXnSjQDV2bsPVowzkaYQmyMshvKKhlSWuAZ7iAJOXwaPXG3uYT5RC79phbjVE4sLkvp6DCUAFGRJKPp+XYv6Z6X59hgtgmnRTjFG3AupJM9fAAhOHcyvnenNGRZM1q9RFyl46DGXINh8pHSYluCIVXa10SESDkgsVITCJJu8Z/SK3R7zIbnCWvkYcnOX6cKTWymkaqaU7xXKPiuko0BARXhpT98JlFj0PRs98oBLdevYVhu0vvq1p/TdKdLpT78D1RhZMOhCqDOF0ZkSc/6ugdqMbk9hDdqki3tmQTFsBc1MjMMm0nB82pqINa5vFPZw0dZ+Z+VhQ2DNRCn1sTXZ9Sra/zPoemm2pOzJM9t2xTLrqzE1c1XOcNNI3AsmmD3yJjY4/5Qzc6riWwp9TV7UKsiZMpkV7/Bkda++WbGlVkDhEyg8SoK6VY0J2Fl2uPJdhpHEpbQxUeMvFaVvX9wBhVcIBxesqNAZvy2FSrXvJWgCDCl54rb+6BGmrk29SYqujyzVrKhFtK4M9yt6EztBmzgW2wl4ZYTc5Mdc0yI5a++9nA2C8ss/+77whKF9F8YLdvIeZB51CF6TfVAz20HYDTjCQsWzkHvKN1DsJO3n7cY6tkUgTLfeGz/KwbeLoX4Y0gUGvzPznceVoZl1/FgpPSQKOdhwcxfEjh8xxz3/I+yhWZN7dPYGg9ufwg16jfi0UlsZiGcOIxDUnGWa+2UbeWpsGF7</encrypted>]]>
			&ScriptIrregular;
		</text>
	</script>

	&OutlineCss;
</dir>
