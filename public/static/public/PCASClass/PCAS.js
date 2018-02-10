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
    if(PCA.DefP=='')PCA.SelP[0].selected=true;
    var x = 1;
    for(i in AREA){
        PCAPV = i;
        PCAPT = AREA[i][0];
        PCA.SelP.options.add(new Option(PCAPT,PCAPV));
        if(PCA.DefP==PCAPV)PCA.SelP[x].selected=true;
        x++;
    }
    PCAS.SetC(PCA)
};
PCAS.SetC=function(PCA){

    PI=PCA.SelP.value;
    PCA.SelC.length=0;
    if(PI != 0 && PI != ''){
        C = AREA[PI][1];
        var x = 0;
        for(i in C){
            PCACV= i;
            PCACT=C[i][0];
            PCA.SelC.options.add(new Option(PCACT,PCACV));
            if(PCA.DefC==PCACV)PCA.SelC[x].selected=true;
            x++;
        }
    }else {
        PCA.SelC.options.add(new Option(SCT,''));
        if(PCA.DefC=='')PCA.SelC[0].selected=true;
    }
    if(PCA.SelA)PCAS.SetA(PCA)
};
PCAS.SetA=function(PCA){
    PI=PCA.SelP.value;
    CI=PCA.SelC.value;
    PCA.SelA.length=0;
    if(PI != 0 && PI != ''){
        AV = AREA[PI][1][CI][1];
        var x = 0;
        for(i in AV){
            PCAAV=i;
            PCAAT=AV[i][0];
            PCA.SelA.options.add(new Option(PCAAT,PCAAV));
            if(PCA.DefA==PCAAV)PCA.SelA[x].selected=true
            x++;
        }
    }else {
        PCA.SelA.options.add(new Option(SAT,''));
        if(PCA.DefA=='')PCA.SelA[0].selected=true
    }
}