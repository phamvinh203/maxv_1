<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmcc">
  <!ENTITY CommandWhenFixedAssetExternalInitFields SYSTEM "..\Include\Command\WhenFixedAssetExternalInitFields.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeEdit.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeDelete SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeDelete.txt">
]>

<dir table="cthscc" code="so_the_ts, ky, nam" order="so_the_ts, ky, nam" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="điều chuyển bộ phận sử dụng CCDC" e="Tool &#38; Supply Transfer"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" dataFormatString="X" allowSorting="true" allowNulls="false">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l" key="ma_dvcs = @@unit" information="so_the_ts$dmcc.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
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
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbpcc.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_ts" allowNulls="false" clientDefault="Default">
      <header v="Tk công cụ" e="Tool &#38; Supply Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tkts%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tkts%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_kh" allowNulls="false" clientDefault="Default">
      <header v="Tk phân bổ" e="Allocation Account"></header>
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
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/pTDAmEOOulB9FyHngy2IpsRF6kCGImSgrmesmV+nf/LgF0j/CS8hS5u0oAx1ojhCcTL4WenNtYXP9p3YTIg0O</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
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
        <![CDATA[<encrypted>DHHXyIxmr7LW08XtyMN07JZyND2F3TFbgn1FPJGegrF1fWub9DqR7TlpUy7sanmIFHWt1LiSb3GIqRnQZlR+IzC5ADtNCns05zo1DlMVn1UwO7OCT0kOJ9SlLrKZ3dsKGQjDI2+TlaNN84g6TvwEkiwbnvHClcphKBleygZ2YlyA+2XOo4qN+bOinGL9cnKweI8xuSKlra8E4/HG+/e51gjIhAqSENEdg6JJE68c7Y8WfDgSwR54qbvu/AOyK2wa+HBiq0pt/rbqyokmNZZCfiT8ECAXRPstPg+k9QI1/a9/1UghA64Agl9uClJ4OSHhxDikaPh7Akf9UXnD5QSWcIXKJKweCiDp7dm7dux3B5CXlZ3FCyr1/iGUrNoagneo5x/l+Jhp7zz+Avi1V0bdCS0h8h5GBlWiBvyhIlQXBfHcGc5Uy4/BinKgZElvTsRBY8qOwNuWPbdSYnQh9hoQFDqKCuiXPcGynLPMAPrHv3s=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>DA/Q51RtysOWQr63mmw1+XOFfrIdh5fzFpsXpqOYND3IBqnnaVHEVarWOkYTfh5f15bZiiNq8LKSkLzHAK7WvJqziVGLSCPa07PCHWVXTlWcWg9qTEtmI2fV1XRtGX4PbVTyIzFpsCz5TYoVNhbfupn8VHS+YIIIR86f4yONjHRRugZbHo6TsITYCxOpf3buw0MrXP0BXd8K/VSJ80BVV0KjBEFJzTTm/n2CLSpisVCgu2IR5LyVs/fn08sGIKxcl3eoN7fNYNIZ2ls+pyDtLv8jOxHjuJMgd+0Q2hJcj3uAVq2EcdyuS+YapyA3ChvK</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>bLRG3t12oOP2XG4hR4ZOtZ8UgMnHnwx8Ag56JhMeNL+G4GxJcjX1WM0iq5LpvAf1EGc/RCGZG/1+B+rTrn5dZrZHifIYeE7gjTyca3wExDdyuGMtysukzUZU2blQkwxuYIKqnX+XHThMgsK3ySVTUkwg0FCiBDttsixOdIGP8jVoJiTzFKZlT6q8O052MawbgV4IExSc2Fye2Ds3X3R1JBuOyYMWsGnnt1gZ+YqwNwBSNoq/pNcTdy0QJj3Qgr74vdlnQRpa7uiOwjP1kuXG0kqIqCrOaOA5kITLNPO3gxJ0K2+BarH/Tj0X7keJROUikddcn2uLmBLZlBktw0x2bIrrWD/xQhAbm+0kW2+e10KnUl5IA0MxisYyUJ9IkO1LnR7PvdpAIn2cgYaz40xe2sEJcac3prBlXKXetBnxf0A=</encrypted>]]>
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
      <![CDATA[<encrypted>mdJnRu4nqLgCu4gkRCGWydNzAweEuOKTCY80DhQ7cbwxc1hiuHhF8gZwKkuuFGyaFrQd3vUw2Xi44SE5FMbNZwJPvF2huW+mpRumVRiNPB6Dn+INO4Mmr/gxamL1F4qMJuYgCUjRb/hpNseH+nO6LEYlBwmPu7zfFmMfH5WnW8rTVbO1D3EIXKMEeUNayd/VDIxi96m555mCGn/G1jSco9ByERrGOFhEv3mUHlzd2yVfIla0D4WWeaICRf2mNo2FpTGA3TBmOr857csrAhM5BcqDmrxl0ZXGY/RImckWu1/7HS9zokHT+oVDEH66fBm16cMNGBAWCdnFl7i4yc0ajw==</encrypted>]]>
    </text>
  </script>
</dir>
