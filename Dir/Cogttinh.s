<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
	<!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

	<!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
	<!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
	<!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="v20ctgt" code="buoc" order="buoc" xmlns="urn:schemas-maxv-com:data-dir">
	<title v="bước tính toán giá thành" e="Calculate Step"></title>
	<fields>
		<field name="buoc" type="Int16" isPrimaryKey="true" clientDefault="0" defaultValue="0" dataFormatString="#0" allowNulls="false" inactivate="true">
			<header v="Bước" e="Step"></header>
			<items style="Numeric"/>
		</field>
		<field name="stored">
			<header v="Chương trình" e="Execute"/>
			<items style="DropDownList">
				<item value="">
					<text v="" e=""/>
				</item>
			</items>
			<clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa43jpPiltXqAoL7lIFn4hZGb0cRw8HGrkJG3hCViLwXTj</encrypted>]]>&OnSelectionOutline;</clientScript>
		</field>
		<field name="stored_name%l" defaultValue="''" readOnly="true" external="true" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="tag" type="Boolean" defaultValue="cast(1 as bit)" external="true" readOnly="true" hidden="true">
			<header v="" e=""/>
			<items style="CheckBox"/>
		</field>
		
		<field name="ma_gd" defaultValue="4">
			<header v="Mã giao dịch" e="Transaction Code"/>
			<items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct='PN1'" check="ma_ct='PN1'" information="ma_gd$dmmagd.ten_gd%l" />
		</field>
		<field name="ten_gd%l" readOnly="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="ma_bp" clientDefault="Default">
			<header v="Bộ phận" e="Factory"/>
			<items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1" information="ma_bp$dmbp.ten_bp%l"/>
		</field>
		<field name="ten_bp%l" clientDefault="Default" readOnly="true" inactivate="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="loai_yt">
			<header v="Loại yếu tố" e="Factor Type"/>
			<items style="AutoComplete" controller="FactorType" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$xdmloaiyt.ten_loai%l"/>
		</field>
		<field name="ten_loai%l" readOnly="true" hidden="false" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="ma_yt">
			<header v="Yếu tố" e="Factor"/>
			<items style="Lookup" controller="Factor" key="status = '1'" check="1=1"/>
		</field>
		<field name="nhom_kho">
			<header v="Nhóm kho" e="Site Group"/>
			<items style="AutoComplete" controller="SiteGroup" reference="ten_nh%l" key="status = '1'" check="1=1" information="ma_nh$dmnhkho.ten_nh%l"/>
		</field>
		<field name="ten_nh%l" readOnly="true" inactivate="true" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="loai_vt">
			<header v="Loại vật tư" e="Item Type"/>
			<items style="AutoComplete" controller="ItemType" reference="ten_loai_vt%l" key="status = '1'" check="1=1" information="ma_loai_vt$dmloaivt.ten_loai_vt%l"/>
		</field>
		<field name="ten_loai_vt%l" readOnly="true" hidden="false" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
		<field name="tao_pxcl" dataFormatString="0, 1, 2" clientDefault="1" align="right" inactivate="true">
			<header v="Tạo PX chênh lệch" e="Create Imbalance Issues"/>
			<footer v="0 - Không tạo, 1 - Tạo khi sl = 0, tiền # 0, 2 - Tất cả các trường hợp" e="0 - None, 1 - Quantity = 0 and Amount # 0, 2 - All"/>
			<items style="Mask"/>
		</field>
		<field name="tk_cl">
			<header v="Tài khoản chênh lệch" e="Imbalance Account"/>
			<items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l"/>
		</field>
		<field name="ten_tk%l" readOnly="true" hidden="false" external="true" defaultValue="''">
			<header v="" e=""></header>
		</field>
	</fields>

	<views>
		<view id="Dir">
			<item value="120, 30, 70, 200, 130, 0"/>
			<item value="11---1: [buoc].Label, [buoc], [tag]"/>
			<item value="1100-1: [stored].Label, [stored], [stored_name%l]"/>
			<item value="11010: [ma_gd].Label, [ma_gd], [ten_gd%l]"/>
			<item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
			<item value="11010: [loai_yt].Label, [loai_yt], [ten_loai%l]"/>
			<item value="1100-: [ma_yt].Label, [ma_yt]"/>
			<item value="11010: [nhom_kho].Label, [nhom_kho], [ten_nh%l]"/>
			<item value="11010: [loai_vt].Label, [loai_vt], [ten_loai_vt%l]"/>
			<item value="11100: [tao_pxcl].Label, [tao_pxcl], [tao_pxcl].Description"/>
			<item value="11010: [tk_cl].Label, [tk_cl], [ten_tk%l]"/>
		</view>

	</views>

	<commands>
		<command event="Showing">
			<text>
				<![CDATA[<encrypted>4qP2pCdQRWeEfN4frFJefleXbNupIpUny4kAGLMagzsDKAYNZAEZNt7v0Dm6KeFlFV+gOFZnUC27XrSN3bdrJQifI5/eRHmvHkYdxGt3ovXmfMPqANXKd52EIUSiF9AkMU/6vU3HEtbpLVyuHRAs1tDjdtL5PLweuuFFeTRTPKuFqhmxywLce2fpQ0MAIWtGP9zzFwcQzOglWEFJB51JWH45OXu/gfWVHIEojqY2kekVayXAuBRfquG/XM2SJ0vktRwcDhjWwEq71Ga9hu1u/nrw9PCZC7EcKGa6Ln2oVH5/QMkZVLz63F8AbLUTPHbwOW1uxHKx2FxR2TVnSScqLH/HCmsBSxcP/Jpysa1xTPS/R45/HYKSl0FZgI36h+yUnFUzUTmPcU4I2rdKK/RHPkVFnxaamm89loEP2miiiwIQFsK3cJBK33PHw6UjDwO1TrW3dammox9IcUwL/WTkUq4BkzAgkrGqS+nKZm4KkzKUKOKfKasPlrdbzS4DdT4R6fOASD9uzRXL+E6O0wmI3lZLiwRM5iU/0qyAT1bAt8s=</encrypted>]]>
			</text>
		</command>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhrvkAVyvJ5neDD0g+iMmpaIm5B7ePSPWJS5XasMF9rocipBa06BNxnCgKXrY90Hzu+fJS1LkDjW9/zNR7BOiPQy</encrypted>]]>
			</text>
		</command>

		<command event="Closing">
			<text>
				<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7UNWxKXqT3noRZYqza6znvvF9AMXAgovc/fy7FZMkP0Kt9/+1dNotfeTjnK3Xs+Pi6HheP8Z6Ny5IegnWK8h0nGP6RSbcdT+DK3s+V6FW8AR</encrypted>]]>
			</text>
		</command>

		<command event="Declare">
			<text>
				<![CDATA[<encrypted>lgotRatLJhxkCcEhNviXk4FVN1Tf66uJLpQd0LmDCqwIJ21MhcHquqqFs8C0PYhpMmUVnTV0YWqjMaV2l8L3WKeRlR6engXA8DzxHJw0cyVFebIgrhik95R0pyP3oWita+4n9jR1q1jF6NQspcLrkmn7QdhfqUK+53y5kKXhn9DNJmNP67Vo2I38DiuLRbsWimu/CydW2vUnjJgjAYgvvbsRhbQVXJ24FvBr4TDTpVFX8Sgf8CKs+HGjOG1sXGeDbmtxaZ48Bwgk0NZIWyjnp/lV7l7zdhuCM/PdYbt7VbaaP2zmjwGpt0hlLD0Uhc/KaFz3ub5ruBs5lReiY2eptF2fiHEv/TpzAB9izXxSFWxY3CrX0IXwmyh4HERXjkwKFysMTg0lt89ELS9vapBOTldjs/BJ/r5itLkXM8EujWm/AiIJTX8TWpgNPChAJPle</encrypted>]]>
			</text>
		</command>

		<command event="Inserting">
			<text>
				<![CDATA[<encrypted>YbuMyPpRZ5olCDoLnkq3KHHC8iW5VqHGBQe8NmLzOMQmfS1DOZa1XyQioXBsPdv8uwtp5y1EOQFXFikHhV4loZfF/GgCUvLHUbWYKMLuKpyNP5UX5JQxtEZG8SH5BbJsHgGHCHuYMYLiGRqxgvIevF26reLeN7fKr/85ie+nwgvWeOllCyQqrv5U/2NUqhOKsurG5TyEDdsF34ns/MGO4eHSMAYOjPn/8WKyAEkfM8sHvRbBBqvwByWvRxKKMrOk</encrypted>]]>
			</text>
		</command>

		<command event="Updating">
			<text>
				<![CDATA[<encrypted>ifGNdo51SeKKS6A0I8h/ETDO7G+G7T/XjgVt+059i9ntYkA/stnn8n7NA7BPGYh6VhOZmI/TNYX1YYVEcBQMnaoDdQuJgxc1eRyVIw0W7JRatg3zyqTI/CPi6Er3zyqdxmD88YGZtKiX3+Ro5HQ1znPIj/X2B+2zG7jPr7g0ZrKzu8HgSfWJyMWxeu9jlV0B6v0ZLwIob+eAdP+LTYdeYz8xjSFxbFFcw1UtItNti3KmYxxfqBCD6NlDJJFrJFmQa0IJSEviypnd/Wf0YZN7zol9SAOCm293sNnR7XFFEXc=</encrypted>]]>
			</text>
		</command>

		<command event="Updated">
			<text>
				<![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILe8UYB9ji47a/nVSY8RbiOfNzOQEi+LgR0VtyEbXxS1t</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			&OutlineEntry;
			<![CDATA[<encrypted>7221no/C3lrBDFIuqJHPaGxppCLCQf8HJ5zfT8yEn+Ek2lHefhposmgOxYg16i99uhaT20HzDBGcFaieB0nPRWwHWkZNQW1k60YSrTe1E8ptmU9Na51QBkp9w/ws0+a1kO6snwQztvIbIoikWVQhVyBCSasFtuKhZGFchBe36dKB39ZhARSV5c1Rgrw/+ZgLZsLhna+ygMb/OAwA0rhPsxS3P79gBBNDmKlh16ds+4rvT1qzXjN8+o2hWPxAGYaf72tY1kyK711iMd96vhK2oG0H5pueZ+l6qgiz5YelurZgQRo2Y4aIAH5jAlpIYi/nR986bWRR2xJgxkdscZUa+xmsNFji91ATSApKu1uPnQe/52IdE/hEO1eob2H4xczI2w5G2joEwRrHJ417Qx190vXgQcN2//RQ8w7ZvYQHODTig0VlhrTR0midcCZ+fdGnwVVYHMK96VjmaOTCU91Q/zuvpQT21WkAwl5X347a7ay1yvdgb4p6iTsCs5N5LNiFdz7Uk1YYUZSw+fiQpVDMEEB0m9UR4iOEZwntC7DSv0iN7EBQnYl8zbdxntUfFvL6G+0nV2Z9sdP/cUufVikruWBOuYgyzgEpx+JbS6WXr3V4oOzWpagnO/dCfSkeE0ecN7vNTTr7qW8qCtiGv8GGHS2USMYpkdwcp/q0orvUp050zp4iin5DInOo52r4ThWFbNXH/3k9LPgUfIRnaOWKndpEjUK6PyWIPOcMkio/wPq5OpO+afjLKBBYwsb+n9PGviRt/8PDVfj57uCMxCYweRr+nEr8Z3rJkvLbpQhrW7lhqJ6o3pYtRROGF19rI1iFzCfI76no5MB9QN2W3vuEk4Zsq91lPx8VZRnJ0QE6yXPkQlmr064BT9/QZdyksTe96I09H+7cqlk8l2c8m11AYceFNslq8XSklkfT6ogsGPplTpt46MsicmC32X6BCsHVhXe3BZ2ycT+fAsZ7+zRKa1JcgF52GcsLYqAe3vRZ831H5fFFNqxKSv7R3DjPaCLasZBpbZwXju+nI1aTQPG/wmeN5hEwdYYlNEEYc8Lf7GuQcUYiVwwjY5MHmc96tuEIelGJ2nweWKORkX+ArgGVkd+mfA67r1jFqTYTqjssVfj6l5bkngdNOOJwClneLRm+DQKOyvuxzJBCZA64tjCWQ2Iy05buPW9Ex2ecJGqbADnBekN/cXRKZiOAONWZfvjI</encrypted>]]>
			&ScriptIrregular;
		</text>
	</script>

	<response>
		<action id="Stored">
			<text>
				<![CDATA[<encrypted>1xzmOF5VMPDRjOLou6VhD3zLlkwZr2aJxNi0ucFl9xZpCYZz40IdWaIubKmqrgNAAPwt6gR9683hCvrgP6sTIcg5eTMkFy/2INmR+Ulzcc24XySgzIncla5YusBItf9kzCAsyBGrCXqjvkyvq/Krfpg57pYD2R31xnXUyovQwiHIyeH0xyIjFx/0PSNS0cibfzkzklUJoUOECMa/RRYTqbXPJbNiQqfUIYmfujbI3hl8oHujRtn+Q8PI/qXiDlJVP6YDWNIsQrNpZOCt0NkAEfS0LDLBH6EZOM7CqsjpcVuJPDhlkNn0JhX57tY+H9jD10Kg94U2IPaW2Yre2IsqaT40TMfDBOY8/+hWIMuxQ926M4eY6LMFI0mDqqD64IuwnfObMmWIYBboRnlZdxBaSXG90ZJ5+aMNIxFcSmQdXJkktQfmoxJjFNC/XejuXCBU</encrypted>]]>
			</text>
		</action>
	</response>
	&OutlineCss;
</dir>
