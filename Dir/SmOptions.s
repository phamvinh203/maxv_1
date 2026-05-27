<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="options" code="name" order="name" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Tham số" e="Parameter"></title>
  <fields>
    <field name="name" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_phan_he" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Phân hệ" e="Module"></header>
      <items style="AutoComplete" controller="Module" reference="ten_phan_he%l" information="ma_phan_he$dmphanhe.ten_phan_he%l"/>
    </field>
    <field name="ten_phan_he%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="type" external="true" defaultValue="''" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="descript%l" inactivate="true" disabled="true">
      <header v="Tên tham số" e="Name"></header>
    </field>

    <field name="nor_val" external="true" defaultValue="''" allowContain="true">
      <header v="Giá trị" e="Value"></header>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="num_val" external="true" type="Decimal" defaultValue="0" allowContain="true">
      <header v="Giá trị" e="Value"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>
    <field name="cmb_val" external="true" defaultValue="''" allowContain="true">
      <header v="Giá trị" e="Value"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa489SnU5BI1ykTjQq/YnLBg1ejzt/uPL94Jqs13fKxR/d</encrypted>]]></clientScript>
    </field>

    <field name="stt" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="val" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="val_view%l" external="true" hidden="true" readOnly="true" defaultValue="char(255)">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="160">
      <item value="120, 100, 100, 100, 130"/>
      <item value="11100: [ma_phan_he].Label, [ma_phan_he], [ten_phan_he%l]"/>
      <item value="11000: [descript%l].Label, [descript%l]"/>
      <item value="11000: [nor_val].Label, [nor_val]"/>
      <item value="11111: [num_val].Label, [num_val], [val], [name], [type]"/>
      <item value="1101-: [cmb_val].Label, [cmb_val], [val_view%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kohvZ+IN+lj9PNFIPoO6jWDUpGQ/bx+F/dkfXeXAGYOrdeepJVrmpDTMd+gdvYrJnA==</encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>ZDjo12cjSfh9tTUHx217I1z4v7S2q0tLn5T2CJQXkCP4bUoUB9m7aZU8UFjsGpbI3a7CvrID+g0EvqrADGYpzbsuNv3gafkHP3PMkeEtdAhT5hfeJn2zcbbg8Ry79LIre1icofbQr3bmgIXQ3zEj43azmypH0NFskvwAMGYq8di2ZiVt9m7npq0ellpxQCACPSmmVeo02f5uqZV7ldHeRIoT3Y12C+QPu8afGiqYt7bIpvKK18TrqyWK/XSvgJsCXs/vaqkwVEItQ8rtS5jew5p921eK9Hm8EV7EBtG8Xc45cPMUb99b1qKG1Yh8wfl6buDQHAD8JzlfTPzuUIWYT6H8RTZijEQNAGaMnK/85vmtK5nDAxVIJ1eUBh/ba2r0pSdB1m9Y9XegePM1QHyRfZnnlA3esb+lLOYwRJJqrNI=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>XFogn3sFF6JdTlHwq46xS0Sniaw4ZIDbCMzKKjR3Z6JoDNrm3ej90HYYxP7ZgHvQVNgcHM9xdlO2UWTpUQVISSvjBHNtILkyaeM8qKQ4OrnBqbcH2mpXG+xNnXu/FdkiI1LkHR2NqN850MZ6j0docUa3ywfHlroxsRldaiZXzXgqdC4uo52Y9kwItjptQrxpgEB+FiMq6ZBrNzULknfR4ZA1s5Ll6Wtlt9FRnQUvB2w=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>BVNPP+MeP1xEpMNal9YTC/AptUuooQDAyU4pDmFlqc6PWzWCWaAYaicfiL5N5/giPH8bR1wxayoyPuUTQuJa7kDoLmm+0wy9Sz+f2S6WxmnrvS8bgF6q/XiWYCY88ZX6HvPkVQukNc23miCBh5yILypTFuJEdPNA3Xoeemuz5wPvymmd1TR2MTxcOCeKxXIHeexDGnhlwUxgaavLk0NYew/M8IAelKcZhq70RRVm6c4pxUcaLe+Ut7KWeUliiKsqnzBI7FkAk6vNcQ4ETrVM1xyOEI78oHnZZTYEC6a8GeGwnRq7hdsFF0kn66ZmkJajAEUkV7t5EA5GrK2d2NRb8EupUu3znFi6u9byUmXOxQbBmPK53ss4oeDsmEaJBrNgbodAODSSBiiQI4kuoJg2V+skOcPnip1fmKuKmqyojuh8ztBuk9B0+o76+RoRBcdW9d6BCfMqMl761hjQ5mqKul3Ov6sZqFvAsVw4AIoamhXPquW/RNUkgDaoTy5C0ae2fQavMwwgIIW8pu7sbBCN4i7Wdr0ABVsylpPxlGhvogpYMyYGs71rfYj+FBiRVUFWyAW8bfGTUfU+yL8xjLLs7Qno5GEYaJlu7iBWKp2OM2f+9LRgAugzAQiwcjExNcaozZVJGbZEIV0UL8rEpRmXIR5+yGUmy9v/i/LYHt9XZmLQonlaEGx5Dr1Xx+Ab5TBQnlnyzAT5qbV9hB2r7zajkwDKE6VlDUMqPjF1E3yuNrrVA8vRozVSJaYWLZrrcgK4u3UuSofBWnPFmP7iil4JXawRSjQkFQWduKSoBclWZlH+NQrPO9HUdIyy5FeBWui34v1uPbeIe0zi5gRS18gu+CyjZwN99TMtCtYoeiZxzumkF54sQGLAjoCmlIts4wmKzdDlmaScu9bkz+6a2FWaJPlcdO7Af2Lg3+45B8WVltwgDoA2KUy5UaTw5OoAFKcCZswk0IyDYp9ZcXy/QP6CW4qxH+LUPAxhUx4eCHUlp0YkgkzoX69nbitJxwgkQyEXzN9SROwO5Q9HvQeMPebRMk5MWnHLOK9GdnYaNxF2sifpBT2LI4eACU1Ta5hzN8bP6+IJTM3hCqkgVLDUTRxbIHEcCcdsSurHHE7m/GadbOE=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>0gV1vMB8L9wkd2C9+6JGT6w2ajwXwxSfJKb8FyOaC42RoOmHPUosvTARRm+6OIZsdpcbn841FAJsmrVkq7+fSin7oiN1yfF1tSj4383fljOJJGHDKnn82rJhGev57ta3ng4z4xAsnthiYWKn7xhkr5W4YikXcbh3l/5MM3bv1eaK4SoDnK7L4U1eKO0HWREFeo1fQLN8nYyR6bO79roLNHzN7ZLBpcmyim8MYm08UDNuzYrKl61YBEK9jOP1/2Ej</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>QFAGC7/U7j29rhjqy+WmFzWM0drTZUfxbxqGbpZwmuWaE0GHf+Ds+Kl/4eKuQ8vSaHxlmJ92Py3h0Ec6UkPxlTXvvuZlQ761akvb9SbrmWFsoggPDILXLAnph5AyLZUj24g+PSv6nA6Tmt6diQszz3m1ebAq0DGDP7QbE7QZuF1A1NARDRXB0hWa8HO0hSeXbEose40enGdBaRNMId4Uhzc7/+0uegxHaEy7y5YEaasRJxEnYtQ2dV2LZeqIKFtwGGgKoC0xbRrBByOCN3Xz9MVCYd3r8ntuyFeteBnZa2LnvH/S7Z2vCWZ3y//1SeFFoMm9waT5FUqRM5w9DNykycU7gBm95xviF4zlmBTpXgjeTmAY5+rUKIoVD83x/CpwR7c4ZThWFGXJyrvN4l0TgHLlAPH5pys022lnoxewy3xJxAZBJ8PtUfEwq+Bzi5VYZ4rYC7jCS3PCAGxigvlPTfRBPP3zN9q2K+aWi3MHA9AGOSIQjUKT2bwhA8VkpdNh9IsUOr8cWGtwhMpEbVZcaTkmFcnj4j4r04J4b29wAo1KMgbhr0kTb4k1ABef5K/DUcACG6vrTv4HLEg7ki0UD77j5dleSpL/noi3fyObyVvjqnvhuZogsaxkNvj/soo6lyGhxk0fovTN3kFnFFPumqKgCsWluVfLE4e8sVtvUl8ZeGrYMo19xivUEOPyPReDeeDiqgJJ4GAG0V0AndlXXFBKu87yufZjwOUeoTAK4Sb21e77aFGXGxcSMP3b4DgBd2TCWX2UC85QTmZ0fbSg+w==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>
