Shader "UnityTrain/VF" {
    SubShader {
        Pass {
            
            CGPROGRAM//表示是CG代码片段
            //#pragma表示这是一个预编译指令
            //vertex表示这是顶点程序片段
            //vert表示顶点程序的标识名称(函数名)，可自定义
            //类似于C语言程序入口为main，但这里程序的入口名称可自定义
            #pragma vertex vert
            #pragma fragment frag
            //#pragma target 2.0//默认，最高支持5.0


            //顶点程序目的为了处理顶点
            //in：表示引擎的输入
            //float2：数据类型，二维向量
            //objPos：变量名
            //POSITION，表示顶点的语义，语义：顶点和片段程序可以识别的变量的实际的意义，表示一个变量是用来做什么的
            //out：函数输出可以用返回值，但CG中可以使用out类型参数输出数据
            //pos作为顶点数据输出，在frag中并没有被使用，图像引擎会进行处理，我们只需要关注frag的颜色即可
            //传入模型的顶点数据，输出一个顶点位置数据
            void vert(in float2 objPos : POSITION, out float4 pos : POSITION, out float4 col : COLOR) {
                pos = float4(objPos, 0, 1);
                col = pos;
            }
            //CVV,裁剪空间中（-1，1）模型空间（-0.5，0.5）

            //片段程序最终目的为了计算颜色
            //inout：参数既是从顶点传入，也作为输出
            void frag(inout float4 col : COLOR) {
                //col = float4(0, 1, 0, 1);

                //float 浮点型
                //half 16位浮点型，float的一半
                //fixed 9位带符号整数，2^8=256，r,g,b，256^3=16,777,216，真彩色
                //The fixed data type corresponds to a native signed 9-bit integers normalized to the [-1.0,+1.0] range.
                //int
                //CG不支持指针，所以数组不再是引用类型
                fixed r = 1;
                fixed g = 0;
                fixed b = 0;
                fixed a = 1;
                col = fixed4(r, g, b, a);
            }
            ENDCG
        }
    }
}