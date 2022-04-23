

enum YoutubeListesi {
  donem4Endokrin,
  noro,
  ureme,
  savunma,
  hareket,
  biyolojik,
  gebelik,
  tumorler,
  soldol,
  travma,
  enfeksiyon,
  endokrin,
  sindirim,
  yaslanma,
  pediatri,
  gis,
  soldol4
}
Map<String,List<YoutubeListesi>> listeler =
 {
  "1":[YoutubeListesi.ureme,YoutubeListesi.hareket],
  "2":[YoutubeListesi.savunma,YoutubeListesi.biyolojik],
  "3":[YoutubeListesi.gebelik,YoutubeListesi.tumorler,YoutubeListesi.soldol,YoutubeListesi.travma,YoutubeListesi.enfeksiyon,YoutubeListesi.endokrin,YoutubeListesi.sindirim,YoutubeListesi.yaslanma,YoutubeListesi.noro]
, "4":[YoutubeListesi.donem4Endokrin,YoutubeListesi.gis,YoutubeListesi.pediatri,YoutubeListesi.soldol4],


 };
extension Liste on YoutubeListesi {
    
    List<String> get toList {
      switch (this) {
           case YoutubeListesi.donem4Endokrin:
            return VideoList.donem4Endokrin;
            case YoutubeListesi.hareket:
            return VideoList.hareket;
            case YoutubeListesi.soldol4:
            return VideoList.soldol4;

           case YoutubeListesi.noro:
           return VideoList.noro;
           case YoutubeListesi.ureme:
           return VideoList.ureme;
           case YoutubeListesi.savunma:
           return VideoList.savunma;
           case YoutubeListesi.biyolojik:
           return VideoList.biyolojik;
           case YoutubeListesi.gebelik:
           return VideoList.gebelik;
           case YoutubeListesi.tumorler:
           return VideoList.tumorler;
           case YoutubeListesi.soldol:
           return VideoList.soldol;
           case YoutubeListesi.travma:
           return VideoList.travma;
           case YoutubeListesi.enfeksiyon:
           return VideoList.enfeksiyon;
           case YoutubeListesi.endokrin:
           return VideoList.endokrin;
           case YoutubeListesi.sindirim:
           return VideoList.sindirim;
           case YoutubeListesi.yaslanma:
           return VideoList.yaslanma;
           case YoutubeListesi.pediatri:
           return VideoList.pediatri;        
           case YoutubeListesi.gis:
           return VideoList.gis;
         
           
      }
    }
     
     String get toTitle {

      switch (this) {
           case YoutubeListesi.donem4Endokrin:
            return VideoString.donem4Endokrin;
            case YoutubeListesi.hareket:
            return VideoString.hareket;

           case YoutubeListesi.noro:
           return VideoString.noro;
           case YoutubeListesi.ureme:
           return VideoString.ureme;
           case YoutubeListesi.savunma:
           return VideoString.savunma;
           case YoutubeListesi.biyolojik:
           return VideoString.biyolojik;
           case YoutubeListesi.gebelik:
           return VideoString.gebelik;
           case YoutubeListesi.tumorler:
           return VideoString.tumorler;
           case YoutubeListesi.soldol:
           return VideoString.soldol;
           case YoutubeListesi.travma:
           return VideoString.travma;
           case YoutubeListesi.enfeksiyon:
           return VideoString.enfeksiyon;
           case YoutubeListesi.endokrin:
           return VideoString.endokrin;
           case YoutubeListesi.sindirim:
           return VideoString.sindirim;
           case YoutubeListesi.yaslanma:
           return VideoString.yaslanma;
           case YoutubeListesi.pediatri:
           return VideoString.pediatri;        
           case YoutubeListesi.gis:
           return VideoString.gis;
           case YoutubeListesi.soldol4:
           return VideoString.soldol4;
      }
      }
  }
  class VideoString {

 static String donem4Endokrin = "Endokrin";
 static String noro ="Noropsikatriye Giriş";
 static String ureme = "Üreme";
 static String savunma = "Savunma";
 static String hareket ="Hareket";
 static String biyolojik ="Biyolojik Etmenler";
 static String gebelik ="Gebelik";
 static String tumorler="Tumorler";
 static String soldol ="Soldol";
 static String travma ="Travma";
 static String enfeksiyon ="Enfeksiyon";
 static String endokrin ="Endokrin";
 static String sindirim ="Sindirim";
 static String yaslanma ="Yaslanma";
 static String pediatri ="Pediatri";
 static String gis ="Gis";
 static String soldol4 ="Soldol";
 //List soldol


}
class VideoList {

