/**
 * Created by Administrator on 2017/9/28.
 */
SPT="--请选择省份--";
SCT="--请选择城市--";
SAT="--请选择地区--";
AREA = {};
$.ajaxSetup({async:false});
$.get('/api/index/area.html',function (areas) {
    AREA = areas;
});
function PCAS(){
    this.SelP=document.getElementsByName(arguments[0])[0];
    this.SelC=document.getElementsByName(arguments[1])[0];
    this.SelA=document.getElementsByName(arguments[2])[0];
    this.DefP=this.SelA?arguments[3]:arguments[2];
    this.DefC=this.SelA?arguments[4]:arguments[3];
    this.DefA=this.SelA?arguments[5]:arguments[4];
    this.SelP.PCA=this;
    this.SelC.PCA=this;
    this.SelP.onchange=function(){
        PCAS.SetC(this.PCA)
    };
    if(this.SelA) {
        this.SelC.onchange=function(){
            PCAS.SetA(this.PCA)
        };
    }
    PCAS.SetP(this)
};
PCAS.SetP=function(PCA){
    PCA.SelP.options.add(new Option(SPT,''));
    if(PCA.DefP=='')PCA.SelP[i].selected=true;
    for(i in AREA){
        PCAPV = i;
        PCAPT = AREA[i][0];
        PCA.SelP.options.add(new Option(PCAPT,PCAPV));
        if(PCA.DefP==PCAPV)PCA.SelP[i].selected=true
    }
    PCAS.SetC(PCA)
};
PCAS.SetC=function(PCA){

    PI=PCA.SelP.value;
    if(PI != 0 && PI != ''){
        PCA.SelC.length=0;
        C = AREA[PI][1];
        for(i in C){
            PCACV= i;
            PCACT=C[i][0];
            PCA.SelC.options.add(new Option(PCACT,PCACV));
            if(PCA.DefC==PCACV)PCA.SelC[i-1].selected=true;
        }
    }else {
        PCA.SelC.options.add(new Option(SCT,''));
        if(PCA.DefC=='')PCA.SelC[i-1].selected=true;
    }
    if(PCA.SelA)PCAS.SetA(PCA)
};
PCAS.SetA=function(PCA){
    PI=PCA.SelP.value;
    CI=PCA.SelC.value;
    if(PI != 0 && PI != ''){
        PCA.SelA.length=0;
        AV = AREA[PI][1][CI][1];
        console.log(AV);
        for(i in AV){
            PCAAV=i;
            PCAAT=AV[i][0];
            PCA.SelA.options.add(new Option(PCAAT,PCAAV));
            if(PCA.DefA==PCAAV)PCA.SelA[i-1].selected=true
        }
    }else {
        PCA.SelA.options.add(new Option(SAT,''));
        if(PCA.DefA=='')PCA.SelA[i-1].selected=true
    }
}