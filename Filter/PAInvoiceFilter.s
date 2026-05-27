<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
	<!ENTITY Identity "PAInvoice">
]>
<dir table="m83$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="Chọn hóa đơn" e="Filter Condition"></title>
	<fields>
		<field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
			<header v="Hóa đơn từ ngày" e="Invoice Date From"></header>
			<footer v="Ngày hóa đơn từ/đến" e="Date from/to"></footer>
		</field>
		<field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="loai" dataFormatString="1, 2, 3" clientDefault="1" align="right">
			<header v="Loại" e="Type"></header>
			<footer v="1 - Hóa đơn trong nước, 2 - Nhập khẩu, 3 - Khác" e="1 - Domestic Invoice, 2 - Import, 3 - Other"></footer>
			<items style="Mask"/>
		</field>
		<field name="ma_kh" filterSource="master" operation="10" readOnly="true">
			<header v="" e=""></header>
		</field>
		<field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
			<header v="Số hóa đơn" e="Invoice Number"></header>
			<items style="AutoComplete" controller="PAInvoiceLookup" reference="stt_rec_ct"/>
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
			<item value="120, 30, 70, 100, 230, 0, 0"/>
			<item value="1101: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2]"/>
			<item value="11100: [loai].Label, [loai], [loai].Description"/>
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
				<![CDATA[<encrypted>RDZOB0ZWOvSz9NjYHtbmT4GoLCrcYIcEH00nrKBjocyrqum37wANq/E+oP+WSAO6kqisQgtN7VDnfWDs+IWxPa6s+E0Krs8SvTfywwsWrnFS6dErmpHCiY9+TL1/MGDphPUSUmR0/zmOLKJP5q5UdlOyTuPR68z/xkng6x8cY6dRTRzYUJgdaXghdGWNYe8GvheFkMbyy2iyt6XmEBIUs7L6/ZqnBiE4+Tv/dr1uOp/KWNZTOA+3k6pY/AU+LlvYcdCQmhKiwOQ42ZmPJYLFc0HG/lVRaFDXyYdJHHVSHEs0OSd9bVIeY8xpxLiYvZMGEsb6CHXKD1ovTi2/Cs9gyHX5MX2yyZuwAH6oAsIrAWwc2zRk8FG1Ruhqsjjor9tqrImDznHj8WmmVZ0lYHAJyugbKo/OinFtgTL3mHQ084BZdBOd+UwHDVuvL5L0r00W1NIFUVJ7h7Hj4foPxgtVJ4dVxYSU1MiG+HFQd0mxjeC2ontVqLtjpEqp9LT+jCwP+EgDgjw4LJPpWcAygErgkD1KiKwjqt1T0nGlz2Aqgh3kk3xykRQQFUsGam1alNM48KqSy9ujD/7fVCNbfrl/8hDAF9iQIoAPMk1WxYyNpHYGVLpbp/6GxsgnLzjV4PAbz06HI/aXGClKAwndnccfWRUlWN9x9hD3fSpO7NtFcBSYhY7eCDUco0UXQkAUWKqovmQBsvE38CuvtCTr+1I5EnODupRxnrOPx/7CzInc+EUnj9mwKMGZBFQgTdh5T0Wy+WvqVEpQNXphIcIpNPYyQCuk3zctiXrmR4VZkuth50DT7MG2H+sDbLqifG+YZPIcDCnLoWvXNtwcFvZbBMhAhDTD+VYPHtWaVizBQFObje1zhA2twrSJgQT7VCjK5EtZMTY6KFAAJb/0fVNn2+xUNa7SkrMc3N3pBW3Akh+RhBXIBIUg8+yh2C7QqmbjUAnBkQT/MrSgnO/2BPwUV6dgbqDGhFP8rizQupaNwZT4ALmMLPH/yR05+ERvRTzoSkiZqDBQwGf+2eJmulygWGPinRgTxir4NIdcjZyNTgQtFP0AmB+5fnhXtdaklpfZxaoRC/j+GeSxJX2LeX9uV2+AExc2fmcNZKamcwBaMYRVSnxiZ2dISDbZ2D7BtWc90CESdzp9p3LHnnQ1SfiCS2r6zQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>y7QP4hBHh6KLqMaIzVGscUr6qO2q/8++y3R7qtuGkImQqMxiU0tBfwg3tl251ooSdVt4WHbunkMoqvfetpcxYc07gZTDVXNnT5UUyss4uTvMwJMqbvmKBQoB3fAkhOk9Jt66xmamF73MVLtx/0FEOL89KxKuyDDCe3u5q+R+W1Ey/xbqe+GEukit2da3ThtK38LGA6RqxZuMjiVE2/6q5w==</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxs4Nt7MSIEsnM0ToyBWvgfyczUvLt9+JtABUgeXDkoW</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3UU0H7WdFatSlDVt7FgZAZuYyPDSX5GCF4pqIbXs5btSYTlxAhIsT3zY3afQtXRsRKKqN6pxHuWnLfadSry7ARCtG9QZGCQnzU1Ddj4dvOLb</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3S9woFmylORlfoJYguxfbB2gbRHBZ2yN++lUfSAZOrDJr5u1zYMRc4dn7617b+6lUSzVCVNqlvpnQGT4sGM1s7PWpVmSYsQ5CTNSjoAoWvEJcTzSpuJDvsECU7e0ykZz8w==</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3emAAvRAWXb5axeB4vYqwXnkxzjwVRTW4KFLQMJHMTNsKziX3ZdOsrVK4CerCBQl0Luonc3UnmaLKpffbe5lypo=</encrypted>]]>&Identity;<![CDATA[<encrypted>F14lSnEXBWWJvZri1xKVEDHMn6x5UG4unxgK6y2X4wqrhyxdxWWJ8Na0UZbQnicvf7MGKcXvC/0tdWvfqZ9c4rPyF9QaYJCA9DG/eKLXzdRsrCr5R6XjTstDQsZJG/DLEp1OCOGzN9KgW3pT/IuOsIA5wFR0FDq3JcivgbSysGoXjES2HGRuKTutubkFEDpSHbjB1bq1/RTUaZdDf9KsDyPVc0+lrzgyhMwO2qg3tJXSP9mPXAIfX3eXixcrQ8/6hN8zF4c/RocjOCLq8lfwhLPjnVYhYapE7I+ZmYrcaNA=</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3fc0k5a+VuefIW/zPX4oOjZA39fOwtXz5r3o6E/C1CpMDnDpKSqabCGrYkOTTXZLjf/eD7z0aDjTjtc6lN39LQg=</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3WyemJVVQNagCBJW9G5iFTXu6eXxG7XRzLjFHeuv3aFZxnRd/6CaSSRoYQ3d1qWGZoBczHXcI3kYbkaz0I3zq7sD5d9VYRuQ8FKNrEAdhjNY</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3emAAvRAWXb5axeB4vYqwXntraU1CaEYqk9WyjDUds+szRy831prjIz+r8OirpiXduAinWR8o5SBoG+6GytYH78=</encrypted>]]>&Identity;<![CDATA[<encrypted>ap3mIgDc5Ml8kLmqv3HabMCYZrqtILjkku/fnQ5pxAtrcui3zaxeUXeGZLgfj8RuLb7Yx61Vci01TIhD0xvjxck05ztlL1IkPvcaUg7lInhst+A/Qnh6sD48e3T6crCvaScFjcBmadpA4nOb9JRNgp18CxhlWXaEimu42LfK4y7iQnocmZbnKz2iD+RvKlwnKEmEGdIeGl2R6lxAem5bwbs93HTEqNXH2cz7xnkp2u2VKmzDaRl8CuRpU1vJezGUHasz4OD46G50tVDmJmr3VQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>+N8r2KyWY47XA1//PgDU071JgBCPEtPds23D/YzSAr4laZHcsk5e6L2iTHA46RhlougngcRlnzAo3hdJ/BraREblpvg0lxdt98esearOr4B4OiROUjZ8eZdjK0ePe3vzCsc2KcgcPBM7D6QjM5ioC13FbLIHKJmTHPZcazsmAjYhGFBDp1JgiINhUtbZUaUTKzPPQsxvepsGgv1A85BCYR+lT9JTD3iM/rDUdYk05KQzSLljaD8wQdKcjDwezQsY4mcooyPVz9L8mvCrx92udnvsn2O6EdOE88qDXcob3lUd2zRazHgIrlhA3hCDWmPSmtJ2zRJ5cf22nrDQWJRc85Ztu8M+DuNYKRBm0TfGm1rGX12Ghr0jKN8wuczx+S7xeuaYgDqHbMkpC5UyXugmqv5l7To74C/uu1qljmH7Hti/dFwBPVA5wXcUFQVv7mBamvVAbnGlLWBZ4lLA5AZFqg==</encrypted>]]>&Identity;<![CDATA[<encrypted>+2WY8Qj94cz5OqAhibExF/szrCavCW1Ryq8NVR3VPLHZ9Rpepbr3yUXC3bIq+TDyqELX+NWtHkVh/+dquvvyJOhpmXFx8hqvb9Z42GNzlBf9TKCTaEUAbgPWVfjZLKpLBcbgLPJxAzFegmf8WEGPI7L0irkIGSpc6udoVKr267g7Zg2Nyb3IXAFZexKcKojKuflB7R1b8mE8QuQ6lpjprQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3VS5S9Jf++YQL44lJ9QsTOKCRphiCqfff6Hg7J35F266UkI82uEHFhqD0EjYITl+6A==</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3UzK0nu7Ot5xx3D+dKPw9uvadmR1TQJaOhnlQOkjFkq1nh2mcTnBNmqsuhQL3HNcIQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3W7jmjwuxSqeOoCXyGt8HINDTOq4FrO7kI0D0QlnbXQ+LsgI0ZsTHRH9pb6qfGSM3kSfsKZGLWR8Eglw/xMVxvA=</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3fHLh6ySS+DPLHgwlYfAkUcI8Uk7EvVg+qe1xndv0msmXYfwuHFeubl12CwnzZoSIg==</encrypted>]]>&Identity;<![CDATA[<encrypted>nponjFcJJQydMna7XN/adiJnFqeZYb5FKfAD+dMTIBd93OnmxcERdRJMXPQ3kMs9rYCCDwoGy+cHeBHbCLvoQQ==</encrypted>]]>
		</text>
	</script>

	&ScriptFlowFilterCss;
</dir>
