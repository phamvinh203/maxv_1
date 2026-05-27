<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>
<grid table="ctdmts" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="TS1" uniKey="true" xmlns="urn:schemas-maxv-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="ctdmts" prime="ctdmts" inquiry="its" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_nv" isPrimaryKey="true" allowNulls="false" width="100" aliasName="a">
      <header v="Nguồn vốn" e="Capital"></header>
      <items style="AutoComplete" controller="Capital" reference="ten_nv%l" key="status = '1'" check="1 = 1" information="ma_nv$dmnv.ten_nv%l"/>
      <handle source="dmnv.ma_nv" foreward="true"/>
    </field>
    <field name="ten_nv%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="200" aliasName="b">
      <header v="Tên nguồn vốn" e="Capital Name"></header>
    </field>
    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Gt đã khấu hao nt" e="FC Accumulated Depreciation"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" inactivate="true" readOnly="true" width="100">
      <header v="Gt còn lại nt" e="FC Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100">
      <header v="Gt kh một kỳ nt" e="FC Depreciation per Period"></header>
      <items style="Numeric"/>
      <handle key="[tab_yn]" field="tab_yn"/>
    </field>
    <field name="gt_da_kh00_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" hidden="true">
      <header v="Gt kh đầu kỳ nt" e="FC Depreciation at BoP"></header>
      <items style="Numeric"/>
    </field>

    <field name="dien_giai" width="300">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Gt đã khấu hao" e="Accumulated Depreciation"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" inactivate="true" readOnly="true">
      <header v="Gt còn lại" e="Remaining Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" width="100" clientDefault="0" allowContain="true">
      <header v="Gt kh một kỳ" e="Depreciation per Period"></header>
      <items style="Numeric"/>
      <handle key="[tab_yn]" field="tab_yn"/>
    </field>
    <field name="gt_da_kh00" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" width="100" allowContain="true" hidden="true">
      <header v="Gt kh đầu kỳ" e="Depreciation at BoP"></header>
      <items style="Numeric"/>
    </field>

    <field name="tab_yn" type="Boolean" width="0" external="true" hidden="true" defaultValue="0">
      <header v="" e=""></header>
      <handle key="[tab_yn = 1]"/>
    </field>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_nv"/>
      <field name="ten_nv%l"/>
      <field name="nguyen_gia_nt"/>
      <field name="gt_da_kh_nt"/>
      <field name="gt_cl_nt"/>
      <field name="gt_kh_ky_nt"/>
      <field name="gt_da_kh00_nt"/>

      <field name="nguyen_gia"/>
      <field name="gt_da_kh"/>
      <field name="gt_cl"/>
      <field name="gt_kh_ky"/>
      <field name="gt_da_kh00"/>

      <field name="tab_yn"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="dien_giai"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kgjjGPc3YEB51We2f928z6gFfS8a4sEg/4zLCYhw69vXoK2w/YUkJHUY0ZH43sfD4duGnx7Ohbkr4DBDNymWoBwQEGMn/qD8zRnO7G9BYAe/TvwiNYB+shLIE0UZhWfV7Q==</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3khX63lKwmzHzjwARyexDzCpOZwlE4lOVaY8k9R24ocGHqr/Y9vn0dleP1J95VH2VAf79ctKpKvXbOok8q6nET2T8O3xDK38OIY9OHxrvW7pj</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>ehodlDkLdWpaaPB20HbZjEDLDCqHKFQ3mJZxVmSbb3kpIZnrLoEusMKRBfZfST2JTPdFXgiHG1vNQfWFhoq0lIw0ZJ86Pi3aGPKtoxNTdRc+/iwurenzxdzGBE7hAG/biYpnDPXClXKvKwpCr3chp8t4nCHiYhcfXnyKi0EUMPDJzjL+9/eKPPwLaNOtxDWm1iqz6DReKvjW7YGSVYroYUg91g9lrQsXXE7GmpXmKhTcZ6A9HaTsQ1nLYOPblRNhI6MiHouHBrzPT6TW3CCwVnKDC8cGNeF162hjlOVlr0CYCNbuT5Kjcw2SNmaJ0ulgNiK5DAWLXBN8zfVfIP5VO2Ek6p5+sy1s/3Cs9Hekk15GoBZHLVkRdbLWxrdhEMGCgyQFMrly81NVxCj+4heO7A3A2f38SC8kyH+Y1/fVdMGM0magzNupUENjSiQlvIOvrRyCDX2LZ25XCGinctydPOr6RDoggI3bt5wbV1UAhyf4s7r9yVW93DNGnj3kmu2/6m/Lc1qTYRbl4B0Yt11DjUl7QFhDWxbvCdO3VLf4cZ5F7hqpVr5zl8OurUAUCgIuuBMImT8GnWNnmKCkdWlaIVqfhvk9yWz//dzHpxizPVogc2rBUmeHvsMWDFKa6oNr0g7iuskTDLsUeqS1z0WKJkfoDSR7TDzk6Oc0hCH11xwjpdGDL2wbGBEpCXjYTELLCQzdRtNZ7x12VktXTqT4K3dFT4e3tJppQi1bXmr/2Nfayp32U/8hLZEqo6FAnqPG5c+feOTlLXWc49LCMQygqjZFiINyDAi7yKdn9rirwG5BiG4N5Nev86nPVd1/aMtvwO8cq2Hd4+wa3oLfNFVRf5iWTbd8R46IJcXmX38FDoDO5gB//l0quiXl+IxuAzWBic2Eb8mvLYnKjcnw3STXb98Jf1/2p34Ap1ORlcTWZBBSqxou4VjI8fboa8jIodaA678uu50mZ7dTUQ+pkBL8aXlKNiIc2INotj99XJbiYKN6SWyu8b7yNI2OoMNPPp2Ymf5bZfw+KCWnc3wp4EZGu6BZzV2zf2DhEQBwYyCPuctVaUky/U6wicMD8HUaMOFgB/EF4T17cfsUP6bjJkS+3CPcvTsCyoKOWi8vc46EuaPGvXOf6qi+zHGGo9sRGy7cVZZY3c5XjW9Zzj+71Ttf5bkfRrJ7EXqu4lWiW8Hibn0=</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>0sroB3VeLqy5knK6N5EGa7bJk536m7oFqviyN3+BccAbF+w8EVlLOO15RYT8rKkqSqQMy3l+9k+wCQyiHs99b7p+q+RRHgxmvfYPTZAMHRBR6iK5+Pax8TsoQhGN9A+5/KZipEM27vjCLfCsr9SdkhGLp3aHxnjIAC3HMpVtDO2+asY2Tx+6rESbIcbd5/CG</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>
