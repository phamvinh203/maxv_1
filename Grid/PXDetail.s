<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
	<!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
	<!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
	<!ENTITY XMLGetUOMConversion SYSTEM "..\Include\XML\GetUOMConversion.xml">
	<!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
	<!ENTITY ScriptCheckGridIrregularCode SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
	<!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
	<!ENTITY ScriptCheckGridAction SYSTEM "..\Include\Javascript\CheckGridAction.txt">
]>

<grid table="d26$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HM5" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
	<title v="" e=""></title>
	<subTitle v="" e=""></subTitle>
	<partition table="m26$000000" prime="d26$000000" inquiry="i26$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
	<fields>
		<field name="tk_co" width="100" allowNulls="false" aliasName="a">
			<header v="Tk có" e="Credit Account"></header>
			<items style="AutoComplete" controller="Account" reference="ten_tk_co%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
		</field>
		<field name="ten_tk_co%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="b.ten_tk%l">
			<header v="Tên tài khoản" e="Account Description"></header>
		</field>
		<field name="dvt" width="50" aliasName="a">
			<header v="Đvt" e="UOM"></header>
		</field>
		<field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
			<header v="Số lượng" e="Quantity"></header>
			<items style="Numeric"/>
		</field>
		<field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" clientDefault="0" width="100">
			<header v="Giá nt" e="FC Price"></header>
			<items style="Numeric"/>
		</field>
		<field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
			<header v="Tiền hàng nt" e="FC Amount"></header>
			<items style="Numeric"/>
		</field>
		<field name="dien_giai" clientDefault="Default" width="300">
			<header v="Diễn giải" e="Description"></header>
		</field>
		<field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
			<header v="Giá" e="Price"></header>
			<items style="Numeric"/>
		</field>
		<field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
			<header v="Tiền hàng" e="Amount"></header>
			<items style="Numeric"/>
		</field>

		<field name="hd_so" width="80" readOnly="true" align="right" inactivate="true">
			<header v="Hóa đơn" e="Invoice"></header>
		</field>
		<field name="hd_ln" type="Int32" dataFormatString="#####" width="50" readOnly="true" inactivate="true">
			<header v="Dòng" e="Line Number"></header>
			<items style="Numeric"></items>
		</field>

		&XMLUserDefinedFields;

		<field name="stt_rec_hd" readOnly="true" hidden="true" allowContain="true">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec0hd" readOnly="true" hidden="true" allowContain="true">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
			<header v="" e=""></header>
		</field>
		<field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
			<header v="" e=""></header>
		</field>
	</fields>

	<views>
		<view id="Grid">
			<field name="tk_co"/>
			<field name="ten_tk_co%l"/>

			<field name="dvt"/>
			<field name="so_luong"/>
			<field name="gia_nt"/>
			<field name="tien_nt"/>
			<field name="dien_giai"/>
			<field name="gia"/>
			<field name="tien"/>

			<field name="hd_so"/>
			<field name="hd_ln"/>

			&XMLUserDefinedFields;

			<field name="stt_rec_hd"/>
			<field name="stt_rec0hd"/>
			<field name="stt_rec"/>
			<field name="stt_rec0"/>
			<field name="line_nbr"/>
		</view>
	</views>

	<commands>
		<command event="Loading">
			<text>
				<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXoK2w/YUkJHUY0ZH43sfD4duGnx7Ohbkr4DBDNymWoBwQEGMn/qD8zRnO7G9BYAe/TvwiNYB+shLIE0UZhWfV7Q==</encrypted>]]>
			</text>
		</command>

		<command event="Closing">
			<text>
				<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khX63lKwmzHzjwARyexDzCpOZwlE4lOVaY8k9R24ocGHqr/Y9vn0dleP1J95VH2VAf79ctKpKvXbOok8q6nET2T8O3xDK38OIY9OHxrvW7pj</encrypted>]]>
			</text>
		</command>
	</commands>

	<script>
		<text>
			<![CDATA[<encrypted>AQ1BLWxC4US6PKJRwDd4Sh9pIz+68Gk7Fl4+egq+HBGuM57NH7+47MaZm2tr3pQQgwDkOM2nyRoTJhD+Gv2cjGz+HNXraR/9EG6JZNr1fNKnANp2yi100DsIt9iavdluXoQ0qlBxhi7uh8iOVZbucQa1xB9TtmTtbIaVE1U/J3TfjHmf6yGvj6QEnaVju8LC4cwiQzXqXyV1F4BoRAv9qYiU94cVQFBekuzbElFh6/3/ClHrjauuMeedIJHVSuewsc9b+mDNX6klx/H/HpoD7RtuD/gUCix3FCfUp5wXCEK2aDCQdG4t9H7fDbqumYVMfKjtXYkAN0EmCHnVscRPLGLrsAhzvAIyJLYAk6OTVgvtVZfTtUCxqJTM2zAT8tQjiR1wCwTlvnCGWUZGbNJkax3udJcA6ArNhPm2wnUcEg5k0WeefLP8+InAYqDoOoxksIuhMDwICwPOfIFMYrpa+Yl9GBgn5L/1X9dOtZBMqfUMgYyx2r37yFY5QxbHUXeLreb8F8vs+kgQGJsTFFjuZQHMd0mL9Er8S1zv24xwRhjLc55RvA5wbHDrjrXlPeHoc3K+m4JmR0zxGbC1oNFQMbSGky5V2IVaMj+ZmLSvIjmGb7MVj8jrSLFAJjZwb+DB0H6tFrqxTleCILX279Vkvqmmg8NTFz6ELnWkFGWXivERwdQi/8X7+4GeLHCmVBKJ4Jp8NydsXttMXVQvTZNU51uYWd0MXQtcHJg+gTNcCI8Q6ggPyzDZO+tsF3sIGbEQGEszqE/IvHtq+pIuLMmWaSMtOqhsFjxPGscwmKkGXDmxaX4smUdDUkve+eXmBo/b+8akdz97tkhhlMZl8NhCValZzlBEibTJreM2qvb6U8/MD4nJzITk6vamIbQE7dW3qU0KFRr/OMFa66tNGNSRs/2fbsyP+Arsg1je4uXmBkQ=</encrypted>]]>&ScriptCheckGridAction;<![CDATA[<encrypted>2z7LnpaBWmrRNGe9/pzlq9VPzdoe93s9K0Ipm0L3EoCCzoj0+dE/7nC8gd6zjKogc9At3/vXGNZ741qwRlVeYQ8mfxUm/RINv4HM+nw/Il8wc7XQ0nhwc8Y9uAYkq2rkCvGgimdOXST4AqA2LpsyxhmJLE84/quhwHim2DP+tsYqb+gko2zubkrin15mn28WNKGt+3b4bUWR+C3iZ0evJfICFUjXHwLg/oYyCSfLZcXyluUk4oCQwleZVJHAdK/j3fTI000tIJW4zs0OnGBsDvWKpyJfUJzIJGSMftmAri8OWm5rEKiZfdgKDTQJI9YN/SgwnJG7K7pjKCkbr0XLGbIhYMVHyh973aptBCxcv6HyI63Bb22cfLGcMj8NHNfyiEjBHwHiQw9IRDls8NLIcS7/bIh/nAqvFSo0rX4Eb3w=</encrypted>]]>
			&ScriptInsertRetrieveItems;
			&ScriptEmptyExternalField;
			&ScriptCheckGridIrregularCode;
		</text>
	</script>

	<queries>
		<query event="Loading">
			<text>
				<![CDATA[<encrypted>+8/A1B1Edn+SRk6VRS7oWaVsSPD34RwwMXxV43PbxIHtvz55atNiMLrhbnZDCbqicUu/RykvHIuCyk0t4zk7bO1fRf6NlN+m3WIIK/889bxXsk1eF09niek7bYtIe/bzy4MKfgTJcmJWP+2fRwdnqBH0ZFFT4ekzCBlnrXGAGgLmopa5MiytxkQAXNsNrsRo</encrypted>]]>
			</text>
		</query>

		<query event="Finding">
			<text>
				<![CDATA[<encrypted>i02Ezi8AaAKVN4WMZBJTdrWozJhIs8SdeOVZfcF4F94vRwuZPJ/tNzf19nBmTkf5VMVDRWUKoE6fSlULtgH98GT8CUWROVyyS0JFKZJ/H7di5JRdcAGUwtrNlMcsK/pdep9P/HkAsCKRVUQs8KDEXrw2NcrRxIehmOghYMPneonOYWXFPPt+J7dfoWZrDGfrQ99XJI/jJDMvQIrJU7OFPGXaWmM4HW0z2jIJzeThncRKgVGEAkoBxkE2VyaSB/fU6ecipEIfdzSaz6rI1gQojHGM181R8R7iwwLNvGLZZalCa6LQycFL6QG4L2Avgqwom1aq+42YrQTKqCir1Zc4T+U52dSbcFUdWeeGS0v+d4T9mg5z7+Ee0xxCZXEEsbLiEDliisKdFT4BFKuDhXci//8Cqs+ocwKlP3Ld5BZmsxS2tdXGfFUEtV+HTFcAt4s9+E6DZJW5pxhXwj3YLrXMsXHk2k1yZE322kC0r//qNV1SzeIpue2cGdlH+QshERNg3RjUXwZPbcg7H8J4y0WlDuYWR2l+TsrZRZ1Gk79mnuvrEbSYlwra0RJDU+WfV2zgjUaicAr5srXbUk4fkPFDM9J16ajw5IfnKtjmEwDLVwdrcM0eDB82kG6yQZRHb6QzJRt5ZJVB4ewykE1pTY1AB6r2aNelywPAgHxvQxd2Eu4MvAC0d0LtM7Ttv0H5lC7j9wLAsuqoqgbQfUg18tdlAw==</encrypted>]]>
			</text>
		</query>
	</queries>

	<toolbar>
		<button command="Insert">
			<title v="Toolbar.Insert" e="Toolbar.Insert"></title>
		</button>
		<button command="Clone">
			<title v="Toolbar.Clone" e="Toolbar.Clone"></title>
		</button>
		<button command="Remove">
			<title v="Toolbar.Remove" e="Toolbar.Remove"></title>
		</button>

		<button command="Retrieve">
			<title v="Lấy số liệu từ hóa đơn" e="Extract Data from Invoice"></title>
		</button>
		<button command="Separate">
			<title v="-" e="-"/>
		</button>
		<button command="Freeze">
			<title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
		</button>
	</toolbar>
</grid>
