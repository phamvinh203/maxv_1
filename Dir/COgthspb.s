<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ClauseWhenInsert " and exists(select 1 from @@table where nam = @nam and ky = @ky and ma_yt = @ma_yt and ">
  <!ENTITY ClauseWhenUpdate " and exists(select 1 from @@table where ((not (nam = $nam.OldValue and ky = $ky.OldValue and ma_yt = $ma_yt.OldValue and ma_sp = $ma_sp.OldValue and ma_bp = $ma_bp.OldValue and so_lsx = $so_lsx.OldValue and ma_bp0 = $ma_bp0.OldValue and ma_vt = $ma_vt.OldValue))) and nam = @nam and ky = @ky and ma_yt = @ma_yt and ">
  <!ENTITY UpdateConflict "begin
  select 'ma_yt' as field, @$updateConflict as message
  return
end">
  <!ENTITY CheckEmpty "if @ma_sp = '' and @ma_bp = '' and @so_lsx = '' and @ma_bp0 = '' and @ma_vt = '' &UpdateConflict;">
]>

<dir table="xcthspb" code="nam, ky, ma_yt, ma_sp, ma_bp, so_lsx" order="nam, ky, ma_yt, ma_sp, ma_bp, so_lsx" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="khai báo hệ số phân bổ" e="Setup Coefficient of Distribution"></title>
  <fields>
    <field name="nam" type="Decimal"  isPrimaryKey="true" dataFormatString="###0" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true" dataFormatString="#0">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_yt" allowNulls="false" isPrimaryKey="true">
      <header v="Mã ytcp" e="Factor Code"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1'" check="1 = 1" information="ma_yt$xdmyt.ten_yt%l"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_sp" isPrimaryKey="true">
      <header v="Sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1" information="ma_vt$vdmsp.ten_vt%l" new="Item"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp%l" key="truc_tiep = '1' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep = '1'" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" align="right">
      <items style="AutoComplete" controller="MO" reference="ten_lsx%l" information="so_lsx$phlsx.dien_giai"/>
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ma_bp0" isPrimaryKey="true">
      <header v="Bp gián tiếp" e="Indirect Dept."></header>
      <items style="AutoComplete" controller="Section" reference="ten_bp0%l" key="truc_tiep = '0' and ma_bp in (select ma_bp from dmbp where status = '1')" check="truc_tiep = '1'" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp0%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true">
      <header v="Mã vật tư" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Item"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="he_so"  type="Decimal" dataFormatString="### ### ### ### ##0.0000" >
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 105, 330,0"/>
      <item value="1111: [ma_yt].Label, [ma_yt], [ten_yt%l], [nam]"/>
      <item value="1111: [ma_sp].Label, [ma_sp], [ten_sp%l], [ky]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1110: [so_lsx].Label, [so_lsx], [ten_lsx%l]"/>
      <item value="1110: [ma_bp0].Label, [ma_bp0], [ten_bp0%l]"/>
      <item value="1110: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11--: [he_so].Label, [he_so]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ZYm6pq0O4ctdHSgtIkX+kWr1e5Uwjg7Z1zrLEEU0FlJWclYXHsKv/ILr7y6jNwhoRpqPi5FKLm9GbvpuY4iLsw=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7ZYm6pq0O4ctdHSgtIkX+kWr1e5Uwjg7Z1zrLEEU0FlJWclYXHsKv/ILr7y6jNwhoRpqPi5FKLm9GbvpuY4iLsw=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>o5GhbjKvxyh/3hBY4W5cSW4wmeOMZNC9pX/LGWZx2rVSvY1XmEswk5BBodeyDr3HLo9RHwUAx9hgDAATn2TsUqi4lx6ODnQ+436lrIf5kO4NxXjJr0lZpxAPy8zRNhmB6GR5GNZwdNtqVHoYQzejIThbc+7mPD14YPIEDwbplH8b8AWllDUXNi1CwlAVrVvxE/4FYiISPaZyNQLTMXTDHtcV0Fg705oGFMtY5xqqfqukpDnpqlzYdmx+cxuQKYHcYGzuyVCQZXDUpZS1IQUC9jSb/Mzu9NZEAxMbWvkj7njjDN6wf6TZYuJpIeA+KEInadEhQjpHon3LFBWpAWM/1kaLV8vQxlUGsDEkehOPsUZF6sZ9dUhD/S8jFcNk1GWZjSiUHMHPhKPajyq4ENcZjlWOfcD38YcOC6YN9CI3caLKmKLoQfNH7tXkO4Vqcl7DczGpW6OmS6ByM6KHeq8iorkJFs3j0gwVYrUKFIubBgdLNbwiiZGpe31AjOAS0zEses/z1e05z+Pa8BncBQSJui52MI5U46yRr4zmX0t72bQ=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>bPNc2tSgbTdfOQRFTF9B406z14qSDXoszY9lLO+ocgDuYHbHu86FBEx5SVVHHiu6swM6EF1cp24jxYE13wDBEE14N8wgjWIkXi2MOhKX17AzufqsHAkKwV5ui1z+GbG6ja0B+05quIVqml/6iKudKhdqpthsN/nOZt23iU0XQ4Kq8hH5yYPGtFv7Vjqo2NC7UCr7GLXYdqwTl2ATyi0uYQyw0Qt3JeoS06YvqeYW1tk=</encrypted>]]>&CheckEmpty;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN07/uJO+QKD7h2IE17e5RuLPGhGPCunzoiFmdFrYjWnT</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>qOlvQGn56rBZ7KrfWohfpsyJ31RGP87TPH0fkk/KhexizkCO62Tn9FpmtCWxrbgA</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fNzufxSw0Xz6lyb3yAjZErGgnON2AqPuginiOH/XRooCR</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>qOlvQGn56rBZ7KrfWohfpgeyLMqHHgEf5DUEnuNKGa4VV6BIbYRpSEsMGfdNKq3/</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fNxSxQB8WZ9Ovhs56yTPW871aWLOKVfc8iIZ43ciu7Tsz</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>KFxY3MicUY2HPKahQDCHkepuqOE8YV9mc3LX+6ebWULaK9UHU50/DUuPR/2d8nK1</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN7c8+JkoorVtnHKp/O8EoGXS8qBnmLp5K0PhN3ltm6sq</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>KFxY3MicUY2HPKahQDCHkWHrMc1lqGBox7ODHDdRd2ADKZJyd78iuM4RMJJKhDAd</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN7eXk+OuFnvXS0uCqmuvaEWG2nHqoM7V/Z10oZwjCsFx</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>mdM6ZZBPcP70/Y6EXcRG2JLd4TJ19BtxgI7A4u/ScoxtwNd+lMKQlYfHJPIhgUvz</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fNzWeoabLU7S8A83kV6HVVXTqdlgCrQGBH776VUlpCqtN</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>mdM6ZZBPcP70/Y6EXcRG2FXf2dgGTHyWWKjh+ihW+OoLv2hahqba8pvjiAOOfUDP</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fNzFsi/KDmc51JQ02AhRkSxN6GjoSxZmeKLyp166EYn+4</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>r0LsZvPxgO1yvI46MoPyX/o6oimRpdIj2p5CrTt6EBnRygEZEDfGQk5m7agibO8U</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fNzqsB0yrhCOVyYvI7HmX7coeLstTN6ou2rSPjAJ4SFqi</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>r0LsZvPxgO1yvI46MoPyX8xmse0AxlCx9zA1pL0FoILhHgNPznhkxytWX5B/IVhH</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN2i3azViGWnRA0Enh8rhB0x85ELWS2kmEYaoNOnVbBGG</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>wHqpgIxYPMt9/B8k5FkKiX/Kjf59dY3WY9Zsi9NO9pSdG5zVKu0xcLFo2U42I+LD</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN8FR6vxb8UHzijpxUlKw6ligKmUaid9UyafEicx3Gjxt</encrypted>]]>&ClauseWhenInsert;<![CDATA[<encrypted>wHqpgIxYPMt9/B8k5FkKiZ7ieOnrZHVhJOJjOsXnSyYDZ3Aj1w4VBB8rz2wf4uUP</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7apPWStMxy488D1htMwWe78PUyCM7UmIDtynnP0GRGZLFY5Djvj27VH8OV2CRtfHyX5e87ewvKe4I3+pGM2Afc8=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>OeWUpJz05XKHXuqG5y8hlNSj3I5yYFDtIHxXjAPsWIdugY8NTtcI3XYxnu3NQlxwbMiJm8yLZfxzBuNR72oChq3KWmlARS0CmVdqKaV6TUgpl7LdXnSp4zGpCu9eVUUjB+1zU1Ymb24cxFQ2hmU5nNKBZjJU3PbGZuL3HM273e14PSt72sWJ4yr1UVdgKrkOpPeGHxdeFu2sjBtvv3orYPwSiQHgDdRlalePG/rnyflvpBdHY0MugpT+OcCxXbT6QcEin6HJwx0dF83oV8Vv/4+pNkMpFZfCX0scDUFaSWgcYoLBHh2kISBouFhOQZUhe+fByxzYA53t/RUX/wwCWYLLjSeiFbOkJgc+P0o7YmF0AkPxpqocFGXNAz4jIpUVSlOvBkL6s/51uFwlx9lVP30HVWfzHdDC/rQgiTYcdSO5kzVhyD2J11ytjCCFqEX9</encrypted>]]>&CheckEmpty;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN07/uJO+QKD7h2IE17e5RuLPGhGPCunzoiFmdFrYjWnT</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>qOlvQGn56rBZ7KrfWohfpsyJ31RGP87TPH0fkk/KhexizkCO62Tn9FpmtCWxrbgA</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fNzufxSw0Xz6lyb3yAjZErGgnON2AqPuginiOH/XRooCR</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>qOlvQGn56rBZ7KrfWohfpgeyLMqHHgEf5DUEnuNKGa4VV6BIbYRpSEsMGfdNKq3/</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fNxSxQB8WZ9Ovhs56yTPW871aWLOKVfc8iIZ43ciu7Tsz</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>KFxY3MicUY2HPKahQDCHkepuqOE8YV9mc3LX+6ebWULaK9UHU50/DUuPR/2d8nK1</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN7c8+JkoorVtnHKp/O8EoGXS8qBnmLp5K0PhN3ltm6sq</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>KFxY3MicUY2HPKahQDCHkWHrMc1lqGBox7ODHDdRd2ADKZJyd78iuM4RMJJKhDAd</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN7eXk+OuFnvXS0uCqmuvaEWG2nHqoM7V/Z10oZwjCsFx</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>mdM6ZZBPcP70/Y6EXcRG2JLd4TJ19BtxgI7A4u/ScoxtwNd+lMKQlYfHJPIhgUvz</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fNzWeoabLU7S8A83kV6HVVXTqdlgCrQGBH776VUlpCqtN</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>mdM6ZZBPcP70/Y6EXcRG2FXf2dgGTHyWWKjh+ihW+OoLv2hahqba8pvjiAOOfUDP</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fNzFsi/KDmc51JQ02AhRkSxN6GjoSxZmeKLyp166EYn+4</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>r0LsZvPxgO1yvI46MoPyX/o6oimRpdIj2p5CrTt6EBnRygEZEDfGQk5m7agibO8U</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fNzqsB0yrhCOVyYvI7HmX7coeLstTN6ou2rSPjAJ4SFqi</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>r0LsZvPxgO1yvI46MoPyX8xmse0AxlCx9zA1pL0FoILhHgNPznhkxytWX5B/IVhH</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN2i3azViGWnRA0Enh8rhB0x85ELWS2kmEYaoNOnVbBGG</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>wHqpgIxYPMt9/B8k5FkKiX/Kjf59dY3WY9Zsi9NO9pSdG5zVKu0xcLFo2U42I+LD</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN8FR6vxb8UHzijpxUlKw6ligKmUaid9UyafEicx3Gjxt</encrypted>]]>&ClauseWhenUpdate;<![CDATA[<encrypted>wHqpgIxYPMt9/B8k5FkKiZ7ieOnrZHVhJOJjOsXnSyYDZ3Aj1w4VBB8rz2wf4uUP</encrypted>]]>&UpdateConflict;<![CDATA[<encrypted>wEBOnvhVmsKPmyiMqy20s2ITCngpVvAdbn367DipKVk=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>YQnPwVLLTRjWSQ9aPEJbcBjbHiHLKADV5YdR20HEeFjOKw9YtjHm20/hEjkpTODHxOnUxlwCtHWJJQQAOhuEzOtG1fzXJC35tlEZ7HMUxit+3+dw5oA4gsfFsUkZw978uo3TT7mg28FFvkgSyOVBPPdH3xMNkjPpKZnGIHdDe5bPotCdZzp3AmAYyhVEZZH0</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW+PQeLDfM5i53cg+XdoDAmmySYuKXFQdAP1KNbhq3K1/OoafpbZ5tvsvoMMKupuTt5Q0HRjaoNmz98yloEu6WV5VHkgWE0KpF+5mEhqMRT+rMXkf7ELH+WjguyC+DTCaVPV9p7Rt+DIhGolD6pXQN+n1dm2zzJx+dDA7sU8gZcFw</encrypted>]]>
    </text>
  </script>

</dir>
