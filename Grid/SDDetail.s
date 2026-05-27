<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetDebitTaxRate.xml">
]>

<grid table="d22$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HB6" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c22$000000" prime="d22$" inquiry="i22$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_no" width="100" allowNulls="false" aliasName="a">
      <header v="Tk nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle source="dmtk.tk" foreward="true"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên tài khoản" e="Account Description"></header>
    </field>
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_thue" width="80" allowNulls="false">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMWANSp+4fESrNXmh3ZBDdfE6jWXZYbV6Fq2+jWE5kEBrfkyz8sxi2bweJpJM7gA2A=</encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''" hidden="true" >
      <header v="" e=""></header>
    </field>
    <field name="thue_suat" readOnly="true" type="Decimal" inactivate ="true" dataFormatString="#0.00" width="80">
      <header v="Thuế suất" e="Tax Rate"></header>
    </field>
    <field name="tk_thue" width="80" allowNulls="false">
      <header v="Tk thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[ma_thue] != ''" field="ma_thue"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41mWlv8nQolKWziiEBjOIPMKX/jXyRzZdRui4xXGR0atDgtr7LdP2IayqEI8Ci5JjDyi+oIJ5TLIyprM6tYFdg0=</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_thue%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Thuế nt" e="FC Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_kh2" width="80" onDemand="true">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <handle key="[tk_cn]"/>
    </field>
    <field name="tk_cn" type="Decimal"  readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0" aliasName="c">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="dien_giai" width="300" clientDefault="Default">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>

    &XMLUserDefinedFields;

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
      <field name="tk_no"/>
      <field name="ten_tk%l"/>
      <field name="tien_nt2"/>

      <field name="ma_thue"/>
      <field name="thue_suat"/>
      <field name="tk_thue"/>
      <field name="ten_tk_thue%l"/>
      <field name="thue_nt"/>
      <field name="ma_kh2"/>
      <field name="ten_kh%l"/>
      <field name="tk_cn"/>

      <field name="dien_giai"/>
      <field name="tien2"/>
      <field name="thue"/>

      &XMLUserDefinedViews;

      <field name="ten_thue%l"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>vjrTpmF2Z+0W/paelcn11J09Gxkc6w3chSXkmWofCDh6LlliBCjA/a9We/a3Rl73Oh5LELWJ8Um55rI+mGnqSiPN+Ucwa6JIuiR9KlDFljvWQYiD2V5pUVCdpiPAg+0BV3kOGBMKAl4ljjCV8PeZh4vx9za0Puta3oLGklWDzUx2s3p2ngg25tlMZDyCKfnlijVBLeH8t4q7xSvGAxYlizwjoXHbyW8gvAAD2Ja3VXuVsEogK8rz/a90Sdnp78iR9wpBUkXOrWjy+kW5SymjlQnnEwSLR+Is6o0IzHpRdMODJbkQFli1QJHE76NdSJi3YpMeENvLG789UsI2bUm+ucXQ5+mhjYatgvw65qtiIAFk/Fxlqvre02Iv3mvpK3eyKGgOjcNRuxHSHfLxsrybtAlYxgUzxzCkbhpe8skrsGaQpIUT1JdqqUbIFswgcv1uw1r9wnbkSoyFjtpj/Ft91g==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>naDkaoCCjb3ZjhLBPz0j4I34qjly58ghVA1SqzllqYwEQ2/S6p9xWZE09DIhwbqNMPIFo28gnp2g38A3tHZRP9jF/pyDnD9+pERGODtkoA6tYk2AjLNfG1czXFSmmZPGJR98iAKLf56FO3+HJ/ivfA==</encrypted>]]>
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
      <![CDATA[<encrypted>dXnV9QHdP2Ngn1wojhVuVmdBRUQmSltOQtOIsG3zUMbWibpFqdcMUO2TTOqlNiiiL4f6gWD8rdBN6YevOzd26W1H7UqmmVYQ6EGbFhH+IiryrJyiysSnialnStudw8bhZefRq62klFKVoLXhUcXV3C97+JG77VE/YZA4BfBy5zZgau+QdyUxZKCPSMpEks4cDlCfiYFHkgplgL61lEVEgHG2PU2dCHOfc5Z28TcVmAU5F2LuqKQaSf4w61fdS792Wdpj7l7GaU5nZpfWB8MxX6PrENEoo45rEGcjnWgvbzvHnzlHytpHEYUHg4RxryyOMkRNmLcrvQOuvnDlW7gI5dmRj2ERkQUnRioPXqa5yb7yH6nMrtB/YjbGCH46wWCfsYDUaDYrePRhUUCXrZghuk0kp9/osTcCw7cJan++jHnh9MWv08vdIixCyWj62sM/rd2QP37dWeCw81nQxGUJQe5r2T7pPuek5NJAdmyMpD1jCXvPJIOtu6r1JCZ7HmvFjgupdtYuux9yDBUrHgV8De4q6/aPA/dI91lcD7BMUfHzQ1i0I0GuOFU43PBRQmTZYK+j4py9SwuQr4mdrsOChcTGUGd9UfhgbkSEFSJwXNVntlVH7bk7N93IlJsLTdMIWAFym99ftj/PT+AxN8GUU2ZZ/tvTNISrbKfClfLFMdB2DnB/MZGy3vSfTTjxF29/V7b3d3S6Y/MS8g+9+oAGtRuou0fp30uXJscuc+bz1tM3s9O+V2ZyqlFGg5XY3+FsOpnXq17SOGWTv7kJaJYnBKreGW6btwERpXZ/o7PMLIeA/PJNZdy9ld9nPMtphiL4KhBhh+OAOBbG+/2irNm47XnSrjHSSsp4nxpig3M7rxb4v0nprx0JqNSZsv/he+Kyw/RIo9TygR1oNTqUfn19Y/5N3cul6YDA2gu1wMCSGhwopGfTMP0EM2Z9GHQawj9jmHA9Nb1Dpr88v+h4MLTUscOceH66LE67CuWmY7jdO4PdqOUMinz0GQviu7ZIgmG9FspoR+k+d2K3zSHTpyFGkXNoXG8w1IfmgJ/JnRhNaw2C07xLCNSfwFRg5oWxxdtcS5U8bZrZjn6owDjNXlk+4H5+kt+oPLecddyGijePwGnQEqJmRUECWBVDo4RNdEi10il09pKItfRs3i8IwNPrdqzONJHhAZeY3sYEtkkQCbdR+7tAcdSrPIB2P1m0GsfHyt+X5Aypz2yUhg0piUECuZEr6nHQo7KOkLkd8+c1odzkub/+oqgkJNdvw9TWI2+rMZECrgyiI0+X41sALvnCqESzoFAe4bUx5wzynZCT6h7nO4/uYjEM8AzvYA1n1Rg4mr0kWncDAsV6mBmBItuGLCArPa7eRFScS/tncfsuJfYwx1OHGoLHcj3S9MQEquL95b5SO78J3gyX5NsCiHSPUm/GJRhbfWHnNQ4y+DA0czc7zZ1cb9RUkkLTbu0HxFds2pQouwz64yyuglb575O2WCE0qI230nS9NjIWjVNi+F7EqMc1N70tfF7WQZc6b4mCj743Sj0G8iOu/feoOqthsPDYGpAsVBptyCvgDpi25PFFWW3bDc/hEg5UZ/76F0yTcSqbWkuXQz32JNF1DLtQ2ln0RHFbN7VDUBqXtGE5l3ZQFWs8yLkdSv0cZMOdnnFQUX6DHjljr2u+bHE+Yd79FkLX6afNf1mWSwyGlrK3Qs0O/VMq1g3btZ5DOAVzkn++/eJgAkXBUOsfPnG6xSJcbk7V8oRRrIkCPwiP/g6+h6450izZmtThSFTHUDtmzVQV3eLR6fI4EpytmjFpCRuPYJA76/em1muaeyj7uGKoP4A=</encrypted>]]>
    </text>
  </script>

  <response>
    &XMLGetTaxRate;

    <action id="TaxAccount">
      <text>
        <![CDATA[<encrypted>fzaFi+yneMQc4B5tUV0FMOxdTnIfz9+Sc31M6PkKc49T5OK8ACyjebkZ7GBF9SjZDLfVt8xVaFTdL1EFM8NEqlHP/IiM2jf5B/2iMzOVvha9JL6vvsA/XVQY2Wz+CzWXkzsGE25TNBp68NUJ1nxmMw==</encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>LxedltkRGis+DlpD80eJ5pjaseINnvqRL3ptriQokmGzy7FlqiYbqZBAObBGi4hsmyqzw17yMM18ZYKlTjzvOB9QRNPB3uR2Jwbl+hmSIZR67tUkhWof7S16Ess2kaWGiExR51BjbYFAaeNJAINjubu6PqbcsDHN7Mmj+2tLebBopuGUF+AJ6oKvBQj9lHI2nNuGi2fGtFlWY/wA1YoYQw==</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;

</grid>
