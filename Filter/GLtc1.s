<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
	<!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

	<!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
	<!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
	<!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

	<!ENTITY Form "GLTC1">
	<!ENTITY defaultTable "V20GLTC1">
	<!ENTITY defaultForm "V20GLTC1">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="Điều kiện lọc" e="Filter Condition"></title>
	<fields>
		<field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
			<header v="Đến ngày" e="Date to"></header>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa48/EVfKu/nBIlvVoc5tgv/FL51C9Z874rO7WW+QicugIu6uUZ/AbcWiZ8iEfMglSCA==</encrypted>]]></clientScript>
		</field>
		<field name="ky" dataFormatString="1, 2, 3, 4" clientDefault="Default" defaultValue="1" inactivate="true" align="right" maxLength="1" aliasName="Quarter">
			<header v="Quý/năm" e="Quarter/Year"></header>
			<items style="Mask"></items>
		</field>
		<field name="nam" type="Decimal" dataFormatString="###0" maxLength="4" inactivate="true" align="right" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear();">
			<header v="Năm" e="Year"></header>
			<items style="Numeric"></items>
		</field>

		<field name="kieu_in" dataFormatString="1, 0" clientDefault="Default" defaultValue="1" maxLength="1" align="right">
			<header v="Kiểu in" e="Print Type"></header>
			<footer v="1 - Tách biệt tài sản và nguồn vốn, 0 - Không" e="1 - Separately from Asset and Capital, 0 - No"></footer>
			<items style="Mask"></items>
		</field>
		<field name="ma_dvcs">
			<header v="Đơn vị" e="Unit" ></header>
			<items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
		</field>

		<field name="form" allowNulls="false">
			<header v="Chọn báo cáo" e="Select Report"></header>
			<items style="DropDownList">
				<item value="">
					<text v="" e=""/>
				</item>
			</items>
			<clientScript>&OnSelectionOutline;</clientScript>
		</field>

		<field name="mau_bc" clientDefault="10">
			<header v="Mẫu báo cáo" e="Report Form"></header>
			<items style="DropDownList" >
				<item value="">
					<text v="" e=""/>
				</item>
			</items>
			<clientScript>&OnSelectionOutline;</clientScript>
		</field>
	</fields>

	<views>
		<view id="Dir">
			<item value="120, 30, 40, 30, 100, 100, 130"/>
			<item value="1100---: [den_ngay].Label, [den_ngay]"/>
			<item value="111----: [ky].Label, [ky], [nam]"/>
			<item value="1110000: [kieu_in].Label, [kieu_in], [kieu_in].Description"/>
			<item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
			<item value="110000-: [form].Label, [form]"/>
			<item value="110000-: [mau_bc].Label, [mau_bc]"/>
		</view>
	</views>

	<commands>
		<command event="Showing">
			<text>
				<![CDATA[<encrypted>ps2s3Ku5V0lAVXvoO4HoIiX/MPuIOr2gB3r/Sg9SoffoD5i6s3UkjnBEg8jrN9xgYQXhjxmPsCtcqot1qt1SjvM2ND/xyZGF+DI5xYm5hZ38x2i0TfsfHMu//nj4Gya1PkbtvnzLmW5Se7awdGang7CtaE+AZecNl6v5OWke/k8Hhfd9l+e+zD1K46WP9dRoQOmFTJ9JGPW/lrjbAX1u5+VCCXK64Aa9waIu6IELhC37C6YE4AvidVglwTws/LxjAC0Xv0Gz3IID3v+fTubnARHULpth1wl4fsqu813TN0S9jU86YC58M4RKDOx/ZZke</encrypted>]]>&defaultForm;<![CDATA[<encrypted>Qsl8Oc64pKaf+2oIxpE0dlzzgekyiuFTMe3eaex9UBqdiwUP5J6BK3vzDtWAdcvNFn+VhlPIumAVQOuhaSWsLERdD075Zx4ZWZbp/ngVSNa8RTtTk/nX/U4nWCB9yJWoG5RHK2JIB0l6dRdmDPZz1mry/TgFz9hI8OZsccIoJo48InM7kb51AAa+yKU5Ag89wTJNjhsbLp9hjt3kMUThS1afzqX6ZtyCU8feMAF0hwlwmYmFXvYuOamUsSoBKMYFW1tfIX+pWfTyu0vU4Yi56w==</encrypted>]]>&Form;<![CDATA[<encrypted>pEWz7kha+RrPz6KhEZAdbm/Wo+trbd3mjFa2d391YZdpI8LgAAPRuOsvi1t+uCOxjHj7aIMl0eigTQLs23+NwBzcXKsCrqOw3J6cjFC2co2gKxBo/hqHo3ncYHVY+aEXLcrASS9tjc76VLHnoPDQbOh4RVVMKarQIgwV2S9HntMcepxyih621jnxVhT/if9b/lO/oU5oIYa7X5CHBqtRLtwZcsxyX+Lr5eWpZaOAZB9kjMxzniq81IRvCIs+BVhxha9mk+g9mNs2f+3yZc8CtwRiQuWsuujW6XVuK84iqFE=</encrypted>]]>
			</text>
		</command>

		&XMLWhenFilterLoading;
		&XMLWhenFilterClosing;
		<command event="Processing">
			<text>
				<![CDATA[<encrypted>9jvYICQM3qZKMNh9SYJ/+ZX+OT0ZwesEPai37c/thdu2fwgJE9rrmGwurWCiU4xhZG/Yo+QdoYXJR4VmLDJdfSKoF+eut5pHrTwy4Ibb3lNmzNQd59UGlmNGcyjNi8ilE2o+5a8AjXKb2n08oHVwh2E2jlVIst4f7LwKxColXXffqMUP0pBc1hdnks/WhcU/TZe8DVUm8yCGjGEr2qWll4ifLmmbA3O5BUJOFqVpqngyQXG9T/TqylZLE3rLT7Lre4CUa7jyqD6n3iZLytLGYQOw2HU1/yGGnF4DLk3cGy1V4EEHo1M2HOXq1BCHvKxF</encrypted>]]>&defaultTable;<![CDATA[<encrypted>QWTWCONuTzfX2pQnQX/T2ZGdd+a5xGawZAuM6WA6/Jf5MXcqotPSNbpLOHd25XbU6B1Q3qB193ZKAbRXTR19HNYjsKa9KRQtgeDc8E3XfTQ7yEHEsh3auOlAdg8FTJOvyeGTC0Hjs4iR3V7EbF/7oYM1EKSTjlrg3f2mddF4O1lqB3pHHev8aOpzdPF90WrMo8TexNlVZt4WZrOSGF9Brnx2Tdt37eKSr/Xm7UjFA/Od4qvlTAZyq4VzUcp7pyK81FrcnDjM5xqPotQ2z7MONJQsvkU8lJXgV+UPBWGksJ7YCNM2peByLJBsM/O6DPMrGelZnp0rLFPXehR1Ecfx6Nf84ozkZL8rzp87fJd0WpsMIE90EiCQI5zs7o7hh1TKxm81l6XPXhC16qgQVfNC0dRwKSPRES/05UIrmUBfaItg1/wugbeprlLlbqNhSfpNonEk9FJQTsimPapoiydHWQ==</encrypted>]]>&defaultTable;<![CDATA[<encrypted>hIkygextHKuq2BRkUg7KaBI3b5yvWT/V9TTHfAjtv9HMZbEtjK/jb5G8QKOKV3dSnva9XWOwGUW/bA+9UJ+BomndBkIiaH8C6ddGiFS+DzlbMR6JHXvPF58V/K8Cd6Oalv+VyrJKOyYoshYKlof3ner0jP69RYuzCazXMlZ3ghM=</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			&OutlineEntry;
			<![CDATA[<encrypted>VAYnf/v8mhtAdQG6s2pWELSHY5CilKeehLO5w/+Xd2P+mfo++6njO1+eTuZD9pO/bKMz83M37Ju+N2sH5a3fdap4VvRXUupt2vwqNKSafY0cQCkGxk72e9G2eivArSvUyMqjWi4SvuX2sSX5rT6xqswQZIaHp1t0Ok5giG5QUY1UHeHfhIKWNhKVCIG6vA0qVf72qv0Rr5ht8Zc4ogtyFG2A3wDZyziK49jG74Q/L3XvBRGbjGJ78iqGA6UoWVdx/SepEzWZYRu0PxaxF0l+EtvSvx65fs8FqQJjKHv9sBTre3Lp4ctIfEBMdOfpQARlHmoAabyClG7tU5N1BzxgeuIaASilr3tPfZ576enACiEb4cbdgKN9jpxg+551vHHaFI5nei5a2LGkdqOh6HdOs4EQPTSFK+uPyRLhPn8YJNI8DBmwkV4yf1h93a62V2yCeSp9x7ACbCPphxeAXaGHu/d/1OoxprZr8ycPP+Mc2tTkZCXFj8G1Hr7VsK6qQAs8wpkJr+a3U07YkrG5R8etSBiirThl89tuZ1ONAHm8pL8+/5ASHLVMDgB7WOpHFuL6WzVC7R8zY6J1WdO8AUlsicf49YYv9LdYQQi6LvqWpT34cUdbJq/3+jUtSYUf2JIYhH9HVVVh2k33QvtMHQmr8btE8tfoSBRkXxcF+dQhEeCf04IpZJsvfkvSuup79beOhEC5c/LnVPAzL5Mwr4X2GGh+YAaeidfX+pNyuhJjfeZ35YjrvSotNhYqc+A7yY0cH8apSOmRKsoIL7gVWx3yQnkrcrOBflWyR3v90G+sdWoxeaM7z4UHQaAKeYJRMsXDho6ELEw/koblWU+sJ1u3Q8Aue5WRtNm1gdgm40HRsgJVV2IyypdvbuTSv4KdbPUcssxEA+jHbtCHJN00Ixy++L1L15eS1XjWazHTtBY6igUv0zuYVah9vwaKcrAjOo30bVuw3WAvpg+12ZfPJZjT5H4+kRIVgsVxGS4XN7OZQKfqf3wHJJsFgb+Fez1Q4GN2</encrypted>]]>
		</text>
	</script>

	&OutlineCss;
</dir>
