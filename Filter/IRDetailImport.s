<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "IRDetailImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY ImportUserDefinedFields "ma_vv, ma_bp, so_lsx, ma_sp, ma_hd, ma_phi, ma_ku">
]>

<dir table="d74$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0"/>
      <item value="11000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7dBQJ8wla33p3qrA3ah0ba0eD3/3hw+8mP9+Wv6OM5EXfFnlnLWmnKcz0u3xEZbreg==</encrypted>]]>&Identity;<![CDATA[<encrypted>5+Q3LKJ9icJyBb/Nr+tBx3iBSXPUmB1EL3w+7FYArEQW9IsX5AIHZK3Blm+w1z6Y3D9UIEO2JdIwc2HyROtIfQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7RrLvJfo2uGnts+5rTaC80yAz2ndUAGkMc0o7w7pQsEu</encrypted>]]>&Identity;<![CDATA[<encrypted>5+Q3LKJ9icJyBb/Nr+tBx3iBSXPUmB1EL3w+7FYArEQW9IsX5AIHZK3Blm+w1z6Y3D9UIEO2JdIwc2HyROtIfQ==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>p2/jHDjprJwLegpXgt/IUpgk149hGPYAONle9bJuGxK4xhWL1MBYz40H6Wa0g9zD7AjipXjfIlA7BGrPlT2AOx9YrliVj21zJAu2Qz/oAkcXoUgbiqFl4MMPeCjx1sMiwfLKSXbFULf9krsIAKHdshSzYLJiCOtGRTjWHFOtT/c=</encrypted>]]>&Identity;<![CDATA[<encrypted>M1IwLdBT+OCaxgcRUO1XkR3/ELItfsGt0/qOi7xgTRkx4B1wDm7N6zLbddrUIEBxRgsP+5tu1hjp32xkuQQhRyw3q+VhQluN0f1s3xH102FD7g4uxXauxRVe5wTDcUyNtXMTL3vEm9qub3RdZhbH8noaavf82SMyRDmLn04HWxFcP5HIaL+w5EpqQboDsEA9wLD8vCSzMJGHNecVacCqNAxw4l+QaJIhqSTR+yC1S7s9xyCinWpLhim4K1Bc/uoYMoOEPrQvYMhqR6YLHCyql9UjRK0KUZ+/VPz5NN0pwZdvMmHfBpAOtSh3w2KFuGTIIzyhKUeMntj8PWLk3buP+cICr40IXT+cJ+iaRzDXxTqYvO7GNJGk6x7kQK/rJs/p</encrypted>]]>&Identity;<![CDATA[<encrypted>8lWJ1d4IozP+OJqy+mvq4kYEEMJITszDy1IOBaBSEHTwZr1+2evb1z0efg+3ymq8Z2EYEOIH5+y8BAuJBVPInKhlHu7U9o7jsVv9IXhlvc9WMLoTsDkpeYGOZNLiqWCTtHGL+tYZf2hPUqxiwoSdDCu5VtgMnKNvgrdcytPPjigPtVcOoNEn76aSfmvAgC7N</encrypted>]]>&Identity;<![CDATA[<encrypted>EK6upKlyef5Tsq+OQ9o6Ay1n+ir/6Kae4q+lrPgGv2EMqWU9Af3OOCiDypBXsAaNT+Nw67ab6oGP46qs0oZpPoIvPbQC0NneuBIFjNpa+Kt/GX7yOMn5XJFMjzWVRN5EB4DzjT3gGAzYqaRJ5MBXzQfqlH+xdvSXyIqmSBUaHVzjETfN2VS6epVqWgr7jctPCjYl+FSzfsM1Kuo58fYvxmmGToGsLzX2Xppq7Exd8uydm+8xswMCTifiEOLjZNIp1/YbEKWdNKX+7eGrJauHNkqvNvwJ/HuWK6jrp4ZobPfxDlB8tKIjnSZ+DTA6C+5P8+IEIS9HLhpMcV+/RlKBG6LNaxa/arZvIgmnVnx3vrxn/cdHRyTcCptJEHENK9yOpoJrhadYjQ7rtk4H3eUCQazVP8umyM1vpUR+MzbzKw0Dr7uJM4UhaawbePYcIR8WSmi7hw2Vp64tkomTJEvn3D2iV3LLCQxLSLd7PgLTcgwQfi6a26MK1dDGOk6tNtCASFl3+Oa2Yuv2kqKwj3ubMQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>exp1iiivU9XbL1PDvjdpWxs4Nt7MSIEsnM0ToyBWvgfyczUvLt9+JtABUgeXDkoW</encrypted>]]>&Identity;<![CDATA[<encrypted>QGxbsPHCMPAv3vvc+Bap1wGJwdh91J1ABrgwCGJGdkVwxJhCJDiakCjg4EgXwav7dE+zP9M4f4yX3OMK9SdJ6H38aWTQzN0syzD4nApZJ9/hw+sxbhs0GARV01Wjo4o4HS7Po2+hjfGcB4OMMekRFvNwiQfTjAjiGGo9sM36ducRn4KaVeC0Hm4oSjc59Hk+rO2G6UgU58hAEynJAw4tloLwOi7RUOh0SyTyrC+jOz4+STFwrtJnNbogRnPTMd9mSRygS7n9eP33qgYJREziIg==</encrypted>]]>&Identity;<![CDATA[<encrypted>iFEl8nj0FN/RSz3ppf2ikL1fKZXS98K1KVcJLNpdT4+s/FYDBj7bx8lutk7AKRa5yL4yH3lFjXpDxiFJ0bVHcfM0YaNkNFUu5IEEReNISF7EYEo/lGNY8kwvjDoZpIEypuhJjf4I4Cj/nCtPDWz3SBJsylrLaau+/SsIqFWYCAluCk0GINoeJB7wiXF4v6/5OdNLRuym3FzODhENT5SQpeb8XnbwTqVcKs9W1vDSRs2Bej3jOKFpfoA5uua8AWcH/M0oGfJpLff9+i5tVmMjy/BWEVXCVZgjcLpUG/7dZ0okxxs3S36IHB4SO4TqnrMDcagIeGf3qf/TKH8lRfFfB9NzRk3j7WA0W5rpEIjxXcpM6rc3BCU38BSCoaZhc1bwmRjZNWmiaIaCq9PWqRT3uwAxf2FNGpWCTzdDoi7wAQvF2Z/9wTOLGD0UvMENWTxxkEVepM58m40fhqXfU+KI1K0lcsevjcG9GXs96AFu2D8WWOmOGZ/L+fa8YiKQf2o9gSHB1b52PkBh0aze912y5JUnzSxsAxN56w/79dUghmrQnp5nuNxaJyD/KoMhe0wuzn/J3Uh6fjZp4XGs9AdAgLkwZV1WtSMjFEsiXQfW3ZXVlXSaCGx/Ef8rfkhDmRccNcjQFKWvejDB2/wwjwv6uNAGCNKhTIHxu/zg8anu+9ZXdIrvCc7nj3i703LEO9p2</encrypted>]]>&ImportUserDefinedFields;<![CDATA[<encrypted>EFtpeZKjeYU1Rfw6rEVcpzeGIRA36i3x0JUOtPjl/OkflcH5fEWNPe6vSeSpi1O/na+eKmDkapSKSrZGB8JsHLgtcsktH0dwWTl7cwjMKq2stkYaB33WteJ8yrRe9oPBOfbc+sPxxXTrlvgysrIhQcmgzKArLiteHkyKrVv7zAD6rBZHyY5LTGGN4OAScPOnJJF6jJaipZtrwskQHVw7VNQdQ9d566b1Y8atp9GxEpFFFSHOQnPYU1d2uk2j3dFAu3X/saUGgBwQivOyUKKAKrdt1SSiKC/hYcDQssV5MuocVywee7SBC2n4rmA9i0sEOM0VdSLsqtnZyg3jzp5GG6YngU8uaj+vTiLsLYQQ9KUuhyLOr4vNxGxTQxs6y9oHGEjxD93PjomkULUELQ4wiZGNd037gbcuWR5L6re9P6YrZ9AAeAcZ5igOewDoRYrqQsgZwhyiiVX6qCg7xSz6OLxgqeRyInze0EHlgvoZLEAWFwM80n3jW1bjY4a4T1dCQcvhnlsybzxAfpJCHQe8s129mtuQaIoxP4NnLwJOQ2x9Ggy4nkoXb3FRLX+fSWj84X2lkxsC0ELbPn85s3rrJReWDRwHGzLsV+hpR8Z4JsaxsU14izEHGR1TW569JYxdPVnA1Wv95X+KHOmlXaQVj174Xu/cUqWtz9QYXMrGoGTl1QFLyTlGDbHBdLWCeeh7qrb9Y7JwqAxqcmU+hzv3hl++Cf0TKpMRCGJ/8KQZyvd/4XsaxIxXyhj3UIC+B+rlXT4Yhp+wNWRlvGvgO7Af2iO2aBBeoSyhiZwtaXYCJ1xwm11O2pWgNPTufjwUVxAiy7IwwsZB3xwa37ClWBN+MNI5fG/yeA6glzadhPsSFa7Cr7gDw6orMk8cyIfRKkV/9cFVhZG2UF0b+7+nZaBrlNyG8gLMKYNlb4oEoX2qrdCn8aydQpDVKBTihf5Dw4wYq6ZJx5vqtZyzOMWI/6R8H7EpnwJU7vocnoKJ/HhBEk4tCnmyeZlH9W04FO/izxhKng3cOM96KVjGnjkqeuE9AEq4Ir3FJNrKyj2kO6vgjWtjECDgY6R0Vrj8XgjP2YOyzApiigBKg2DPOKqN+tdevtGJ2Uqeoxer4Bvo4eOa678=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7bY2yHgZ7QPfR+8ybSNzzv55HNTiFwYgTz+rDxDWV9whCF+EVZp3qF9GFpFmIlkTag==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>
