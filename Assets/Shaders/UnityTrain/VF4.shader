Shader "UnityTrain/VF4" {
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            //结构体中的语义与函数的输入一致即可识别，在vert中返回v2f，在frag的输入中，只要保证输入的语义存在于v2f中，
            //且数据类型相容，同时保证参数顺序相同
            struct v2f {
                float2 oPos : TEXCOORD0;
                fixed4 col : COLOR;
                float4 pos : POSITION;
            };
            
            v2f vert(in float2 objPos : POSITION) {
                v2f o;
                o.oPos = objPos;
                o.pos = float4(objPos, 0, 1);
                o.col = o.pos;
                return o;
            }

            fixed4 frag(in float2 oPos : TEXCOORD0, in float4 col : COLOR) : COLOR {
                col = float4(oPos, 0, 1);
                return col;
            }
            ENDCG
        }
    }
}