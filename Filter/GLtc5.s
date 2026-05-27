<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
	<!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
	<!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
	<!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
	<!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
	<!ENTITY Form "GLTC5">
	<!ENTITY defaultTable "V20GLTC5">
	<!ENTITY defaultForm "V20GLTC5">
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
				<![CDATA[<encrypted>ISlPAc7+AbW/2+pYAjr2SPtNK6b0h/McfUVB+ie8O2LZBrGY/QHLCwZcGVWnIEp/Ghe4Kb0RjSktPvSDEH4s+qm7HHZgcz3nxW92JpplV0++6L9lz4WaRzMoGg/TJj9JDzVQlqcQWztNANWqghsc0tmuiRl4ZsSA9/kn0Siod4OLkJyGHCxbHR4dyi9u5CaaBkoLTeQ+zLips22lvWZPkW/Bb17UUepkSrimJ9zPqArYktnVBMrmyDmP0hZLv8WbZGgdMYeADjY0kg9buTamaA2sAfq7VAIqYsq0/SIbBHX5I9i4ocMTbBb3113Nf+DEMTdtP7FOllUo7edHgL4TzrvdfRlHMwXDIJNXTD44j+d5itZWvELF8NOjyfKnhzZAVUNr+u8d0l9wGtc7vvZXX5NTQl+MVlIgJpPEGZjg20vTfVl5q3RuRwkL6nvdF2k+hfSYEOhIhE2yRPsFC6TqMmsDlRNi8TdskPBNzXZ+o2itbrbjhDM1/gUcJZHIODf3olVBSAzKefA8CZ8YuAV9zevE8DF56JBAPPTpBMaHXc4LfiBPGokF/aPXOXWiJURJ8v3yeV4ODAYRZ41bgndBwF5J/JUanjdlWqaMkF61vM4fsARHrIbQLYkjICvCEikC0yL9MnFg/G/a1SIiA7OJN4B1QORLafuz5SCdaBoQw58NG8BV55BhmRgsRSF/07v1QIUfy0/LdpVpjZJ4S1PyxPF7m3BvhOafGw5isaTSpXeLcjQZFU2HbZdrqhzw23sr/PrMuXGnCx5DWSEvQnC6uy2r7QVPj3plCkvpUa7mS+mOjfD+MdpRLuOcx+PAsWxUVxUW/zBTeb/8HBmGF1TFbzDXA+AowHDHaM4ZSasIQ0z55pI5PKxysncGUDP5lwFAMGD9vYvKmMjo6A2yyDuvwHhIJsxvxlVtoADZAtK1CX2iBXx5t50eVx1XQU/UjcoPEsyp1VuCdUbHf+spip9gx6alBfbEC7YApi/ASDT/iVDLsziJT1xeaoeyKpE5VAnL4ObemQSWlHW0dyXRujZzduX9HrTKzm7oFzzx+8PdtCmPWMM9NJfATGI+8VhazssOw43IB1pNJAm64TIzXRCSkZKkP6jgQGbY5YUud1gp2o0=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>hIkygextHKuq2BRkUg7KaDVdfVFR3M1wZHHxj6ACL4oorsTRtOy/gR5uJzJ56HfsXMHwZlSCW8ycdl0J4omj9LYbNNI3cWiNWsVBCzGo/PgYE0Tt4wzr9Tc0m+ovAKsQPXEJSiU6cCySX8eDiVrllcz6V3JtonCfwgJORUpgA50=</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			&OutlineEntry;
			<![CDATA[<encrypted>keeKv93ROU8drhlfZsP4WQNoV5f+k9aGAvQBdykFmZtbA6TaXyP65vLnEOtZa+VWMK+FrCvrZw2wjt60pp1rx3rg4vUSU6Gto6qDDlim20pHPhZCILrxi2n9TxN667+5RvLxORR0ly65tCm1Q4yEguDGgR5b8h/HEDWMLc6JXe6BA96Qc/tbWJuuK+Jccdag5IyDnyMBDIkeSt/v+Hv0rBr/2JRmTyK9yudL+41wGwXo5nTRqeg4up7ch4Eb/mRyHcc954J5+ycw0ppwRIPpuMwyy1BSzrPZxWsqr/MeX77AIGT49HJ9VNcZBn7CFwBPBm8+fT8Plx7qXmlVAECARMEdp2Lr9CPEPgoDwnE9cZ+8YqOh9/nADmcGSIJxM9MHjxQF7ZdEwJynnGcL2NwTLF9Bt61bnVm14B5v3VDx6CnDfn8ZkheBZeSrDgUb2sQMbAgTXFSQEJB0/dcHgLPmOka3Rf0PWvmHOQYK+uN507lIH0hC6G+9sSXrzjPx5xubpVaPBkZnX0M5AzethSApi7Jwq6jaEw+bL42Wfsa2WhSNQksnCH00DTsILxD+WHIGHjthextvGOTVoWxMGKebkyo7Zf/4dg4bQr/C9/DxLA30giaQ2viPzGA2ykaaIAg/P/t/f0aU8nvaSQtsC85U3fZpwSEqCRWvr6yGnXnrDQn9ogRiz4SilIYgvvJ6C6K8XPBP++XYzJLtWwxfQDCljhP89uSlQO0ZXVmpa5lmKX/x3v9xXoH9csN4R4EtHQtFJ0nXfnaIhvw1FbEl04t60I9XOc+qaqZEOBfL2kXlqb9JSYsa3y8Fuo57cBbi8HqdUWAhSuI5Qfr7+Km/sz7fplg654fdzQLuN4uqMICN9hK0vagM850u6F0g18LHYxifIyFAPFbx8xoUrwPciVf4MBvH4+bLPKKtYd2gUrk7m0PzaFXcH0DwI1PRtqRFitgbdcSaR4ayeXiyGNzhEk6Kx3c4qOKHN1bAQiKiSVCWL7Sa2f7AdG6ugHZTvigRdwJ8Vi59cZ4QX+QdT2k4uyaQ/Z+quRdFXbMoUf8ieieucTHRs3uhPNV6vgpBEZGztdG1</encrypted>]]>
		</text>
	</script>

	&OutlineCss;
</dir>
