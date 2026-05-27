<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
	<!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate.txt">
]>

<dir table="m81$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
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
				<![CDATA[<encrypted>eRaTAhyG2ZiIkITWavZj6ZoY8L/VkcnfnOFC3EF5X2eDzyQp1a6XXF40y8Wq6GOILOJm56ZyyDfAP5u/1X4L69jGa5aVeq/t0pitlkzBKjQidnK/RAQSZ7CyQmPCM5XwFXOp7qWl4kFiqTf7OhXVxg==</encrypted>]]>
			</text>
		</command>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Tg6yplTBaQz7rDwSvYapHB6L7DzaFdifWHuVsPrZH6I3jRueMMdKOFZPo6OrKz1z5cnrCTMnIgyI64UBpypq9LgqElt8cDkxTWECQKYo4QD</encrypted>]]>
			</text>
		</command>
		<command event="Closing">
			<text>
				<![CDATA[<encrypted>yBL9zUph3JYfUoL0FYoRbv9BTpZlmv4DGz2I+dJyyVw44Q2TeiprOeoTd8GQr4twj+H5MjGy2dZpBRnLDG7CEKJeoqYM7zPiHhQP9TRXbEEZ2/UA9PLsBhHO80GpjHG9</encrypted>]]>
			</text>
		</command>
		<command event="Inserting">
			<text>
				&CommandCheckLockedDate;
				<![CDATA[<encrypted>UuALZiQEi24UggZowbAQAlximsyh4/BvTU1YCWkvoMdRJPW0aK0qxhpT/7hoeWJo/Wr63b6T9JrRID4DL1OT0yt7w8lB/GmypzJ0SAgFoaQYH0qGk4GpB5h07voG+4cCZjQq6qEpnN2YEPWwIlvbBgGahMUm7JRwHPUHg5fJguEAlMYa5YjrsytufsWNtdfyTdnZgYS8MEPYVbWqYuhuGdOIII5wzT05Bzh4M30XINl0uUFfAo+SkNzjZObwpxxEgLitTPevVmuHMgxW3AcBicUV9q50eSVgsRQWyf9AOPdfuh8vKwASKpJNcuwUHusl9252ZPQmcNLIiyxzO3Af4IKJdBjDNSusBWnO9w9tL/aDapZmJZx8xOYIIJ6rNCbj</encrypted>]]>
			</text>
		</command>
		<command event="Checking">
			<text>
				<![CDATA[<encrypted>17EHpy8FntHPZc6eQPKebTmWpILNXFWw9UbiCD7QDw3mvWfzfmuybdy6QEgU0A8BbCLy1OBZr3m86Ko7YVbbnpycdkQ9S8FMrpePMYB4atKfGTohzpu66aqbegvh/tErowIPIYujhkUcTUWHKJiXsAZlNe/cA/9hT48nDag8usIu7amHrKF6ZArTUx3uEBG9W5XyR//w37qbeb4MlE5cuQ7EVImuGNkq0XER+GEv86W0O5dRm39LCwRMztuSi5A4/hnPOkaukbGhkegdzM4uz7p6bVIkULi61RszQ5LxOTKXlzv+5iKEQis17qJjIX74kYpYF0mvb3mY5YWPAsnG3Nel/SShvYoz8c5AU/NWYXCanyffcO9yQS97iKYmCM2ZhwydeKEYE5rZCFsD7QAWeg==</encrypted>]]>
			</text>
		</command>

	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>5u+nc/0pa2V3i64C8PcTnzYy8ICpa1Eb3cuZ+B9yet9AtyJJxyW+anyQKs3S8y7nwqUVABFMI4N8JepRWFSw7vzwM55YkD694AjxRkDctJlIMALvoV4GE962K/v7A4TeAb6zEStlEF4uSCswDHPxGRi6UZKgxYDWy/Bt9ewUU+SCi99srI1SYA9OQjY+JceSyPN0NNIZ0x4x39zUl6FD49USlHCTyCNcEv9c65oiDd4hNMmiB4UUh5f/4gvl39b18dDFNRFx3bZJVEYxExYe01UaeexhI/gh8g78CXCp/vdWQpimFtN1tW3a7ZzUa8J42Hd7KaWoy2i7cnorR77zdOmH3npyJ5KwLhue41VC2a+m5BAF63iepEUmPvxRRlHEZkyb/9wnvG6Wwn74H8KabvZ9WPAx9hn7p10F0EIZBTjM6YueG58OH1cTpprfSiNznSojgYr20pvaMH5Xx4D6JVd0/DG4LudF1NbKaN8HL2mqKG7ttlLlk/bPLLFilduzlJ1t9TBrfFvDbvhzSVCzfzJAQAOVRem0Il9otgMbdxUgPCGWrQ4omXijQrXRzsYqA9hPBAKl3Cfn6+RcV06uUp93jXv9u1pS2V/tBuByTwkCMN56g7sZrIzF9gLqBeSvtFimrxigFNpohjLsxZI7GlEbZTYbLZTLzxVjssW3vj2nQrykPe/qRpHc8yW1lOdpcKpuH6myyOsgqwfqTixbt5636QuMQSAsZ8M9cOOl8FbPCLDdxpIROdyCZYSk3QJp0HrS1B3T0fEC1zEjaAPAPQ==</encrypted>]]>
		</text>
	</script>

	<response>
		<action id="Calc">
			<text>
				<![CDATA[<encrypted>8PJHmHpQQe0SJ8+uSuZWiDPZUg+lwxhU0jC9SkRQRfYSd3qTLqqmsHEMCGR8T43w/WthAz7dtNcE0bUj0mmlD31M/W+cfk3fnPofJlBgZ5HDIqNEOpKAbVoz/+lS7s2VoboSyOJFnzhtkB1ifQN3WQ==</encrypted>]]>
			</text>
		</action>
	</response>

	&ScriptFlowFilterCss;
</dir>
