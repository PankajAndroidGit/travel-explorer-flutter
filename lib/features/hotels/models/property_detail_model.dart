class PropertyDetailModel {
  final String imageUrl;
  final String hostName;
  final String hostAvatarUrl;
  final double rating;
  final int reviewsCount;
  final String dateRange;
  final String address;
  final String description;

  const PropertyDetailModel({
    required this.imageUrl,
    required this.hostName,
    required this.hostAvatarUrl,
    required this.rating,
    required this.reviewsCount,
    required this.dateRange,
    required this.address,
    required this.description,
  });
}

/// Placeholder sample data until a real backend/API is specified.
const PropertyDetailModel samplePropertyDetail = PropertyDetailModel(
  imageUrl: 'https://images.unsplash.com/photo-1517090504586-fde19ea6066f',
  hostName: 'Trang Luxury, Lifestyle',
  hostAvatarUrl: 'https://i.pravatar.cc/150?img=32',
  rating: 4.9,
  reviewsCount: 1648,
  dateRange: 'OCT 24 - 26',
  address: '1155 Rue Sherbrooke Ouest, Toronto, Canada H3A 2N3',
  description:
      'Experience a comfortable and memorable stay at our hotel, where modern amenities, warm hospitality, and convenient surroundings come together. Designed for both business and leisure travelers, the hotel offers well-appointed rooms, quality facilities, and attentive service to make every stay relaxing and enjoyable. Guests can enjoy comfortable accommodation, delicious dining options, high-speed Wi-Fi, and a range of services suited for a family vacation or a weekend getaway.',
);