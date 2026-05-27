<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
	<!ENTITY Identity "PXInvoice">
]>
<dir table="m31$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="Chọn hóa đơn" e="Filter Condition"></title>
	<fields>
		<field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
			<header v="Hóa đơn từ ngày" e="Invoice Date From"></header>
			<footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
		</field>
		<field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
			<header v="hóa đơn đến ngày" e="VC Date to"></header>
		</field>
		<field name="ma_kh" filterSource="master" operation="10" readOnly="true">
			<header v="" e=""></header>
		</field>
		<field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
			<header v="Số hóa đơn" e="Invoice Number"></header>
			<items style="AutoComplete" controller="PXInvoiceLookup" reference="stt_rec_ct"/>
		</field>
		<field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
			<header v="" e=""></header>
		</field>
	</fields>

	<views>
		<view id="Dir" height="88">
			<item value="130, 30, 70, 100, 230, 0, 0"/>
			<item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
			<item value="1101111: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs], [ma_kh], [ten_kh%l]"/>
		</view>
	</views>

	<commands>
		<command event="Created">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SN0UN3w1cDWrLJM1eK2lupn3N3nlNR8V8Y64QrcGzW4</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3cvpUDF1guFYHHiMEwyq+T3uKwR84As3T9EhkW2qJoskwPGijJSABRjPkpeJ1AYMjg==</encrypted>]]>
			</text>
		</command>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Ub/rydLvKFZDMPY1RJY0L8KyO8SSFX+335uEiJnm2Ji</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3cvpUDF1guFYHHiMEwyq+T3uKwR84As3T9EhkW2qJoskwPGijJSABRjPkpeJ1AYMjg==</encrypted>]]>
			</text>
		</command>
		<command event="Closing">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7RrLvJfo2uGnts+5rTaC80yAz2ndUAGkMc0o7w7pQsEu</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3cvpUDF1guFYHHiMEwyq+T3uKwR84As3T9EhkW2qJoskwPGijJSABRjPkpeJ1AYMjg==</encrypted>]]>
			</text>
		</command>

		<command event="Inserting">
			<text>
				<![CDATA[<encrypted>OdgVo/L8txuR3ON78MfIknVGZERVfyGCQ53uFyw05fV3v/g7x9xyKGOcJ/p9PD3SaP3XwchCSJG0kHUO16wpQyJvRqlQQKBPdQo6+Pw4V+/zGVZUKJ7n6oMxjtb3g+6z6E3uWBm5Lg33aWx22BNZVsFkeGoXr5AoIs6avb/bQTkdZMoSq4gq6zL0M5IwkjQq1rB60J8f0iIYMIk8CNGA2BEHqyqQMB7GfjY1akxJ0V1FPWClOAdl8McdM/k3cOfKZyAqyjPaBR/qSv+CZJe6MAwkjIZtWd+7Qm5IAzcLKRv6pR8JpGjeq83yFj4GC8tJASC8Y3xdwr1ctsgoeyd6MGgpXqjficYP2gp2jGer+gpo7bDLCMN4dFFNJjP+gJ6Fm9AbuWjzshCuhRt4Hc4SUV4lROAYqVjhZhQT/dYvHgSeRb+gKBvg3y7Z3FNtRFIc5dnH0p0H0uaBC0gB/LdKxbf7yW8eQ0kgk4R6ZLnDyx3M5G7YiUDKfhzinmFQUSp3JauGrFWZz+6KQv5bSKOPseIhfmgsTld/aePtYTKJ9PZmy3vl2Dp6IDDUiVK/5zXxxRNE4oljIl1b4zalBOAYdpNzqAul7hr0q5tQJTxpgbDpL4fQ9ptPwAluE4t/unaAWJiv2nckC9OPckjmXwXYxOfa47Qd2Y7gYpxqS78QRZUyraqVqWG4rr4DrZ1FS3tU8kodmapZG/ihsrgCn7QEMbJM32dJno9cbEBqLQF9oqOC3q/rU7xA1eosR9K0WFTHfFSa/ehFE6HHM82YIFQbIRgywxWXzGVELYbHYzI7kDOeAGleIHGv3Df1A6+LJ7L40ciRfkSk2sfSYc8gpmAcLyGFYhUX+gpuha4WkHcBW7//t2/btnwUClk7lMGEsJ7G7gfohc6lmZNfjLJvIb27dJc/tJnrpSkyoxzy8m2uAoezr88IUojBCIpRDf45GnZaktvJ6BNuTDoVIIC/FO4Byv61lqgzphczIKtfeeXBHLHrXb79V0mcbFWyjUGgGute7h7rDfb0VDmtuu5V8aOm8b+p64qHzW1nLoOtfHwn8uQJ8ATvmRudx5568JI+hblqTIIPG97Q/xejVGnDdUcNBJAyOd2074FHTpmokjNH6u8/kKoXjTc9krk1Ji7II9bc7TQo4muLJGD+YTDhoYpw9ytqhgovfB6WGhkXQL0QVvD8RZM/45QEOkIX/0LK5ruIbupewqDIRK1L7U2hZ4R/KGoGGZ82eTzJyW+zHWbWqZo=</encrypted>]]>&Identity;<![CDATA[<encrypted>fzdxqaz0x/vck/SMA7SutXRJklzmmi3lpKcALwrepGzFYruZnCd03lzpt5Kr1zzwB0PIxeAJZobuLQy5dgM+cI0O04UP/es9TWYQfL23r0aHBKQLp1weM4J6PjCSRxM5QH+idR5qnz0Ys5mhKlQvfzdRGQ5JsYFNxlTIKIWdiIkxJVbq/o55edQVbu+pJpeN6JuJWqd8x6+GixazAAAG+PioPrJRgP/eCbEULLO5SHQiwp0vzBlu6fGcY6dSaxJxpd/E9p1HvcuMrwHc8qLjtA==</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxs4Nt7MSIEsnM0ToyBWvgfyczUvLt9+JtABUgeXDkoW</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3UU0H7WdFatSlDVt7FgZAZuYyPDSX5GCF4pqIbXs5btSYTlxAhIsT3zY3afQtXRsRKKqN6pxHuWnLfadSry7ARCtG9QZGCQnzU1Ddj4dvOLb</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3S9woFmylORlfoJYguxfbB2gbRHBZ2yN++lUfSAZOrDJr5u1zYMRc4dn7617b+6lUSzVCVNqlvpnQGT4sGM1s7PWpVmSYsQ5CTNSjoAoWvEJcTzSpuJDvsECU7e0ykZz8w==</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3emAAvRAWXb5axeB4vYqwXnkxzjwVRTW4KFLQMJHMTNsKziX3ZdOsrVK4CerCBQl0Luonc3UnmaLKpffbe5lypo=</encrypted>]]>&Identity;<![CDATA[<encrypted>Fsg5yfvOXgfce39IgOZs6D/9jvCytnA+/8EXv8DVLGCENb2qX8NWLq8wZ/3Mw8cTplBPMEkxrXYVRlUO3uoS9QMkgBTY/j1QAyKFP/VQs+v4uouPpYNBFvWGM4hW25Dpf8JOr/i+OrupvQPWJiWFYlYpDmxB8JqqWyV+Ewb9nhBw3QqKeZMDOadlIWMXDWCW8IG4ZVmlFQ1Z+4UnRVAit2152QG58wMwGL8YNu+mC/bfb/UoX4kyTmMcjUQC0Dg8</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3fc0k5a+VuefIW/zPX4oOjZA39fOwtXz5r3o6E/C1CpMDnDpKSqabCGrYkOTTXZLjf/eD7z0aDjTjtc6lN39LQg=</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3WyemJVVQNagCBJW9G5iFTXu6eXxG7XRzLjFHeuv3aFZxnRd/6CaSSRoYQ3d1qWGZoBczHXcI3kYbkaz0I3zq7sD5d9VYRuQ8FKNrEAdhjNY</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3emAAvRAWXb5axeB4vYqwXntraU1CaEYqk9WyjDUds+szRy831prjIz+r8OirpiXduAinWR8o5SBoG+6GytYH78=</encrypted>]]>&Identity;<![CDATA[<encrypted>Om5G8Psk5PHyRpEEKZefigmWZ3JbLFsfJYVQ92XG+RTe0xYAsuLslA68M7q6pl6h7c2hJ6gKOoHzJUvX1cEd06xPGhVFvrsMRqUIqxxsErGgUYuc23vd+NILxRLeIMICqpzHRnVWuqs8ukR7fz4GgpdVFQwNwpiU1iqVeuLtTf0WnEXbPM1JtaSFdfaamm1QIxi7alJmlDGP57D48c2Aolg2vGDFw57OKAxJaYWaevuP2bd2x6fy6u/NFeb4KlgHLMPDI03zjyAyTMA/xe6E3w==</encrypted>]]>&Identity;<![CDATA[<encrypted>ou0KyeEY6r1DEjZhHaXm+LRg3zY3ntZAYQH7bUplXIpSUhYHP75o5t4uEgWIEZJISpq1lEWWOXaqr5ARzdI30DahEqRMMKHRe5PAXJBbZeHCk4SW2KBgRLccDQCrTQ5TbgiMM4NjBteDixzlIl5219J97SPLvoSqHNfmQhi/gCBUO+K93GiUXwOOJ9AcqMC3ZvgOWDDWsiGis1S8vn2/EmZIlpDDj/bkgH6Rqwl0vGlBbAo5EiKW2RhkmFe4/ZvYOaRR05V/ox5pi0l1mw1KuOQ6/ajgidbM9kS23KLJ+6S5RvR8IK1GcFqmkN2ck8V+mA3gQmuOUZg2XDaDW7wtPtQc3XdWOpn0Qa7BUZNEZ9Z/0IfOZDnlDnGtNPbi78fgW8F6S2oe1VeyMp6ZGdbnpbJwcaXOlZSx8RaWqJm5exA=</encrypted>]]>&Identity;<![CDATA[<encrypted>zmfO9bifl2VZKwzE+om6FUvvJ07h7osPn5sE7XBV8l8moCSCTw/xSniHz/2nLyJk3vOWW/33ASbTjX5I35keJQhdH0j5pLG9Sifftb8IAoAj63eVkTt6FvoO4qhw+brC1LrmMHm7yL7Vks9YPklIM7iFPU5Uy4dwcjHOwp/JU0iBl+bPvxht3cmN4MuhXJVThlNmRGJOCj/buHpqMsBe76lI2OaXdbouyNuoY/fIFiYemaXQDBnJLLZ3O7A0anFT52CJajBYdZfoZcUq4rC7z7ehjwr6pHZjg2lbVRRq7xpw249UMXw9OKhLSGywKKw+4pZSFrN4gcTySHOokv4kPBGdxhzFkQ11jfvwIogo46o1fcpCYEWO/qdQLrCQkZ3KUQT7DveN1SvTG2UdMddEQ6YmNUVRGhk9dCuXnmbC0FvNfOPh+9Rsg+OuprvGv6fHuY59X6aJPWOzQR2Ctv/XWxV8hcNZhNZkcOuykk82RcF3NLlbB4GJZNmEuCcSzy/ZzKKvpgbpzGoYuobwQAwi9brdTp7AtQV/Ju6QG9dnE3nU8RUdQvxnPhaijcXnWp7x</encrypted>]]>
		</text>
	</script>

	&ScriptFlowFilterCss;
</dir>
