<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">

  <!ENTITY Identity "ViewReceipt">
  <!ENTITY c11 "Phiếu nhập từ ngày">
  <!ENTITY c12 "Receipt Date from">

  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">
]>

<dir table="r70$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Xem phiếu nhập" e="View Receipt"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="loai" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Hóa đơn trong nước, 2 - Nhập khẩu, 3 - Khác" e="1 - Domestic Invoice, 2 - Import, 3 - Other"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>w4PMMhDwbdhdLsYtYCOa4/sXrGZ8F3Y0hIUSLNU5vahz15v0zQvJx0N6oDNgnqPm</encrypted>]]>&Identity;<![CDATA[<encrypted>1Wj6W7HHt9HYmmZSa6sDUtlKbPMa0Kln7W0JulNM9WDRtW8CBLhqoRoqEaJ2w6+M</encrypted>]]></clientScript>
    </field>
    <field name="ma_ct" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="true">
      <header v="&c21;" e="&c22;"></header>
      <items style="AutoComplete" controller="&Identity;Lookup" reference="stt_rec_id"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_id" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 100, 100, 30"/>
      <item value="1101111: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2], [stt_rec_id], [stt_rec_ct], [ma_vt]"/>
      <item value="1110011: [loai].Label, [loai], [loai].Description, [ma_ct], [ma_kho]"/>
      <item value="1101111: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs], [ma_vi_tri], [ma_lo]"/>
    </view>
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>UXyMbGZKMy0VptlAzQIdG316DJJfYxbbvwpfquwTICHLab893SMyUYrrtU3dXDkftx9e/ynj4YE5TNJ1rwl/TEVrrarHfyDszX3PAxVhBQWTyg73ppZPZAoaz+WwLGrPcoaX42/X/gb/nxH8Esv2eRZpiAPbfQhM/aD7QCXuVVefGR6/6en1S+FsfHwThv39bTf8tNv+e3M4uhrY5RcUypbVNY9tdHyNRTWelrFIXupBmFyHtjDbBoaYtX3HSeeBW5ENqB7bSncdGl3Nhip+NVXzLiGS7hsFdpkcM6X3dEWJDBrJ7T8NOxCE+HmCSKwRffW2qlrCYHzLPxZjRo+4J8DMqUFuEpwUccy1ZD7VXNEB7UYDjfD7OXzgNHoUUE8SznPf3auigGCmFwF2NA8LViKMAUNbtbPIwYxakZlfmyDctRbd9THSKDA4WxBrm851MPEiQ0xHEayglJ1TUrkvVHMAeENOe9F6pl52GGqR8nlivkNMy3qIPT9aoZTueLyx4TabZmVXhRzp+Nos9vxAguXLKqVgvwMafRsuyNaxdWj/HJRdZfu84B9+H5Y46njMbhjPFc++S253S06ZfBWVPI8c1xv69sO7AvTqtN/ccb3aCnW21wZyUKGCy+ZDjcN+jQb3tKiB5OjR6Hg96ZcXSqOoR3znzhCO33p+ugrKgDYHLI1bJeGWnrI9gJtqPGERiitYZtXvTtqDT/ms77aWjkRMPIkCvP2WyHbkFS3oMChG8Zuy7xyFMxthxwuiTtdmUVKgnRckK7D0Tq+u+WnzeAAa7uVSSPRm3nNcnYiEhE9PA6OfDK5p195Cv1NJolYtev4prdlGdJR20uNib0+s/k7GkW9L9y+u6wYlJcyH7EzKCqC00S8Md8dc0u1u1JQyGuCmCM5oZTGIGyvwr6Ck0AHDHpXJQduCazoW+MLfsemcZQ3MuI3Nek4YwsVEM3M7gJP8YVirNckE/c6lmh7XuP9EjxyfidJiK7+N972GX0MB5MJyPKrUsHVf0VZtPXm3HYNYLtveP0x0I4FzznbBkHDGkIkYJfB/+oILKiI1HCGWyI4B2sdCqfvL9innSa6zZCgDrSYiXdir02qNC4+dbjvbTMIr+IqoGwtIo1xP0FjrpkBckxeBcFeYXtjXrJo384yT9YbDd+iy6eV7INEa0FSlG5aghoOXpGKspwr3Uax+xpXScd2IO3+ZgyBSaGyuGS/z7Lw+ded1772KhulAfsyuQhdcnpLxsjeYBFb66Tdh59Yi1AOAANdE+vgCOkmJq8Jt3muvp5OXOBZT3MbuB/Mjpp62lzBQP2lWJB66WLXuxaqubXYEw/XVHtaMf4Dhf6O9XN32yrJz6eIdPm36p19Nwk8f8UKMkTBwvxBfba093XA8yM1r1yEZq2K4AcNhl2hFpmRBgkXdVkll5d0HnIBoLXtwa7dlu/7nvPkQ7mp8DDQLwBUIgsUTFXhKflhay/ufEpc6fRsycGswf9kyPGdZU3JmUF+OGdHo2AcP0B0Feogm64+jk4Wmz/QgQIar</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3Yslr3kAOTJZ9XfZekSm0O53YPMovv9YBMavkkZRmkUF3xE9ATvYGwtO8VjDCVE+tIy/9pGyuYt8YJScUVzyEPWvuPkcU0GtL5LX4tE0bYRM</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxs4Nt7MSIEsnM0ToyBWvgfyczUvLt9+JtABUgeXDkoW</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3UU0H7WdFatSlDVt7FgZAZuYyPDSX5GCF4pqIbXs5btSYTlxAhIsT3zY3afQtXRsRKKqN6pxHuWnLfadSry7ARCtG9QZGCQnzU1Ddj4dvOLb</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3S9woFmylORlfoJYguxfbB2gbRHBZ2yN++lUfSAZOrDJr5u1zYMRc4dn7617b+6lUbNUoymlKW5+BhUvK/bDsRxMnrGT4YM/ytHa/RjTDCtlq/MOAD2CdYv/SkY0dphoLw==</encrypted>]]>&Identity;<![CDATA[<encrypted>rg/YSKhwnmDH9YmxdoVM4AlmOudQBs6ZEPrOTqPjKzskZvfYyVEj+y8Ql0dnKnAH7bROC/b3NnDVs2D2ZLw+krKE/+Vm0kbwFL4MgvDTM9XKVyGTACGwknX/J9/MFFagw6YTEaiZR+JPCXFc4TK7nR05d4aP8Jo67qurQO2aN01L9BcxJerbevEjmgnbROxl6YnyY9ym/FXkHpubLHIMJqMwazvH4vjU04AU5dYGhrSnf/2RWIkHl/siXs8XFXuFMcDDPUubLktX21m7g09ZY/m1s9/CHJK+DpHNMc5GvthzhM7ond/FG9VW2wxswUrjrEXuGwRHsYR348Ms1N/rkWyaLrBvb3WHbsUdyfR7mQEikq8BeYSVPeEHh2oz6PPlYcFbODuT9eIoFSQYD+4sBAqKqpdqItLN7HXKv/mxTCHk7FaTSQktMtbDJECP+fpbHVObnewemEGroJM1zttEgi2O/oTYMMAmSLKHuVQXQVLO2WJqpAFZU32mv+9rYAJA</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3agMdIIKEYOA9pk+HJG1x33VKTWa6U50ojLO7eDzBnjQX74/b3RIxkfibimVMlF7XQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3WyemJVVQNagCBJW9G5iFTXu6eXxG7XRzLjFHeuv3aFZVi3TUZoRR8KPEIEJII1spbJd9N/cYg8lUka/Z3wFw3Q=</encrypted>]]>&Identity;<![CDATA[<encrypted>FjXMeA2aQps45V5B0rB5C9yamx1fMwaG5MbLpIEmqNnDwZCDjEh25kZLhki2s/c3qArEO+fv6eXnJasZtAuBGBeZFqVHL8PH8H4Ixf2FF+AvWIyVyic8SpQ3C4MskwOK/R50WtPNmckBfkLqZ8tzxf5OG/g/3PiQgpYklgxjtITyijjjN1qmi4Nf2SmE6DlczJp0iSJkwaMjSdRlpwd7ZHZN5cwTkQxTYQ30y5xmRZJLgqI6mHIgy9x1q/QBMQ4cnOZAFtiQ+oK3RwwIfeP6BWR3FljY0jWozpfHHUMobwSQcDhXAIlTeGcxcKOaIslJKvI7kkPQ37AxQcU/eV6MgUy2bWRAtOYjXwXn9Fea83eAVdSPkio5RnnxN9KPi93U6WEsWJrBQiVS7Yrm6JAI4q29Gox0hHiJR3a88ge4PGteerxXSu9MQWOR88iOpacPoYsatZRqXky94aB3+vEGrA==</encrypted>]]>&Identity;<![CDATA[<encrypted>qLH8w1KhKIMplIlwVoXM2YB7/QKF4MpyS6JBFLajuuKXotP9//8u4ijo68xu3EsExtu9IBh+EcQXgfd8CXfZNWD0NrAHyIvUYE0E8whaHRDnmB2NdTYJbixYL7yiNLi6qP/zsJecDWejGw4x65rD5eHoJubcPvHacUsHH4Ts+BTx10tF5nq0rzPpWLHvkGxoe+Gx/voKNafL+yo5YhjskfJBOtukVKWPxXDqDxNk0/I=</encrypted>]]>&Identity;<![CDATA[<encrypted>GnAonZQgs4Ui3FW+a5yRHYUBw+w+edQa8ne79wTcC81/A8MxX5hJsnr3Vd8zUnvzcS0eeMeKt1Duzzm5f1KyQQIcDTGgHO9vq0gO8s8+cajdOJnO/kPQUB2otgY7fpUbEwIDUZ/+LrJC3QUaLUi+D20Sr5/tX764+10bIHd9WSI2kL8aGWla1qSXL3QfiT4ASfDF6voToyaPrtSpjrnFgWbGYKhLVYP4kU3nwrUnjgL7Ej4QRXR0989mMJN8hRHb</encrypted>]]>&Identity;<![CDATA[<encrypted>FlpsQxVqe+rPA4abnMldn1h+sbddyAs/RTYd5zI1Tx3Blz1goPtFAu3XIY51qLsxhnJMSyGA0ki4fw2X05IkL6zGQlXphnS1hb+zzykj1Hn+siQqwNB5699HocMuhMNlRP3DV4X5ZzVS98/hroUKqpIzSEGhahMGsiWdivetkuYX9XJaQvBsvOYcbezwfHUKgO5ejj1S4RRXPtbBQQTWItIef93QG7UL6L2Gs1hJX0fFYTk7N694VS0cVRp3T+BeDrAqPR5BX+TAJ+9UD7ToMykfWpwkhBWGQmeMxNdbO2AWRjXEWGKTIcEr+nK85rYDzQdSWE7/ggQj0RvAtwIngd4AssZ2m4FGq5e9e5ACUGzbwjCdoz8B182wSwtdUUU6</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3UzK0nu7Ot5xx3D+dKPw9uvadmR1TQJaOhnlQOkjFkq1nh2mcTnBNmqsuhQL3HNcIQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3W7jmjwuxSqeOoCXyGt8HINDTOq4FrO7kI0D0QlnbXQ+LsgI0ZsTHRH9pb6qfGSM3kSfsKZGLWR8Eglw/xMVxvA=</encrypted>]]>&Identity;<![CDATA[<encrypted>sARIHaPnMI29CTNnbTmV3fHLh6ySS+DPLHgwlYfAkUcCMxSCJ2UELh36EOIpeBLNbzztMtv3n9b8iZuNq1tBTbGFz166CNralAOUm3XiNPkKExUcFdFvtCwU5gsdqEqb</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>Xz39Qgl8OJt5KfAQ7e4frxx5NkDHGc/7MUVrJuytsHXIYI8dnlBN84qEWf9lCF48hB6V3dETAiTeoqy5Cn7TKzNipLff/7Si3OsIKpFXDtRuXEzQsh4HWr/i7qJyCjJv</encrypted>]]>
    </text>
  </css>

</dir>
