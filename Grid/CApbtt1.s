<?xml version="1.0" encoding="utf-8"?>
<!--C-->

<!DOCTYPE grid [
	<!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
	<!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
	<!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
	<!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
	<!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
]>

<grid type="Report" code="ma_kh" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="Phân bổ thu tiền tự động" e="Advanced Allocation to Invoice"></title>
	<subTitle v="Chứng từ phân bổ" e="Alloction Voucher"></subTitle>
	<fields>
		<field name="tag" type="Boolean" width="60" filterSource="Tag">
			<header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
			<clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
			<items style="CheckBox"/>
		</field>
		<field name="so_phieu_thu" width="100" readOnly="true" allowFilter="true" allowSorting="true">
			<header v="Số phiếu thu" e="Number"></header>
		</field>
		<field name="ngay_phieu_thu" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="true" allowSorting="true">
			<header v="Ngày phiếu thu" e="Date"></header>
		</field>
		<field name="ma_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
			<header v="Mã khách" e="Customer ID"></header>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa40d0G5qnvncVRhLrzrIdQto0gAdFQ4r0NeN5R3JB1ncEPGC2RcCiZPLxAJkQ7TZCIw==</encrypted>]]></clientScript>
		</field>
		<field name="ten_kh" width="260" allowSorting="true" allowFilter="true" readOnly="true">
			<header v="Tên khách" e="Customer Name"></header>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa42eFB3FvtwqUDdsttIC2Y6siAJra7QKYY2bP5+xYaLNNURojWDv4CXxH9ES+ikVC9g==</encrypted>]]></clientScript>
		</field>
		<field name="tk" width="100" allowSorting="true" allowFilter="true" readOnly="true" hidden="true">
			<header v="Tài khoản" e="Account"></header>
		</field>
		<field name="ma_dvcs" width="60" allowSorting="true" allowFilter="true" readOnly="true">
			<header v="Đơn vị" e="Unit"></header>
		</field>
		<field name="dien_giai" width="280" allowSorting="true" allowFilter="true" readOnly="true">
			<header v="Diễn giải" e="Account"></header>
		</field>
		<field name="ma_nt" width="50" allowFilter="true" allowSorting="true">
			<header v="Mã nt" e="Currency"></header>
		</field>
		<field name="t_tt_nt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="true">
			<header v="Tiền phải thu" e="Opening Balance"></header>
			<items style="Numeric"/>
		</field>
		<field name="da_pb" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="true">
			<header v="Đã phân bổ" e="Allocated"></header>
			<items style="Numeric"/>
		</field>
		<field name="con_lai" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum" readOnly="true" allowFilter="true">
			<header v="Còn lại" e="Remaining"></header>
			<items style="Numeric"/>
		</field>
		<field name="stt_rec" width="0" readOnly="true" hidden="true" aliasName="a">
			<header v="" e=""></header>
		</field>
	</fields>

	<views>
		<view id="Grid">
			<field name="tag"/>
			<field name="ma_dvcs"/>
			<field name="so_phieu_thu"/>
			<field name="ngay_phieu_thu"/>
			<field name="tk"/>
			<field name="ma_kh"/>
			<field name="ten_kh"/>
			<field name="dien_giai"/>
			<field name="ma_nt"/>
			<field name="t_tt_nt"/>
			<field name="da_pb"/>
			<field name="con_lai"/>
			<field name="stt_rec"/>
		</view>
	</views>

	<commands>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kqcrJ7STqo96DkOP3y5u3vGHbVg9XYQbkhvxdpZ+dngrycLQCwps3uTsDrdNwm1I5+awxka16pG6vR0hL0HxYka/IJJ3IVuJ5Z8wCFZ+6nKY</encrypted>]]>
			</text>
		</command>
		<command event="Scattering">
			<text>
				<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjqN8AscshQnVlzdQ7G/9mra8xXWGNroGBZuBhQQ6PM1aFnWcowcCRBXs2xohkf0RqfiwT8oik3HQqc0MLFTTTU=</encrypted>]]>
			</text>
		</command>
		<command event="Closing">
			<text>
				<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3knOBAwn8fMi0bMmtdvgjFp7jfEnmGmtOuV5L/RwXFESXOIwklgKEeySoYD+tlQ6Zc/5DSkJH9tDENrnnyTrRnXJA3y6kdW5Ev1l+xg74WuAT</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>rp+B7g0yvVjJfrQvsjdEzLf6zJCQZep4mR+JTIzZYiLPCJ++nee8MesFKZCGZp1yGDyz3FnTluEGJl0T2mu4V0qjRl73Zu7oUSP5Z9jYjug7w2K4BySLa68aj66uj98aas7RKdusQ1OFsARQ7VIVS6grn3WsIyGtwC6F5+u+euWE6FGwycrMBLnng7RfMC2CiK3EzY8/MWXyz49DJPcVr9kO8jl6V/poPJGJb7tbvLYZVuDwY9Qvhx50BT1/zUvAAnJ0pYbb8m8pYjR9bRSbGy9Ah7YgxNAMFb1H9Qoya1koEbuvF8ekBMDwYITPfG2dDwqNPRfYAXJFgCdQEvgxE7amUi2iuA7xcXW1MrgxB4wjLiSBmXQqteBjwbqvThAVbQe9gVyv28W9GV+5GDNcxRSfZsyb762eVDvv5vsUbdpbq8SCULAz5x0gr2FySn7QBb7mF1q/TJZhB/ftb9CTrXQqkMz2rSBM++xmK3Jw9buJX+I+CYOug4qwY3P9bap30+RudWz5tc14SBhGvlOwxVAWZJ8sQVTknfVKX7oFbaIY01fiMhc7YZQccFmS40LkYBi4WSbH5vXAlZj0U4JItQl6dd/eEYtzx0mtMNKCsnHlZN0QBPSj1LI99JpO4caj/DTVJFgTiQAoRPFYsSTG/t1FrfIiibtFVcSjaxDHy8gAZAnBAi4nQF+Agbd+73jJb4b4XC1I8KIg43XxHqlE7lmFJHAmxR1n6JlTwKrDWlSL0/xjlnHEv55ut3hXnkyRoT6Mi98MV0o9qzDa1v8c0WaV9yt2pT5HlYod5rAqvLNnBRnqB2RCcxW2DAqBIOWBOwo8DRCCP5gY/X1valKhixsXTln9tB0QH8ucSknteCV6pf4iv+SJR7wMp2Nc/eypgb3gT+NN8S0R5X5xIUVV0D+cKXNkUneqBRKnV9Q/eG4VRYzfNWwIWJ5u2xDBhmd7XKMpGst0rPl+Wid3BqPO8sWIGYL3QzkqWePqXTXHz3z6q3LO1iWkhRKjU16xSc6hhIsAxKTQlDw0X3FhAkj1w76+Iemt+O9GNsPKNVhdFUO4bFUL5jAALuhSpWj9GSNiMXVYy+5uxHO0a7HXuHNL22s8L24j7goi5lyjNG74XdkQEpkk4msXdqClAtwXeZJ8Z61gSD1z9FqSBfcbhNzavNWHKmy3ECwdyd0gGLyMaTWQGOBvxHHC07uImLuWyXCcd0oYl2Q/SrV4vHK88WdzGrXERqFCKGJ0+hXGMLeC3982il4fUUPH25U1JsKjRm5BJwtke1WhgZ01jcXryalFty5ffaLGOjh5PvU1rgAkRIU46f07SAQPEkDE0oxsLjq65MvCm3RHGrmzkn4y908jK2vnplv9ip1A9pNHqLsEhlRsSA/Uf+53BuQXL6RsYTPSPAL0MXLNNXOe44McNkxAY9FAOhqftjzbNkOi0vUBBk5dYwCZ1VPlo5AiIiFhByLpHvieejj0IcCh/DWFCz9wQsuIr6GxxWHjr9atfEjB5eM3LydRhnbywE47tqsxOWi5Jnu2dNh3UgavedOCQOe6FXsBdNlpgmYrIOWEmwFlqUFtV82z8ze9MuVuxwNjhE01rrDB6/wtU7PnmgHivS9/GXe4tdqF9PhCP6871YPTf6hpe4DZv6qPuswNO64i04Y6mjo7VN+N0AdIeZBCYDRLLBxS8hIzbKOe2tBmLRfk7DI=</encrypted>]]>
			&JavascriptReportInit;
			&ScriptTagReport;
		</text>
	</script>
	<response>
		<action id="Delete">
			<text>
				<![CDATA[<encrypted>p53k1VEwmck9A2L+UMAXmsM5Pg7xGr8Crze9x08PVR6Omyf+f3ewhwSjbKkJ6/1hw9w+zxdtC6D2i6lf9YHgJJUPtZJyhr02ci16iyVAtMl6Hrpwo+DiXpZENFK0giBRcl2EJHgWDXUWS4ORIWv1hk2xaRlKHdfohqUNJFx/GBhjwswzJtO6+OzvNDdripR/cPggFW7HWX+a1Z8bbk50hQ==</encrypted>]]>
			</text>
		</action>

		<action id="AutoMany">
			<text>
				<![CDATA[<encrypted>HIPVh0ON3r5JiU0bsUd7BHiq/y5UyRCr94EwCdzNACH0hqQXohc5gckN39Gl+fQXMhuMvzxuIgmVYOKjPfafEjWf4sFS81BHWcj2BD0zP/FA7guZ5xxtm8M8opaNtuEiZsyVwApmPx0U83arXa4Uss1/r97IiZljvLdTXNpJE5yugwnwIwabQ89h5Qr2CF8m29gUqtxGun1m82U7YrLnr18ulDiQwIfFZTAo8ewlAPI=</encrypted>]]>
			</text>
		</action>
	</response>
	<toolbar>
		<button command="Search">
			<title v="Toolbar.Search" e="Toolbar.Search"></title>
		</button>
		<button command="Export">
			<title v="Toolbar.Export" e="Toolbar.Export"></title>
		</button>
		<button command="DeleteAuto">
			<title v="Xóa phân bổ" e="Delete"></title>
		</button>
		<button command="Allocate">
			<title v="Phân bổ" e="Allocate"></title>
		</button>

		<button command="AllocateMany">
			<title v="Phân bổ tự động" e="Auto Allocate"></title>
		</button>
		<button command="Seprate">
			<title v="-" e="-"></title>
		</button>
		<button command="Freeze">
			<title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
		</button>
	</toolbar>
	<css>
		<text>
			<![CDATA[<encrypted>ya+UwSNKLiOl7J5J/o7y9IGp0E4xmuHq8Io+KA1yYSdC+G3WKqh7OMjzn58fCbo0F0n+bdR/wJskrhmd29F0rQfecRZ6Uj5+ZBsQy6i42+os8o4HI+sPb3VYBhS0dz+uMLjV5XDeMnOkBVbTp7G3W9jZAU1Vf9Igs/pA5PHiEQbYUWPlPCrgq6L0WDpA506+PLGmdDKonDUf2SdEVViTUQ==</encrypted>]]>
		</text>
	</css>
</grid>
