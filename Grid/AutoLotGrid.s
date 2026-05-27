<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY Identity "AutoLot">
]>

<grid table="vdmlo" code="ma_vt, ma_lo" order="ma_vt, ma_lo" type="Detail" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="ma_vt" isPrimaryKey="true" width="100" readOnly="true">
      <header v="Mã hàng" e="Item"></header>
    </field>
    <field name="ma_lo" isPrimaryKey="true" width="100" readOnly="true">
      <header v="Mã lô" e="Lot"></header>

    </field>
    <field name="ngay_nhap" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Ngày nhập" e="Receipt Date"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa44feNnPpWF62geTASt646WPD8hWLfdchzFjAkEngns1WubeSiU0bY7ZydfWqAwvg8Q==</encrypted>]]></clientScript>
    </field>
    <field name="ten_lo" width="300" allowNulls="false">
      <header v="Tên lô" e="Description"></header>
    </field>
    <field name="ten_lo2" width="300">
      <header v="Tên khác" e="Other Description"></header>
    </field>

    <field name="ngay_sx" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Ngày sản xuất" e="Manufacture Date"></header>
    </field>
    <field name="ngay_hhsd" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Hạn sử dụng" e="Expiry Date"></header>
    </field>
    <field name="ngay_hhbh" type="DateTime" dataFormatString="@datetimeFormat" align="left" width="100">
      <header v="Hạn bảo hành" e="Warranty Date"></header>
    </field>
    <field name="ma_vt2" isPrimaryKey="true" dataFormatString="@upperCaseFormat" width="100">
      <header v="Mã phụ" e="Part Number"></header>
      <items style="Mask"></items>
    </field>

    <field name="ghi_chu" width="300">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="so_ngay_sp" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ngay_bh" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="kieu_lo" type="Int16" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="status" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_vt"/>
      <field name="ma_lo"/>
      <field name="ngay_nhap"/>
      <field name="ten_lo"/>
      <field name="ten_lo2"/>

      <field name="ngay_sx"/>
      <field name="ngay_hhsd"/>
      <field name="ngay_hhbh"/>
      <field name="ma_vt2"/>

      <field name="ghi_chu"/>
      <field name="so_ngay_sp"/>
      <field name="so_ngay_bh"/>
      <field name="kieu_lo"/>
      <field name="status"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3krf4XQDDIplhHI/0i3jUqGsVAgLBq1D/nElko7pqqO9b</encrypted>]]>&Identity;<![CDATA[<encrypted>sDZX6DrXJtu6F8Wy3t0jcTmEOox6eoNVqucWR+E7sfKcF39Jch3McLJqE8GtdrftuYYQXTQZU9fRLqjC4IVnRQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxpgUMynXJ1mqlHw+pbaWDeSNMP0gtligVeTcbOOwuSr</encrypted>]]>&Identity;<![CDATA[<encrypted>qEHNNUnud6dowv4q4hPiv91z251CCoNgBB7MpqxG2lTINEGww++wFN43pAAF6S1FR+SAZFI4kZMbtAJUN9lDDn7U7QOIsTHVavt042Uy8jSvqRWfUn4gLcqBjU+VIGLbJmd7u5+/mrxCcG2U70oSyWA06f4fTUiRlffsH12JHt8uliO5poy4uHYdfulGsRj0nht7m14ldJgba4IyNE+LN4MCBkIF4NepVFSwJcw5F99iB3TaMu547Uy3c3Ro4F8aP8P35sU6+DZHiGjgm5iAOFjq32T+54zbydOy+XUGat6eajMd2yZcjmrZ/eL93a4jNg/hzpUkNEJLLihl/b61+hm59uFzQpV7dBnanL/BhUVB6q2nqQXa6oBCg7upkjEY</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>sMIEVOCHVf2+0ORJRHy+joxg6I1DZY2N2tOppml657GRHFcHSnnOLy3qyH9D1L575K32y7RJ3vJ0RuQHKC+YFTW+J8hpTNv0+4fj21tZ7DFZDxyPywLYAUk8Q9Gy0lYcC/ivasUJXTbc48YXLs5wff1EpK3aGMkiDG/kXFiw09NQ+5NKm76/FV9aKwYEdLH5PLCgGvaSiw0zEwzoE+qAyezg325jCti0h/UkvKBXgCc2KoVLlRJtxB2PyjXxGzAIy9CzO21oswNNtqFgDw3ax5+2KJI7Upg2nTZs//4407a4nRvfEf9m2leEJhICCITJpq+ao55g3yMraF3KUjyVWQU8E1mXiKMOGgMyoPllCKURwqxBpxuFRV+/Siuya447xfgfNX0jyQ6PDGYUHeJWBkNNKb5btt5qwetbnRjC6irftysbGBvXik0A4TtKNa283XGna4NN2H23NxH6vc+20rIXhpG53Fibk+88rjGTFot3QCkpVhh6GbyPT3q7jOV4jlPe+6fCaq82KZAoGWimcJa69TuTc7/IJjdB3VRjNBDLJZ8sDyKQ5dFcN68aLUgem8HrdWvWK3lS+8ziXParTRBFplAVTL9kDcp8NQGMqAjk+J4AJD3sTKa+0I00LugQ9lpUSase78WElvc0D6bOULnXGJ9t8+vzbm/wY9eSnU3l8WA4mWsrkhPO8xIxYaptcr8xQAwYTK8Emo0OY+mwGS+bruoReNeNmSiYtiOwWOTI51yvExAEw0b4/GmMXva+mP2r3mCXavhsCLlxHQuKSrroM77ylF/H8FwFtni3KrGvVtaBcbvvV84MO3vcFOhwnVN5krd5Orrl7shMdw69B9pEZZxnjh3i68bBv9IiDYcp+MZ2InhGN4bEGb9Z5MHk7heGa2wsoGKh4DzqPfp/03NcurSUm8HiB3Y93WqQU9+HCMkXGW8bb9+0A5uT/D6AJ0cs+SjHkb+QmvtnjomKuROTP1ZqTjgxrJ9HFEgqjRfVetLQ91u2Qf7z00basX2mlhtmExXMwq3i+wWlbOy7o2YkCikRtJZlZXtSMQD7zJNlv+RCkSBEMD0tZfjX2puf</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>
