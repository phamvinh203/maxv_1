<?xml version="1.0" encoding="utf-8"?>
<!--C-->

<!DOCTYPE grid [
	<!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
	<!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
	<!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
	<!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
	<!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

]>

<grid type="Detail" table="fsdcttttmp2" code="stt_rec, con_lai" order ="ngay_ct" id="PCO" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="" e=""></title>
	<subTitle v="" e=""></subTitle>
	<partition table="fsdcttttmp2" prime="fsdcttttmp2" inquiry="itt" field="ngay_ct" expression="''" increase="{0}" default=""/>
	<fields>
		<field name="chon" type="Boolean" external="true" allowContain="true" defaultValue="0" width="50">
			<header v="Chọn" e="Select"></header>
			<items style="CheckBox"/>
			<clientScript><![CDATA[<encrypted>/0cm7JC9876pDxJjXIvA11gayjk0F1Aq67wbV/+cqEE0DNe/krtEoPXvvdUJjFyf</encrypted>]]></clientScript>
		</field>
		<field name="so_ct" width="100" align="right">
			<header v="Số hóa đơn" e="Number"></header>
		</field>
		<field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100">
			<header v="Ngày hóa đơn" e="Date"></header>
		</field>
		<field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
			<header v="" e=""></header>
		</field>
		<field name="ma_kh" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
			<header v="Mã khách" e="Customer ID"></header>
		</field>
		<field name="tk" width="100" readOnly="true">
			<header v="Tài khoản" e="Account"></header>
		</field>
		<field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" allowSorting="true" aggregate="Sum" readOnly="true">
			<header v="Tiền nt" e="Invoice amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" aggregate="Sum" readOnly="true">
			<header v="Tiền" e="FC invoice amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="t_tt_qd" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" aggregate="Sum" readOnly="true">
			<header v="Đã thanh toán" e="Recieved"></header>
			<items style="Numeric"/>
		</field>

		<field name="tien_pt_tt" type="Decimal" external="true" defaultValue ="0" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" aggregate="Sum" readOnly="true" aliasName="a.t_tt_qd*0">
			<header v="Được ct này tt" e="Được ct này tt"></header>
			<items style="Numeric"/>
		</field>
		<field name="con_phai_tt" type="Decimal" external="true" defaultValue ="0" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" aggregate="Sum" readOnly="true" hidden="true"  aliasName="a.t_tt_qd*0">
			<header v="Còn phải thanh toán" e="FC Receivable"></header>
			<items style="Numeric"/>
		</field>
		<field name="tt_qd" type="Decimal" external="true" defaultValue ="0" dataFormatString="@foreignCurrencyAmountInputFormat" width="100" allowSorting="true" aggregate="Sum"  aliasName="a.t_tt_qd*0">
			<header v="Thanh toán nt" e="Payment amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="tien" type="Decimal" external="true" defaultValue ="0" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" aggregate="Sum" readOnly="true"  aliasName="a.t_tt_qd*0">
			<header v="Thanh toán" e="Receivable"></header>
			<items style="Numeric"/>
		</field>
		<field name="ma_nt" width="50" readOnly="true">
			<header v="Mã nt" e="Currency"></header>
		</field>
		<field name="ty_gia_dg" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" width="100" aliasName="a.ty_gia" hidden="true">
			<header v="Tỷ giá dg" e="Book Rate"></header>
			<items style="Numeric"/>
		</field>
		<field name="ma_tt" width="90" hidden="true">
			<header v="Số ngày nợ" e="Số ngày nợ"></header>
		</field>

	</fields>

	<views>
		<view id="Grid">
			<field name="chon"/>
			<field name="so_ct"/>
			<field name="ngay_ct"/>
			<field name="ma_nt"/>
			<field name="t_tt_nt"/>
			<field name="t_tt"/>
			<field name="t_tt_qd"/>
			<field name="tien_pt_tt"/>
			<field name="con_phai_tt"/>
			<field name="tt_qd"/>
			<field name="tien"/>
			<field name="stt_rec"/>
			<field name="ma_kh"/>
			<field name="tk"/>
			<field name="ty_gia_dg"/>
			<field name="ma_tt"/>
		</view>
	</views>

	<commands>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXbQjzZYy3l4CRyxrxnjZf/xIl8Cx29a8FfRr+tbqYcKgwdLps9yyej6PiijT2YNSr</encrypted>]]>
			</text>
		</command>
		<command event="Scattering">
			<text>
				<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kveMVpP177kKofYOnxe2/b9H/wS3atgD2Sai5PDi7Sor+YRP3rZOn4WtYgsxoAFl8ociIhJzbp6YjwLZS8cRGUM=</encrypted>]]>
			</text>
		</command>
		<command event="Closing">
			<text>
				<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kkpNJziKB2OtvVlSSbmeumR4Ri53j2MJO847XKW7npH4a0QPBrNrTHZDqPRDvKVh2ypD9bFryB2cvHg1hhYsyq4=</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>ecdqpsFP/nn0c4SSuDhZtHf3jXOBYTHALUEs8ckvhmubTIOktYt8ppR5ooH2ikUSeQsk2hfF3TtPokt7/D2WG5UvNGAPWHQ6oX8QK5Ehx6W9R+FSkWgjqHo4N3uCOOGC1iWTbMaFC6D0fLbRGyrZWejJLVzYkqOSi76MgKxs0PrlzY4BF/8H/w1pqImBZ3bCjKELjE1WkBJk61x/ZZJyGl1ofjPOcNMZyDGZtt2P8O1G2Vw8db1uZa+k5UAMpDpYrF3Wu3scv7+Pbjr4vG5FAsWhOtvYr7TkhK7f7zE/nmCCDVcBDZ+ZonXHUHGEEVSanMWj+YimNGg8jDM6zw2cVQltNCYJqxDag3EKslgM9YufFCFukB1LGGxrXin4DT4HRKHw+sMKjTv4YAQ6Cp+qZTC6myrJ9hWPX8ZqVU0i4NBLM+jrQOXffnIyswLWxXcEp61djUffdX5RaK0XWhWnnIl64Ung+IJ9uQvE3cqu3MonL6W28bx+KnhTjH9lWpe2U0TrOppvr7mnOjhZPaaLWI3SwAMCZ1AQ6YQAbVAY6cYz1SO86aK1sxm1hbzkoWjiMFRl6J5rXQIGHpwFAojEiFvgqIOz6DahLYeWgiThV/ZOCK9kR1EuDIe+d7JwySXAfZpNSn95FumP8A3HVo4mVYOlxJgqNL/of1KSzUBcREjtjRsuU8yeTH5naCI/PhFtsHEufKu7sDLhvBCZvRUvm1TiWjjQBHeGivNfm0LX0KLTcy5uNLAAeMEH/x9llBuMxJVloGsP2Q7FXGehHROVYGzIcQgXfxzhrP+Ivaci5wTSsGYonK92HvQx3JboSLYPIBpx7U2lev8q/vafY6NWt4ghv5D52sZVUk/pYjIZWRGBX/BO65ygcH6zQwO0nzpwJHfhTi0vjnOkBtCjyJYArRfB1+ddSl8TmkUj7pCOpgRtAiTJ6y1vOP64V86N/QVLn7dqZ9efVY475/jng6CqXaEPhZpk5F2jI8+12kqmwHYkEruFNkkLxqZJcl16zd1PGZWKYcPe/pCiy5U1j7/98Fi0IwZCczPnaKHrLBOY1PKH3ASGoDM3BWAKc58HvpXp9xVGhGkNxhTnPZQZiPy/+Q==</encrypted>]]>
		</text>
	</script>
	<response>
	</response>
	<queries>
		<query event="Loading">
			<text>
				<![CDATA[<encrypted>GIddqON3xIF//UI4AG3KWw5Zbs3KZEsuXHMHkrYpxAFMyyREVsmkfSWVegW6C2cNFIcJF6abwqVwY06eIwjtlOPTcApsb3VAJpqREB/PEhjP3+iRDCBw4m3HK4ySGNa92KstlVAlN2b4NEPb3rU6cH1ewThg9Mb9Pgwbs+pwZBqUOJ0LBLvMDhznnhAZfz/i5ectwov1x2AqgTTlrLhgrSc+ZlGuPtmRnqTCYRhRXssPvSLB8er5PlXBvx9wS1dPVD6xdR0jzdStaMhoY/F6VsRFoDjriDvfsj4VJ9lpeA/kTIIjnDkKvBGjeRX2Ixmz1uG8fQ/4d54j0jkhQAcDY/HRZgl5e+oQccycm4IgQUKtRugdGrtdRHoCVVMABWPPXoBsVkT+JNnfyiuy6q0o7bVIDTMXiJhagYFO6CMOM4acgFsdiK9DwI+cmYc7z0CjCTq9AO+BI2vUGaCr8I5dqNfvd3YR5NXi8iwWDDYy7IK7Ff4OZxKaPf3Ub6DV+IiYIXVR8WmevyaD74SzxiZHB2yXKkFksWmkXirMqreJOTkgaNXSkqQmTA+ixsHrTmyhyiBnAtvpYWBH8xsDsWY0uDFtwnXgbXVb7mbuYWyYdApV6GCVVfYHk8Nz7eteys7e6yWWRrTkzrg8+I4x/5dBWDFuDHrKFNsVh0Pva5iKfsGCIsmjFkr7SiWWs62iLeTz2eJPAYlZOSKA9g8qHHKrAq3AlSTYpOi8woEIYqMIUGKlgwn/OIM7lw1iytKevUZ/D8DsftCS2Ubg/g1wrbRN+VIuzLD3it0WZdJ30HHmXcH0n1mSIQxouD0PVzJGGRexYaNukYYtjLpZ5ye4YKDVQydz6Kh8hObGjksAVF8qS6HZHRXihYFxfVOiEX7Yo7+mM9C+SOgCasZVAiiXmYkb66J7gWuJ9GwWnTIOHU64L4bjHHMjgy2bUFVo64+9ZT7uTn88FcVF8doOtiJCoFnCk4T1Pz1uOEruFaWai8SFE7ZEDKiuFXq5Xw0dnQdqxmwsEsE+xzDE3COiiKzWzNDooXfjmnZF4BPKBzmPsjyOZ5Aagfap5x/GPS4o1rOOBh9nMK7xp2ntSP/omExPL6eiVh9cgMkK+grqTItyE0Ri2t1eZoEdY2OWdZwIe9sMwRX1xftt5xnVT5A57C9AGtq4UH5LDc4CmBqdtTvH3zmSbXqjOOYLA5TXDm1Ff3zUD+lrapb3IJYB9+DcnYUu26aNi9e2NxkjMTaoffPaRYwSB/lV3mhdr1Y7NQM7vPQVUEugzXoOff7hH6nIQIscGEjswqSEYexYcUrF5PhosasmEBqK0U+WP9qpDZ8jT0BFiuHBa3+4W8drHvJPyq8XLdL3TnDPhvjpka/Na2QlLTBQPS++qHbvYmrzpufMP8EhABmOsm2TxIton/n+O5N0KkYvzip4ttR/d15h5Dyk2vQ38ACLvXgNc6mpDn7Nm7GrOYdtR16xlHY7RtwLd3/jSV7EC3ubqZCUWKxCN1PtKoTKn118NoNf3/n1Kc8iSNj8EdbkGHlmtcpA4BwgjPzZtAbNR07Gji2qbbPewhpTkmdYrEY=</encrypted>]]>
			</text>
		</query>

	</queries>

	<toolbar>
		<button command="Freeze">
			<title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
		</button>
	</toolbar>

</grid>
