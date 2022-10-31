// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "UnityTrain/VF8" {
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct v2f {
                float4 pos : POSITION;
                float4 color : COLOR;
            };

            v2f vert(appdata_base v) {
                v2f o;
                float4 p = o.pos = UnityObjectToClipPos(v.vertex);
                float w = p.x / p.w;
                float wc = w / 2 + 0.5;
                //if (w > 0)
                //    o.color = float4(1, 1, 0, 1);
                //else
                //    o.color = float4(0, 1, 1, 1);
                if (w >= 1)
                    o.color = float4(1, 1, 0, 1);
                else if (w <= -1)
                    o.color = float4(0, 1, 1, 1);
                else
                    o.color = float4(wc, wc, wc, wc);

                return o;
            }

            fixed4 frag(v2f IN) : COLOR {

                return IN.color;
            }
            ENDCG
        }
    }
}