Shader "UnityTrain/VF9" {
    Properties {
        _Radius ("Radius", Range(0, 5)) = 1
        _Hight ("Hight", Range(0, 3)) = 1
        _OX ("OX", Range(-5, 5)) = 0
    }
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            float _Radius;
            float _Hight;
            float _OX;

            struct v2f {
                float4 pos : POSITION;
                float4 color : COLOR;
            };

            v2f vert(appdata_base v) {
                v2f o;
                float4 wpos = mul(unity_ObjectToWorld, v.vertex);
                float2 xy = wpos.xz;
                float d = _Radius - length(xy - float2(_OX, 0));
                d = d > 0 ?  d : 0;
                float4 upPos = float4(v.vertex.x, _Hight * d, v.vertex.z, v.vertex.w);

                o.pos = UnityObjectToClipPos(upPos);
                o.color = fixed4(upPos.y, upPos.y, upPos.y, 1);
                return o;
            }

            fixed4 frag(v2f i) : COLOR {
                return i.color;
            }
            ENDCG
        }
    }
}