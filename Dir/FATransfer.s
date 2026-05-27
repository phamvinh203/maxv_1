<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmts">
  <!ENTITY CommandWhenFixedAssetExternalInitFields SYSTEM "..\Include\Command\WhenFixedAssetExternalInitFields.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeEdit.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeDelete SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeDelete.txt">
]>

<dir table="cthsts" code="so_the_ts, ky, nam" order="so_the_ts, nam, ky" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="điều chuyển bộ phận sử dụng" e="Fixed Asset Transfer"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" dataFormatString="X" allowSorting="true" allowNulls="false">
      <header v="Số thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="ma_dvcs = @@unit" information="so_the_ts$dmts.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" width="300" readOnly="true" external="true" defaultValue="''">
      <header v="Tên tài sản" e="Description"></header>
    </field>
    <field name="ky" type="Decimal" dataFormatString="#0" isPrimaryKey="true" allowNulls="false" align="right">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" isPrimaryKey="true" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận sử dụng" e="Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbpts.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_ts" allowNulls="false" clientDefault="Default">
      <header v="Tk tài sản" e="Asset Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tkts%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tkts%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_kh" allowNulls="false" clientDefault="Default">
      <header v="Tk khấu hao" e="Depreciation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tkkh%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tkkh%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_cp" allowNulls="false" clientDefault="Default">
      <header v="Tk chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tkcp%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tkcp%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 40, 20, 330"/>
      <item value="11001: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="111: [ky].Label, [ky], [dv_yn]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11001: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11001: [tk_ts].Label, [tk_ts], [ten_tkts%l]"/>
      <item value="11001: [tk_kh].Label, [tk_kh], [ten_tkkh%l]"/>
      <item value="11001: [tk_cp].Label, [tk_cp], [ten_tkcp%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/pTDAmEOOulB9FyHngy2IpsRF6kCGImSgrmesmV+nf/LgF0j/CS8hS5u0oAx1ojhBon+sz/QNb2c8xh9sU8OaD</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh7+bzGDGaSI3PWmokkUbaiKg1daUmmSVD6TEDf9Fr7iJA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/pTDAmEOOulB9FyHngy2IpsRF6kCGImSgrmesmV+nf/LgF0j/CS8hS5u0oAx1ojhBon+sz/QNb2c8xh9sU8OaD</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandWhenFixedAssetExternalInitFields;
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>DHHXyIxmr7LW08XtyMN07D3jbIyq/21nfghWbM6cXd//B7jkG3/3kOV6DbfAjUORZg6u47d6EXb/IAGTz5FHCA0vzdA/W2BMoknMTojB/9AUvvFFgOBOGxPvDz2Z3H5EoVJRsD8KfG4Ri6DnvoMx+EI9zAavjyVr1co2dzWybWPtizP/qBjWoV+eyeujVvE8XfY3gSmWDMVSaQtG65RXDZoZ+h3rzYISrW4lzI5RjEDH9z3NF5zTwcAR9TfMPid1cmYtvHk+Xetp1CRJO+PReftK+GfDjaWT7HQWp+/s8mgNX3C3ZBkogqZKoJkinFGV6L1corLiNejTyHXRRxSXmRcajr79gqV563MtLe1E52NwOezJ17NAOGEwjx0ikxtXiL/75Tdw1dkIMt0gSRPYlqSzsfXd9iC7I9kx9fjAXPosb1cJflC7/ZtGYZW0q1CJKCT7FXInpKdDHSvY0D5xFKpFAxj6CrOOellpjoaj0RU=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>DA/Q51RtysOWQr63mmw1+XOFfrIdh5fzFpsXpqOYND3IBqnnaVHEVarWOkYTfh5f15bZiiNq8LKSkLzHAK7WvJqziVGLSCPa07PCHWVXTlWcWg9qTEtmI2fV1XRtGX4PbVTyIzFpsCz5TYoVNhbfupn8VHS+YIIIR86f4yONjHRRugZbHo6TsITYCxOpf3buw0MrXP0BXd8K/VSJ80BVV0KjBEFJzTTm/n2CLSpisVCgu2IR5LyVs/fn08sGIKxcl3eoN7fNYNIZ2ls+pyDtLv8jOxHjuJMgd+0Q2hJcj3uAVq2EcdyuS+YapyA3ChvK</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>bLRG3t12oOP2XG4hR4ZOtc+3nah96qQ6Vk/fz0msITwDAe5x8X8viwwcvwLHfWFtAWnbD8mfLeQuXaakpOs75CkLEp067ipym9OHTH5msd3FCf/hVC3qAYgUF6zP9QSeCVcbjyfQ170WU3FPGLfgEPgRGsA+nOYb4Bzz03rF2ZohG+r4mRcF220jLiyY8G2f9oTBH5xNfjg4zV6oZku9ohahI8Rv0qtklmFbZ8pJYpJnUc1yprBsNoF51t7bPFddKWC8EjKCV5iElG68t5wq9kR52Hvowvq3/N96eCyeW86XGoTz4x3BFaNp/ZWGkzDg5/8FEibYnL3mMiUEHcigZGiJYgs/BcoCAqciTil+CU0rL86cj58/5/bzAv4L0mqxXQlKWYCqpmbjQWgi86Vj9l7UYt7vQiEVV8X+fNT606U=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvlbe8cFMzxCppjAK1TxlnsfZWIVIpiQN/OtBBuh9a0dOOR0eHrFATTQkzyh5zJGhwBA==</encrypted>]]>
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
      <![CDATA[<encrypted>mdJnRu4nqLgCu4gkRCGWydNzAweEuOKTCY80DhQ7cbwxc1hiuHhF8gZwKkuuFGyaFrQd3vUw2Xi44SE5FMbNZwJPvF2huW+mpRumVRiNPB6Dn+INO4Mmr/gxamL1F4qMJuYgCUjRb/hpNseH+nO6LEYlBwmPu7zfFmMfH5WnW8rTVbO1D3EIXKMEeUNayd/VDIxi96m555mCGn/G1jSco9ByERrGOFhEv3mUHlzd2yVfIla0D4WWeaICRf2mNo2FpTGA3TBmOr857csrAhM5BcqDmrxl0ZXGY/RImckWu1/7HS9zokHT+oVDEH66fBm16cMNGBAWCdnFl7i4yc0ajw==</encrypted>]]>
    </text>
  </script>
</dir>
