<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmcc">
  <!ENTITY ExecuteAdjustForm "exec fs30_FXCalcValueAdjust @so_the_ts, @ngay_ct, @ma_nv, @ma_tg_ts, @nam, @ky, @so_ky_kh, @gt_cl,  @gt_cl_nt">
  <!ENTITY CreateStructureAndExecute "create table #t(_01 numeric(20, 5), _02 numeric(20, 5), _02_nt numeric(20, 5), _03 numeric(20, 5), _03_nt numeric(20, 5), _04 numeric(20, 5), _04_nt numeric(20, 5), _05 numeric(20, 5), _05_nt numeric(20, 5))
insert into #t &ExecuteAdjustForm;">
  <!ENTITY CommandWhenFixedAssetExternalBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeEdit.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeDelete SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeDelete.txt">
]>

<dir table="ct&FixedAssetTable;1" code="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" order="so_the_ts, ngay_ct, ma_nv, ky, nam, ma_tg_ts" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="điều chỉnh giá trị CCDC" e="Tool &#38; Supply Value Adjustment"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false">
      <header v="Mã công cụ" e="Tool &#38; Supply Code"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l" key="ma_dvcs = @@unit" information="so_the_ts$&FixedAssetTable;.ten_ts%l"/>
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
      <items style="AutoComplete" controller="TSAcquisition" reference="ten_tg_ts%l" key="status = '1'" check="1 = 1" information="ma_tg_ts$dmtgcc.ten_tg_ts%l"/>
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
      <header v="&lt;span id='idf_gt_da_kh_nt'>Đã phân bổ nt&lt;/span>" e="&lt;span id='idf_gt_da_kh_nt'>FC Allocated&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_da_kh'>Đã phân bổ&lt;/span>" e="&lt;span id='idf_gt_da_kh'>Allocated&lt;/span>"></header>
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
      <header v="Số kỳ pb còn lại" e="Remaining Periods"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_kh_ky_nt'>Điều chỉnh pb kỳ nt&lt;/span>" e="&lt;span id='idf_gt_kh_ky_nt'>FC Adjustment Value&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0">
      <header v="&lt;span id='idf_gt_kh_ky'>Điều chỉnh pb kỳ&lt;/span>" e="&lt;span id='idf_gt_kh_ky'>Adjustment Value&lt;/span>"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4+rnG2Sdpwy8Ia/4j4mVwNsJkbHFmrc4Uw8yqcNGBOlohTKBIDA2O2B3LOnjArsXdA==</encrypted>]]></clientScript>
    </field>
    <field name="gt_kh_ky0_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" defaultValue="0" external="true" disabled="true">
      <header v="&lt;span id='idf_gt_kh_ky0_nt'>Pb sau điều chỉnh nt&lt;/span>" e="&lt;span id='idf_gt_kh_ky0_nt'>FC New Allocation&lt;/span>"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_kh_ky0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" defaultValue="0" external="true" disabled="true">
      <header v="&lt;span id='idf_gt_kh_ky0'>Pb sau điều chỉnh&lt;/span>" e="&lt;span id='idf_gt_kh_ky0'>New Allocation&lt;/span>"></header>
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
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ksQTIyQXOzcu+uafi6siJp7B1YyYwj6BnGeWevFEEQZ3uMiUSg4QiXr2WhD6Q+iyw01FLyKT+3wwCH3DVRWyhRk=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>3Kl2NTbw/jJproimB5KZfihthkw0frXU+eiaKfa3uzS0T+FmxWQT/7x2fskbLwzlRfmUj6URhKiHWmlyn1zDXO1fGKQigV+tfyBShARaZO/n/+ouqMb9mpWjt8hgtGN0+9xAavPWugR8xHVTIEpp6u+Q4xAjMmPCKtP+29s3yoS89saJwTAbW2V5xW7VFwVG</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Yn3xClWqOcYoqrP/fAsE3NDrSPF5Ghh446Q5pRe7XcS48B6lXB0nbSwegqozRyLmA==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>rtZ1DnTlQh8PQjr2pDa/63C/gFthM7wG5orDIXxHsX/5NRu3nfHu1FzbNr0dJx1pHqQCXQLsFS97Clv4jvECuqM95S0c4Voaevj2DYYv/tA=</encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kjDEQ3kCZYIzXDrbWrsMmh7+bzGDGaSI3PWmokkUbaiKg1daUmmSVD6TEDf9Fr7iJA==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3ku2e9kc7KEP+L7HOQ4+70EAbTwPKKN3Xa1QcF/fDsWta6Ye1KNNAqzf2QyzCYKKGrimZG1BGl7efkFx1xMEW8Wk=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>61dhTeh9FhNBZdJyGdYvsEMdMOs9KPU9Ve1jL0735tPudLQFTyJHCcDb8XySehx/JI7g32ZMf8xG3R9D08IhMNhO79agqifeOhHOrdOYBguWsz6K2qUdCnRtoNoQNcb948ZaoPE4gk5IIOOXuQSVr/XOcJ618OwyrCb+F8nRDNyuffBVNLLPzmnqjOznuAMM2x9CtfvzF+vo0oI7LXi2Y3IGeE//YTpb9suIDDQMjk6wn117twutpuovD3oFjUSU</encrypted>]]>&FixedAssetTable;<![CDATA[<encrypted>xCM+Pn75ktMlpflTnNiJZnbSEidpdajZEqKarLUR83C45RWpLwkE1ZkAbfgruH2dw0dJjXaZXzJfOnX6Vjsgmv1aE1Xx629GD8h4Zh33q4wqoHN+uIuhldSyVQJ8STCivJ2fl5lcIcJNMHeiPJjndcoKo1u1/Oz3+8n57VR6ubfBwF87mm5ecbOEb/wYm1BF+6bufCo4igGVLZv6T+3E8voSnP3qwgtdqKjLYhKvVHVK43eJcr3uZXh4xcr8p6eTkzreOTQoO8PnwR9SCD4J4g==</encrypted>]]>&CreateStructureAndExecute;<![CDATA[<encrypted>Da4eETAf1XJzhiR+VvC8wVZI1nr72AaCpIiv3+l+e+kxUBrFLWrZkAZQbN8F4MdAJ5aO57xdjx1suwz4O5RvzN0kHaOBJv699IhIP/T+gziWAPFQF2HvXNK2Vvg8ZM3P/A/BMcQoGLic7/x4WuwQkZ3xJtZvYrHhmpraFJK0ppbILFUjp9r4zLmPIb0u00ku</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>UXi4dLVbLA3AUnbna2/Tz4+cWRlHAW0sGoufBZ0aEAADHhCZEo7etAtbH9DMjNZAfig7EBHR/eZqdP7CDwnPzcYnZfiP0TRMJ/KfXYiDlHHYqexOKISWxVIuUjU5Ue7unS5OqtUPxhglNuBThvYBwf3OCLCCQ4ZifQlaExP7khJ+0HvsBkGOqC2uqPLF50bYpxir0P4Jr2KeYHe9mgbJLRwJYTAY5y03+zB8V+b08dy0RA+c3h9qphRztfJE1oBvq2CEj2OCjefUXFa3OyosEPN6rG5G9zKe0DWvQkNc3+a9TyhnneEslnzPnPR17ytpsrRxgPoW+dhHP48UHW++350bb4rJC/JXQWrA+7sCifMfuky8/X+XhkBkakLYyVBZtAX0MRrnk18rpJZ5vDHiOJGz5iia/CDdvVAenO39bwBDbSNsTSmfT3pCctDrO0h49zK0WP2/Z0LfggSr/NZ2KlIDdbH4x5Lw2f9hSEAVzcM=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>rCICAca3p4XSheyVGffb/jY0QPnXeQweT1oRWzAlO/v/OteyG2j2ZyeoT+S62od2uQtQ8/xCvSOz+Kdj1X8Wp2hOUasz1+U+XdGDRRriJFlkstQt1gZdoJSToeYvNj64u7fOk2OgtEeKWY3mabJuO8Jw/SE76PlL172J7bYT74EaCJ6kT5THfr2PMoBzo3UGPWLcYCVW3FPIUWor28WqIcSrNyRZJ9+AaNjYuguGu5/Ho+Px23SepUUcNmUX7aflpTrRaAPmE1P3xjbbU5b/+PN0t7x4JaJr6IWD5rXqOU8=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>wzSNdSSsqwXxK02Fd705NYct1Ov8JBMNcK6Of3Dl3lj8H4U3ldi3HgJ6Tsyh4tA2ZRpm8/W/3aoTUOpYYK8VCqO97IawEDxesaZkR1E+6/BG+vYCn/3BkIXa95YvsRWzEU88zzBPWi/gAmuNYF3hVb3Umi7VuAH6T6Pog5jflIai6599GXbtlfH90H/gb0PGNsmPnW1DDU7CdqpM2jw4JIeqnMyNfOoJJuXpWUWPciyhV5p1oMRWv2cL1okh/qwgCLqt6APRrFN08EgP17vhR0HKDkA2yIcRkvsz44C5g6zDX9ZuadqBTT1IvaPyK6L38/+JCUYyoTedoFNJZOxG3xeFu8HavCsqv31LZ4wj+zPt1ebaAOIaMCT9MDrNDMY3IFrwKVltsw0ZK6nZyVffbXW9/ecsPiBzpc/BZUbG5VQ=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>ZUzH1OBrU4xzm+vFax4HntQarcHrgB9qb+b/IojVzmGPSkfRl1wWifNOo60AIEcgHDekK01lrrgeeiM7j3TptqsNQWuKES6ae6WwxE+BYDXcIN1jdxyAHRNz92UFf8VQl9mR/5qonbj2vIJ5LAOz0rVTu9+HZ5iZq+V7hiMehx3YE3gYcHpKW0T6esSE9XTg</encrypted>]]>
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
        <![CDATA[<encrypted>HK/VADZ7GkUNXnEHrqhoIEhefUNPjA3ott4wNzOl09uzjQM7k/qbM9U3e6WPYXwzWRpITulXpLTFnuyzWPc6gdzKJBcsxLRdKgzJWWjUVIZiO4OjvclL0EjF++DVcvdOysFhWK/+IBWR/dvzkWQw4ztMrcgz9fXukPrgB74Vsi/tKfJDOQWDD26adnJ4Yxf+XkdWqtrAETgfKlDsZZmMKA==</encrypted>]]>&CreateStructureAndExecute;<![CDATA[<encrypted>NvOY7ITRQY0SBizfS6nQmUok532ZVBNwHFBhL7hwhxgRCcjGoFWp6JHkG7+PoygI/ufro9EuRgDbC2DFDNwmhcCgt/SFCuLf/4efbw9SWRPQ++JeWFlf9XZGVTitYOhs</encrypted>]]>
      </text>
    </action>

    <action id="FormRequest">
      <text>
        <![CDATA[<encrypted>rdileVdzDoIUgLVYgC4fN75xZjMgElmNoxHL+LXzERr97iZ+F+qi8zYHNyV4WAcr5vWAGSoDZ82LkOkGMyWT358/9b9HTR06cdDogL9X9C43k6w5r4N/bZZ+pcwEImTR</encrypted>]]>&ExecuteAdjustForm;
      </text>
    </action>
  </response>
</dir>
