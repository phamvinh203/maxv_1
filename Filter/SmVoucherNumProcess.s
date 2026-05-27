<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate4Unit.txt">

  <!ENTITY SysID "SmVoucherNum">
]>

<dir id="0" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Cập nhật lại số chứng từ" e="Voucher Number Mass Update"/>
  <fields>
    <field name="loai" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Theo chứng từ, 2 - Theo quyển chứng từ" e="1 - By Voucher, 2 - By Voucher Book"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_quyen">
      <header v="Mã quyển" e="Book Code"/>
    </field>
    <field name="ten_quyen%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="so_ct_des" readOnly="true" external="true" disabled="true">
      <header v="" e=""/>
    </field>

    <field name="ds_ma_ct">
      <header v="Danh sách chứng từ" e="Voucher List"/>
    </field>
    <field name="so_bd" allowNulls="false" dataFormatString="X" maxLength="-100">
      <header v="Số bắt đầu" e="Number Start"/>
      <items style="Mask"></items>
    </field>

    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" inactivate="true">
      <header v="Từ ngày" e="Date from"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" inactivate="true">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_dvcs" readOnly="true" inactivate="true">
      <header v="Đơn vị" e="Unit"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130, 0, 0"/>
      <item value="111000011: [loai].Label, [loai], [loai].Description, [tu_ngay], [den_ngay]"/>
      <item value="1100100-: [ma_quyen].Label, [ma_quyen], [ten_quyen%l]"/>
      <item value="-100000-: [so_ct_des]"/>
      <item value="110000--: [ds_ma_ct].Label, [ds_ma_ct]"/>
      <item value="1100---1: [so_bd].Label, [so_bd], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7UslFxKirJQ0SavA9CLMWYQz8zB5qVIt0UCjSFhlETwc</encrypted>]]>&SysID;<![CDATA[<encrypted>DPLpk9NtejFvjj/UDiVHgrHbF9NV1quYsMlDM77J7WKHZ5yjz53YZb2zVGBlJv4SXQeeNzlRYtPYMd1RHX+87w==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7Ub/rydLvKFZDMPY1RJY0L8KyO8SSFX+335uEiJnm2Ji</encrypted>]]>&SysID;<![CDATA[<encrypted>DPLpk9NtejFvjj/UDiVHgrHbF9NV1quYsMlDM77J7WKHZ5yjz53YZb2zVGBlJv4SXQeeNzlRYtPYMd1RHX+87w==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>7rR8MVO0wsOrmkDEOWT5g7XdWigyFuNgNvQw6XYDqfO5htxvWimS1zdCZ7nrwaMvC8UVH9JPLhv/AW2YXELmzYsQLOhZ/23csasBxZHO0Qg19jpZG5j0CZaLiMTzTgeRTfZBMKhC3bN+K8S3TqJtZnTJHaS/gDoKzIE1WvB96OUIpGULjPGegg1gTAsakSDhAXEqbQM7m8tjFvBPme5gfA5Fz/UL1i8kzMSixViAu3LyoVbu/sT+R9SDH1Wj7g+qQmOwBK4au5NccdQt5FtTl00LVWwESPJSjbCgN5ZC3RDQNGKR1N6kTRW+6K88ScpuEET/9+qQWr+i+egiGD+k3kNnV9kiyV0RvpKbXAALIDDJua/tD4WNj++7ApayXWLGu3J7BaD8dG3qFtcjkGPmaY3UMa04XDB0sLxMKQrup+MIcIzvy3/Jgbu/VXmhusI09hZfXXezwCp0Ue+rBAKMBHsS707AWvt8nhmXMDHsKud4UUZ88RbceW8vRp2EI2pemdJMCwgcLz2HgNsUV8L4oA==</encrypted>]]>
        <![CDATA[<encrypted>tMkNoEOPDwUJk6SkUkvkGjYnFTjSg7cJNmsCvUS7hgnjQ6/r2yrBnzuN6QklxIzI0uKptSk/TmlWGr1zbSitIrzSq/osT00UV5FZdJbSas+D3xSnEO67dEAfP3Q73e1jO48ICfXBnjnMi9rMyLGqCeWQGC1t0r7gzP9rX3N0EgkCj12TQRC08nXIE8XNk9W1u5hD9E7TPvxlBpahVQt+V+eYIE5slYTmJWQH8tpVe4oiNFyG4OzrVj4zuxfhPKYHghdo8Lk6oPadvfcLcQWndq8gcVmAlPh02zFnSXc7YaWJ7Xx+txipkHyYQcuuN+Y7Ldvy/5aSuUWBHBGnhvvYLAzZdeLtbDL65OwH0Z2vkaKzzK7klq8Oontft+/pOZc60rYJ8YGxQYAdvuPxg3JwwYAdxH6O2CmPtp4pGxTh1hU+1iuEFT+CxfMF4YPKiHSVNS1L7e+paqINNen8rITdAYh5olJ7Opf+FeyfYy3Dv5OvU21HiQgwIOqAsOC6fxvtcV+cFzdSOg9cDTqcKkXfPmQQiJ1GaV3OFKJvvA+4dsxPRKjy6pbquxH/233B/PaWqhkpOhrbCuRsmTfWJpsK+TTTNa8JnsA7MStYXyWB6FJucTNk3onvio362Ihe6nGHgXiqqcpeJnTZ7HGUzCEgqg==</encrypted>]]>
        <![CDATA[<encrypted>cRusGOGP8pGeTQAGv60IAAi4aAtKqiBP9nlDi0v63570PeZSA+bLAi/YML/cdYGQzmJSbURBIw0WtuQSeHPMzGhZmrgM1BjCepYKssA0mof99KG4TgaCw0ymo1QOOyrgn938Wu3Bs4GHgTOclrdXaMHQ43rwEo3T3bRi0gZRu3DUKcVhANA0Nnd1RPxV2NlLf0FRF58vi9Q/ir82DbQ4dQ==</encrypted>]]>&SysID;<![CDATA[<encrypted>JEB7MwTdavjofXNiMbl7VUkoXPIQ2e0KihNM1ZHmCkA0FTQ4CgENYvUlkw2vYO0LdLiwhwhjf5jERBEOH4Tr7A==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7RrLvJfo2uGnts+5rTaC80yAz2ndUAGkMc0o7w7pQsEu</encrypted>]]>&SysID;<![CDATA[<encrypted>DPLpk9NtejFvjj/UDiVHgrHbF9NV1quYsMlDM77J7WKHZ5yjz53YZb2zVGBlJv4SXQeeNzlRYtPYMd1RHX+87w==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpW+NCu0gw2aKHJZzvaqjxGznGVBElh3MqnCqJ9S6nlY+g</encrypted>]]>&SysID;<![CDATA[<encrypted>U39dvo1OnqEpxhyRrKrW6tbah69+JC77ykfqALo9FWufAuGe82KJLz4iXKkdQWTI13X19TzARkaxQvRL6nLyFSVhU6vgvcfxAoKrVYuO5Wf7KgxPxBR9RoTBmxeiBGltAosSQ44F/SgwSgYfRNVL392D3JtZiBQUHhvBhnllqMo5hi+XnsEn3hH2Co1ecwY+snciGPeJtA/OzeTrG2ujoeSAJ/Inor0Ika1qDFYH5cM=</encrypted>]]>&SysID;<![CDATA[<encrypted>me9B+T6tli5STz7teRbMEVxNUyATDw3S5SqKgXeI/cqOoHnH7yBfgrogviJvvyZTCowhSE3uf1p8nWdTEmwSL0xnXpiy96aYmkWLjwOY2DU=</encrypted>]]>&SysID;<![CDATA[<encrypted>eWCuhE4f4KHZtuktWdvGpMNGmrQmOAWqXUkR3qSwv6c3ruM9o838mrBNwcgZJHyMqqkY7jHOzLU24d+QJsj1ByEVwbMtdm7UVAnq63h/tQjdFtmxwKY1lTyCTk+0icX1V0JIY7uJP+OsDtCK27TawYYnxMysDKS1Al08C/J8wy5OwMah+IyAT8m2Ekf45OnV0S/z8N9Rv5Ch3PyP2IVc20Ey97ooh2KymrTj0a0yEnKwKEOQijtmdgVRbuu25GyxWzRJ/132T4uTuZmgOIklcBFIVzfBC1LTKesAgxIPryiuIf3QFq2MOItlSxueH39JmSAO4s4Gbx4Ln9jgXIFcQovldgkEvPYz/o7nA4sXDAU=</encrypted>]]>&SysID;<![CDATA[<encrypted>JEB7MwTdavjofXNiMbl7VX9FFvontkIsjkeqFRfaRXgV+ofUvXtd1g3wd3KZ/E5RRKhTexczkFPNGDUg7gZxL5IdWw/XmHro/LJNH9w0HF6Gjr1MBgwmn9bZZkwNSglS</encrypted>]]>&SysID;<![CDATA[<encrypted>CqlppnAYnYn1npYd3J6IxOvpXxno8aE3LWGMx/PwKht6Nx+JuobgDNme3oroKgGd0D6SCBJgjTd5NMDKo+b+Dw==</encrypted>]]>&SysID;<![CDATA[<encrypted>dbEf6jVkjopimfwliub1mCINoORYtXuPIBe+aDG5bVttZgJz98i4dlUUsWNrC3ahZpD9saGf55Wiin2B9sBesfGQYP1GOjMZPsWl9iKUV91CerqwISp+G5LiXlwGSzxQjKcG6vFgRWYGSH8oG3PNTrQPomtLlmhdYTYSHSnpRTOsLPfjyHs7RKbgpQnavFJvfxLvZz7c6UkeHyRIIa1cAxvfGkaYvaoxLYCZNwcBNUE+1vPBOAOmcO9yjUeabIZrQfoYkIKF6nX99yrRLEYgvNPrrzf465c4OTpupFpTswWgTbjLt+oi6MMFvbEr+xdrb5gSpcxBFUdM7CbQBmQkVuwRH0SCFCHEhRag8T8yTnbNeq4uPqzz5zqY7uO1Fuj3qP3beNm1rR2jscnqGPzGXgsuvPyCYAuAIlVzaU3e3UtDWe1LZv/EIIGH1RNB6wIzWU9l8N+ERp3N7fQ1C94HT1tWFtFci2StbDmjcta6TqI=</encrypted>]]>&SysID;<![CDATA[<encrypted>BUfD6sWf2jrBF9QouF4xny8Fh/efo33VYy6/zoeamTp2kHVaPjb9Z9eP5xO/Xu1evC4sapGmxOAL/UCY2cTvEWawLtRu+euFm3JDj0UfWhiwoI3XuJ5XD3+N2tybRHbnzHKUzLjH14CphIzKNgZ20PVwy0+bS50xt8Jb2QGxm8Y=</encrypted>]]>&SysID;<![CDATA[<encrypted>mCaJHifcogJrW3gErTIE11qsNE8DD2D23A2J5/Km5Z0xpe0lLVCbPXB6nRsGIo7okKvtqdsmclmwiDkzC6UlOmc0Y7EgjEkO+ODC8Yax/wNTHHNcvkHIJUusugR3+ZNqI0zsLjJC9DgNtYFxkNYwkmAvmBb3S8zCxxQxGeS6ZOC628xRczx01szNgJmUtgkG4VoBgfMfKRhNsJXBl6vDm74KcT8FjZ5QhHhRfnX2vzJ6Pp/+EI8lQbUrqA4/WiVbdLiwntrPKTBjsEoDrpg3QX6QGLvCHP9bI/rTp7mpVMWjZ1sQLzrxB+HB6NbsGlyiXOWjBVFwtQj6Sz/v7OegWA==</encrypted>]]>
    </text>
  </script>
</dir>
