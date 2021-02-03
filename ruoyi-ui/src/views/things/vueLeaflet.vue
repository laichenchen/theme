<template>
  <div class="map">

  </div>
</template>

<script>
    import * as Vue2Leaflet from 'vue2-leaflet';
    import LeafletDraw from 'leaflet-draw'

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
                drawnItems:null
            }
        },
        mounted() {
            L.DrawToolbar.include({
                getModeHandlers: function (map) {
                    return [
                        {
                            enabled: true,
                            handler: new L.Draw.Polyline(map, { metric: true, repeatMode: true }),
                            title: '画线'
                        },
                        {
                            enabled: true,
                            handler: new L.Draw.Polygon(map, { allowIntersection: false, showArea: true, metric: true, repeatMode: false }),
                            title: '画面'
                        },
                        {
                            enabled: true,
                            handler: new L.Draw.Marker(map, { icon: new L.Icon.Default() }),
                            title: '画点'
                        },
                    ];
                }
            });

            this.map=L.map(this.$el,{
                drawControl: false
            }).setView([32.413220,120.219482],8);
            // L.tileLayer('http://webrd01.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}',
            //     {
            //         attribution: '高德'
            //     }
            // ).addTo(this.map);
            L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png' ).addTo(this.map);
            this.drawnItems = new L.FeatureGroup();
            this.map.addLayer(this.drawnItems);
            var drawControl = new L.Control.Draw({
                edit: {
                    featureGroup: this.drawnItems
                },
                draw: {
                    polyline: true,
                    polygon: false,
                    circle: false,
                    marker: true,
                    rectangle: false,
                    circlemarker: false,
                },
            });
            this.map.addControl(drawControl);
            let _this = this;
            _this.map.on(L.Draw.Event.CREATED, function (event) {
                if(_this.layer){
                    _this.drawnItems.removeLayer(_this.layer)
                }
                _this.layer = event.layer;
                _this.drawnItems.addLayer( _this.layer);
            });
        },
        methods:{
            setLatLng(){
                this.$emit('func', this.layer.toGeoJSON())
            },
            resetLatlng(data){
                if(data != null){
                    this.layer = L.geoJSON(JSON.parse(data)).addTo(this.drawnItems);
                    this.map.fitBounds(this.drawnItems.getBounds());
                }
            }
        }

    }
</script>


<style scoped>
  .map{
    width:100%;
    /*height:calc(100vh);*/
    height: 500px;
  }
  .sr-only {
    display: none;
  }
</style>
