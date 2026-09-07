class LocationModel {
  final String id;
  final String name;
  final String imageUrl;
  final String distance;
  final String availableDate;
  final double price;

  const LocationModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.distance,
    required this.availableDate,
    required this.price,
  });
}

/// Placeholder sample data until real API / backend is specified.
/// NOTE: image URLs are placeholders — swap with exported Figma assets
/// under assets/images/ once available.
final List<LocationModel> sampleLocations = [
  const LocationModel(
    id: '1',
    name: 'Toronto, Canada',
    imageUrl: 'assets/images/toronto.jpg',
    distance: '150KM',
    availableDate: 'OCT 24-25',
    price: 50.00,
  ),
  const LocationModel(
    id: '2',
    name: 'Banff, Canada',
    imageUrl: 'assets/images/banff.jpg',
    distance: '210KM',
    availableDate: 'NOV 02-04',
    price: 75.00,
  ),
  const LocationModel(
    id: '3',
    name: 'Vancouver, Canada',
    imageUrl: 'assets/images/vancouver.jpg',
    distance: '95KM',
    availableDate: 'OCT 30-31',
    price: 62.00,
  ),
];
