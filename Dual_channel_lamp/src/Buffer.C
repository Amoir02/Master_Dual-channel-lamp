#include   "Buffer.H"
#include "Key.h"
#include "recive.h"

static struct RunParam RunParam_Reg;

extern void Buffer_VaryFun(uchar ,int);



uchar BufferRun(uchar BufNo)
{
	/*
AT_Send_ToAscii_BCD(RunParam_Reg.GoalValing [0] ); AT_Send_End();
AT_Send_ToAscii_BCD(RunParam_Reg.GoalVal [0] ); AT_Send_End();
*/

if( RunParam_Reg.GoalValing [BufNo]  >  RunParam_Reg.GoalVal[BufNo] )
{
	if( RunParam_Reg.GoalValing [BufNo]-RunParam_Reg.pixel[BufNo]  <=  RunParam_Reg.GoalVal[BufNo])
	{RunParam_Reg.GoalValing [BufNo]  =  RunParam_Reg.GoalVal[BufNo];  return 0;}
	else
	{RunParam_Reg.GoalValing [BufNo] -= RunParam_Reg.pixel[BufNo];return 1;}

}
else
{
	if(RunParam_Reg.GoalValing [BufNo]+RunParam_Reg.pixel[BufNo]  >=  RunParam_Reg.GoalVal[BufNo])
	{RunParam_Reg.GoalValing [BufNo]  =  RunParam_Reg.GoalVal[BufNo];  return 0;}
	else
	 {RunParam_Reg.GoalValing [BufNo] +=  RunParam_Reg.pixel[BufNo]; return 1;}
}
}


void BufRuning(void)
{
uchar i,k;

for(i=0;i<Buf_Number;i++)  
{
	
	if(RunParam_Reg.RunEN[i])  
	{
		

		
		if(RunParam_Reg.RunSAT[i])  
		{
			
			if((++RunParam_Reg.TallyTimeing[i]) >= RunParam_Reg.GapTime[i] )  //更新时间到了？ =GapTime*单元时间（0.01S）
			{
			RunParam_Reg.TallyTimeing[i]=0;
			k=BufferRun(i);            //改变SerRunParam_Reg.SerDegree[i]
			RunParam_Reg.RunFinish[i]=k;
			RunParam_Reg.RunSAT[i]=k;  ////运行到位置后关闭使能！也可不用
			Buffer_VaryFun(i,RunParam_Reg.GoalValing [i]);  //实际舵机的运转函数！挂钩函数！
			}
		}
	}
}
}




void BufSetRun(uchar BufNo,uchar Deg ,uchar SPD,uchar PIX)
{
	if(BufNo>=Buf_Number) return;
	
	if(SPD)
	{
		RunParam_Reg.GoalVal      [BufNo]=Deg;
		RunParam_Reg.GapTime      [BufNo]=SPD;
		RunParam_Reg.pixel        [BufNo]=PIX;
		RunParam_Reg.RunSAT       [BufNo]=1;//开启舵机控制允许，到点后自动清0
		
		//AT_Send_ToAscii_BCD(66); AT_Send_End();
		//AT_Send_ToAscii_BCD(RunParam_Reg.RunSAT[0]); AT_Send_End();
	}

}





void SetRunEn(uchar BufNo,uchar RunEn,int MID)
{
	RunParam_Reg.GoalVal[BufNo]=MID;
	RunParam_Reg.GoalValing [BufNo]=MID;
	RunParam_Reg.RunEN [BufNo]=RunEn;
	RunParam_Reg.TallyTimeing [BufNo]=0;
}


void SetRunONOFF(uchar BufNo,uchar RunEn)
{
	RunParam_Reg.RunEN [BufNo]=RunEn;
	RunParam_Reg.TallyTimeing [BufNo]=0;
}




uchar GerBuff_RunSAT (uchar BufNo)
{
	return RunParam_Reg.RunSAT[BufNo];
	
}





