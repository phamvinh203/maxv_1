<?xml version="1.0" encoding="utf-8"?>
<dir table="dmcltg" code="stt" order="stt" xmlns="urn:schemas-maxv-com:data-dir">
  <title v=" Khai báo bút toán chênh lệch tỷ giá" e="Exchange Rate Difference Entry Definition "></title>
  <fields>
    <field name="stt" isPrimaryKey="true" type="Decimal" allowNulls="false" dataFormatString="##0">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_bt" allowNulls="false">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and ma_nt not in (select rtrim(val) from options where name = 'm_ma_nt0') and status = '1'" check="loai_tk = 1 and ma_nt not in (select rtrim(val) from options where name = 'm_ma_nt0')" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cltg" allowNulls="false">
      <header v="Tk chênh lệch" e="Ex.Rate Diff. Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cl%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cl%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="11: [stt].Label, [stt]"/>
      <item value="1100: [ten_bt].Label, [ten_bt]"/>
      <item value="1101: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [tk_cltg].Label, [tk_cltg], [ten_tk_cl%l]"/>

      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>
  
  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>kN8KWBRaB3pcKzBLSArjCsRbi95+XJnPFRVHUXHGlgYNzoKjPD7lY/I6bvUhQL07heqQGmVxwNUvvtogIasJ0nhS5lqyTLqWxgQ45vI21O4yCTJxaX8gOkRdDNjNSYKF8f1WWr8yOvyq8r5m/EOb/5s0dy9xEjf45rhp66y4WlmhSxLIwWPyb6Je6+wiqKPutQ0BDkRuchH4ks30U5F61qxtUpvtXlSMX37Zd55Srxpa4IaEng9C+YL6UBwfGIwGlPFbaS4973rxji9dx0iUflGU/U93uofAelUzcIaty5nz9T7UyZpvtmk2ec/QQJWpu+joOrplmBZd7MznMcU6uJIrwKc7/g7fWWgXLE96jWIN0W1z6TzdOnT6u+xJRFJ9yLu08e2uJT+5AWlC2csP5tZ44hnP+MpX23uF578aSWbRZONTv2MqdtXgE5XDhr3j</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>ri+364tP+6LHPexV+72EVf8MXzlEstXPRx1Q0+n7oc7R+T/Q4mlwaEhYMM9qwjkfCi9iuwiNtiIgjedsDRi7Ws5Ma7S56hazbfIw3wmv53QHNHrm1hyplETa4nMFLl2V/t0S9Xax+HIVd7s3UdCrKqUBQpFgm4l23UL6qGDimppM8N76IKhWS6nfpzAGMr75ldDjWYVJwS3Ih2wkQDdjmTtIxOK2rV+m8lNATaA2XcMIVpVyhLWd1r38sYn8Wc7G</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>75GZe9z2LryhMGYRO4MrIAeavJUOweM4K1HHvuIykaBsnAsoDPiKv4WTk05UKTxUa8C0UH2lW0iuLl/+EKCpRyN2tJGuYUDy8V6nRV6+/DIhS58uNoyQjmVTJWWXnDP81KJevLcLvd74/DTd7fX3PggoluA1naG45Krmb20K5cjspYxyXUKbu5dNTW1l5UCIwfj7Ug1qv7ECS1FjfNym2gr7hnA7NTAvYj4YHkboGdMuh6HGffV/lwZ7sqvBc4EuKIvznKXjG1EqLL0iBOOMWml76Xu1VEe7R48TfaIEvx0=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>3kfMpeabPD8zZgygL6bcBVNJofcH4vDl9HJyVyozMZCGNtb2hcwfUqpWeR3UyulS2kweuHATstJaXePPG4dILcxuZguWWEuvqt/y8z8XAbWY/zWJS/09lMKMO9U97VuH</encrypted>]]>
      </text>
    </command>

  </commands>
</dir>
