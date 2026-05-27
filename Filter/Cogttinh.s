<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
	<!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-moka-com:data-dir">
	<title v="Chọn kỳ tính giá thành" e="Select Period to Calculate Cost Product"></title>
	<fields>
		<field name="ky" type="Int16" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth()+1;">
			<header v="Kỳ" e="Period"/>
			<footer v="Kỳ/Năm" e="Period/Year"/>
			<items style="Numeric"/>
		</field>
		<field name="nam" type="Int32" dataFormatString="###0" maxLength="4" allowNulls="false" aliasName="toYear" defaultValue="(new Date()).getFullYear();">
			<header v="Năm" e="Year"/>
			<items style="Numeric"/>
		</field>
		<field name="keys" readOnly="true" defaultValue="''" hidden="true">
			<header v="" e=""></header>
		</field>
	</fields>

	<views>
		<view id="Dir">
			<item value="120, 40, 60, 330, 0"/>
			<item value="111-1: [ky].Description, [ky], [nam], [keys]"/>
		</view>
	</views>

	<commands>
		<command event="Created">
			<text>
				<![CDATA[<encrypted>N6V5qmxYmNatECkJI+R2lbtAGg4xsS7cX/JQ/2bJyc2Z6+499b81wazX8r7Wn6vYs7YKk73y4fmogJ33kTEAXp5qLR5T4JQvJT5DJLFE/aku0GFnbpeSYZNUbKHg1tbjOS9XnbkOZzTsppAqbpbINQ==</encrypted>]]>
			</text>
		</command>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>rhN89LpRfOIrMxm/JM7EawwA5kTjs85yFPlUvXYsbLh+LuBCt6p2TobuprychtK/4kY+aHR52kSZzq8cgiQBc3ekbv+rZwms38HrIH/WnRdDNQVLvbRkPSSavXkU0z0y</encrypted>]]>
			</text>
		</command>
		<command event="Closing">
			<text>
				<![CDATA[<encrypted>13Yivu5EgiVvmvfpfd2lroQweO7C0i9q2QitsW0PKan1F3ZIr9Zj8AQTe3Xdw6m4NUT2YuUCWV59nFBy3TMEwA8FYesfsf+7t350STmXpRiqRLDPaCaRJaFJYvshN3NM</encrypted>]]>
			</text>
		</command>
		<command event="Inserting">
			<text>
				&CommandCheckLockedDate;
				<![CDATA[<encrypted>Ooe7WjlTBiNXG74CSWGlxj1H8Z65tEDxo+XXkapb2lbjExL6RYbKfD7VO8Xp+4DC1w4tpim6wWK6Q7i0Xs/S9P7lMcp/m9wShkH7tOgtwO8FOP6FIFq/ETfczUzqTe7TJ5acZ7H1UfDbufTAOFJrMH4If581tOetOmJfNQZVPB4B4mUIw0Kn4ICKRhpAwiCIPCVQn8+6BuhvkxuVSo8mbHnHP1cksR8Tz4wlDAet2AR9iRMgLlrV6RzwB2i44FpjzcN10aNy99YG5RMrHgey9wcw25CqdENol7zWrAIaVeulXuW6bcy604vCbVFfKyqRNL5ogiPoBycXtxev3SZ6LUZMj6SPGwRRFBTt/Lpm3RLOjQ6hLQOT+ps0B5FMQ/aQ</encrypted>]]>
			</text>
		</command>
		<command event="Checking">
			<text>
				<![CDATA[<encrypted>AjGwYmMlknfONuwpgEA+0t3swTHEsfn5LvKgJlrY8h2/AYciYvE8SV5RPGBnx2/Hv33L9G8dyMdO7uIkiM1t554HTtuW4rc4iWt87PyLUhhTNybQoLlpBBMAcyiLW5f3UAapxxgAaNG80BPLXSExJzF8HnXWpr0yeJ7vhac/Womt1kwfWefhRQNSUNF+EP2DhcutRotxixkdk9LSLBSMWxg5OQ3hQBs9TGe9XO45mArG1am2+Xd2GNCI9JbCfsIuYqYuDlvdF6HOl91J2PRfzFOZNdy0MGzoHr40VB+pc8XJTuyGQZ/46Ph/xc3QB5NzAoMiYQRQwU/vSABoIqeE5+cYio1pB0TDPZa7FqmbP2kSHDi7xdCNz46i+lWnm0/77HpbFCe/iTB00vzPhB/eCw==</encrypted>]]>
			</text>
		</command>

	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>gbxyPZg7Uo53MPnD9WRxDO4Vmqv/VaZ31qFYU21XDQKAcwKA8MKkTuugYi3RhtYwb3hV/IxpOv73wfsxZEp+eeZsA+IFYVvoj5qhbW+nvbK5bIP4pz+6wKPs+8JT3IswC/SmHqqfPN3tljO87mEUD/mupH0N+O+8QPREBrxsa+RxCU6er7MwG6svS1V9K3riN6BeNuHGbsdBUFXE54TJC3J4hn8JmzDoJbs4wtO118ivXzCRry21dQyS226ARHTk/yiMDhFSzf+JU7Wo5h7hmvhHULkSIdWSuDI/p3uHcH/KQ1MeDa9RH5HXyG/j6OC6TzuntAKOMAXJGV4383zkAuZ3wF+s5eJyvEaY82MvuEmMUyJWubeiUvbvlau0iNjuwqQGLcbY65ZUly0rqNzVTnCmrpJ8giBJ/dwVMN4o/jLm7k0yTB68liu8dkTppS0dCVH2HTWqoUu6xB/f3oX5Z3RsyQ9ZYwr7lVy+RfxK2t9CMY6NAkmHoS/9dNDzUkwcIzZ5jzDoKrMMa1KyViij3BonJDRtikvEOSMVKnyv3VhPFjPzE2G87OiJim3X/1PrCvW4OUvcdHsSu9yZ1e8AyHu5MCIt+PKScoJhRGFh5D90Kjr0v2VQEJU0oagIpcqVqfgYm6F2iHmXAmP3urASth7X81Hdik24pKQ2hmaJRCzy5mSPiudmUBKcDaVtSMB4qT+1e4fzjMNPTP1qma9V5mxmTuRilqukRdXtL7dSCU9KD8mSNzQCggTKvw2oMubxRcM6Nr6BfJmspIgdKoB3mg==</encrypted>]]>
		</text>
	</script>

	<response>
		<action id="Calc">
			<text>
				<![CDATA[<encrypted>60JQm5mXodhh+duRFki+pP9LkBSHxflNacROUdKf4VvnvUAp9Vzm8xHdsndMFSneq338o+Q4LRO7NMm6blCx0hjCiKfcuJcXbn2WMxa0dtamZVI+XqpzoNbAo4go5zHW6hpXmOve3nHRElnReeEAWQ==</encrypted>]]>
			</text>
		</action>
	</response>

	&ScriptFlowFilterCss;
</dir>
