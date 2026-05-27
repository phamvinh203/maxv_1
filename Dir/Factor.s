<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>
<dir table="xdmyt" code="ma_yt" order="ma_yt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="yếu tố" e="Factor"></title>
  <fields>
    <field name="ma_yt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã yếu tố" e="Factor"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_yt" allowNulls="false">
      <header v="Tên yếu tố" e="Description"></header>
    </field>
    <field name="ten_yt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="loai_yt" categoryIndex="1" allowNulls="false">
      <header v="Loại yếu tố" e="Factor Type"></header>
      <items style="AutoComplete" controller="FactorType" key="status='1'" reference="ten_loai_yt%l" information="ma_loai$xdmloaiyt.ten_loai%l" />
    </field>
    <field name="ten_loai_yt%l" categoryIndex="1" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="nh_yt" categoryIndex="1" allowNulls="false">
      <header v="Nhóm yếu tố" e="Factor Group"/>
      <items style="AutoComplete" controller="FactorGroup" key="status='1'" reference="ten_nh_yt%l" information="ma_nh$xdmnhyt.ten_nh%l"/>
    </field>
    <field name="ten_nh_yt%l" categoryIndex="1" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="kieu_yt" categoryIndex="1" allowNulls="false" dataFormatString="1, 2, 3, 4" defaultValue="1" clientDefault="Default" align="right">
      <header v="Kiểu yếu tố" e="Factor Style"></header>
      <footer v="1 - Nguyên vật liệu, 2 - Chi phí nhân công, 3 - Chi phí SX chung, 4 - Khác" e="1 - Material, 2 - Labor Cost, 3 - Overhead, 4 - Other"/>
      <items style="Mask"/>
    </field>
    <field name="cong_tru" categoryIndex="1" allowNulls="false" dataFormatString="1, 2" defaultValue="1" clientDefault="Default" align="right">
      <header v="Yt cộng thêm/giảm trừ" e="Factor +/-"/>
      <footer v="1 - Cộng thêm, 2 - Giảm trừ" e="1 - Add, 2 - Subtract"/>
      <items style="Mask"/>
    </field>
    <field name="tk_no" categoryIndex="1" allowNulls="false">
      <header v="Danh sách tk nợ" e="Debit Accounts"></header>
    </field>
    <field name="tk_co" categoryIndex="1" >
      <header v="Danh sách tk có" e="Credit Accounts"/>
    </field>
    <field name="tk_dd" categoryIndex="1" allowNulls="false">
      <header v="Tài khoản dở dang" e="WIP Account"></header>
      <items style="AutoComplete" controller="Account" key="status='1'" reference="ten_tk_dd%l" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_dd%l" categoryIndex="1" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="dd_ck" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Dở dang cuối kỳ" e="WIP Closing Balance"></header>
    </field>
    <field name="th_bp0" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Tập hợp bộ phận g.tiếp" e="Gathered by Indirect Dept."></header>
    </field>
    <field name="th_sp" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Tập hợp sản phẩm" e="Gathered by Product"></header>
    </field>
    <field name="th_lsx" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Tập hợp lệnh sản xuất" e="Gathered by MO"></header>
    </field>
    <field name="th_bp" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Tập hợp công đoạn" e="Gathered by Dept."></header>
    </field>
    <field name="th_nvl" categoryIndex="1" type="Boolean" clientDefault="Default">
      <header v="Tập hợp theo n.v.liệu" e="Gathered by Material"></header>
    </field>
    <field name="hs_yt"  categoryIndex="2">
      <header v="Ds các yếu tố tính hs" e="Factors to Define Coef."/>
      <items style="Lookup" controller="Factor" key="status='1'"/>
    </field>
    <field name="gt_ps" categoryIndex="2" dataFormatString="1, 2" defaultValue="1" clientDefault="Default" align="right">
      <header v="Tính hs theo pstk/gt" e="Coefficient Defined by"></header>
      <footer v="1 - Phát sinh trong kỳ, 2 - Giá thành" e="1 - Arising, 2 - Cost"/>
      <items style="Mask"/>
    </field>
    <field name="pb_yn" categoryIndex="2" dataFormatString="0, 1" defaultValue="1" clientDefault="Default" align="right">
      <header v="Kết chuyển sang tkdd" e="Posted to WIP Account"></header>
      <footer v="0 - Không, 1 - Có" e="0 - No, 1 - Yes"/>
      <items style="Mask"/>
    </field>
    <field name="status" categoryIndex="2" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" >
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="256">
      <item value="120, 100, 330"/>
      <item value="11: [ma_yt].Label, [ma_yt]"/>
      <item value="110: [ten_yt].Label, [ten_yt]"/>
      <item value="110: [ten_yt2].Label, [ten_yt2]"/>

      <item value="11000100: [loai_yt].Label, [loai_yt], [ten_loai_yt%l]"/>
      <item value="11000100: [nh_yt].Label, [nh_yt], [ten_nh_yt%l]"/>
      <item value="11010000: [kieu_yt].Label, [kieu_yt], [kieu_yt].Description"/>
      <item value="11010000: [cong_tru].Label, [cong_tru], [cong_tru].Description"/>
      <item value="1100000-: [tk_no].Label, [tk_no]"/>
      <item value="1100000-: [tk_co].Label, [tk_co]"/>
      <item value="11000100: [tk_dd].Label, [tk_dd], [ten_tk_dd%l]"/>
      <item value="11--101-: [dd_ck].Label, [dd_ck], [th_bp0].Label, [th_bp0]"/>
      <item value="11--101-: [th_sp].Label, [th_sp], [th_lsx].Label, [th_lsx]"/>
      <item value="11--101-: [th_bp].Label, [th_bp], [th_nvl].Label, [th_nvl]"/>

      <item value="110: [hs_yt].Label, [hs_yt]"/>
      <item value="111: [gt_ps].Label, [gt_ps], [gt_ps].Description"/>
      <item value="111: [pb_yn].Label, [pb_yn], [pb_yn].Description"/>
      <item value="111: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="120, 25, 5, 10, 60, 80, 25, 225">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="120, 30, 400">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ewFYas9MIo+SLrBnlTxMhrxEcIdu7Q7uipcE/Yf/3M/dOKGGKFnCTb69Vq+mPFFoq98TSAE7gYQ7ISM8Iyw5qo=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Y8kSdEtoK8a4pN6gdTJ2X3HPTY0OOXi4XSu7azy/wXHyhL9fSEDz4+aeHH0tsiwuQ2rWa1yxxuUEuNUjSdFwfA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>5F4FmYRebB5jyxsOgkNNH2RT52C4vEJL8/BpWChTtuFju0WsdWrJmPsDdjjpcC6NXMuKcO3nEuFtCtJOl6mmp6mROF6sH9aYjKgyss4n52RoaN8+Qp0Sjd1KUZjlvDVUsJvI4gbuAri3IsjR49X/LaTudxkOcIfwtr+5Xa/zagyfRZmydKXjPUy2D1J/Jun02TYbVz7daMHY4ILsZRdE2Eq2UxQVM9+tWcCASxCKthCn1yo1UJPVScTyU0bKMc9Z/1skpjmeuivuAwuZQLYrZduMlh7x6Z0PetOWxLd7Q+s3BWBTcWKFBp2htCdqcRHkh4ChZaASL50/Ib7qreLSH9bi5i8kvk/RhxGyD+Snk9VUdKjlUCJCvASvfRC8qE9TpmrV254dftIvJS08tG9AFCiqnEzbEJuTYedl7VwByfzxA0QMYoCcZcUDOqtaxeePLQQaF8EebKfDGbCDBeBf8Q==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>M3k3QgowElyc2pcM1HmK83We0Qr2d2zOcifL677D2/ZO3iwXS1ZX7KBytAa72MjjgSYsB3dIWGoUAAWm4d6p64EAw6dUvWD3RzchgUSwk23+MabbRuq2NvodivAwfMhMwJbs1hwHTYdxfCHCQR9qEGeOVghRRA9w8Pg6ypx95klaTR30dUoX0B4PCUKOSyRSUVOnYFmf8WSepV1e14i0THa+pnWH2+cb8PaJiWQnWfc4N6bP8mpQoSAwbEvwazVXLGxWNFScnNOsqiGM06IOSQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>HF6dk0ioy5D6p7Zlgi3Xplh9Uwfrsrnh3oQAjJRtSjHK3dyaaThmbEaBaF2XFbE++oMh4VqQNMva6VtSUtYxjb/zuztUfcRZNjgNHgJU1ELuqVLmEfQAr0vwqQkXRj+qVLIv7UqHX7UqS7V4kkny5BN5iRtT43uIXMJAyb8xmYsOqC4zicYjmj+sVsPs8PZEFKLeHdkvBWZHMt+lgZitljb8pkEjw6B47PABaGq1+HYPmZN4h8iAXs4/gktGj4wTHbI2v0Y2im+LJ05V1TWkFjL1alWKX17P6723rqkqXa8=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILYkInGOl9B+tkTDdVkKbiF9bobCwqkzvwu0qijbK2djv</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>VCGRt3GtMhNOPFhdsvRBhm+envzbqfLYQv9rikHxrgpEZK1T4/JAKm+B0dSbXP0PzDE8l5ngVmnyCVLleV2aVxHJSokqEhmiGPF4qkgzaDieMCevB7Fapg047Q5Btjtf/MJtAgGxmsHyUjYdA0qmh9aaa0yiaBp719Ceav2uLkZ6BVvB9285v2d6HhBwTakC7LhfzJ1Hto9bbjM49svZRgxrvISAE2J3aGfx3KyQLDGwciw8rhhMmWpCd+O1OPCSwjOKHJexUezW4lTECGsmKwZdLKhcZFNRwh9BbkpzC+APIwFb0JEo79W7PDdgmdOOxFy1NWyjUZY5F2+XjKkNGLJUdnJTQx6H9qMq+4lxb53wV37H+8z2yrW1BkJR7t52Z45aQW7a5zR53T5130QW+rlnX1BLWb1wQtcFQ9U2n9M2pUAsI3LJj6MqkVUizGweXR8ZnRxyAYqMnEu1PEJ3vFXBfTcLAr2InZiJLktotcw=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>