 static List<String> donem4Endokrin =["pnGC741y2o8","5wt2wugG0vA","TeAFxAEFNNc","aLRpk2HsdgA","6aIl_0oAPfM","TIgZiWRVs6k","yamzrT8HuEo","7Bhz-XTMiMM","JYwhkMqlkD4","iVcYzOVpiBI","lK_LjY9l9VE","kmExsixShtg","Q45f48-n5Bg","-d7l0RG9DSQ","IbJSRiac2J0","yDjfXs1fUCA","dMVrZ6gQ0aQ","3rF8zjNVbGM","t9IHmIDAOTs","JHQ2MNLlxfo","XT1ulSBVCP0","iEWm7_mIbeA","pWTa7V_v1Yk","LLid15EwvL4","8lfmAT_IBvo","KONmOLs8Ozc","KLOZyUEQJvg","FguQwoPDoyo","gOVgddp6l40","diioSOADAeg","v4WdkxNQS40","oLmCyX2xR7Q","1cQIBG3ahCM","xMlDgj9VoMo","dBaSk-YJ71M","X3pLiihX6p0","JFJfd8TnEDY","LFo0pTgIbXc","6WPMzXaLsQc","LJ3oPeZIa8w","l-wTlsXLWK4","dKUoW__eMA0","x8tv59IRKqs","V90rn5xpSow","xQM81ZkmMSE","pFoLReaR390","7lPvjxnEGcQ","p3QMSL8zpmE","lBrXBYrdXBE","l0UqM2wTBrY","4Aj6HN-IJMg","hYL5ZskbIWw","SJ9W-LpID0E","RbnpSlJsSxM","kpooeOil7X0","R6bdHoJ6kbg","wgyJpChEbZ0"];
 static List<String> noro = ['VOVC8aVrJm8', 'CeRD6_ZsRfw', 'SnLVwQ5qjUw', 'EXYU2KyOWF4', 'dZbMWnshK38', 'eSTBUYqvoF4', '1my-5b3727E', 'd9boSgyZ_w8', 'BwcbhnHtR_M', '-7P5YuetsYM', 'ovH18QpXJ7E', '7AjQcrN7wRs', 'WXVEV7COLxk', 'YEHk42s6XO4', 'l_8bOJ7v5eI', 'WniV_r4_KQo', 'vO_ZJERTVnk', 'CL-PI-HaBU4', '4e2-ucaYViM', 'CPPr4hqBCRw', 'HSddPZ_1pKs', 'E91uOMJm304', 'BPtCUWgM9lk', 'j_CK2IihTKY', 'QY7Sc_YxaWk', 'vUHa3Edj-W4', 'wQlRZRFlhiA', 'bkJKp5k0koQ', 'PP17-Iem-WM', '8mMoiG_4lPw', 'MV70-OTcw_0', '-FeeBnM53QE', 'hNunF_jCOEU', 'Y71Iej5gn8E', 'QBX7TPqEMeY'];
 static List<String> ureme = ['PUHBkSJA-Ro', 'Oy_ByGuyZzE', 'dWwljkKy_Dk', 'BBKDYsxH-G8', 'rkPcnwA9sss', 'OvJ1IH5rL2M', '6CwkKByYINU', 'mye3QOhEFxU', 'nzlvo082BcA', 'WlvrhFUhdgs', 'Qjk710gzeBI', 'O41hk3ZiT1w', 'k41aiZ3ekvg', 'LIHqonFkGQI', 'WRbS0K-5B-E', 'aqyTPB9xNVA'];
 static List<String> savunma = ['6uWi842mhAg', 'D6e_Nh39ivE', '1EDRAg9Xz3U', 'NJ2MuZ-gwJQ', 'AT8n_2buUtE', 'FOhf7-nLHGk', 'A1SlPHVpJMc', 'kh1FJ26mojU', '1IMffTL-zH8', '6Zcx-0yxe5U', 'xg3qazF6CXI', 'uSnjaerSbNc', 'X6nB7UG96no', 'VFakd84BaRE', 'LuTxDsFVts8', 'B2fHnnC9qNE', '9QTitvloUJI', 'H6D8ARZG_4M', '0xbJ-PZDyP4', '2lmEz3IXMOI', '5qh16SYDdss', 'u3hAh7n01nU', 'tPMAKNYVgx4', 'y3o7r0KItdw'];
 static List<String> hareket = ['b2Vx3PnpYE4', 'nQXp15TAYJk', 'wXlKZ1OTDNI', '__1DLleKXCY', 'svHRwrzBTBs', 'nYzrt3bTrMs', 'zQyJvoo0MJM', 'TQBhgq9vzfE', 'fUfLOT4ek6A', 'JLYag_pmcGU', 'rUJUxrert8I', 'mCialDL25wE', 'heh1f0vnSBk', 'UvfpBy1p-0I', 'yadyEnOMVAk', 'AZiWiRVayMY', 'M-ZlSFgVJ_I', 'e8NnNbM3FlA', 'dHq5KCq3rqk', 'pKzBO8nN5Aw', 'b0pyJj2qXOU', '8syuj6uzpbE', 'UCRJ9wIwaVQ', 'GbGJBhs0mxY', 'Np782h3a8AI', 'Ggd_FYXPagA', 'Blumvo6yPTQ', 'ViCrHpgfZ2g', 'SYG_s9tz4rw', '375y3JdYrbE', 'TPUINywChlw', 'jIUCCk3C4Tw', 'L6nWZ0uZf3g', 'wHc--XnjvUA', 'JyWEUuiBiqA', '5xi6PeiI2ow', '3aZSkEbCH18', 'uuAV5lQLvUc', 'knifEhN5qhc', 'dxvh4TXl4S0', 'XXwpBQ5HWxY', 'WTU0a5GK4q4'];
 static List<String> biyolojik = ['Cp26jWulO0c', 'dvxuCVTlFJE', 'MTddZoqbTrE', '1zznWoW0RIo', 'SqfTtefcUXA', 'q797WrctOis', '8qSjaR2yT6M', 'DNIY1owtRXs', 'wxfnC-3Z_zM', 'm9rA1LMx_lQ', 'mFv6L-_tfVo', 'qPoVWueZTDo', 'ecvOIXSt9Uk', '5z1sKka8nfc', 'dDrL8GXU3fE', 'XyGaxxXdNeM', '4BmD5XJ-XU0', 'of_IoPCaA2I', 'sdNaS-14ZAE', 'QIg7qHiPU88', 'LrgTKp3WrJU', 'BVDGGtF1MIk', 'MAdvPjNqcKI', 'aqooAbLYuhc', 'Hv5swh_AYr8', '59BMtcJ95Ik', 'npszBvoROj0', 'Duy1XwTJ5eM', 'UTp3PeAlDZQ', 'up2uKBRa324', 'iy3Jv5W5FP4'];
 static List<String> gebelik = ['Yhh3pFQeaRc', 'phUL5MJswq4', 'BHdCpT0zMwo', 'otzBJe4StrM', 'D5aQtySAZkw', 'aCCHXPIkmJ0', 'A95pxR7QlyU', '-lPst8Mp3Bw', '8bmWnUZ7l0Q', 'gHa0X3Caf0g', 'yD9m0pH0x08', 'Lckwmiq4cEE', 'E4zbYs9rxO8', 'KOIKtvCPa_M', 'MEXwpgBXzEo', '3Cudah4UTLA', 'FVo1QrrDvCA', 'GIGbe4TzWCQ', 'OaA50anVdG8', 'U0Nmq_oKz5w', '4dTuBxX4uvs', '_eHt2RPvtV0', 'HL4_x4cd9_g', 'hHlr3BdlgPs', '-fUuEEn-ZR4', 'fhHdpY9LgIU', '_qWJomfMQD0', 'tESpZg4iCvs', '3LqTbT0jKwI', 'TNlQ6hQuSRE', 'qIw-Nnrf4ds', 'gcjAJLhrjr8', 'ifgfxIvIeTk', 'AHKyL98wdRE', 'BeikEVVnY0c', 'TiCder431oM', 'BHnbWvOmjKc'];
 static List<String> tumorler= ['dwbymwI3hPk', 'VXbrte7ai6w', 'dRsypES7nto', 'UfMJXfLnTjc', 'Dj36jIFh7bw', 'rsVvZKCQA4k', 'yetJ-o9S98c', 'iSt4T5MhggM', 'zoA4FleuTWA', 'd4MkJBJZJBw', 'y05Ixcj3h3M', 'OgLSeqjqntk', 'IUw5BAk34v0', 'Bj8RJMdxK4U', 'PfC1WKhHSCw', 'lUFSE_UWOq0', 'U49YbNvn2yA', 'MsvMGb1tFo0', 'KkiQFU1wv5Q', 'VnV7Imxd2v4', 'j9OI_ZfQUxI', 'BiRa9VdegeQ', 'u2voUIHvYJ0', 'whL-hNEBG7A', 'YduC1oSZ108', 'BfuLrzUd38w', 'rp-dsgbp4Qc', 'aSK34dEd0NE', 'euhSghVuzi0', 'uOC0VWdgdxQ'];
 static List<String> soldol = ['j8WqzD1oKa4', 'Rf_0LcCXdFE', '_O9PNgqp--I', 'IiXAlC5ZCmY', 'DhxJP8zTyRA', 'V9RKcRh_b7k', 'e66VIAqSrec', 'AfNvCgjlOy0', 'KAX-gL4NpUA', 'BuTDGji8dA8', 'g2KPqUWEC1A', 'nxZzIsqCIOo', 'Biv01ZlOVMQ', 'oKg61vYo9aI', '-J1YoMyOns4', 'K3gDWCCBsGc', 'TZsRX6X09HA', 'H24_rqOiaf4', 'uTP0jaQNi38', 'uqLCAZqSEZA', 'XD8lt_A8laU', 'Du_4RKFB3XM', '6PvSPBzwAFY', 'LsMYYE14TT0', 'IxJPBH6KA-8', 'INPosPzaSWc', '_ZuZM4CeQb0', 'B3YtH4XC0mk', 'AGFxSIr-1Cw'];
 static List<String> travma = ['ayESl1iKXlk', 'pinydis1JQ8', 'mHZYIh1Ct5M', 'FdgnzW8NYCI', 'g9guZdVNH6I', 'UYLqzeSuiNM', '1KRvw7bsUcE', 'i2WIU7QkEq0', 'lu_wrCPnyhM', '4Kf5dN8XXkg', 'kfHLVXS1EYk', '6F7xtKVaUIQ', 'ajTVA-i2gsU', 'xdSWRcuD5zs', 'BuaJoFzVg7M', '2qEjzwCm97M', 'QPFe_gGTjh4', 'mLsaMKyzUmw', 'pug3vQZCwJc', 'HdZaVfHWB54', 'Rxd5ggdDlgs', '1FZ-sq6WhSw', 'hCZGsGAC6Mk', 'z10wyuJFwgc', '7eyhzRX_w7Y', 'TNoVkM2TCBQ', '0lR97vkPcR0', 'QHLYlgBSbpE', 'xwpao7S2-kg', 'A3WDRPukGPY', 'hLDXvL6gTGE', 'oIDJ7iCxhdU', 'IjoYmzsb9Qg', 'NoXpmlq2_2c', 'iZ1bsX5N6gI', 'rOn5536i43A'];
 static List<String> enfeksiyon = ['qSA3ILN1btw', '-y-RMwhMb3A', 'sVkxyO9KQEw', 'eomFruWkulI', 'qbMuMI7mm4Q', 'nIANoKTsgPg', '9hes_aDke1w', '8knJH75ShoE', 'jrRAiHr0nIk', 'w-IsuZDvPKk', 'TNHqEcatZ2M', '5OTkiofQ3i8', '0oNvB4QWycc', 'Pu8q6wES5pw', 'wnnM3xy8p2w', 'POhJ3ifO24A', '5ei6vjOymz0', 'N0WtODFVaEc', 'CeUonp9uOxk', 'UDPYoFeib7c', 'wrlKnXBqA28', 'A4-ks43Aghw', 'Boa8gZkzPb8', 'WKKRisYDQec', 'tI7t8W8XMJ4', 'fXKPQfSfrM8'];
 static List<String> endokrin =['eV9TZav1R4w', 'YT9kpiD59gg', 'QBF0t6Die2o', 'uenIN88xARg', 'US1ndJN8Jr4', 'XTQ1uTvRLco', 'qXJCu7t2ULw', 'zT52cRJP7_Y', '7wX18HmHgzI', 'YFALovQZlvU', '3imfMCIdQGo', '9cY22gxLywk', 'VZT9XZmB9cQ', '3dJMH6JbnTU', 'y31F7t68io0', 'Dto0jcFzrEo', 'lXgCeeeg79k', 'k1WZIE5yTVw', 'subQXtUg-lI', '9mXD-LF1_qE', 'MOJ_lArtgsA', 'fDXQ7sEI9MI', 'UPwLtCnVe5o', 'qaTC72qJH_w'];
 static List<String> sindirim =['zJFmW65Bqf8', 'FC2JNdeQzrg', 'uAVS7T2Cyj0', 'LY3ivyx0I8w', 'JOGZuzbgVFY', '0HdUEYwF2qk', 'ZC_eJYrN0hA', 'duX8w4Uquzk', 'M4BZ_yIQ-s8', 'qOQoAxwAUak', 'H3Fjx21rpFk', 'Qx6SA6UKsh4', 'sR35zgs77Ys', 'WfmCqseKsK8', '_a9MR60for8', 'GB0EDRrsyBY', 'BRcKuvz7lk4', '7oSwQWUvTjs', 'c8D6x08sLdg', 'CxgaPss0hBo', '3xQoP9mrd4c', '3yUW42xHT0E', 'HY03mxxCT6E', 'OLYLfxeqonQ', 'IokQ_CUY4gk', 'SJb5JzSAh4o', 'cLpKs4v_L7k', '3FIFJJSINYM', 'pad2rBEvpVc', 'fWiJyfminqU'];
 static List<String> yaslanma =  ['YFVQpPECKRk', 'cTUIs2wwxSE', 'PK_czuthOhE', '7oBl3Ev8Aco', '3_9Ypcs82fM', '4Fi0EvGomfo', 'SvwZGpi8ySU', 'd11aLbkui0A', '1QiAOn3fxjs', 'ajOV7ZAuD_0', 'SfBrFB_rB4o', 'Ii3JUo9UqX8', 'TBPAeLiDIqo', 'LSzykC2PypQ', 'bcL2ID2YX18', '4jwQ579lTgg', 'W_TtBgg1hoA', '49gaS125Pn0', '6zuH-8-Oo6A'];
 static List<String> pediatri =['emSmX_ZoPOc', 'XwZYQfJZYL4', 't5JDSHoNfGs', 'bPsbrfC7Le8', 'FT_Ok_SDEMI', 'aQJar1FPQU8', 'MTMK-hzeQtk', 'VzkYqxy4taU', '79pO0AKTkYc', 'jAsVl7oU-tc', 'DXwGr3oyqLM', 'zK_jA1mHAn8', '9uSKME6xxmo', 'hjk2lzV8u2A', '56opLhzCtXk', 'lDmfafg1fJQ', 'Z7ez42jbsI0', 'JvkftMI99oo', 'J_O4lWpRFzA', 'etHILvykxP8', 'm2LUPm6Junk', 'v8q3kL3hw-Q', 'vOXwS9qODtA', 'ixDvV0uGDgE', 'PaywRjS4hQE', '4cGpe9q-mOQ', 'CZCRHcOly9Q', 'wHiuirSQhCE', 'dvdhJy9aMdg', 'wfdiZfR7F90', 'PNleJQX_IyM', 'hapT7Or1mQ4', '7uBE65pVwVY', '1nnEVcDBJEE', 'PICXPFRcRbw', 'JitP2C0AuK0', '7Z0VpO_CYus', 'EoKa293Ms3w', 'pqRLsQbJrv0', 'O7GprK1jFCM', 'Wafiqsds6g4', 'I0fl0zPFagA', 'ssGFHRSjZk8', 'tCRCUS6DOy0', '2VFm4ing1VY', 'NWORGCM8lbY', '90ggbV82eC4', 'VWp0qHNDdTQ', 'fPixRW2c7s0', 'NkGP1kQMKrA', 'XfqjMyeNumg', 'v9XpKOTJjqc', 'nWuQrERQ-UY', 'SMyfr1E-HeE', 'NliYHDOaGjw', 'gZdEhHnx_cQ', 'ZuMlsyYv6Uo', 'X4Lpq2fsSdM', 'iTQ3aeQ8bAc', 'wMJyoSqW8PQ', 'a35qaU4hQcg', 'rImqH8-nkus', 'L6C_-3Zv84M', 'v_KZpp879N8', 'grR1BOqnXZ8', 'fahkqLya2Cw', 'kJSL2594NxQ', 'pq3mK7yq1zw', 'nxeeyNoSIi0', 'DSwwh71C_l8', '70mLXYopdbQ', 'MTNOcpzLBAg', 'Rz4TZkoOAxY', '5wdSux4JNX8', 'D4tly29Pa3w', 'NUf5l8C0Rzc', 'be_VgdRw6KE', 'F6ZM3PvJxi8', '4W2HQV699WA', 'iDs_70_nAiQ', 'e2XVvc8Jn7E', 'QrPmW6cZqWY', 'YiY3uKoy5fw', 'XGo5lN0Jo1Q', 'FwumPQj_KSM', 'SFLmnoD4f_0', 'ifdZe7T86Ws', 'rh2O_Ake3c0', 'g_kk7ZE4D2E', 'Q8enyX7p_MA'];
 static List<String> gis = ['AbnxCTRNN8Q', '2rO2-HtNpPU', 'Yc-VEGS2Kc0', 'yZl-9S1C18Y', '8WoXymcIj1c', 'UyHwy5ThiEo', 'pFaTDp1bZXc', 'eB9YY7FAzew', 'UExMDTjqWwg', 'BhmNOpKaSvI', 'mMj_kQhaU8w', '9BdzyhywGBQ', 'EQWSU5OZCRw', 'huEmSk_ojq4', 'Obj_TwgQuBo', 'NOBtC_RN-3Q', 'R7hNkIMfMX0', 'CrzmWUJSLhY', 'ZuR_Ofm7xlE', 'g0r3QEHqI4c', 'jLCSolcTqIo', 'OnpETDYhyyM', 'f7URTGpqdEo', 'j3vrunSTCDc', 'AtFpONgEIUA', 'oDyw4BocHoo', 'T3lVCQYPIhM', 'yLqYK0XJYGo', 'KaPkmTD0uhE', 'gTKw5zgUeP0', 'fog2GpErQto', 'E68BZ-J9Uic', 'aVMPSVTdyjE', 'ej8AxQ5rqeY', 'Wnlp0rvNcd4', 'se_DqJkZHPo', 'D-THC5Bf25M', 'I6wIu-MLhAM', '3Jyymj6g1RQ', 'HosUilk99bk', '5DMC7U6wlh4', 'EDOz-8inoTY', 'Z46BXcyTeeY', 'x78w0878n8A', 'atSnGmxSxbw', 'L9GfBg6G2Jo', 'gzVSijh_oJc', 'RjriTL2AVH4', 'W544g09zq90', '7BQC6bcqhLs', 'OjogyjDccuI', 'XIDP3sedJnE', 's9m9MBQw9fo', '_4KO7P3Lo_s', '1sLXyC31s7A', 'u-49OtoSLWw', 'I72XDsAUnvg', 'reGIvsjQUos', 'ATRugrRIoPw', 'QGoubdw2lkY', 'Rv-UfHN4UiM', 'JrdRjwuXtF0', 'K0_khodK364', 'kZqYY8NsIWY', 'B_MHbCnm9xY', 'yfNXwXELzQI', 'GQSp8od3Now', 'O6GJ80Q2s94', 'R7W__KpdUsA', 'epOXb7t3sOg', 'jacpzw4zEDY', 'caDzD2TYpj0', 'q7wnaCnfEmM', 'WrTyjJTv3ps', 'luF_GsaSTBE', 'PjKN2DIgI_Q', 'wDqtxzkLswo', '02bsW9RcD1U', 'INC08oWGCs4', '22PqH6-zAZQ', 'Hx_Xv_v9BEs', 'st7A3RlB5ow', '1dF_a8gNijU', 'kErGVYpbbjQ', 'H9sl3Ta_9Qk', 'xBL5fifnf0U', '2bqAYwDQ_n8', 'liPmB9rPo74', 'FybcrwysSqM'];
 static List<String> soldol4 = ['fxizPgLMVJk', '7lQrEa8rKyQ', 'jKYzwQExMeo', 'ZfEkxAwY6qM', 'yKWkREZj-lU', 'Dp8df6jMdS0', 'Ed1uTSpgDB0', 'RgmsB08012s', 'ngF1KrjWY4c', 's2FlyFcMUzA', 'NR_MqEb-BsE', 'm8Ln77bYAIg', 'XXJ_nrO77Ww', '9bjOAuvx2jQ', 'I2up8E9dPaE', '16z2DooyxB8', 'n_ACgC1bas4', '_8yIuAH6II8', 'GC7DaiGhFsA', 'MwDmohCIX6w', 'RjSSWg9_ZsI', 'ECJZpajF-5k', 'zpEzRNwGYug', 'oNrPNsgzoWY', 'iiRyR9hXsGo', 'y6OQmQTloMM', '5mmsVxCm1NU', '6nUVzNhdQu0', 'lIxzIJWOZGY', '1lzuR5vbwNo', 'ezsHHw4z8es', 'eqeH3bRVS2c', '8CBdC_Cx2fA', 'uuxveRb9tMQ', 'xvA7CAEoI-s', 'gSh1MD7TLIM', 's4Gp-6-zbl0', 'KR0YFyIIwBw', 'oMe98E_860Q', 'ag_Eh_AyySU', 'ijyt-7jLLos', 'GR9Xt0ra6Kw', '2jROoP9772k', 'FkPQWmdIQzY', 'rul--zo1dwE', '0nHYHvzH2xU', '7Oe1BTtMNGM', 'k-LB8WfoIyQ', 'D0JUluU5G7Y', 'VXTLuZfWbGE', '-FbiNp4porQ', '8eDwteZMiSs', 'shNnEOhEikQ', 'jH_9TFxqWI0', 'JcTD8wlXZ7Y', 'L-YUf9RikL4', 'OTuAnmWr1Kw', 'J44yYns80r8', 'v1P0OX5yRf8', 'SAa6KKMZ7OA', 'KY7pCk1N52E', '8Zq69AbZ0xQ', '4eC5-1ZsF6M', '5q-BHgjKeE4', '0dVsNP6lVCU', 'F0hJM4cFtGg', 'AjeI5N_DNBY', '3zCtwjUu3pw', '3-KIMeQGRnE', 'LFCM66X_wkE', 'eXox1CxAoLI', 'z3wl9_0zhoA', 'Tj0CrNlUiQY', '5rfzADtsOpo', 'LgoaBpt-Zts', 'eU078IwAHVg', 'FyTjf22xvWo', 'aM6NpExDlGU', 'p9FfYZGIeIc', 'aKsAuC3V708', 'YRYxv6N9MQI', 'Xb_VDOH1KM4', 'EHXqbJx-XjE'];
 //List soldol


}
// let a = [] ;
//  let k = document.getElementsByClassName("yt-simple-endpoint style-scope ytd-playlist-video-renderer");
// let c = 0;
// while(c<k.length){      
//        a[c]=k[c].href.split("=")[1].split("&")[0];
//        c++;
// }
// console.log(a);