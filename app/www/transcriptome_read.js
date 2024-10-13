
Shiny.addCustomMessageHandler("visiumData", function(visium_data) {
  console.log("Initializing DeckGL...");
  initializeDeckGL(visium_data);
});

// Assuming you have the following spatial data
const spatialTranscriptomicsData = [
  {id: 1, x: 100, y: 200, gene_expression: 50},
  {id: 2, x: 150, y: 250, gene_expression: 80},
  {id: 3, x: 300, y: 350, gene_expression: 120}
  // More spots...
];

function initializeDeckGL(visium_data) {
  //const visium_json_data = JSON.parse(visium_data);
  //console.log(visium_json_data);
  const minX = 0;
  const maxX = 2000;//600;
  const minY = 0;
  const maxY = 1885;//566;
  const adjustedMinX = minX; // 2000 (new left edge)
  const adjustedMaxX = maxX; // 0 (new right edge)
  const adjustedMinY = maxY; // 0 (top remains unchanged)
  const adjustedMaxY = minY; // 1885 (bottom remains unchanged)
  const bounds = [minX, minY, maxX, maxY];  // Replace these with the bounds of your tissue image
  const adjustedBounds = [adjustedMinX, adjustedMinY, adjustedMaxX, adjustedMaxY]; 
  
  // Create a BitmapLayer for the image
  const tissue_bitmapLayer = new deck.BitmapLayer({
    id: 'bitmap-layer',
    bounds: adjustedBounds,  // Coordinates [minX, minY, maxX, maxY] for the image bounds
    image: 'detected_tissue_image.jpg', //'tissue_lowres_image.png' // Path to the image in the www folder
    opacity: 1.0
  });
  
  // Define an Orthographic View (non-geographical projection)
  const orthographicView = new deck.OrthographicView({
    id: 'ortho-view',
    controller: true,  // Enable zoom and pan
  });
  
  // Create a deck.gl scatterplot layer
  /*
  const scatterplotLayer = new deck.ScatterplotLayer({
    id: 'scatterplot-layer',
    data: visium_json_data,
    getPosition: d => [d.x, d.y],  // Coordinates from the data
    getRadius: 10,
    getFillColor: [255, 0, 0],  // Red color for points
    radiusScale: 2,
    pickable: true,
    onClick: info => console.log(info)  // Click event
  });
  */
  
  // Initialize deck.gl
  new deck.Deck({
    container: 'deckgl-container',
    views: [orthographicView],
    layers: [tissue_bitmapLayer],
    initialViewState: {
      target: [0, 0], // Center of the view
      zoom: 1,
      bearing: 0, //no rotation
      pitch: 0 //no tilt
    }
  });
}
