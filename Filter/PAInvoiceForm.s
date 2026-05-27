<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
	<!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
	<!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
	<!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">
	<!ENTITY XMLHiddenFields SYSTEM "..\Include\XML\UserDefinedHiddenFieldsDeclare.txt">
	<!ENTITY ScriptFlowFormFunction SYSTEM "..\Include\Javascript\FlowFormFunction.txt">

	<!ENTITY Identity "PAInvoice">
	<!ENTITY DetailTable "d83">
	<!ENTITY c11 "Mã ncc">
	<!ENTITY c12 "Supplier">
	<!ENTITY c21 "Số hóa đơn">
	<!ENTITY c22 "Invoice Number">
	<!ENTITY c31 "Ngày hóa đơn">
	<!ENTITY c32 "Invoice Date">
]>

<dir table="m83$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="Hóa đơn" e="Invoice"></title>
	<fields>
		&XMLFlowFormFields;
	</fields>

	<views>
		&XMLFlowFormViews;
	</views>

	<commands>
		&XMLFlowFormCommand;
	</commands>

	<script>
		<text>
			&ScriptFlowFormFunction;
			<![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW7OQAZQhTZ998nY90ZB+2n9Oz//iYY33IoIwIoepns+M</encrypted>]]>&Identity;<![CDATA[<encrypted>qEbwZE1tauD+kB/i2yTU65Wl4uDbAOWFAVgWxO+a4c1UW904G8OkvLFpGFjpKDWqM9rga14khT5VyaOUag9eaCcIV8azSHeWmZJUXWMkixKiIrYZamdBLpVjOu73Occ/3igc9ntzod59kbWxpnPETbPY+3bsF/CfoMJIsEPg1Ep0uYwgXtTZEpo/XpbGM7DJpLQ7rpYntMldyqNuW7B1GrM8UM8TurXABaxVbfsfuYIuJ/nTpVVyzUwuticNi7GMBS/me2sDeAU0nkOAVpexfzgB9NvOCtRFCsd0irwwiPr/rQKzSGpzgJFPM2znRTiKJqTbL44flbSxZTsfDdyILqOmpoFBozPR8XxNDL7saNkkGgKO+fmOLL5mguKy5uWrJT3oiL6uyiAsa+8yya4fGsTDgV0xnB9w6aqnx06i4LpXIjUziszWrq8BlJ8xA+z/ItYTbaOlir8U93/1p94RFg==</encrypted>]]>&XMLHiddenFields;<![CDATA[<encrypted>CAQw/30TkwvsaQhMGBkpoi+RglZ4z4Vcn5IW3yik91Vk66zsf18ADA2pECXmORZO9gQ9GNg6O1oFee2M3rgJA6ep8gMBy3xv04tNmix6TFgtiWaNfPMxl1jzBMNy6uaioEmIpH2Oy+9gKj3cV1R5AgopCbJAhH/pPlVcB/wNSlHWw8NmAf90tX8FDCwJhP4HzgKm/FH6I6PLiQ0EcXrq1C6Bx6jzQCGtQta011/8DiYut3KdVGRDiaMtrmqVAWO4F/hqoonf0dx0yoxiAkrCPevY7Eyf/CUyHEOxz5yii4Qrt/xLkJta/bKaxwWAf9jLNtFQ+qheIWny2YsT4A4QaDz+Wg1PFSpqFXo3LJvNr6Te9VOlWnvVuJALUDV9RAhG5RGoF765UWZffkc8Uvc35JdVO5OslaT3ykptYCW+zImmF5CSCrM++A9WFpxyAUg1U2ZcJ/m4XKERtRa7dxhGWxPZ0tGjY3DUvnXOHW1sy7pPBZXOdtHyJP+FyKcfO1Si</encrypted>]]>
		</text>
	</script>
</dir>
