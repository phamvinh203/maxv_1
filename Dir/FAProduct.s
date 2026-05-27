<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmts">
  <!ENTITY CommandWhenFixedAssetExternalInitFields SYSTEM "..\Include\Command\WhenFixedAssetExternalInitFields.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeEdit.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeDelete SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeDelete.txt">
]>

<dir table="ctslts" code="so_the_ts, ky, nam" order="so_the_ts, ky, nam" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="sản lượng thực hiện" e="Fixed Asset Production"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false">
      <header v="Thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="ma_dvcs = @@unit and kieu_kh = 1" information="so_the_ts$dmts.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="sl_kh" type="Decimal" dataFormatString="@quantityInputFormat" align="right">
      <header v="Sản lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="ky" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true" >
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" align="right" readOnly="true" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="1111: [ngay_ct].Label, [ngay_ct], [ky], [nam]"/>
      <item value="111: [sl_kh].Label, [sl_kh], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F5TO6PUvuzECvgYM/jXufISF0kCvjHVQOwrqL9xfX3lgas4QTd0cKoPAdFl5xCax36JSVgnFiRzF5YtFiiqHlZvd2AAi8KjxNr/eLWTlcD1Od+LEi+jE5tDzk7jNPCHZVA==</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh7+bzGDGaSI3PWmokkUbaiKg1daUmmSVD6TEDf9Fr7iJA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>WQQdgB5CTF6mzHBhQpS1F5TO6PUvuzECvgYM/jXufISF0kCvjHVQOwrqL9xfX3lgas4QTd0cKoPAdFl5xCax36JSVgnFiRzF5YtFiiqHlZvd2AAi8KjxNr/eLWTlcD1Od+LEi+jE5tDzk7jNPCHZVA==</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh7u/oKtoI2Jct/atPcvdSHfrbM7qdzC0OS8g4IVC9xQWQ==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandWhenFixedAssetExternalInitFields;
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>dEmQH5Pzvl2OKsg1ROa2L/CEmqPTO77iZi2IjesLM+whZRirSHGwhTdmYLFerV2RTW1aIdhyJWxBG52EpGjJM3XSs5pEo2Wztf/SkdgBF0Czvl8TYFBq1iLr6jnTnHVM1WejdljDlvgCs+QERrq7sKa6fxJyw94F5Hr+crD2ZZ2jaeCerBBL73mNO1UmZRbO6Wq1tu+WUCaI6OFSh49hh95EE0tvMzj3xiliVJUm4njN+9wBdCm+GsRamo/9cdYmMzBWYYgCIlqQ/qnR1IGksvDtu/MBi+zzcXThsHPl1bw95sM2kVjwFjM8YpfuIs1x5VniXrY5DC7SNs2BAtLb1whrCK57J1GHinbnxswPh7/0t+NmPxnCjMt2eW3dZgkT9pwACGDp6/hB6damsfX+S8UzKiQwTywp/pyAN+6V6yszk2nwM0wd/mCMQXXD2KxBAotaNIGuMYtytRdqufPp4DV4z3iVVppSN7O+Oxzhlk0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>MXHHx3xdJGTnRO2ftbxhv2aUmk0UlpxnmrvPgZLItHzUZz6ecaQGf0Xqb3Msg6+juH63TMmXGqHB2dZEexYXHKVARwXIS3kOhcfvPP8ACjU+KLFYOc2BdeLCoNuyyWO1v884j6Ekp/RI1oBXO0xEoG7IDJeW4nL9t2axGSEEtmXvm1x7zDUF0kp9MLTDwEYot/J9Nv7lOIli4jPjtSLhi18kErxdj29EDQXm4cw9F+I=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>DQdbjCOutY9F+PZBlnuIL3CfUFLjH3ph3p0GNJakCCj4B6eJLce413DAzyQU6rhbqJ2g9Ut/UUYJyGiZcTPeIoJO73yHQZhD1SIa/NtHf40Npu39PR7teZ7wQa6e2LN/WxAwV3X8DO2ALI1009DID+WwtcVzKhTU7/JzJpYgv9vSWuo1HPbOlUhACeFwyqvY/QiZvdH3H5NFZ8RajIWHNTEIM8hTldS2WnuVvbY+qCm688vL1bM8FG8IGrUQqCtf4ev881Y1XexAaeevde/QuvhrPxv0dTC3O7F8mOw3ZlnE7USvo2elb3PKdL87tgxVjX40atPY6+b3QweRJs2r5w==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>bMnjoM27L0fijNIezxk2v5y3J149w7kOHo2QmBuJQtG2MaII4g3G+L7ChH+MT+QvDP1qQ9P2VcosDE0jJ4s3PdbwPA/86gp9RY1zktMcmIYauQNxPJp7pvl2GIu66LSxP8cCeWz1fNBOp77PWv5gdA==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenFixedAssetExternalBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>bI/47ue9BWZS54qqYswkdZ7mIZMiqNDMOnKCIFITjxyqZpPTGEh6fbkOhiwuhJsJnX/YXH3bsClwaCSTewr+OKewANwJmmVsm324oVFIhZG7An/29LSc8jRheV4fWx5LzUac/VcJLf+ogIvol8eMbYZ+/omrPXkJIOfR9tmP6gkmvJ4d2NwS/NwPL0Kj4Wg+THalXl5Aw/xgSB224UqHX3kGKyw53tQPzHl5WiPKo465xTKNI/x96FD+sN1MwyLIj9Ckq8NQ5bXIHE7yPuMMaG+nhTsoW6yJkvpQLmhvA73szUv8YoDZ7gjUfESEGVkF</encrypted>]]>
    </text>
  </script>

</dir>
