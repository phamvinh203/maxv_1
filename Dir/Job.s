<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLSuggestion SYSTEM "..\Include\XML\Suggestion.xml">
  <!ENTITY ScriptSuggestion SYSTEM "..\Include\Javascript\Suggestion.txt">
]>

<dir table="dmvv" code="ma_vv" order="ma_vv" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Dự án" e="Projet"></title>
  <fields>
    <field name="ma_vv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã dự án" e="Project"></header>
      <items style="Mask"></items>
    </field>
    <field  name="ten_vv" allowNulls="false">
      <header v="Tên dự án" e="Project Name"></header>
    </field>
    <field name="ten_vv2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="ngay_vv" type="DateTime" dataFormatString="@datetimeFormat" >
      <header v="Ngày dự án" e="Project Date"></header>
    </field>
    <field name="so_vv" dataFormatString="@upperCaseFormat">
      <header v="Số dự án" e="Project Number"></header>
	  <items style="Mask"/>
    </field>
    <field name="vv_sd_pslk" dataFormatString="0, 1" clientDefault="1" align="right" >
      <header v="Theo dõi số dư" e="Balance Tracking"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_nt" allowNulls="false" clientDefault="Default">
      <header v="Loại tiền" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" key="status='1'" check="1=1" reference="ten_nt%l" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true" >
      <header v="" e=""/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" defaultValue="0" >
      <header v="Tiền ngoại tệ" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" defaultValue="0" >
      <header v="Tiền hạch toán" e="Base Currency Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_vv1" type="DateTime" dataFormatString="@datetimeFormat" >
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="ngay_vv2" type="DateTime" dataFormatString="@datetimeFormat" >
      <header v="Ngày kết thúc" e="End Date"></header>
    </field>
    <field name="ma_vv_me" clientDefault="Default">
      <header v="Dự án mẹ" e="Parent Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv_me%l" key="status='1'" check="1=1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv_me%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true" >
      <header v="" e=""/>
    </field>
    <field name="ma_kh" >
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" key="status='1'" check="1=1" reference="ten_kh%l" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="ma_nvbh" >
      <header v="Nv bán hàng" e="Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" key="status='1'" check="1=1" reference="ten_nvbh%l" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" defaultValue="''" readOnly="true" external="true" >
      <header v="" e=""/>
    </field>
    <field name="ma_bp">
      <header v="Phòng ban" e="Department"></header>
      <items style="AutoComplete" controller="Department" key="status='1'" check="1=1" reference="ten_bp%l" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" defaultValue="''" readOnly="true" external="true" >
      <header v="" e=""/>
    </field>

    <field name="nh_vv1" clientDefault="Default" >
      <header v="Nhóm dự án 1" e="Group 1"></header>
      <items style="AutoComplete" controller="JobGroup" key="status='1' and loai_nh=1" check="loai_nh=1" reference="ten_nh_vv1%l" information="ma_nh$dmnhvv.ten_nh%l"/>
    </field>
    <field name="ten_nh_vv1%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true" >
      <header v="" e=""/>
    </field>
    <field name="nh_vv2" clientDefault="Default" >
      <header v="Nhóm dự án 2" e="Group 2"></header>
      <items style="AutoComplete" controller="JobGroup" key="status='1' and loai_nh=2" check="loai_nh=2" reference="ten_nh_vv2%l" information="ma_nh$dmnhvv.ten_nh%l"/>
    </field>
    <field name="ten_nh_vv2%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true" >
      <header v="" e=""/>
    </field>
    <field name="nh_vv3" clientDefault="Default" >
      <header v="Nhóm dự án 3" e="Group 3"></header>
      <items style="AutoComplete" controller="JobGroup" key="status='1' and loai_nh=3" check="loai_nh=3" reference="ten_nh_vv3%l" information="ma_nh$dmnhvv.ten_nh%l"/>
    </field>
    <field name="ten_nh_vv3%l" clientDefault="Default" defaultValue="''" readOnly="true" external="true" >
      <header v="" e=""/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" >
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="232">
      <item value="120, 30, 75, 130, 110, 105,10"/>
      <item value="110: [ma_vv].Label, [ma_vv]"/>
      <item value="1100000: [ten_vv].Label, [ten_vv]"/>
      <item value="1100000: [ten_vv2].Label, [ten_vv2]"/>

      <item value="110-11: [ngay_vv].Label, [ngay_vv], [so_vv].Label, [so_vv]"/>      
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110-11: [tien_nt].Label, [tien_nt], [tien].Label, [tien]"/>
	  <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
	  <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
	  <item value="110100: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
	  <item value="110100: [ma_vv_me].Label, [ma_vv_me], [ten_vv_me%l]"/>
	   
      <item value="110-11: [ngay_vv1].Label, [ngay_vv1], [ngay_vv2].Label, [ngay_vv2]"/>
      
  
      <item value="1101: [nh_vv1].Label, [nh_vv1], [ten_nh_vv1%l]"/>
      <item value="1101: [nh_vv2].Label, [nh_vv2], [ten_nh_vv2%l]"/>
      <item value="1101: [nh_vv3].Label, [nh_vv3], [ten_nh_vv3%l]"/>
	  
	  <item value="111000: [vv_sd_pslk].Label, [vv_sd_pslk], [vv_sd_pslk].Description"/>
	  
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>Pj11YLWqm2Y8we7PzvZie0D3VE5pGoPgeW1f9gZ0OesOaTruBZ32my3890XYUM8kELddIQQklnOpXLhtzeKLvqTfjjxbCadrhDqrPnRIneUwsb25Zd4lRS0eJyg2mnDMXVwihZRDykpwfrJVYrA46LTFAn6ngpcwTXrgyuOP/o7PL1G2gtHeIl02NNw8YzLw1UKBRASrOPCDuLAGzrLSwEEHh+R1eCP6xEIw6X6AUYLAfcQdqOGVpt+eav4vl7WPi2TTGY1P9QtbMpcG2I8c0WaGYW9fb2zXronljiHDFhcMhjrxS9eRUWpOT9khQfJhwOj8NfkfNKWCYyVbOnYLEWg1nx7fRpzFY4vuHohy8gKCTDn8/uskdHAC9rrbbdUmpMRKHvWNLPFSkY2Zx6ldSMt//YfM6uRBck1FjslMoyx/ZDQ0jnexGgPPntA6SG8bHyDCncHw61kRfMrJWi4P9vuFooMpNwEwSOayJFAM/TYn8HGzf2MOewj88hxp7986giuqDt8VgUXjuVqLeT6qlq/bjkXG4j00Vgeurz1X9og=</encrypted>]]>
     </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>Pj11YLWqm2Y8we7PzvZie0D3VE5pGoPgeW1f9gZ0OesOaTruBZ32my3890XYUM8kKLG1iUghNC7ybeppMyZ5E5vbz/ygoP7or/nZLbiLlmXUGaxJC5tJnImPXdvMAIEngUdCzfJ/Zt4X0Qr3xK1EYpoOO4rQmjbVeQOI3hG9c6c7BBdHb1vWImymp+3ET5qACrPFJaP5I1iVAQeGKh593FMwST3Vd6ZwiMGmgEFh+F+ZrwxaNCZ0Y+M3fukmfKD7fxPGe8qGTfFNbNPGHGzHtn8qTlxX7bZFN38rM23zTcJMiyfk46uvRgAURCCIM1jvIUbdvYLpbquIU9M+67FTQB8N6TdtJi9pHfjK2dypd4w/c38SGoBki7/Vy1Ge5lOjRn5BMF1uvKktYgB+0ZXz8fd2EMXhQEctNotjVygg/MC0sW5xGgm7/DoHskC1odm5+rgXl5BSg322xz6sHvLAKSwcSKUOqEnS14bziFNcyFUZ7TGu40vUfelE0ElBD2ygwpqgibxPEgF9hZqnCB9OYA==</encrypted>]]>


      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7TcsEoMgaaFaAWMqR9e2ptLeysqYWqpSU71aMTqLfhba07gFl3kCKRQL7DugEmOEbgpR8i4Q6iKKgPiOilKVHjI=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>2RcYRKtQKkw9V49ODWjJsOrV1QQ3h9djr1FeMsa+/oBG/IHpqeUbVnxBAeet3a/6yY1pGCj1XwVF9fnzsFNVSe3aN/4ISjNjVlVvcq4guPp8xJ8cwOwcknXCux92TApH/bFVFKy70lHjIVPZ4Yhoo8jrGc97Jk5QDPw6EwXtos0l08CtQvyu3oI17hmHDRYbDYZLAPWpp7fxH1c4GNRjpxoPxCwLV9nQUyaj/mqWUIYQPxTKa6su9ljgtr5tHdEXF5+/K18PhBEHFIvvWOaOqaUU+SdweTauM6jz8vhKVi7ptVsGo49ETdmxx9ysNWqjV0sfL+2XvmJbyhmjnC/oFCvOvifEOcSezd7cCvGro35owtk5Hes89AboQp5O6TlxJvCs+aIG6OrfOvxLG/D/IoLxNbavqagr2dnB8pCo8tyDO1KhPYG2csQVWN7atk/qCArUlgxLGArRYZwUWELLd2iXnA4SIAEWAwJOWgc+yhb4ZxFKd5W96oehHbNQzvRVtdCeKeq4OZnNPW73IvbwTdJM57lg0b2EFhIKGf+yS+3SawvEkA6HjWjgvmKvhvs6ckVR0xVzxjL2pjj7ohgJx/c07Qs5PYxROm/0qOygXGBjbYQgeyKogIkaZhgfKnperAf/9h4mEGgOLgNMYPyM1w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>yrbvJV3+CcNg+Q83dh3OBH7F/GWeewIZ/p+2VFBMFP+ZWNfInB+NUVhlaZ6+zpsfzktuzk639EnoSDU5DZygliM+8CcfiD9o7/nHjVhLhHAh9WrsHoQGkxQxEgIwbl6zRd1jffyOvBtcKuB85UJCNr798pzFVuXmj+BBs80cpRtxupGWojcWOBVM5kp8H0JyQW6ST7Y5j6Kk5NvzHzDWhQZ+VSshDg97hnrAh1Lal1G7slYCfKGdHqNr8nFYDEAL</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>ABTmkhFBkEzfN1qUOUqI/n7/NiPse3jDiAKvdAOnH5lM4fmRCR2IP+Ce+e4QcPvJ5Fbn47w5tjXnflcSQS6uBBNISLcyL/kuMTFFD3BiQwlGBCzpth7+Dw/QPYyw17MdbXeY7+7Evk2Xni9WGnqrCbOMHQnWzFNHzCgNHeka+WxponN3uIAcBgnMc4lhYtcXnDs+QQQJM72H52GXTsrnq/u7WLm6qpHrrV+8frOaSU+wDdo992W46WEEjlLvzv7fKR/owrdDSdcPkkMMxa9aPpe4axCpIm1NOA4gNhQYXNcpdcAwdolXP/zLXrXoOQLXXgo4WrVyya90xoBGh5bQZmK2i/9DPfBVwZQHdpyHiugtDcSRt6cQamzWxmmyoh2pKJk8g5I+YjSddigGUcjWTg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILYhwSO9jZRSRXyu1YKqfzz8gyFBS2yMH64bHUdFsYJvL</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>os/+BA9uO2SylsmZR52nRH/dNOOekDb9G09oOgh4DyFO3u1EfaE4KDf8FLSus0IrfweEmi7zdD88YVSUQv7ZG+lZuSi2DllULDW5pyco6CyHaiaZ689myRnT3nLaxRzIX3QL5nKJwakJDrVnr0BaC5l3MCfGNn1PV0srD7rBws8h434O2e5haTOUL9S7X51PUooyrg8bFCu0CblNXMGbWrq2xNcVP6kvF6pHiiZq16k=</encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>dPi9GL63wZDiSEyjZDVcUV/XEcgbRY8kJ9oDJzZZU6QlJX1HpsrStoEF9SukLgvM405+zNocF5m2NGsbg3X32PB3pJbOHZEAn/IvQldyA4WzR4jestUOXTpt6HzDWReZyHJYPCBCmEfinHcQE3qnQQlG8BlygT5epp/3Qp5rCpjLdwEZlgOSrBxRGTyPNdSQgp97/IlUvdHXRIwN3qHnTsfWCs59MmrlcS7VOqbHEZkVeXuXCOhSuOblRr/eD++lP7OERFksITkyIPJSR6j8Dq7rL2MtqquOKzfl0NLf+ShgrTm04inZtnKurKWgKMl7hYllIosQ7YiF0hqx3efsDaOSEuGHDaRZ/6/4JLQGarGHgKKpvHtIkQWchizTpP4GCbml1FSsAy+ghCCGVCYai3ScBh/rUAVNBm1mjceR3/9kdrAppA/0z6crxFLKiBuLVBKdStMCcG47O0tLZdCEjzXXWB2+/Pt/LcoQfyI5aDht+lo6GIWRDcWU4/rUOPwQECp/QRxhArYT+7NOqxkhDLJB4dxQWe/YoaE3Er833xhzc8uyrioAC8Hbpmya1iBd0HXMbn1Q1z3OMkGVgemA8A==</encrypted>]]>
      &ScriptSuggestion;
    </text>
  </script>

  <response>
    &XMLSuggestion;
  </response>
</dir>
