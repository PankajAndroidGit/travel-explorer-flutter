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
    imageUrl: 'https://images.unsplash.com/photo-1517090504586-fde19ea6066f',
    distance: '150KM',
    availableDate: 'OCT 24-25',
    price: 50.00,
  ),
  const LocationModel(
    id: '2',
    name: 'Banff, Canada',
    imageUrl: 'https://images.unsplash.com/photo-1503614472-8c93d56e92ce',
    distance: '210KM',
    availableDate: 'NOV 02-04',
    price: 75.00,
  ),
  const LocationModel(
    id: '3',
    name: 'Vancouver, Canada',
    imageUrl: 'https://images.unsplash.com/photo-1560814304-4f05b62af116',
    distance: '95KM',
    availableDate: 'OCT 30-31',
    price: 62.00,
  ),
];
