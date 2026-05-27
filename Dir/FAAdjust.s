<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmts">
  <!ENTITY ExecuteAdjustForm "exec fs30_FACalcValueAdjust @so_the_ts, @ngay_ct, @ma_nv, @ma_tg_ts, @nam, @ky, @so_ky_kh, @gt_cl,  @gt_cl_nt">
  <!ENTITY CreateStructureAndExecute "create table #t(_01 numeric(20, 5), _02 numeric(20, 5), _02_nt numeric(20, 5), _03 numeric(20, 5), _03_nt numeric(20, 5), _04 numeric(20, 5), _04_nt numeric(20, 5), _05 numeric(20, 5), _05_nt numeric(20, 5))
insert into #t &ExecuteAdjustForm;">
  <!ENTITY CommandWhenFixedAssetExternalBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeEdit.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeDelete SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeDelete.txt">
]>

<dir table="ct&FixedAssetTable;1" code="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" order="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="điều chỉnh giá trị TSCĐ" e="Fixed Asset Value Adjustment"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false">
      <header v="Số thẻ tài sản" e="FA Code"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="ma_dvcs = @@unit" information="so_the_ts$&FixedAssetTable;.ten_ts%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa462FZe0IyP1OIEwQ7C4AVXZACqHZOP1P/oMCdyFCEzVS9tpEbRJ21XtiZYzAjJG2lA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày ct" e="VC Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="true">
      <header v="Số ct" e="VC No."></header>
      <items style="Mask"/>
    </field>

    <field name="ma_nv" isPrimaryKey="true" allowNulls="false">
      <header v="Nguồn vốn" e="Capital"></header>
      <items style="AutoComplete" controller="Capital" reference="ten_nv%l" key="status = '1'" check="1 = 1" information="ma_nv$dmnv.ten_nv%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="ten_nv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_tg_ts" isPrimaryKey="true" allowNulls="false">
      <header v="Lý do" e="Reason"></header>
      <items style="AutoComplete" controller="FAAcquisition" reference="ten_tg_ts%l" key="status = '1'" check="1 = 1" information="ma_tg_ts$dmtgts.ten_tg_ts%l"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa40GB1aTM7LTRxOuxNXSetvBb8NA8tirKDswDP3eFRshm6OsmxMvCJu4QbIvyZ8H4Nw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_tg_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true" disabled="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" >
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>

    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_nguyen_gia_nt'>Nguyên giá nt&lt;/span>" e="&lt;span id='idf_nguyen_gia_nt_id'>FC Original Cost&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_nguyen_gia'>Nguyên giá&lt;/span>" e="&lt;span id='idf_nguyen_gia'>Original Cost&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_da_kh_nt'>Đã khấu hao nt&lt;/span>" e="&lt;span id='idf_gt_da_kh_nt'>FC Depreciated&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_da_kh'>Đã khấu hao&lt;/span>" e="&lt;span id='idf_gt_da_kh'>Depreciated&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_cl_nt'>Còn lại nt&lt;/span>" e="&lt;span id='idf_gt_cl_nt'>FC Current Value&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_cl'>Còn lại&lt;/span>" e="&lt;span id='idf_gt_cl'>Current Value&lt;/span>"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ky_kh" type="Decimal" dataFormatString="##0" clientDefault="0">
      <header v="Số kỳ kh còn lại" e="Remaining Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_kh_ky_nt'>Điều chỉnh kh kỳ nt&lt;/span>" e="&lt;span id='idf_gt_kh_ky_nt'>FC Adjustment Value&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_kh_ky'>Điều chỉnh kh kỳ&lt;/span>" e="&lt;span id='idf_gt_kh_ky'>Adjustment Value&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="gt_kh_ky0_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" defaultValue="0" external="true" disabled="true">
      <header v="&lt;span id='idf_gt_kh_ky0_nt'>Kh sau điều chỉnh nt&lt;/span>" e="&lt;span id='idf_gt_kh_ky0_nt'>FC New Depreciation&lt;/span>"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" defaultValue="0" external="true" disabled="true">
      <header v="&lt;span id='idf_gt_kh_ky0'>Kh sau điều chỉnh&lt;/span>" e="&lt;span id='idf_gt_kh_ky0'>New Depreciation&lt;/span>"></header>
      <items style="Numeric"/>
    </field>

    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="loai_tg_ts" type="Decimal" clientDefault="1" defaultValue="1" external="true" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tang_giam_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" defaultValue="0" external="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="tang_giam" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" defaultValue="0" external="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 20, 45, 110, 120, 100, 0"/>
      <item value="1100100: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>

      <item value="1100100: [ma_nv].Label, [ma_nv], [ten_nv%l]"/>
      <item value="1100100: [ma_tg_ts].Label, [ma_tg_ts], [ten_tg_ts%l]"/>

      <item value="1100---: [ngay_ct].Label, [ngay_ct]"/>
      <item value="1100---: [so_ct].Label, [so_ct]"/>
      <item value="1100100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1100111: [ty_gia].Label, [ty_gia], [tang_giam_nt], [tang_giam], [dv_yn]"/>

      <item value="1100-11: [nguyen_gia_nt].Label, [nguyen_gia_nt], [nguyen_gia].Label, [nguyen_gia]"/>
      <item value="1100-11: [gt_da_kh_nt].Label, [gt_da_kh_nt], [gt_da_kh].Label, [gt_da_kh]"/>
      <item value="1100-11: [gt_cl_nt].Label, [gt_cl_nt], [gt_cl].Label, [gt_cl]"/>

      <item value="11-----1: [so_ky_kh].Label, [so_ky_kh], [loai_tg_ts]"/>
      <item value="1100-11: [gt_kh_ky_nt].Label, [gt_kh_ky_nt], [gt_kh_ky].Label, [gt_kh_ky]"/>
      <item value="1100-11: [gt_kh_ky0_nt].Label, [gt_kh_ky0_nt], [gt_kh_ky0].Label, [gt_kh_ky0]"/>
      <item value="1100000: [dien_giai].Label, [dien_giai]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ksQTIyQXOzcu+uafi6siJp7B1YyYwj6BnGeWevFEEQZ3uMiUSg4QiXr2WhD6Q+iyw5U+PGOiCooUMXKwBfcBkdc=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>3Kl2NTbw/jJproimB5KZfihthkw0frXU+eiaKfa3uzS0T+FmxWQT/7x2fskbLwzlRfmUj6URhKiHWmlyn1zDXO1fGKQigV+tfyBShARaZO/n/+ouqMb9mpWjt8hgtGN0+9xAavPWugR8xHVTIEpp6u+Q4xAjMmPCKtP+29s3yoS89saJwTAbW2V5xW7VFwVG</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3OqmDartyEUr3ckuJgmUD40pUbpsccuA5fVd1xrpxDOHQ==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/5NRu3nfHu1FzbNr0dJx1pOR0i5syqsYCW3OyzAWJhvhojAoj4qpeMtOyicTGZD0I=</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh7+bzGDGaSI3PWmokkUbaiKg1daUmmSVD6TEDf9Fr7iJA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ku2e9kc7KEP+L7HOQ4+70EAbTwPKKN3Xa1QcF/fDsWta6Ye1KNNAqzf2QyzCYKKGrimZG1BGl7efkFx1xMEW8Wk=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>jERy2ymNfQjFJ4VlboDuf9v9Q0V6ODsmb6PIdD9x34I/PU/LNYrYSDvGfvwy1AGtx/6d/MGLyAmf+JTcMKRnNGuTvdqrYN530I4Vmy+EFzE4wyUgwR4loMc+367+go2Mc0FVT7phQRpM4nx5KsWBAZWLDRnLu0BiRr1N4kEvMGxuVl3mm/mRKg7pRpIF5d5a5iY2pBe3qWIIq/WYaoOF+YFuAsl8O+zgAZU2MFQhCq8mJi5/Uqo2V1by5/Vj+nmr</encrypted>]]>&FixedAssetTable;<![CDATA[<encrypted>xCM+Pn75ktMlpflTnNiJZnbSEidpdajZEqKarLUR83C45RWpLwkE1ZkAbfgruH2dw0dJjXaZXzJfOnX6Vjsgmv1aE1Xx629GD8h4Zh33q4wqoHN+uIuhldSyVQJ8STCivJ2fl5lcIcJNMHeiPJjndcoKo1u1/Oz3+8n57VR6ubfBwF87mm5ecbOEb/wYm1BF+6bufCo4igGVLZv6T+3E8voSnP3qwgtdqKjLYhKvVHVK43eJcr3uZXh4xcr8p6eTkzreOTQoO8PnwR9SCD4J4g==</encrypted>]]>&CreateStructureAndExecute;<![CDATA[<encrypted>Da4eETAf1XJzhiR+VvC8wVZI1nr72AaCpIiv3+l+e+kxUBrFLWrZkAZQbN8F4MdAJ5aO57xdjx1suwz4O5RvzN0kHaOBJv699IhIP/T+gziWAPFQF2HvXNK2Vvg8ZM3P/A/BMcQoGLic7/x4WuwQkZ3xJtZvYrHhmpraFJK0ppbILFUjp9r4zLmPIb0u00ku</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>Y9Dj9ROvDCThl0h/A6l/cT3uckWBxr6MUiB0I8b4LMGFKpTK1N+YsoLoeTxv3qKvPwNozt9dkbIFwYdofK4XCq2tYK/+iXC/9ZUNcvNbIousCm63EetegCG33kE1RcMnEGQAo4XcZk7vCkS+Gbyv23ISlnAQeL120YD4XsoCzvu2KhhXN433LKpqC2sKzx4tFGGgTYV9Hzbkodf009B7HBHpzrDp1DCcvOjjepyrBaQ7vdB0N5ZbOObBasCxeeZrIDAToYQq/m19btoSmBTAxs5vNNfk8DhXGOxjbYNaAEOURUvXfhIh040qnieBLqOkjiMaiWiqj72N8m8BMELwzhQVd8Iy4M/yjWlRiS4X6QmewB/gSAtHR5YSvtDpPZeCHDfTgnf6PsRKCkJHOSBZOHjTrOyTyh7neUWWldLy+wiwoD+3oYSi+Ix5myWnuLMKObAnltehd7Nmd60HbSdgvGijPcfygtnwc4Q3Z30kcIg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>rCICAca3p4XSheyVGffb/jY0QPnXeQweT1oRWzAlO/v/OteyG2j2ZyeoT+S62od2uQtQ8/xCvSOz+Kdj1X8Wp2hOUasz1+U+XdGDRRriJFlkstQt1gZdoJSToeYvNj64u7fOk2OgtEeKWY3mabJuO8Jw/SE76PlL172J7bYT74EaCJ6kT5THfr2PMoBzo3UGPWLcYCVW3FPIUWor28WqIcSrNyRZJ9+AaNjYuguGu5/Ho+Px23SepUUcNmUX7aflpTrRaAPmE1P3xjbbU5b/+PN0t7x4JaJr6IWD5rXqOU8=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>wzSNdSSsqwXxK02Fd705NYct1Ov8JBMNcK6Of3Dl3ljl7olrr3CCQPyPKpvv8QJ0/TM08pTSCmCijkzHslMEQAOG7MtKh4LDlfSjX4MekYuchKaEK48jkhHeG9GzuNCe4wpC54H3RjD6cd4tCENikMx/CguivarupRu6VgVGfS/gRHUyArXwH/wKtXLAAv4eFOwkwZRQsoC4J+QaH2XgG4f+SZyl3TqBk9qkc4E7EBlNbIQ9w+xppr+NhtdL21PaO3ID6IC7c6rJpiBKs6W1XhSr0wnz03TSltH3BKfggUdeSRnogdGYVWYnSCi1iY33EMDp2GG/2nX6IO72IM2h3EifC/LObORZvYhRaGESxXYy5wEliV4b6Z0rP+CSzVUcx+Z9Nsek9P2LbnNkt0B+R43GQmlhPRp1+gTSgfGx1XQ=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>ZUzH1OBrU4xzm+vFax4HntQarcHrgB9qb+b/IojVzmGPSkfRl1wWifNOo60AIEcgXpNeA09C8mtbn3A2OPoyyw8SdGr/Wa+flfMBo+ata1RQyZGeotUiBkEi8GWZj2lu8Y6xPU+26nUOuInAPhgLKp/+FCyom6l2VXf4ZmLhNLZYaNe43HXqMCjJOHoAVZqr</encrypted>]]>
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
      <![CDATA[<encrypted>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</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ItemCode">
      <text>
        <![CDATA[<encrypted>1StPJ57rSiTfiOLdWEArTIgScQjd28HwLVMd5GxjVfkFeISQbpuNbf/uuI2KIwAQ</encrypted>]]>&FixedAssetTable;<![CDATA[<encrypted>rHwzdAB0kVYNdBVMF7dDmvTig0D8ysabQfCiF7+EN3bkdrkHy2fcs/BG0NvHNeUdjIYZ6g5wKMTFp9XbHo0u/8g+DW2JdY8FpCm0kLkTjQmC4Aj9HfiEH1OZtxF5ua+DnTLMDOwpHMK44SOgMNgDvKeDmjrG7R1hW4cwHweIbTk=</encrypted>]]>&FixedAssetTable;<![CDATA[<encrypted>Awp/gHXewYkPbfxx/8c/vaqxVQagMCqX6NLiI1+OVm6+IMfUd8pGfTSFRMqS00ISZjWzYVrHFKSKtEt3JMyE1WLfSI4M+6UXwvFKAPKgtc6c6FhnTkHhM0W1Kpf9NKNN</encrypted>]]>
      </text>
    </action>

    <action id="AdjustType">
      <text>
        <![CDATA[<encrypted>zidG/EJFxYtcAKEp2G6QOj5shC1c7Au1rEJCzZhf/qG13m28Fmq8uHzApIekj+YVe2Wt95xKntS49392kDVGa5En1iFPKlmW/V5UFQcLiYJ0iMNaVKC/BTfocx1wAMQdcno8Ho/y2O1U8PJVVkFmnV2+oFmaqlSgJ8jR+o6nGi+BPl+ISE2muplVBQzQHVMh1a+/A7P1xzyYjfAuWYLAEw==</encrypted>]]>&CreateStructureAndExecute;<![CDATA[<encrypted>NvOY7ITRQY0SBizfS6nQmUok532ZVBNwHFBhL7hwhxgRCcjGoFWp6JHkG7+PoygI/ufro9EuRgDbC2DFDNwmhf+GVqPbgBZgE9N1XaMC1IHHQpAA0XTnh6Tl12f5rnJe</encrypted>]]>
      </text>
    </action>

    <action id="FormRequest">
      <text>
        <![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN75xZjMgElmNoxHL+LXzERr97iZ+F+qi8zYHNyV4WAcrCU6To/luv2Dyl4FHUTpFTcPbCmv3TkeQNHSmzFZfo9lNVkq4yxsI1HdibLL85UPX</encrypted>]]>&ExecuteAdjustForm;<![CDATA[<encrypted>JiUeJNu1rmO/VTs4n1j9qsqr7QND1JWdVNkyBf24tnU=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>
