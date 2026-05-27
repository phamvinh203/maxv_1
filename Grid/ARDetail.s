<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLUserDefinedFields SYSTEM "..\Include\XML\UserDefinedFields.txt">
  <!ENTITY XMLUserDefinedViews SYSTEM "..\Include\XML\UserDefinedViews.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
  <!ENTITY XMLGetTaxRate SYSTEM "..\Include\XML\GetCreditTaxRate.xml">
]>

<grid table="d21$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="HB2" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c21$000000" prime="d21$" inquiry="i21$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="tk_dt" width="100" allowNulls="false" aliasName="a">
      <header v="Tk doanh thu" e="Sales Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="250" aliasName="b">
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
    <field name="tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Tiền hàng nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="tl_ck" type="Decimal" dataFormatString="#0.00" clientDefault="0" width="80">
      <header v="TL chiết khấu (%)" e="Discount Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Chiết khấu nt" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tk_ck" width="80" aliasName="a">
      <header v="Tk chiết khấu" e="Discount Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_ck%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <handle key="[ck_nt] != 0" field="ck_nt"/>
    </field>
    <field name="ten_tk_ck%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
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
      <header v="Thuế nt" e="FC Tax"></header>
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
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="dien_giai" width="300" clientDefault="Default">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="gia" type="Decimal" dataFormatString="@baseCurrencyPriceInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Giá" e="Price"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true">
      <header v="Chiết khấu" e="Discount Amount"></header>
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
      <field name="tk_dt"/>
      <field name="ten_tk%l"/>

      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="gia_nt"/>
      <field name="tien_nt2"/>

      <field name="tl_ck"/>
      <field name="ck_nt"/>
      <field name="tk_ck"/>
      <field name="ten_tk_ck%l"/>

      <field name="ma_thue"/>
      <field name="thue_suat"/>
      <field name="tk_thue"/>
      <field name="ten_tk_thue%l"/>
      <field name="thue_nt"/>
      <field name="ma_kh2"/>

      <field name="dien_giai"/>
      <field name="tk_cn"/>
      <field name="ten_kh%l"/>
      <field name="gia"/>
      <field name="tien2"/>

      <field name="ck"/>
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
        <![CDATA[<encrypted>vjrTpmF2Z+0W/paelcn11J09Gxkc6w3chSXkmWofCDh6LlliBCjA/a9We/a3Rl73Oh5LELWJ8Um55rI+mGnqSiPN+Ucwa6JIuiR9KlDFljvWQYiD2V5pUVCdpiPAg+0BV3kOGBMKAl4ljjCV8PeZh4vx9za0Puta3oLGklWDzUx2s3p2ngg25tlMZDyCKfnlijVBLeH8t4q7xSvGAxYlizwjoXHbyW8gvAAD2Ja3VXuVsEogK8rz/a90Sdnp78iR8285sXXR2VkZ+JeNRL4ZpBho+2L+62N1sikJ5hSVgSd/faO+bmaMcecwQA0SSCGLZf5vvGNpQvEcVY+wwAZ0Tx3r8ewkQsfwP5vPwYXuvlal//nJc8kgjeGzlN/RPQ9lh5sEhTfxArvSBhEX/Ru0qmQsa8S3Lh6YkYJ0jED4uBuHm2058GOcODKatlicQxrYpaaEyljrzdu12qRqv1Z/oA==</encrypted>]]>
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
      <![CDATA[<encrypted>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</encrypted>]]>
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
        <![CDATA[<encrypted>/o7qPkLdL/etaVrSqQgLDAZjZos4iV1Brg/O9kBWIcE23Kh8yxF3dmtsdKhK8lUcM8NKcbxZXDnGG6McXZRUWgNkkGBNkcr8UQ4Tn/Si/l/7tZXeOcyhVf87mchLNIi2IPfmemc0QvTz3/ukTVG5OJrH9hC/sEt6eEZ7ScbchBQ6vegn4HrbnxAywBlRCBuH</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;

</grid>
