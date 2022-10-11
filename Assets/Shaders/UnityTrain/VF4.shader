Shader "UnityTrain/VF4" {
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            //结构体中的语义与函数的输入一致即可识别，在vert中返回v2f，在frag的输入中，只要保证输入的语义存在于v2f中，
            //且数据类型相容，同时保证参数顺序相同
            struct v2f {
                fixed4 col : COLOR;
                float2 oo : TEXCOORD1;
                float2 oPos : TEXCOORD0;
                float4 pos : POSITION;
            };
            
            v2f vert(in float2 objPos : POSITION) {
                v2f o;
                o.oPos = float2(1, 0);
                o.oPos=objPos;
                o.oo = float2(0, 1);
                o.pos = float4(objPos, 0, 1);
                o.col = o.pos;
                //o.col = float4(1, 1, 1, 1);
                return o;
            }

            //输入的位置顺序有要求，语义有要求...
            //如TEXCOORD0在struct位置的第一个，则
            //语义为TEXCOORD0、TEXCOORD1、COLOR的语义都能接收，
            //但是语义为POSITION的变量无法接受
            //
            fixed4 frag(in fixed2 oPos : TEXCOORD0) : COLOR {
                return float4(oPos, 0, 1);
            }
            ENDCG
        }
    }
}