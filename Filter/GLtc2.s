<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
	<!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
	<!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
	<!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
	<!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	
	<!ENTITY Form "GLTC2">
	<!ENTITY defaultTable "V20GLTC2">
	<!ENTITY defaultForm "V20GLTC2">
]>

<dir id="1" type="Report" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="Điều kiện lọc" e="Filter Condition"></title>

	<fields>
		<field name="ky_nay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
			<header v="Từ ngày" e="Date from"></header>
			<footer v="Kỳ này từ/đến ngày" e="This Period from/to"></footer>
		</field>
		<field name="ky_nay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
			<header v="Đến ngày" e="Date to"></header>
		</field>

		<field name="ky_truoc_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
			<header v="Từ ngày" e="Date from"></header>
			<footer v="Kỳ trước từ/đến ngày" e="Previous Period from/to"></footer>
		</field>
		<field name="ky_truoc_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
			<header v="Đến ngày" e="Date to"></header>
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
			<items style="DropDownList">
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
			<item value="11001--: [ky_nay_tu].Description, [ky_nay_tu], [ky_nay_den]"/>
			<item value="11001--: [ky_truoc_tu].Description, [ky_truoc_tu], [ky_truoc_den]"/>
			<item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
			<item value="110000-: [form].Label, [form]"/>
			<item value="110000-: [mau_bc].Label, [mau_bc]"/>
		</view>
	</views>

	<commands>

		<command event="Showing">
			<text>
				<![CDATA[<encrypted>ps2s3Ku5V0lAVXvoO4HoIiX/MPuIOr2gB3r/Sg9SoffoD5i6s3UkjnBEg8jrN9xgYQXhjxmPsCtcqot1qt1SjvM2ND/xyZGF+DI5xYm5hZ38x2i0TfsfHMu//nj4Gya1PkbtvnzLmW5Se7awdGang7CtaE+AZecNl6v5OWke/k8Hhfd9l+e+zD1K46WP9dRoQOmFTJ9JGPW/lrjbAX1u5+VCCXK64Aa9waIu6IELhC37C6YE4AvidVglwTws/LxjAC0Xv0Gz3IID3v+fTubnARHULpth1wl4fsqu813TN0S9jU86YC58M4RKDOx/ZZke</encrypted>]]>&defaultForm;<![CDATA[<encrypted>LE5RHG+dIjVbDQrlV+gkLoBSjT8aHqUAlTsPoYivJ+9uXBkRqRt6hRpTeUN1Yg0doPj1uU85R0j4rJ+3mw2rcVN3XZBnvl+arLhY+4o3M94hE+J0WJCd+fJta+wEtvlGn982SYVvr1L3FPLLpE1aYXuleM0F+ylRyfZ3emTGm42vCp2kDknvR/JIp7+oCdCNBj4FcQe6xIFAEQ3u3I1TNA7dzFORjk0U9Wt83gGco9F575Vjt8MJOgaI2vM4kIXqQXVPMMLMxeXZsH+ucnvAzQ==</encrypted>]]>&Form;<![CDATA[<encrypted>pEWz7kha+RrPz6KhEZAdbm/Wo+trbd3mjFa2d391YZdpI8LgAAPRuOsvi1t+uCOxjHj7aIMl0eigTQLs23+NwBzcXKsCrqOw3J6cjFC2co2gKxBo/hqHo3ncYHVY+aEXLcrASS9tjc76VLHnoPDQbOh4RVVMKarQIgwV2S9HntMcepxyih621jnxVhT/if9b/lO/oU5oIYa7X5CHBqtRLtwZcsxyX+Lr5eWpZaOAZB9kjMxzniq81IRvCIs+BVhxha9mk+g9mNs2f+3yZc8CtwRiQuWsuujW6XVuK84iqFE=</encrypted>]]>
			</text>
		</command>

		&XMLWhenFilterLoading;
		&XMLWhenFilterClosing;
		<command event="Processing">
			<text>
				<![CDATA[<encrypted>ISlPAc7+AbW/2+pYAjr2SJK9tVtppElqlziTC/wsgcWoj8M6UFIwjH52HR5Wquokd0Ty11v2M1j2eIzn+NzaPImClfaVbAVWQqpAQUqlbKC+8SoqCQKV4uJIOArCeN+Jl2XOZ+nc03oQPV+rHh+tP+zgedIjfzole0AfGWgyZB1Cu0XW2fXrsu/4hFzygtxQZUtX2eXcMoZN6BOv4zcmQ+w8UfhGS32D991sHS7a3OdcqumtCTlsauhzpieeR0SGHb+LkHUmUyjeKKOqzWT31CIxzRZwzM1XCIE6zj1S/xl0L7aTsTk1DgK3fsFG496phIZ5BfGVoPk5c9NAywEcPL2vz+rPmgcrAwzmFYNvEcK9oe5H0qEkSGEQ2OZ/WJ2XPabgRFcO+tfs54Jjke10Dj8mUZ4Ksc+AuuUJgqJlC3qvlcmrlaLymqjmu71GiFpAsr/HqXxYhX9aPfsnr3fQ16+MMjCjl7TH+U0tJY8iKdbOeGhc8+Xo6SDD17LRnIXUkEy7P5D8so+ONzkewwYXtCKmYVAGykbwKUANrvoh2HfGxzQf2uusF0/UlYOIKjEEYACNB9N8UDwJxIzlQGL/5Wr1i4ZsC0RzmixaZTd3bJ8rrBEwo72pXEeaF3NfJIj1PRMRvEkAO5ixSjcum/3qR08BAH8qkGpypYwzAG+aiIXBe6Gf3Eu/Jn5z5kJSaI2kV8G3wkntYN0yDrJj7IELL+oOC/7O6Nf7Jk5c9qicxuC7EK8vzEK/M6cNxMIIoL/D5nVOGHLYKOSH4Xm8/bIheiRK60hP18VYy3h9KzVLSpu141497JX8MP73qASZd5usYqqC539B8LUGLcC+/wgnFvOetmsYURmj0zB0x7UAREt09ypI/WJHBQ9rVGf6EDQAYvvYgKxoCI0EEV62ZiX9cAxbw/QSiVb/YP5Dm21oEeY+fEmCeuwE/amY/O3rlcRKwoUu4kThcC6JL/OudYdgxm0vNCoB+Dqc+0ibXLlf7LTgUvj8N2q/oePy86RN7qk6TzQ4CNAA6YFHtJMUtWF1aGtMHpOgcgYmnC9hGW8ohxqoO80RpjCpSxe8ThdyYhXblFNLG4rhFmYHmQbNawUsFfxxCRkdXsuC/ltk5zqT9Rc=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>hIkygextHKuq2BRkUg7KaDVdfVFR3M1wZHHxj6ACL4pxqNcbH/L4N9foxHRAqVeBsN0wDB+9WK5WxC4l0zgNUk62J66gKZovaDcVOpV4qfWd+c2I5MDgAINihI9Y+T04GrDaFj7UtySH20vtUSKoWpRSU9UR5m2GhE0/dOj4V1k=</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			&OutlineEntry;
			<![CDATA[<encrypted>LubCFGRnGTAVvhAhBnlVEYIyRC423rC0TkOpG9ReY9sGCazxEANefFd7Aj55rTYhvy6FErwnElDY0rK/1AgQQQ10uB2jooXQ9oIlIVi68tJCKeR8pWYWaUOAcnFuZL5Po8uFvfNdquFpvZN6j6H56rY9CNjqPN+psY/89KQnhydsFfWEGtPKL5rbJVJ7YHP0dcJBShl171rSPgvCg+qz57SaqNlz2zULNK+mgw6FDh87mGflzrCqTigjxitCZsYcOEqGEcJb1VYdOlor7t+igK+Uu1wOYKZUT741X94uWNMwdEa+R3LslT2b6aTEU3MaxWNOPNd/HyGt6F9YWw1oxqjfaf2rEKKa3eRziDLIzOTykaPQkhtc4UWDWiNlf90Rbs3w9lbqsqkDSu2B0V6q3b7c6Fm973Jz/1vxtDDVUe9YZ5R4DUldcvl+xPZ0Mk1tyPZCqWWen8GkY8N+CjjyFVAmynlc2TeeLcamwqg0slhbhQod7pqaDiTO9C21M5UiMa3PEg0QzV1+KiIwwvPAVTgWB8GVzvXD7h3OrLlcPzY5rOLughgQseAGYek4qKwRHlJMgNrDuUXVGqOn7DVaiRVa3NkF4aW0cREhocZC81jpdeMBJgSG2YDDWp3GYascHvg3wliqO7ehXOCyF4HnVyEmyJ6Dewhsm/ULHMHUj9rGrk5oXtTTyjhXo3VJbq5jt/tq9ncJbFmveZLbvOeDYf/PkcEmJYI0iPLFKC42ryz++R5Jb23KMc4gW1Eu/zUUqT4WXCbAcxsZuHRxRGaKn0zIX3E0j/jEyOF+LSSrgh4DgXnah6RVKEVu0igeKMhyp+O1D/jd8Ol1GT/1ETrYHmY4CENMUS4RwwrLMn6XYNo3sO7mXQYavmLKs50BBBiIzpfev2x9hsj9Q+weNd+qwNooUt3M9icvd9mwZbuzANj/8V4YsJlx0Sm3y2iz5ZcQxD28fkSCaRzO6f92K89F8MzxzZsua0zWoI9f1GY2IzXne9mQKeFzxtE+ObtZPlQ0II9xDQUrzymD6VxwLBwbQMwYTFMpE9QXm+4aVV7Uz9M2/X3kJG07jb3wWBiiD0j5DJ+Mm/ccd0O1LJwG1BQfAczZgzhhf1zzRxDuJAgIswqCLXtPYFdsWjZh72t4GccA</encrypted>]]>
		</text>
	</script>

	&OutlineCss;
</dir>
