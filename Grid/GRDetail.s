<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetDebitTaxRate.xml">
]>

<grid table="d23$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HB5" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c23$000000" prime="d23$" inquiry="i23$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
      <![CDATA[<encrypted>/gGLNHBVCB5nPDC7k1c8oFqk9sYE9X/jPdY+/UIIoYGEUM4ysBcHHivMb8jCbhLh/i33zozcEax+KZ56+Q2CyZ7GL7534OgJ8WxqzOSeFMmUHLlihhRY2+uYka5JsLx7mlInREw90cSpteEnQWe6oJuzmKIyn3AvWZys/AtD7WNjFpnLeihaEinEMrDd1iKg4FORFH3aPLPSxHvaa1CkejcIBLHZ1Fv02QK6aH2RBxgj8CJbXrGsDy8R7dAckHaz0GkPNHzpAtx9nmCldN2BX+J5+4yqHXkZ3Cf3Yqc5SbS8XCC3Fzr7PgKkzzHrRbWr00LuFmPxT9RaKzerizfCkAcegAZGnUy+WuplvMgrrDpN+arB7Tqv9UGQeEdRXUtDxv/ebW+BIWeWtgr6aLPa+uXtGZo7mDLSJ3zmXDSktPnE0JyeS86Y5Bjh7/RUE5d7sdtbZMsmcDLci6b3O71TcLK1olMXOT1sohAppHe5tBsZ3zohdLPhvBTsc4l3T8LaECK8QX/ClSNjZRzric5b/ArWfYsNkF1ekNQqJhYLL5Pk7XHv9lNHRh1s/pdcOpsLWsgqLdBNdp/0C/sVf6VHizPk/dxnkilu4gPBBP+A7gyB0ImMbi8N2JzwYFNRQT80K6ZOt9LXKs5u7Tfc4j8sbRT+m95YtxqO5NiB53Ndghu44tgDEIxkiFoGYQ1MfScVNxy2nO+9rXzAfIMyUcROGbNIuHAYqCqGvhGYuXVu/ziI4X2AxOmbKzY1xoZAgW30mURfi1BEac+d6qKwq2rgSUYkQJFNFczP+uUaheRwk9738A2Hn+43A/qi4O62oiMRZ1p7BGB+tcUA1IIrcDLlidUyLcABYJ2YDJxdGB6+w1ZDvQw3jG2+R3z9UnLoAfsy3kjdczOuJiU7DiqsNxW0p5/Y3bwB76tb+CpFa+EVjMeSGyqfF8JUytb0wpFI+1DOrfvB9W6U2kTjqgDMGbOHzb4d31TfS0JTqjknO3VDU0aA6a3ZznYfdyuPZt18QMQnAYEuk4T3Mnc0/9krAP+Sy2U3a58JtAcyv7C2ngy3IP7z+4wZgyc+IvJFgwXQiCsK7G7/GzLWugqN1MBvGp6z7OaFGLnLcNOgJjZcrYseTFnb3zzmKG1V+szGXocvBSAmaxcZF4oLjo8PcbSWbrAs1rJ9FmYcN7fM06fToDOClXX63HxHOZb6ie/mJ2ZpyGj881krfKmEtFamj6NrftW18hI+VyY47Q9zj5lbO2HPOIJRmh4xIq4btpc4vJ+stwAj7Pi6mNp0fRwx+GRsBX23J6yKWytLKgrVOVv3ODyOeUUZLEn5xbitWXQdnnb46j2pKiuuCVkLLshs+D/ICvtd+5kvGR7i116MB99+4yBXTHiILhz7FCgt3lXVJZVeyJmigy92cq4ndq8/Ulus3Lv9oDY5A9+0UKuwD5/ub9r/ItRnm0lH+TbN+uckg4baDaSOY+Z4QYz9bx7IWoVzxZLocaff/+UAhFWHFwkXTZSvVGX3P20U4bTyNrmPZHqY2DRcFbMIiw8rFNV9VsGAygCMs/l6AioMJ9lSb/+qgqhHZmc9WgZKvVanKspVaF5lwRv5/URWJ188vc5dP0R3ObHn6qcz1hoCKr3kWhknUjKAPf7iCMCSLrMnc1weUPUdW9c7IrGGwdWKw+wEJNfCfqhNlwDgEetJjoMfVpmYDee4fazHeoure7GKVAVkRMOH2Bt1tyrUxKTLfi6IBTMdmpOnRPjVor5Dzf3dOr4LL8kpXWHovftrAovpGNhb8RtPhyTG8e81PmK34sMJZi6PI36633reCUhkjRBffenkVzvXEiM=</encrypted>]]>
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
