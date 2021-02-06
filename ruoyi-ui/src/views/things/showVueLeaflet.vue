<template>
  <div class="map">

  </div>
</template>

<script>
    import * as Vue2Leaflet from 'vue2-leaflet';
    import LeafletDraw from 'leaflet-draw'
    import {icon } from "leaflet";

    export default {
        name: 'VueLeaflet',
        components: {

        },
        data () {
            return {
                map:null,
                normal:null,
                stat:null,
                layer:null,
                drawnItems:null,
                geoLayers:[]
            }
        },
        mounted() {

            this.map=L.map(this.$el,{
                drawControl: false
            }).setView([32.413220,120.219482],8);
            // L.tileLayer('http://webrd01.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}',
            //     {
            //         attribution: '高德'
            //     }
            // ).addTo(this.map);
            L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(this.map);
            this.drawnItems = new L.FeatureGroup();
            this.map.addLayer(this.drawnItems);
        },
        methods:{
            resetLatlng(rows){
                if(rows != null && rows.length>0){
                    for(let i=0;i<rows.length;i++){
                        if(rows[i].latlng !=null && rows[i].latlng != ''){
                            let name = rows[i].name;
                            let geoLayer = L.geoJSON(JSON.parse(rows[i].latlng)).addTo(this.drawnItems).bindPopup(name);
                            geoLayer.id = rows[i].id;
                            this.geoLayers.push(geoLayer);
                        }
                    }
                    this.map.fitBounds(this.drawnItems.getBounds(),{maxZoom:15});
                }
            },
            lightHeight(id){

                let result = this.geoLayers.filter((a,i)=>{
                    return id === a.id
                });

                this.map.fitBounds(result[0].getBounds(),{maxZoom:15});
                // this.map.flyToBounds(result[0].getBounds(),{maxZoom:15});
                result[0].openPopup();
            }
        }

    }
</script>


<style scoped>
  .map{
    width:100%;
    height:calc(70vh);
    /*height: 500px;*/
  }
  .sr-only {
    display: none;
  }
</style>
