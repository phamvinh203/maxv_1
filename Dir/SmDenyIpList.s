<?xml version="1.0" encoding="utf-8"?>

<dir table="blacklistip" code="ip_address" order="ip_address" database="Sys" xmlns="urn:schemas-maxv-com:data-dir">
  <title v="giới hạn địa chỉ truy cập" e="IP Address"></title>
  <fields>
    <field name="ip_address" isPrimaryKey="true" allowNulls="false">
      <header v="Địa chỉ truy cập" e="IP Address"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 90, 80, 230"/>
      <item value="110: [ip_address].Label, [ip_address]"/>
      <item value="11000: [dien_giai].Label, [dien_giai]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>6DUrtPClh74NbHQgev3IcH79n6DgNhBtlF6TtPK/ztzG70W17P+VidugiHSz2uLtoiimqLQe0l1Uv8Z1JH51PETYiP+xufZfX7jLmnJp5VX6ZUK3kfS0ngGkWHapWcEaY1ONNV76p+q8DZ53V1e61+Cja5vcPdSk45XL3w6OZXHxr1r5SESKybXOKLB9B69JwY1CXHCcsMtcawOhM+zhPGwnW+YpvBzttzxS8y4Cq3+cRmtxKwdIFM1YMF4wT9oCo+i8dq2X35i4Y6y5MWmjman09/YkRSDDsWXfnzLKyWc=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>2ST9nMRNRZqaty0gDS8Tp7I1gX9mE1uDY1CF70ZXw64qJkY0l7YaDJFTBxA9gjhfoyQq6bPGDjJ35zMzO18To9jB0pztBpao2TJ4QDCWrro4jfVB1NXrOwb2JiB0yEF+m4tF7tjqR+Hvf9zEPrt5TVT79Ip5q/xfsXQ0dD+D3JwZgLjETKblmvJFAzRvbiPwOsfSjT4IYzKbdYsg/qcFvajGh9bBjGDz21hFEd+4mgcovHcGLaVmmTyONr1zeqWD</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>9ONc3ZVmIArmFWv4juZtZgeV8pcGkv/lCX0ocf3NrHr3izMxjAgNq0jl0DmCs7yuxSjgUGz8vkU8+TtGjGPvletQJq9b9tCQW2eeQMF8+50YnDPykDOLU1YHnab8G35h</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>StgpBQ/aePu0OBOTgGQxHDkw8lB9MP8qlmMefUYbIePbCSNFcbcjYL1etNB6eXJsyr2lhrhvE9rusmQlOm/kLyekSEbYPQefMt9t67X+JFKUdP1K3HjNjvgj0+AnmGYU8jI1CrkXOsgAipFeUvDsYKfFaJxNSQ/kWjJd1HRfOkeos7aL0Dke0Jh7xcugBwcDV7dF2gZ56Wtph8jj6xinTfiyp3UK8XYFdpKRrnic74Ql/t0Ybbus1mhCFmYFZQpKwslgzI4/wta27EElNP40mGOUuR9RrgR/Jk3EHpzoshjT5D2Vo2XWvDSAM8t9cNpF1TryhgEAPoYn8904zccbpCmF58IHusxdm7OEx5J/iOGsOYsMBcNN2asyDYExyY2veMTke3Pf0ZBbWoc6OomNMRb/t44R161AI+xVSZoZ/7HmlTXp5gGkeYadRppsPLmvujop1CMKOc/ME9hoVJq2Og==</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>
