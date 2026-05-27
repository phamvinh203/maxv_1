<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmvitri" code="ma_kho, ma_vi_tri" order="ma_kho, ma_vi_tri" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="vị trí kho hàng" e="Location"></title>
  <fields>
    <field name="ma_kho" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã vị trí" e="Location"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_vi_tri" allowNulls="false">
      <header v="Tên vị trí" e="Description"></header>
    </field>
    <field name="ten_vi_tri2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Theo dõi, 0 - Ngừng theo dõi" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 75, 330"/>
      <item value="1101: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110: [ma_vi_tri].Label, [ma_vi_tri]"/>
      <item value="1100: [ten_vi_tri].Label, [ten_vi_tri]"/>
      <item value="1100: [ten_vi_tri2].Label, [ten_vi_tri2]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kt3uRPrkV9xPb8Ho2GSqnbUVm8F7+V/VEveViMzsN6umUM5PVU+3+BvK6eBGN/Q8lwIYRhNWBiEx37CAFiwrVME=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>ZCGA4bCilozHav5skKP3kmChsK6Ta2HE/MqKluYg2UxJ+FW3+f3RV9Bie7xRL50XCAQdoB3pFJmrCT9kLgudq6nc5+8AQedPUscWjwHlJkM=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>LPLeB2hZYAJoS8UX/aKcYbwtmUpjjd4/AJB04I+clVwVD7l9ZW+914AKv9ExkG2hJ++REcLV0S3E3tJ/d8Lb3q7xGnwpAhRnEzPEGlSGZqSdWiF7otTAFP9asE+3GjUK00ncteWy9yr0fEJ/cSGeL7s4nV+iqenkhAnwyqnGTTsG495RRMdbvtn/9CTtLtATiQsPvRu2KEAlO7cFsUTx/aBs+c3anySBw6GwIwycfJMtfNyQ3XTR8u10C510ZEUrVPRcuUH8v/6W6Ht62RlFOMxIYv7Qj9nCpIG1shHCopk0Ex2+9YtA0eInHs9HnMAnPSPa7dJMdBx0bB7N74w1HdUrpsbUVVWBMxviLJSiMRBtGAL8pJQvU9wkcxzxI9vjifWP2AgljbYXT2E+A8oi0l/jkAyyl9cUgPiwqXz92ZQtmfyDxPopHtfO6sB8HI5+61royy2YGi0lSxw/3CGuXBGeUvfLcLGkB/dYu3uSWcZuo2h5KTg2kVBt9+c7ikMU4rK3DkBG4nqHeGQHP56o+S7+SvJEIq6krZgLffibMN4DPgcmLhv7p1yhdvc1F0zOY9IvpLmADmHgo8WnEgWw3jmflhZ3fmuGAN40E631MNc=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>Wn4CUaRpBk7TIJ3gCobMT+B77DNZei5ICZTipGEPjgwbUo5hAzfxzFIkLEv3QFetAlMesTif8nvIVjYt2+DesjFQ9vVYo/udzoDh6dyYHKx+fWNjuYjc25+zfAgLCdiDnE3LBITi2sP3TicPjdu0HTrUhTa2fH26rGCZOtj4jRMGO8XAdHbEL56pir73yZX3viCMaRyRRZDyA6KvRRY1VP8vV8V5RwUS7IxPn5p5nLlODTwRwIxuFxI61QOKM3zotX/otcv4EMSdrnb9xaUiFP8B4lF15n3Z2IHSuPiei6Syjh5gY9nQ//LAVpZ6TQt9</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>MxlfBahR80CK+lgYfhUU3kekyMshKirQjh6iWKVZmOAw7Gk22oTjHXblhjhm+A3aEIpO4amMFQoA2lAZCyrJwDqTlfV6YHAtkmfKY4LQbRieF6q+1uqwjS8YT/y3+1ltBjkLKAVrg5ohsSQsCA8JaC61qsMPGXjv+pSFF3q0kyChcXHUqAIznmcbi9qVq0/ayzcLhBnplkums/YjhHLF5R1QhCTX6D2GYBdooYjflhJ4KvUOnJDGORIYZso4IVpTL+eMdIPaCL8Tbc2AhsUeS4ZPkXRWHbEhK5riBVQHcy9OvRxoWOf/byHkGI4SVFy0nUODlOrsFc0Wsb9N+iSd4gHywlLCutabL+h5K1vfKBZJVxOgkzJE3USoy4zNjipLXeR1uW6lW6Jmv67K317j7Fvt6IUJ7aQcUUaBjg73KkBPHGzWrLDECk4GcDYZ8Q/r</encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<encrypted>+AnsKNUSqx8Q4GipFtc/I7LvpyeCnxwgTULe9D5gIsXylt/P07Jd+jdqOpgXnlgacDbAVfld2Us6KVD19+u0KHYLHbQdEYe7fEx+XsM2Jj8UGdEEIf7fnoboEEngHhgfper5lsJyurxedHsPzR3Bwg==</encrypted>]]>
      </text>
    </command>
    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>bM0aQ7JOh0F4QA8xIYh2IXUaSyN6v0jAWHRINRBNmPEgMyIGF5Jnh9nSiaJK+aZPzWpqPwChjNpm2Vbvgu6nN+yQE8cy9gZCtvXBLERQPKJ0T5rMXOQM/gI9bqZxjl0konbRiQDmfBrdifsCJX3c5+AXqECTFS2l/Wvrj+3FAgB0zL4E/3gi2pGGhIaMk59KiC+vW5LhuQHlz6t38bx3erGZSh6P+O/cJKi1kBOkdI8=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>qbDHdKwFGO5rbbBeqWAwWib4Jkslbc5WLnM8kH7reJG0ox1wpdaJ3KX3xN3g42lj16rLFm9HNAuOuBLDSs+t/UteGzaWBcujPzCtEWW08sKKmzq0uHAaf+EiJQoc3l/jSwbOIvNPAfhPx0rzZ0Of3KlzZdhQOArXZM3PN0+HtMXEXJYv/M83cM30y+f1K+QuQnEbm9TYL5dErDPpRzLepBdDTB5xc7ov9pzJ/xjm/8m24kTIjf6D1nbw8NUawz4lIDwHMImMYN16fzXuSP9eudp5g1JkpUQjep50OEEA6Znu2hSM4eoM4tiWxEkH7iDNKt5hn1VZ0PE0BwGqvQpQ7sso3WmHrdMF0aijCzVLiv8=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>
