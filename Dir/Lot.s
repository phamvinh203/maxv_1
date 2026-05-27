<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmlo" code="ma_vt, ma_lo" order="ma_vt, ma_lo" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="lô" e="Lot"></title>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Mã hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l"  key="status = '1' AND lo_yn = 1" check="lo_yn = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa49IkGgS42nsN9TSMvza4VeAeDTyx3ko1UMWkmlb+69vLjrMo/BxTCoCWT+p4X+Jcaw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_lo" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã lô" e="Lot"></header>
      <items style="Mask"></items>
    </field>
    <field name="ngay_nhap" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày nhập" e="Receipt Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa41q0wWMdWSt5eqnjM/slnEPO/QVzkoOroePWtFkRqOFgouZfOveCtOhZTyWO3+iyyw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_lo" allowNulls="false">
      <header v="Tên lô" e="Description"></header>
    </field>
    <field name="ten_lo2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ngay_sx" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày sản xuất" e="Manufacturing Date"></header>
    </field>
    <field name="ngay_hhsd" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Hạn sử dụng" e="Expiry Date"></header>
    </field>
    <field name="ngay_hhbh" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày bảo hành" e="Warranty Date"></header>
    </field>
    <field name="ma_vt2">
      <header v="Mã phụ" e="Part Number"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 75, 330"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110: [ma_lo].Label, [ma_lo]"/>
      <item value="110: [ngay_nhap].Label, [ngay_nhap]"/>
      <item value="1100: [ten_lo].Label, [ten_lo]"/>
      <item value="1100: [ten_lo2].Label, [ten_lo2]"/>
      <item value="110: [ngay_sx].Label, [ngay_sx]"/>
      <item value="110: [ngay_hhsd].Label, [ngay_hhsd]"/>
      <item value="110: [ngay_hhbh].Label, [ngay_hhbh]"/>
      <item value="110: [ma_vt2].Label, [ma_vt2]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjXL4fldmcnYEtTD1Mi1hNGSW9z8z20HEwd3Smi6k1ki9oCjT1hhz0e2xdZ8bkA47Qa9JouaLapB2Sw2E4bFNYSc8hQFR/xeY6EV2E2Q3dVUWJ6o25iljAu+lWfKZuJZtw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kpyghILLgY3ioniRTn6SWelzuOVVJsfuKGhiStIyvW0zNcvEiq9BzL2MFR41rb/1KEa5auPUU0YQNlKFyWJDFQI=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>iIXFXty5/TtwGANOEouJyIwJItvDROpVJT6N8aZT0EyoKbl6ZD/g38NQyjBpxcZRNopwoaxUMlYWjrOCIrkbxelrP2lDk9htmOhObevfRY1UrUjHnoOfPUfj0IMpVUh2dsLItiLJBnVcxkjQuD+tiP2UulSuv0ELuMFGMDxDJyCE9rIPflgFb0ir/H8M8WBkeWFZObF6bcDNIhm4VZi4MWhw2fG7qKvE8bc5au53fZGPC27iO3szOp1H/B4t4vKuOiqxoG9J3NWDQ67jgFfPLSvng2SUDsKq2++uFAUztwTy2Q2qV0nceMQIZ92FsWpThK2jSh0l0Rx9gijUcrd/lVN+6ZCxJC++8pkzoeO28gcqQKMBioqYaZBvjrmHdEYnR1xRmK7IrI0xCM1U0568QZoe8f1/wFCHIMjv4iD8I7Oqdf6Cb73uX8sLgN/remxyzh9ZDjPVFzP2BH8Kh0bMXyC/3mLDz42M7dPjzzUiAW8jLcOUYSrcI2Gw8z8FWXdEepcKSUrvmA9TSiqPPKDy0820zhPP27AV97G7ATTPltJtPOVDBFQLY2t82q7QEh4eyMlsfowgn/FqD1Bz6Dh/zmFUOPsoFQWNO1htOgr/Byk=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>qbLQzPJApXEwuxHae7Dtyxp5Lb34u3DUx0wssOXdU1xLFobOOYWH4FDwKVJD7w44k0zjafTxudzcj2djc3VjUekJMEOZCKt9LY0Ed8Ei1ixCZTCIAHPJjrn+Y69IG0pJuxoR78HbLSsArbfMENkUHYhM9kUuDUHpuDvSe9zK6FTU6+rVoZFNHVZKn9gD7e5hwJd78FaL496IT/l0nH2rbfGZ+ipbsK6xU6o19z8Cv5xwqx5Q/VGd0QLy0xdEWov9QkmjcXKGNbkBn9c8PpG9+u2zWSfkQ9Y0f8SMTGqb7TA=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>vWsQJKna1j77e0d02l2/t4sch+bkPnNU813un4BtBdx+L/2Rdg8Z1m4Rp50FsKRoBYL9nQXb2uN0SXLfaqkZ0S+uvAOhGyHOXuu5IxDVAr4zsb4gPubX+p9QaJDYBA4GZffZNENkjLwsUSppXYWjnXduySId1PQbjKJS+MFl+AfjUQFnJ3kP8Krbf/fSqJFG76FSaOEdF8nDv4BtDNhbl8BB+nesfIMLp9JNTtacKmBPwcXGOLOYGh9H3TQTxmS5XRjkBfSeh95TM4SwsnAFG83qaIFETsXk+6osd3L6OSzEDWzVJpqpde7ku+RTevXJaJHAgvVGD/rxm39azp3y2KJz4akBSm8YAfQnr7uTlF5GONB1SsHOeEA36cUJ2UXcToWIVLVVJjumtrmo3pZOU/3wqWYAD/8iDs/49qEy/Ioox+JC0A39NfyZgfEX6GFx</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>+AnsKNUSqx8Q4GipFtc/I4HXK8PojwohwACNN6rHZHyy3l+4MwZfZK3L2XQjtwLzUPSFAuPa+ME5Ohu8dkOsZYde3PdYqk31B1C+TkXzqKwUMnMvnIyysYPHJWFxCDopKroz2OH7Z2AcScL9fQdSLA==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>qcYGEbLggUknAoUIOeOYqSfOArmXUysmKU9QMDpv8lwWJmUN+eehXJ7T0CGnWMBHkx6dw61u3yOrB5BVIO4b0IwicdpNkWxVrL2TqHho2d+L9Hx43O9PgCmIQRGmZTewH2c9BwIZuCxtBul5Btq5OVrUDNjtVfu6K48p/k+v7pv1Ksx4PP7pvfTpIPB1NFkEk6ONjdGLYYayUNyK0N6R9qgXo0Y332lMMLFtdnX8k3w=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>So8cBBoiLLfRIt8I2Ecj/37NPsmr7e7fGF982ifdglHxZzjqLmYEHoKGyQP+cWaX9rLXZNaOpom7++W23RI5h3SDhWtK7fz5+8gmwFl0Qhio2wRtXACWcS/Aj179IC8UEs2pEmNzrD6tO1NDum23wihIkIVOZ47/B0S1QdcYvu1Ibugvlp8zNhbVgZVDAq27n+C/DMqgsqZamQnkAYp9h8cmWxOTjbIRfJB0emUau007SoTrtq3cQ87SjkBsieGOoRP9RUSHZDz7HFnrSXcBChirsArRKhMM6NG0DLuWhgJhQgPG0HsEmqZngt4fDedG8kcXdRLoELMGklTI5306a4288Yyup8P6CBj4L0R7j/UPPLrCE2+yyjA+BLdLP+JB0rtMQJvapROLNE5yISBebiaQmxFBI/AtPx9q6K+QeTN3PXkcFeXb8zACXO4wUviQAND6LzU5w9Vo8O2kKx+3BVcwkZieIFTnTTuD7s9ZHWS+4mLafOp8fulJg2EWEQyBeWSkF4IVfZjWtpocw24lKTDv0/ewZe51HTCR5An9t7nboEVdCbbkEuiWmX9pX8GKb7Q+F7Gw/T0gsR6g44OBxz/JK/pa7mrBNpXTzd+kxuFAXXInVG2oq6y501lMoQeWZP9Jc1YRn/M/YlZjEeMui91HjJ1VYDFkwAAtljCuqHlfp+xKJrZMFHEXEzfYUhH3xaE6b5YEgms3vJ85/kG3BPceac1QuUwqUaomrhcb9B8BDuigOfe9JNp8TOfjmJj51BatX4HzLij7o/3fGGrPyX+wF7WyMhMUe/bpYTIWMx1OIcCTfobjlwpuz1Uf0vA1i+QOVBEGTzEXzoItZFUZ5i8vF/q/0BOUaQJQ+8wgsJEGyP888fKiXUyY5eUHykRl0xW23abzbSUxs9uBReakmMfbxZx/+JVPJNZMFaJZuFKYarGXZNkGlz2jkTYEOGIXaYnH027uy9AEUc/r3Xw3Y3zJHS3BPH5X0qRDi+gj1l8sxZhEccrtw3haCnBCG2Gb8imHIfsn36LHrDRbkplQKolDFLaiNVc3tztD2XQn9rk=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="LotInformation">
      <text>
        <![CDATA[<encrypted>/3dv8PuK7HcD+hrLzE5Sup7DpLwViCFAK4ctQSSgFDjyvLtULzlo2H8t/D5Bhwi69+Rwc86TRxxZyT7As8vNhbPCz4kE6t78jise65D93X6H5AhTv8ZjsDtVBXJGU38K4wUgs7EMm7dpsUzFG90IZgPw2Ys5saX3oe4YgCPDumyJrRVkcLYcjY0ZoEgmEEpR2r0YJCA8tx2N9Y6D9vpoPT/oCNG5lkTmahVho7850N0Zxb0hxc8rQ5cCR73EIg/i</encrypted>]]>
      </text>
    </action>
  </response>
</dir>
