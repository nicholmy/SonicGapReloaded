{
  "$GMObject":"",
  "%Name":"Orbinaut",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":1,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":1,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"Orbinaut",
  "overriddenProperties":[],
  "parent":{
    "name":"Badniks",
    "path":"folders/Stage Objects/Zone 2 - Tech Tree/Badniks.yy",
  },
  "parentObjectId":{
    "name":"Enemy",
    "path":"objects/Enemy/Enemy.yy",
  },
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":0,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"spikeResource","filters":[
        "GMTileSet",
        "GMSprite",
        "GMSound",
        "GMPath",
        "GMScript",
        "GMShader",
        "GMFont",
        "GMTimeLine",
        "GMObject",
        "GMRoom",
      ],"listItems":null,"multiselect":false,"name":"spikeResource","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"Orbinaut_Spike","varType":5,},
    {"$GMObjectProperty":"v1","%Name":"isExtendable","filters":[
        "GMTileSet",
        "GMSprite",
        "GMSound",
        "GMPath",
        "GMScript",
        "GMShader",
        "GMFont",
        "GMTimeLine",
        "GMObject",
        "GMRoom",
      ],"listItems":null,"multiselect":false,"name":"isExtendable","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"False","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"trackPlayer","filters":[
        "GMTileSet",
        "GMSprite",
        "GMSound",
        "GMPath",
        "GMScript",
        "GMShader",
        "GMFont",
        "GMTimeLine",
        "GMObject",
        "GMRoom",
      ],"listItems":null,"multiselect":false,"name":"trackPlayer","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"False","varType":3,},
    {"$GMObjectProperty":"v1","%Name":"state","filters":[
        "GMTileSet",
        "GMSprite",
        "GMSound",
        "GMPath",
        "GMScript",
        "GMShader",
        "GMFont",
        "GMTimeLine",
        "GMObject",
        "GMRoom",
      ],"listItems":null,"multiselect":false,"name":"state","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"spikeExtendSpeed","filters":[
        "GMTileSet",
        "GMSprite",
        "GMSound",
        "GMPath",
        "GMScript",
        "GMShader",
        "GMFont",
        "GMTimeLine",
        "GMObject",
        "GMRoom",
      ],"listItems":null,"multiselect":false,"name":"spikeExtendSpeed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"1","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"minSpikeRadius","filters":[
        "GMTileSet",
        "GMSprite",
        "GMSound",
        "GMPath",
        "GMScript",
        "GMShader",
        "GMFont",
        "GMTimeLine",
        "GMObject",
        "GMRoom",
      ],"listItems":null,"multiselect":false,"name":"minSpikeRadius","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"16","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"spikeRadius","filters":[
        "GMTileSet",
        "GMSprite",
        "GMSound",
        "GMPath",
        "GMScript",
        "GMShader",
        "GMFont",
        "GMTimeLine",
        "GMObject",
        "GMRoom",
      ],"listItems":null,"multiselect":false,"name":"spikeRadius","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"16","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"maxSpikeRadius","filters":[
        "GMTileSet",
        "GMSprite",
        "GMSound",
        "GMPath",
        "GMScript",
        "GMShader",
        "GMFont",
        "GMTimeLine",
        "GMObject",
        "GMRoom",
      ],"listItems":null,"multiselect":false,"name":"maxSpikeRadius","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"64","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"senseDistance","filters":[
        "GMTileSet",
        "GMSprite",
        "GMSound",
        "GMPath",
        "GMScript",
        "GMShader",
        "GMFont",
        "GMTimeLine",
        "GMObject",
        "GMRoom",
      ],"listItems":null,"multiselect":false,"name":"senseDistance","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"128","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"rotateSpeed","filters":[
        "GMTileSet",
        "GMSprite",
        "GMSound",
        "GMPath",
        "GMScript",
        "GMShader",
        "GMFont",
        "GMTimeLine",
        "GMObject",
        "GMRoom",
      ],"listItems":null,"multiselect":false,"name":"rotateSpeed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0.75","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"moveSpeed","filters":[],"listItems":[],"multiselect":false,"name":"moveSpeed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resource":null,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0","varType":0,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":null,
  "spriteMaskId":null,
  "visible":false,
}