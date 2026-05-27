<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmts">
  <!ENTITY CommandWhenFixedAssetExternalBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeEdit.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeDelete SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeDelete.txt">
]>

<dir table="cthspbts" code="nam, ky, so_the_ts, tk_kh, tk_cp, ma_bp_ts, ma_vv, ma_bp, ma_hd, so_lsx, ma_phi" order="nam, ky, so_the_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="khai báo hệ số phân bổ khấu hao" e="Fixed Asset Allocation Coefficient Definition"></title>
  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" dataFormatString="###0" hidden="false" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="false" readOnly="true" dataFormatString="#0">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="so_the_ts" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Số thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="ma_dvcs = @@unit" information="so_the_ts$dmts.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_kh" isPrimaryKey="true" allowNulls="false">
      <header v="Tk khấu hao" e="Depreciation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_kh%l" key="status = '1' and loai_tk ='1'" check=" loai_tk ='1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cp" isPrimaryKey="true" allowNulls="false">
      <header v="Tk chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cp%l" key="status = '1' and loai_tk ='1'" check=" loai_tk ='1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp_ts" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Bộ phận tài sản" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp_ts%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbpts.ten_bp%l"/>
    </field>
    <field name="ten_bp_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Dự án" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Phòng ban" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key=" status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1" information="ma_hd$dmhd.ten_hd%l"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''" width="300" inactivate="true" aliasName="d">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" dataFormatString="@upperCaseFormat" align="right">
      <items style="AutoComplete" controller="MO" reference="ten_lsx%l" information="so_lsx$phlsx.dien_giai"/>
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
   <field name="ma_phi" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Mã phí" e="Expense Code"></header>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1 = 1" information="ma_phi$dmphi.ten_phi%l"/>
    </field>
    <field name="ten_phi%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    
      <field name="he_so" type="Decimal" dataFormatString="### ### ### ##0.000">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="1111: [so_the_ts].Label, [so_the_ts], [ten_ts%l], [nam]"/>
      <item value="1111: [tk_kh].Label, [tk_kh], [ten_tk_kh%l], [ky]"/>
      <item value="1110: [tk_cp].Label, [tk_cp], [ten_tk_cp%l]"/>
      <item value="1110: [ma_bp_ts].Label, [ma_bp_ts], [ten_bp_ts%l]"/>

      <item value="1110: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>  
      <item value="1110: [ma_phi].Label, [ma_phi], [ten_phi%l]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1110: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="1110: [so_lsx].Label, [so_lsx], [ten_lsx%l]"/>      
      <item value="111: [he_so].Label, [he_so], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/pTDAmEOOulB9FyHngy2IppGeD5bsJt08D8HhoKuW5WhtToLJdPOBdFTQamfFn2+xZpZCt5+VT+IP7jJFigbzuUmK+Qeqvp3HEz1WAr/ynpUzhgMER0Swr6J9uOQiAT48=</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>E/+0cLyU7XUD5zmlhHidCP1zAeagYc8XITRDC2FcnBpv4VxCBHzg6wkJuGQ9k2B1+YbjDX6ZK0d+b7heOk7vvxWJKVBD3uuJfVwiLY7owak+NJ3FctzS0pPmeN3hwmsSSG6S6RCWRdqP5Fo/C/12ng==</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Wd6c3ko8jI11nIvNaktwJqY1+8jbtLqfSIIbXeQQ1JLIcXtA9hNgWsx8ohePO796A==</encrypted>]]>&FixedAssetTable;<![CDATA[<encrypted>SIoRqfcWGdnHjb3HcQr5gFkYiBes+phBpBsWClXnlhiKE7rr+eDjAguhMn8N/rJUEApaDX1r9ofxS6Mp9mQ4u61++m+49E2oAQu5oXb2GApnZh/k1RjApdaUpsmbKGHCNwhuo2XgYda7K1fPv8y8kA==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>UXi4dLVbLA3AUnbna2/Tz81qFE+YUfCNiMsQIZVnvybC+j6jbb0TZ8WYCclFxhr2mHsiuGpJBsPGohOGALF3prltnH2t6K9nEWUoNiW5EDMkEdm/ECFJWfr4jajD7WTBDtFgC+Igey9P/419hSM+YLT0ybFkaEHPxGRFN/7Y7/GqPpLo90iusUrkDVL8UfqddDwTOhi7lhON47Xh+axWEZQYe5P3MjQokdIaesb4XkVOSF2Qs+iQlACIt2SHaC5HmhCwXJxKb7v8TKOmjHVT1qU7PR5H2wshyqLfny+wLW/r4N/gXFx9OdgTrTxd9C+FisJ+J+JhHIpzOvfQHIZGzKmgsU7z5wX+0rQmeFIdD9P2EGTLSvVPQpx5vLeWDl1zmBXvvR0WjU6ucIUWsPbIQ3N3klB7+AaJZqtfAGp6hgdLaHTCDq9fli3+PGBzjx2Y0vPauWh/2JLlJzNn1GpVUQwAVUKHwO6E4Y1rhGemykk=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Wd6c3ko8jI11nIvNaktwJqY1+8jbtLqfSIIbXeQQ1JLIcXtA9hNgWsx8ohePO796A==</encrypted>]]>&FixedAssetTable;<![CDATA[<encrypted>SIoRqfcWGdnHjb3HcQr5gFkYiBes+phBpBsWClXnlhiKE7rr+eDjAguhMn8N/rJUEApaDX1r9ofxS6Mp9mQ4u61++m+49E2oAQu5oXb2GApnZh/k1RjApdaUpsmbKGHCNwhuo2XgYda7K1fPv8y8kA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>qmaLJgmkylsZqCpFefKWlo0b8e+XVx8Xolpodot7iUvSRbFwutdkODozrSBSn+7GVzYo7OVkjDjTqtkI9zNDJthN8EP59TYlX2/DMC68T1/ccJzigtnu6SeHtG9KAe8gyh5iyoL4IjwpRoEuf2py5/6N4tDJjPwi8mJheRrUjo+KC2T7ePdWURUcKvg2+N4apO7hv8J0hq1TpLrjs1PIVkUxJl6qbMUizs2aV+N8+lo3nr0STchGlW6ckpwy4E38FA49VJ9rvHlV+QmguybI/eJceuc1aVNsjMn0PhHxxLxtX6czb4Nd/50cMw2hqsP5</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>w3n73L13AnmThMDM7ExezqZ2IdIQH4H/TAi83z13D8BqIadbPCvpVejFklSwLGXf2wu2pTIPg6lJDanTHfIjHp4ivE3e4D3UxkKhQ+uRIuXFr4OA5V/n5GQ12MDP6Umnueh/8apBQQ1NJU8Aq10YD2BmZAHBIwC8LVGXHKvD8QKzuw2+sBT5QCFIl4hTdek5Dbv3qrYQOstEntyCbe7Yg/4uZ/Xo7lRtxwXhZ5P+QMnb10Dkx5/DpbENDEFWIsrU75rXGddjEAHjLxpDKefCD8UNz/ccJ9D8SRhirvhWhoSwpPccWDaJaQ7DVXYPdX9CcFMGYX0HMT8S00TOxVq/jb2ftNnp/uVMPVUCCakOCM/p5PY5iYqIAyTuFs6Xpr/c12TR7Gfu5UTgsycUy3sbYyX2uxe7OB8B9Vc90qi6ZT7gEzEXBkiG0/OauHPZwdxMEPMPXzDh/X0lO/dhJgzj2814/53vuYL5YQZB36FicUP1ju28rumlgmlAUjdxV+vMs8eh8j5BV6Qk/hyXaZ6ZOA==</encrypted>]]>
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
      <![CDATA[<encrypted>JSRmTSaxtISpSQooACOZraNNumpwfo3G2jjjSTU6LKX55SWUUUmMpZ6DKU+UhQSpBNfH2YF8sdp1t7UfAhfHchAYZ83P5WkrLm13FhMtIU+oR9yGoM4AwQ4MATIzLo2k2GC/oYFAOrl6QDYHt7RZoc8A3IxX05zVcoBkZ1CQ5U2HdCnZAReVG3Fuosfz3TKlBycVMQm80YMTe4quamr8WyJLfMjAZnq7ajkdMu/wd4x3X9KZZHPG11Xrn1onJHBOQKZlVAGg20wBmLAHZJqOdg==</encrypted>]]>
    </text>
  </script>
</dir>


