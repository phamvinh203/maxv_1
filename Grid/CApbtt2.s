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
	<title v="Phân bổ thanh toán tiền tự động" e="Advanced Allocation to Invoice"></title>
	<subTitle v="Chứng từ phân bổ" e="Alloction Voucher"></subTitle>
	<fields>
		<field name="tag" type="Boolean" width="60" filterSource="Tag">
			<header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
			<clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA17s9Hee0nqhOYUzVDa2v+B+FJRDDWq5opk3LByVk2wJN915rd8uRygk1gE4eU0QJLA==</encrypted>]]></clientScript>
			<items style="CheckBox"/>
		</field>
		<field name="ma_ct" width="60" readOnly="true" allowFilter="true" allowSorting="true">
			<header v="Mã ct" e="Voucher code"></header>
		</field>
		<field name="so_phieu_thu" width="100" align="right" readOnly="true" allowFilter="true" allowSorting="true">
			<header v="Số phiếu thu" e="Number"></header>
		</field>
		<field name="ngay_phieu_thu" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="true" allowSorting="true">
			<header v="Ngày phiếu thu" e="Date"></header>
		</field>
		<field name="ma_kh" width="100" allowSorting="true" allowFilter="true" readOnly="true">
			<header v="Mã khách" e="Customer ID"></header>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa40d0G5qnvncVRhLrzrIdQto0gAdFQ4r0NeN5R3JB1ncEPGC2RcCiZPLxAJkQ7TZCIw==</encrypted>]]></clientScript>
		</field>
		<field name="ten_kh" width="300" allowSorting="true" allowFilter="true" readOnly="true">
			<header v="Tên khách" e="Customer Name"></header>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa42eFB3FvtwqUDdsttIC2Y6siAJra7QKYY2bP5+xYaLNNURojWDv4CXxH9ES+ikVC9g==</encrypted>]]></clientScript>
		</field>
		<field name="tk" width="100" allowSorting="true" allowFilter="true" readOnly="true" hidden="true">
			<header v="Tài khoản" e="Account"></header>
		</field>
		<field name="ma_dvcs" width="80" allowSorting="true" allowFilter="true" readOnly="true" hidden="true">
			<header v="Đơn vị" e="Unit"></header>
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
		
		<field name="dien_giai" width="300" allowSorting="true" allowFilter="true" readOnly="true">
			<header v="Diễn giải" e="Description"></header>
		</field>
		
		<field name="stt_rec" width="0" readOnly="true" hidden="true" aliasName="a">
			<header v="" e=""></header>
		</field>
	</fields>

	<views>
		<view id="Grid">
			<field name="tag"/>
			<field name="ma_dvcs"/>
			<field name="ma_ct"/>
			<field name="so_phieu_thu"/>
			<field name="ngay_phieu_thu"/>
			<field name="tk"/>
			<field name="ma_kh"/>
			<field name="ten_kh"/>
			<field name="ma_nt"/>
			<field name="t_tt_nt"/>
			<field name="da_pb"/>
			<field name="con_lai"/>
			<field name="dien_giai"/>
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
			<![CDATA[<encrypted>rp+B7g0yvVjJfrQvsjdEzLf6zJCQZep4mR+JTIzZYiLPCJ++nee8MesFKZCGZp1yGDyz3FnTluEGJl0T2mu4V0qjRl73Zu7oUSP5Z9jYjug7w2K4BySLa68aj66uj98aas7RKdusQ1OFsARQ7VIVS6grn3WsIyGtwC6F5+u+euWE6FGwycrMBLnng7RfMC2CiK3EzY8/MWXyz49DJPcVr9kO8jl6V/poPJGJb7tbvLYZVuDwY9Qvhx50BT1/zUvAAnJ0pYbb8m8pYjR9bRSbGy9Ah7YgxNAMFb1H9Qoya1koEbuvF8ekBMDwYITPfG2dDwqNPRfYAXJFgCdQEvgxE7amUi2iuA7xcXW1MrgxB4wjLiSBmXQqteBjwbqvThAVbQe9gVyv28W9GV+5GDNcxRSfZsyb762eVDvv5vsUbdpbq8SCULAz5x0gr2FySn7QBb7mF1q/TJZhB/ftb9CTrXQqkMz2rSBM++xmK3Jw9bsk6jpmSJ1AVhExsE2ccLLSE9wbqDerdZ9auxONJBtx+6IcMwRLM5T6GznmxPQRSWSm4RzcYvZaYtCaBCuOtEc/RTVR41IKJaQ+rQZN6biwdM+hg+haDn4Q7UofU+sAW3trSz+eSX5LkDv18nCFpQDhYt48FJW9Z5jTb8HsajEuMKb/VD2mjChDQ9fVnvkDKtfCMrGxj4x9MQcU4cLXSBQL8mv1h8zEiD7uIN91bcWUs9zGGN/LB0rK7lDS+5OzvxW8oFmwlW0Wu40jfN1xy+J492aub/1WZ0N95qNVCbnvaTUkoVBnr9ADPtHx9SJeUU1oM/DVHlTRpdbqA9eBS2WG7Ife8Qp8Fi5EksKHicvdiflSDkT6wxGsRI9JGM/zVZyDVXSSF4jADA5ABiJyF+iz2wfRN4xTHyYkAE15ttfysOAGFzdzLA8Ag/aPGTSddMsEoFtcX6Xf5ZSDhpTmYNHlgqs+JIM7GrLeXKi4Pgc3VQ/GWHtPGrLmuXgC2IuPu+NTVPjHupLvrL+QNeXUMK3xbOYFuRk5sqKI+RVaFB8ZOo3eYqU0AEBko470WMmDRjA7Wv3zr/iyEhRp9Z57LvdqxdaL+sbC1Je3sj8RWFd60VjtwC9K7gdBb7EJkn/r3qoiR68WZjTpcbRnM87cD9yCTROY9bZ+L6oFzO172gvBGuFg/tBSum+wzebudjJRhdeGTaEhgiGPhCtaiAUULXlNK0VG7fruF/25J/THLIDrKKgLNlfJPV3k92vbMhPSX4pqmChSBsF2kHZK6HM4Lz0f5CX5VGviIYcaxzAuSGmVGPf0/duuNo1b44NERFKMaXknYrllSidZ2vp9avDm3UvkYuf3ZB24F0aI9sdovEj3rD9IVWpBwutp739D7C37wL99spJaecP6Rg2mI//iyrKCtYCmakK2UQshnqY5SDz95pXZVgfEcm4E7YOXH1IYsg1GYno/WXQYq1pQVPFhlbfiC0XHJpS5TKOicdP4ElU9bj898abD81gQlDk6fzMP0w4SbZ767quTajHzdBbaqxwmbFHcq+ri56Ynv2CdUmbPhZnjuOUw/D6PDydH0Fsfz6P2KqzW0O3TzzyuOVkkB0ZBYMwysZ5uz9GjBXgDw1rYqwlq7p2XimmFPsYeVri3s+g0a/UbjRbfOKp0MR5JbNfHRhxGBOmsnI3s7Hi+U5zyJ7/l4TAs307r74PGaw3uDGE=</encrypted>]]>
			&JavascriptReportInit;
			&ScriptTagReport;
		</text>
	</script>
	<response>
		<action id="Delete">
			<text>
				<![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/65SU5ZLE4Wn8isPj6jXEvJ/gS9RQElQ2dIaJnOYszeT/BpA+pf7hoYKaZhR8UPQ0NFOrmDoxoO91+Bo578RC0G14n6HAPbhYdsZCqNeXXipDNT/rXQXQ0JMkxxyg899nTDyt5YQOvM+JLw7lJIMaUJhRG5LM5tRDXN/AcgIDYRZmQml585cmoW+FMWJx+6o1OQ==</encrypted>]]>
			</text>
		</action>

		<action id="AutoMany">
			<text>
				<![CDATA[<encrypted>HIPVh0ON3r5JiU0bsUd7BGmxxFvvJ3lIkiXG6Sasvq7PI+F5po/7Dtot2qa34CQJLgrx3CZrFgMezQLVLkh8abXlhVtS9iOWkSemaxpjpZYz5xhGIYTs633R2MgRJ7m1NhBYWymJFV4gzFu/BfviOwpZ4N+9uiXJbulQGKezCjIzQGpkeYt+0TnL9X5TDsFzhTMXUiZR7K0KhlO3mPVn9k7MUckH9dqGqcS6nAmXnFc=</encrypted>]]>
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
