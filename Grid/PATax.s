<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
	<!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
	<!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
	<!ENTITY XMLTaxFields SYSTEM "..\Include\XML\TaxFields.txt">
	<!ENTITY XMLTaxViews SYSTEM "..\Include\XML\TaxViews.txt">
	<!ENTITY XMLTaxResponse SYSTEM "..\Include\XML\TaxExecute.txt">
	<!ENTITY XMLWhenTaxLoading SYSTEM "..\Include\XML\GridTaxLoading.xml">
	<!ENTITY XMLWhenTaxClosing SYSTEM "..\Include\XML\WhenTaxClosing.xml">
	<!ENTITY ScriptTaxInit SYSTEM "..\Include\Javascript\TaxScript.txt">
	<!ENTITY ScriptTaxClose SYSTEM "..\Include\Javascript\TaxClose.txt">
	<!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

	<!ENTITY f ", t_tt: '[t_tt]:=[t_tien]+[t_thue]', t_tt_nt: '[t_tt_nt]:=[t_tien_nt]+[t_thue_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="HM4" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="" e=""></title>
	<subTitle v="" e=""></subTitle>
	<fields>
		&XMLTaxFields;
	</fields>

	<views>
		<view id="Grid">
			&XMLTaxViews;
		</view>
	</views>

	<commands>
		&XMLWhenTaxLoading;
		&XMLWhenTaxClosing;
	</commands>

	<script>
		<text>
			&ScriptTaxInit;&f;&ScriptTaxClose;
			<![CDATA[<encrypted>YM/R91PDy0GPMy51DJO888swVaENEzjbcAsyR0DtRGTpR+lMpu9YQ9j02E1SrsSBKebdfGDyYikGI/dlPAjt/BwT7EowdC31DSV6VTPtn+UGsKdCpzDuTQ1LSBfEL0hMT8Tpy/9AHSqzr4oRbSzw0p9OxsTuJZ07h8V0tJBcMr1Ob3jZeBvfNNDFXbc+RZA1NKw0YElHe2lUErw+D2MXJgzOaGLpsiKfIZ3jeRDbv+8MzjJQDcnoYlYrdj+g3Jl+3j1JSENtpd5vsohoOA1ceT0oOnb3GCi+hYRBoj1BooYY8BKIr7wMVKGrq0+Iau9OQei9Tv0i4k09vKs+2pA1Gr4fxIgd7rgDOyZovU94pn7H7QENiR+9En4xAixD+N95uID1SI+1bJs4C7zP3Fzz5zxLxxYABNrusYGZLkA0p75Z06VyfSg4/ihN27vUgAyYEcSx8BihlaJJl6Q+ZKGKvCfhXaCb2KjANh/683k30eydiPd2dotQCD0VWbOIJxXOX2jg/ZiGYVIoTUOvIp8flJxnrpV7KQb/WT4p3FghwgxpvNggeWp8rarAKbdNF0jBtYj8pn2DMSwT6l+5J3lO2ej8LugzXsEV/Kn3elIfcCcWDJ75QWgJ4maVM2TYeql+5hjF+NMLc9k03QWed1XuKQ==</encrypted>]]>
		</text>
	</script>

	<response>
		&XMLTaxResponse;
	</response>

	<queries>
		<query event="Loading">
			<text>
				<![CDATA[<encrypted>KJWrUBN0h+c2AchEQ56TDlwwUJrObBrrdY73JSDRb3HhKXgw/qCBL2pBdKEey9xlUyZ2gktQWo5Zh9Gynkwzll6AcW2kAIq3yYv3OhqXJiM+7XYtScPF3RNGnrygd30jA0WtiCgPpwTPG+d8pnoDokwB13iKNQoJQ+8MdRhFvTWk8tP2ybUpYCgtLt5bFNEaA6A7+VXM9EauUDTe39soRTiYNO5HZv/y0L866YvxEYLjumITaTH21NdT90pHBJFWbQP7ean5plPwubKLnWdVB4Mbx69yud0pVRLaXynnydoobun7Tz5fuR3OGCf/IfIz95/FNARmyqj5uH13rPqLbidQmk2Ihu9mdkN9KTNMBBZall+0uWVr8Z8NfMoSBY32quNqVY7EFl97rnUw5QY5H3G4E0KsP6ptrHVM9wSfD3/Colw8DC3isXNTbP3H4DAn</encrypted>]]>
			</text>
		</query>
	</queries>

	&XMLStandardDetailToolbar;
</grid>
