<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
	<!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
	<!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
	<!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
	<!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY Form "GLTC6">
	<!ENTITY defaultTable "V20GLTC6">
	<!ENTITY defaultForm "V20GLTC6">
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
				<item value="10">
					<text v="Mẫu chuẩn - năm" e="Standard Form - Year"/>
				</item>
				<item value="20">
					<text v="Mẫu chuẩn - giữa niên độ" e="Standard Form - Mid-Year"/>
				</item>
				<item value="30">
					<text v="Mẫu ngoại tệ - năm" e="FC Form - Year"/>
				</item>
				<item value="40">
					<text v="Mẫu ngoại tệ - giữa niên độ" e="FC Form - Mid-Year"/>
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
				<![CDATA[<encrypted>nYlgBDj9k4J1bsPz19K3mlmKil+rNw+ZofPMg+dJwluwlHNDPgsBtk2WSlZFe0H/SPLtCixxA4p0fr71+B0gl/iYsYykjKAf2RGTuNvplzHiXkmksdYf85ODpkifzV8o2EmflEGw48auRoBUYxhGeHa2j3C35rhrrYmDoOzKdM/xGI4v3CrTEF6zdel/PwFc2iIp7mao2fYlcdX827Hv6F6E/K8900NZ0w5LQ41rtRqVEA5uLWPiWRTDPStgEyQXEh3Pau6Tf8C642CwUSs2QTa9btDIgPsbaWFwXrssMyJFVs4ka1w+f1qlYuFFkypjQ8Lqf16tfXHc3EoRAkbKCA==</encrypted>]]>&defaultForm;<![CDATA[<encrypted>LE5RHG+dIjVbDQrlV+gkLoBSjT8aHqUAlTsPoYivJ+9uXBkRqRt6hRpTeUN1Yg0doPj1uU85R0j4rJ+3mw2rcVN3XZBnvl+arLhY+4o3M94hE+J0WJCd+fJta+wEtvlGn982SYVvr1L3FPLLpE1aYXuleM0F+ylRyfZ3emTGm42vCp2kDknvR/JIp7+oCdCNBj4FcQe6xIFAEQ3u3I1TNA7dzFORjk0U9Wt83gGco9F575Vjt8MJOgaI2vM4kIXqQXVPMMLMxeXZsH+ucnvAzQ==</encrypted>]]>&Form;<![CDATA[<encrypted>cW35VOUBdy5zaAMDIr7A8xOVt0Hwl9JDdPwRQIsyuDt2le2KPoa2a8MQnqPzdZrNITlis1jdw1EZJ6atOcNxrYByro+H8slzbqynE9c3vw9dkHE0s1NtMlDVMtfHoUEyu+hanlzojAUbWoAr2gy2ojLRYSrq95TtMGT6vS0nSdEeshjRfXXIcxvARkBOgxCD5vZQ3CzaJMOcrXW9KzVYAt4t0GifDcWpNOlM80Y5tU58vRju2MCaXuLf7C1DRf2mn/sxUZ9p0qYmaxEA1dg/3uAchCZzFM+oCd1rcskMKUg=</encrypted>]]>
			</text>
		</command>

		&XMLWhenFilterLoading;
		&XMLWhenFilterClosing;
		<command event="Processing">
			<text>
				<![CDATA[<encrypted>ISlPAc7+AbW/2+pYAjr2SJK9tVtppElqlziTC/wsgcWoj8M6UFIwjH52HR5Wquokd0Ty11v2M1j2eIzn+NzaPImClfaVbAVWQqpAQUqlbKC+8SoqCQKV4uJIOArCeN+Jl2XOZ+nc03oQPV+rHh+tP+zgedIjfzole0AfGWgyZB1Cu0XW2fXrsu/4hFzygtxQZUtX2eXcMoZN6BOv4zcmQ+w8UfhGS32D991sHS7a3OdcqumtCTlsauhzpieeR0SGHb+LkHUmUyjeKKOqzWT31CIxzRZwzM1XCIE6zj1S/xl0L7aTsTk1DgK3fsFG496phIZ5BfGVoPk5c9NAywEcPL2vz+rPmgcrAwzmFYNvEcK9oe5H0qEkSGEQ2OZ/WJ2XPabgRFcO+tfs54Jjke10Dj8mUZ4Ksc+AuuUJgqJlC3qvlcmrlaLymqjmu71GiFpAsr/HqXxYhX9aPfsnr3fQ16+MMjCjl7TH+U0tJY8iKdbOeGhc8+Xo6SDD17LRnIXUkEy7P5D8so+ONzkewwYXtCKmYVAGykbwKUANrvoh2HfGxzQf2uusF0/UlYOIKjEEYACNB9N8UDwJxIzlQGL/5Wr1i4ZsC0RzmixaZTd3bJ8rrBEwo72pXEeaF3NfJIj1PRMRvEkAO5ixSjcum/3qR08BAH8qkGpypYwzAG+aiIXBe6Gf3Eu/Jn5z5kJSaI2kV8G3wkntYN0yDrJj7IELL+oOC/7O6Nf7Jk5c9qicxuC7EK8vzEK/M6cNxMIIoL/D5nVOGHLYKOSH4Xm8/bIheiRK60hP18VYy3h9KzVLSpu141497JX8MP73qASZd5usYqqC539B8LUGLcC+/wgnFvOetmsYURmj0zB0x7UAREt09ypI/WJHBQ9rVGf6EDQAYvvYgKxoCI0EEV62ZiX9cAxbw/QSiVb/YP5Dm21oEeY+fEmCeuwE/amY/O3rlcRKwoUu4kThcC6JL/OudYdgxm0vNCoB+Dqc+0ibXLlf7LTgUvj8N2q/oePy86RN7qk6TzQ4CNAA6YFHtJMUtWF1aGtMHpOgcgYmnC9hGW8ohxqoO80RpjCpSxe8ThdyYhXblFNLG4rhFmYHmQbNawUsFfxxCRkdXsuC/ltk5zqT9Rc=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>hIkygextHKuq2BRkUg7KaDVdfVFR3M1wZHHxj6ACL4rSImK0y3ZAV52iFT7ffJ2RQV9H2Euvf6+BjIix4vLF47cqregHLxTHVEgpjtD44lbVdJR+iE2m1elRopq8EFNfTIVlzTiQzxPoeJsOkpmRCk74UR81bk/pts6EbKVwJAI=</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			&OutlineEntry;
			<![CDATA[<encrypted>nOrYzqre+W2wD1c0v+5sDH7oBbDQ4hXxYBmI7ro2mK9g5MZXZMUYroLwZ9OPlA1hJn6yoS04vjn7PRUJFn92y2tj7lkvGzQuXdEPn8L5WtCMlQUz/ZOvclHT64FuI9QIeD9qWIYnN09F9o8j9bQESIP6jZdrMsmQ6VsL9qyl1kfPI7rHXFsYWGRc6O8rj+F21NWZsC9Pqi+DVyjJLxfX+3lt2g31OgrLc/0PsyiSvbFN+91N0qez/2nGuuUk9SPrPrxlrhALrqJVgZoNzehWJEKUZf6CAxBGq2iMJrw7FjGV1xC0EVAIFigkGt8bAkMmaTzuqpw/fBoiBrYIwTrbudzOAIkym+1N1MZ+kDwZFrGzbArhLUTwEIXrLaKKRaZH9uknndI4dH40lrJSkKwTiWvfa0COLZIPvF01zNvk/93WF8TX6z6d4D9DpHPmGUI71QyVPARY90rynN3K7HDenCh3TkYnzkU6iGIB7G7tsljIIb6YeNqVBrnZ+KqKFt9RCgOjO0GkyLxmfBS4JAfSBQDI4H0i8q0mOEp5M4IAC2LDHaSLJWKiugRNi3E/DCLBAZQNKBN4vhE6IpJAFauBtuawlJk6YiuVTstV3rKxTQCzNdxceN+UeDBSSzf/DOJrOZpu800cZW8Wy5I5/quW+eu2OkFHix2tPjQVCqsrEb4YeOYOEHTValTRTBswAt0z6nHLti0Ar27EppnL2Jtry59wzZXsL57yuXeuwdQUW0flTpKWiPMBgQQq2a9BVBoPkAAfepddRuIrj4vlrGD4Gqn9GVM89sC+LkTV+F774nmG04BqbRUN92+4xg0SmtI0aCBLYM5Ujq29a6fII9uwywp8mBNuDFG+C/aRkWJS6zUDPedAcxaIBV6tOqc2EgAbuIZLxWa0eDs0ztF/trMQcCLQf4BdMFMqlwaAnkL5mbjXeswN07aBAdu2FjDvfWO9Iin8YfLUpJrBetVhrE7qPzLQKfmCXEaSn183QkJcen5zyIlzBnVb5PtNVdx8gd9Dywen2p6t6qH3DtKAFBaTZ6qu+wM8TUS/C9aHPy2RN7VUqw+cCNe88hqiai5DXLn1</encrypted>]]>
		</text>
	</script>

	&OutlineCss;
</dir>
