<?xml version="1.0" encoding="utf-8"?>
<!--C-->

<!DOCTYPE grid [
	<!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
	<!ENTITY XMLUserDefinedHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFields.txt">
	<!ENTITY XMLUserDefinedHiddenViews SYSTEM "..\Include\XML\UserDefinedHiddenViews.txt">
	<!ENTITY XMLFlowGridCommand SYSTEM "..\Include\XML\FlowGridCommand.txt">
	<!ENTITY ScriptFlowGridFunction SYSTEM "..\Include\Javascript\FlowGridFunction.txt">

]>

<grid type="Detail" table="fsdcttttmp" code="stt_rec, con_lai" order ="ngay_ct" id="PMO" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="" e=""></title>
	<subTitle v="" e=""></subTitle>
	<partition table="fsdcttttmp" prime="fsdcttttmp" inquiry="itt" field="ngay_ct" expression="''" increase="{0}" default=""/>
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
			<header v="Tiền hóa đơn nt" e="Invoice amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="100" allowSorting="true" aggregate="Sum" readOnly="true">
			<header v="Tiền hóa đơn" e="FC invoice amount"></header>
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
				<![CDATA[<encrypted>owaployuCosoAWfKrCSCggwF0MQv7SHBRJt2PYWSbSW5NYgpeJDBpO9WnF7fAOdBrq6iU6eH6Al2rA+N4NhKae/oLvPsj3itpSGlOld0/idNIj35Zkp6MlGz/G+2dA5U3ZJtie13+saRn44cBhpcYtZO9J1uBA+FwVgcsgSquVYOoxHG5w/6cifuyQ4w44ywQ0dgfVQPlhQTwqLg5lATR8BXV2cHxBvhyYTz6wkOrbIgyVNATCZMSpHRLB/z00HQBfXpgDleyRMApzCtefCWyYDSsai7uAXTxLrmegaGCD/PGbXipHtR3Qmz8WwWhguC116BASdMlx4nixBaZ4uBdzp3+9ylXVpTM1unlM6kG5XKtRtZWrYqVpH9C5VDczovCyMAOAWTo3y3Xn8Q7NHecNlnb4uevDAu8JyaEaMEhYBSxcdFykJ6Zt7LB5cjIXOVr1KhoeYn8l3m7/NAJx1VtH8vvXdIYEifKse4sVrKN6X3hTJ4gaJJIzrAgSd5lg3Ohj72rDPTrSeS+YPI1wgjGVlUHXwASl6HH5Fsv3Ar/4xl8VE/RMYrC1E0HLbBeJGUkql1ybe4uWyyJmXofnpZVRoYHVxWCiU1Y9r8xOiVSf+ui8Ls0dx6B4evUht9V4Vg0hIp3euyZVf9a1+B+UQ/NRCqsjWsADo0fwMLaK1sQOv1B5H5krEji/wtcA0aXxyB2CO/Qv1gmgninONT3ir547exZk8Caua9/2iFOG2pk1S4xwQ0ry15WeY/kwnrcJGDdrXRbGuH83Ok0LZaLmGT7BG6dn2z9V+ijKm1BCngfBjJE6IKo5Y8YOm+UnNEDFfQyb5nma3JTK8L60iObP7ls2LqOTPa3s4HzPsbF7DEfMtBVXJA51xHbMEl6S/szzMDEC/dP5pYZZZHMSc8+7yxy9gwwF/5oUU8+P9r6IaqtbDhADqZLsBDz5Eqqmxdb7ddo8Oqr4TgaibFSKNds9FsNNJQTryJ7GETGQMlCl8ZfGlVGwzfxQqFpir4Q+AcKwWY0G9KYc3W0hka9qQCWTnkLZIzshkSRVnCP+/FiIGsZA9ylULseikqGaxRpCdlGRzAeCag9KBcy0Fw64sLzqtkX4M97XmGxlOmfXLT8FOj82PUJtVkxbijkTZHebiGOxrDuXtDjsfsLSm5N51ybqWsiuvIWKulH2+s4HVA3j+nIvnNGmKWZ5w2teT+QDq4V0YhZdKJ5tFjErDOOmzPjFT+5kegv4XVknm2FDFrC1qOfz2bqW3aVPhXsLHiqzjtlbVFPRLwdHRGvqjDkU4QtPAeumkBO4CxHMFERvGhJLH0ITcop4AGgHao97s8i5oELazQk+8xAAfRJU4FgJR4Ud6JWLCZSkcn5Lj/vfsBD0ac84eCcGQDCWkV2COP+5X7LN3VYsdowdoTnB4n22g08yaJ9+mMPKtzjprFYLpOKXv2tkWy3h1LHfz/IpWvYDr/3UDvWp+aANeD6CwQv2rXnAyMsyrwOPaqF2+iVHynK6KLio7KJ64VLJCYWZhhhKdfidesqDR7D1/TyIFPZIDJdu2fawc8yBi5NZAqpIAOKLYbpuY=</encrypted>]]>
			</text>
		</query>

	</queries>

	<toolbar>
		<button command="Freeze">
			<title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
		</button>
	</toolbar>

</grid>
