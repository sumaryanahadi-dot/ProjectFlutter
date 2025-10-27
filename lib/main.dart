import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const AustraliaWishlistApp());
}

class AustraliaWishlistApp extends StatelessWidget {
  const AustraliaWishlistApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism Australia',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFAA00),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFAA00),
          primary: const Color(0xFFFFAA00),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFAA00),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        fontFamily: 'Roboto',
      ),
      home: const MainNavigationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({Key? key}) : super(key: key);

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ExplorePage(),
    const WishlistPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFFAA00),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Jelajahi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFFFFAA00),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Tourism Australia',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1523482580672-f109ba8cb9be?w=1200',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat Datang di Australia',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Temukan pengalaman tak terlupakan di benua terkecil namun paling menakjubkan di dunia.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Destinasi Populer',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildListDelegate([
                _buildQuickCard(
                  context,
                  'Sydney',
                  'https://images.unsplash.com/photo-1523059623039-a9ed027e7fad?w=400',
                ),
                _buildQuickCard(
                  context,
                  'Great Barrier Reef',
                  'https://images.unsplash.com/photo-1587139223877-04cb899fa3e8?w=400',
                ),
                _buildQuickCard(
                  context,
                  'Melbourne',
                  'https://images.unsplash.com/photo-1514395462725-fb4566210144?w=400',
                ),
                _buildQuickCard(
                  context,
                  'Uluru',
                  'https://images.unsplash.com/photo-1589802829985-817e51171b92?w=400',
                ),
              ]),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _buildQuickCard(BuildContext context, String title, String imageUrl) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String selectedCategory = 'Semua';
  String searchQuery = '';
  
  final List<String> categories = [
    'Semua',
    'Pantai',
    'Kota',
    'Alam',
    'Budaya',
    'Petualangan',
  ];

  @override
  Widget build(BuildContext context) {
    List<WishlistItem> allItems = WishlistDataService.getAllDestinations();
    
    if (selectedCategory != 'Semua') {
      allItems = allItems.where((item) => item.category == selectedCategory).toList();
    }
    
    if (searchQuery.isNotEmpty) {
      allItems = allItems.where((item) => 
        item.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
        item.location.toLowerCase().contains(searchQuery.toLowerCase())
      ).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jelajahi Australia'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Cari destinasi...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(categories[index]),
                        selected: selectedCategory == categories[index],
                        onSelected: (selected) {
                          setState(() {
                            selectedCategory = categories[index];
                          });
                        },
                        selectedColor: const Color(0xFFFFAA00),
                        labelStyle: TextStyle(
                          color: selectedCategory == categories[index]
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      body: allItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'Tidak ada hasil ditemukan',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: allItems.length,
              itemBuilder: (context, index) {
                return ExploreDestinationCard(
                  item: allItems[index],
                  onAddToWishlist: () {
                    WishlistDataService.addToWishlist(allItems[index]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${allItems[index].title} ditambahkan ke wishlist'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class ExploreDestinationCard extends StatelessWidget {
  final WishlistItem item;
  final VoidCallback onAddToWishlist;

  const ExploreDestinationCard({
    Key? key,
    required this.item,
    required this.onAddToWishlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DestinationDetailPage(item: item),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                item.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFAA00).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          item.category,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFAA00),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        item.location,
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: onAddToWishlist,
                          icon: const Icon(Icons.favorite_border, size: 18),
                          label: const Text('Tambah ke Wishlist'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFAA00),
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<WishlistItem> wishlistItems = [];
  bool isLoading = true;
  String sortBy = 'terbaru';

  @override
  void initState() {
    super.initState();
    _loadWishlist();
  }

  Future<void> _loadWishlist() async {
    setState(() {
      isLoading = true;
    });
    
    await Future.delayed(const Duration(milliseconds: 500));
    
    setState(() {
      wishlistItems = WishlistDataService.getWishlistItems();
      isLoading = false;
    });
  }

  void _sortWishlist() {
    setState(() {
      if (sortBy == 'terbaru') {
        wishlistItems = wishlistItems.reversed.toList();
        sortBy = 'terlama';
      } else if (sortBy == 'terlama') {
        wishlistItems.sort((a, b) => a.title.compareTo(b.title));
        sortBy = 'nama';
      } else {
        wishlistItems = WishlistDataService.getWishlistItems();
        sortBy = 'terbaru';
      }
    });
  }

  void _shareWishlist() {
    String wishlistText = 'Daftar Keinginan Australia Saya:\n\n';
    for (var item in wishlistItems) {
      wishlistText += '• ${item.title} - ${item.location}\n';
    }
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bagikan Wishlist'),
        content: SingleChildScrollView(
          child: Text(wishlistText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Wishlist dibagikan!')),
              );
            },
            child: const Text('Bagikan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFFFFAA00),
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Daftar Keinginan Saya',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3.0,
                      color: Color.fromARGB(128, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1523482580672-f109ba8cb9be?w=1200',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.sort),
                onPressed: _sortWishlist,
                tooltip: 'Urutkan: $sortBy',
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: _shareWishlist,
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'clear') {
                    _showClearConfirmation();
                  } else if (value == 'export') {
                    _exportWishlist();
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'export',
                    child: Row(
                      children: [
                        Icon(Icons.download, size: 20),
                        SizedBox(width: 8),
                        Text('Ekspor PDF'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'clear',
                    child: Row(
                      children: [
                        Icon(Icons.delete_forever, size: 20, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Hapus Semua', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengalaman Australia Impian Anda',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.red[400], size: 20),
                      const SizedBox(width: 8),
                      Text(
                        '${wishlistItems.length} destinasi tersimpan',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          if (isLoading)
            const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else if (wishlistItems.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 100,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Daftar keinginan Anda kosong',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Mulai tambahkan destinasi impian Anda\ndari halaman Jelajahi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navigate to explore
                      },
                      icon: const Icon(Icons.explore),
                      label: const Text('Jelajahi Destinasi'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFAA00),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return WishlistCard(
                      item: wishlistItems[index],
                      onToggleFavorite: () {
                        setState(() {
                          WishlistDataService.removeFromWishlist(wishlistItems[index]);
                          wishlistItems.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Dihapus dari wishlist'),
                            backgroundColor: Colors.orange,
                          ),
                        );
                      },
                      onRemove: () {
                        setState(() {
                          WishlistDataService.removeFromWishlist(wishlistItems[index]);
                          wishlistItems.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item dihapus dari daftar keinginan'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DestinationDetailPage(
                              item: wishlistItems[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  childCount: wishlistItems.length,
                ),
              ),
            ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 80),
          ),
        ],
      ),
    );
  }

  void _showClearConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Semua Wishlist?'),
        content: const Text(
          'Tindakan ini akan menghapus semua destinasi dari daftar keinginan Anda. Tindakan ini tidak dapat dibatalkan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                WishlistDataService.clearWishlist();
                wishlistItems.clear();
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Semua wishlist telah dihapus'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Hapus Semua'),
          ),
        ],
      ),
    );
  }

  void _exportWishlist() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ekspor Wishlist'),
        content: const Text(
          'Wishlist Anda akan diekspor sebagai file PDF dan disimpan di perangkat Anda.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Wishlist berhasil diekspor!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Ekspor'),
          ),
        ],
      ),
    );
  }
}

class WishlistCard extends StatelessWidget {
  final WishlistItem item;
  final VoidCallback onToggleFavorite;
  final VoidCallback onRemove;
  final VoidCallback onTap;

  const WishlistCard({
    Key? key,
    required this.item,
    required this.onToggleFavorite,
    required this.onRemove,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'destination-${item.title}',
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      item.imageUrl,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 220,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.image, size: 50, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: onToggleFavorite,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFAA00),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      item.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.location,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: item.tags.map((tag) {
                      return Chip(
                        label: Text(
                          tag,
                          style: const TextStyle(fontSize: 12),
                        ),
                        backgroundColor: Colors.grey[200],
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: onTap,
                          icon: const Icon(Icons.info_outline, size: 18),
                          label: const Text('Lihat Detail'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFFFAA00),
                            side: const BorderSide(color: Color(0xFFFFAA00)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        color: Colors.red[400],
                        onPressed: onRemove,
                        tooltip: 'Hapus dari wishlist',
                        iconSize: 28,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DestinationDetailPage extends StatelessWidget {
  final WishlistItem item;

  const DestinationDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            floating: false,
            pinned: true,
            backgroundColor: const Color(0xFFFFAA00),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3.0,
                      color: Color.fromARGB(128, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              background: Hero(
                tag: 'destination-${item.title}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFAA00),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.location_on, color: Colors.grey[600], size: 20),
                      const SizedBox(width: 4),
                      Text(
                        item.location,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Tentang Destinasi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Aktivitas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: item.tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFAA00).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(0xFFFFAA00).withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFFFAA00),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Informasi Wisata',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.access_time, 'Jam Buka', '24 Jam'),
                  _buildInfoRow(Icons.attach_money, 'Biaya Masuk', 'Bervariasi'),
                  _buildInfoRow(Icons.directions_car, 'Akses', 'Mudah dijangkau'),
                  _buildInfoRow(Icons.restaurant, 'Fasilitas', 'Tersedia'),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Fitur booking akan segera hadir!'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.book_online, size: 20),
                      label: const Text(
                        'Rencanakan Kunjungan',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFAA00),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Bagikan destinasi ini!'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.share, size: 20),
                      label: const Text(
                        'Bagikan',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFFFAA00),
                        side: const BorderSide(color: Color(0xFFFFAA00)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFAA00).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFFFFAA00), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pengaturan')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: const BoxDecoration(
                color: Color(0xFFFFAA00),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Wisatawan Australia',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'traveler@australia.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildStatCard(
                    context,
                    'Destinasi Dikunjungi',
                    '5',
                    Icons.place,
                    Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildStatCard(
                    context,
                    'Wishlist',
                    '${WishlistDataService.getWishlistItems().length}',
                    Icons.favorite,
                    Colors.red,
                  ),
                  const SizedBox(height: 12),
                  _buildStatCard(
                    context,
                    'Foto Dibagikan',
                    '23',
                    Icons.photo_camera,
                    Colors.green,
                  ),
                  const SizedBox(height: 32),
                  _buildMenuTile(
                    context,
                    Icons.history,
                    'Riwayat Perjalanan',
                    () {},
                  ),
                  _buildMenuTile(
                    context,
                    Icons.bookmark,
                    'Artikel Tersimpan',
                    () {},
                  ),
                  _buildMenuTile(
                    context,
                    Icons.notifications,
                    'Notifikasi',
                    () {},
                  ),
                  _buildMenuTile(
                    context,
                    Icons.help,
                    'Bantuan & Dukungan',
                    () {},
                  ),
                  _buildMenuTile(
                    context,
                    Icons.info,
                    'Tentang Australia',
                    () {},
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Keluar'),
                            content: const Text('Apakah Anda yakin ingin keluar?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Batal'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Berhasil keluar'),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Text('Keluar'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Keluar'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFFFAA00)),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title diklik')),
        );
      },
    );
  }
}

class WishlistItem {
  final String title;
  final String location;
  final String description;
  final String imageUrl;
  final String category;
  final List<String> tags;
  bool isFavorite;

  WishlistItem({
    required this.title,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.tags,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'location': location,
        'description': description,
        'imageUrl': imageUrl,
        'category': category,
        'tags': tags,
        'isFavorite': isFavorite,
      };

  factory WishlistItem.fromJson(Map<String, dynamic> json) => WishlistItem(
        title: json['title'],
        location: json['location'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        category: json['category'],
        tags: List<String>.from(json['tags']),
        isFavorite: json['isFavorite'] ?? false,
      );
}

class WishlistDataService {
  static final List<WishlistItem> _wishlist = [];
  
  static final List<WishlistItem> _allDestinations = [
    WishlistItem(
      title: 'Great Barrier Reef',
      location: 'Queensland',
      description: 'Jelajahi keajaiban bawah laut terbesar di dunia dengan lebih dari 2.900 terumbu karang individual dan 900 pulau yang membentang sepanjang 2.300 kilometer.',
      imageUrl: 'https://images.unsplash.com/photo-1587139223877-04cb899fa3e8?w=800',
      category: 'Alam',
      tags: ['Diving', 'Snorkeling', 'Pantai', 'Fotografi'],
      isFavorite: false,
    ),
    WishlistItem(
      title: 'Sydney Opera House',
      location: 'New South Wales',
      description: 'Ikon arsitektur paling terkenal di Australia yang menakjubkan dengan desain uniknya yang menyerupai layar kapal.',
      imageUrl: 'https://images.unsplash.com/photo-1523059623039-a9ed027e7fad?w=800',
      category: 'Budaya',
      tags: ['Arsitektur', 'Seni', 'Fotografi', 'Teater'],
      isFavorite: false,
    ),
    WishlistItem(
      title: 'Uluru (Ayers Rock)',
      location: 'Northern Territory',
      description: 'Batu sakral raksasa di jantung Australia yang merupakan situs suci bagi masyarakat Anangu dan ikon spiritual.',
      imageUrl: 'https://images.unsplash.com/photo-1589802829985-817e51171b92?w=800',
      category: 'Alam',
      tags: ['Hiking', 'Budaya', 'Sunset', 'Fotografi'],
      isFavorite: false,
    ),
    WishlistItem(
      title: 'Twelve Apostles',
      location: 'Victoria',
      description: 'Formasi batuan kapur spektakuler di Great Ocean Road yang terbentuk secara alami oleh erosi laut selama jutaan tahun.',
      imageUrl: 'https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?w=800',
      category: 'Alam',
      tags: ['Pantai', 'Road Trip', 'Fotografi', 'Sunset'],
      isFavorite: false,
    ),
    WishlistItem(
      title: 'Bondi Beach',
      location: 'New South Wales',
      description: 'Pantai paling terkenal di Australia dengan pasir putih, ombak sempurna untuk surfing, dan budaya pantai yang hidup.',
      imageUrl: 'https://images.unsplash.com/photo-1506374322094-2301b55f541d?w=800',
      category: 'Pantai',
      tags: ['Surfing', 'Berenang', 'Santai', 'Kuliner'],
      isFavorite: false,
    ),
    WishlistItem(
      title: 'Melbourne City',
      location: 'Victoria',
      description: 'Kota paling liveable di dunia dengan seni jalanan, kafe tersembunyi, dan budaya multikultural yang kaya.',
      imageUrl: 'https://images.unsplash.com/photo-1514395462725-fb4566210144?w=800',
      category: 'Kota',
      tags: ['Kuliner', 'Seni', 'Belanja', 'Budaya'],
      isFavorite: false,
    ),
    WishlistItem(
      title: 'Daintree Rainforest',
      location: 'Queensland',
      description: 'Hutan hujan tertua di dunia yang berusia 135 juta tahun dengan keanekaragaman hayati yang luar biasa.',
      imageUrl: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800',
      category: 'Alam',
      tags: ['Hiking', 'Wildlife', 'Eco-tourism', 'Fotografi'],
      isFavorite: false,
    ),
    WishlistItem(
      title: 'Kakadu National Park',
      location: 'Northern Territory',
      description: 'Taman nasional terbesar di Australia dengan pemandangan alam yang dramatis dan warisan budaya Aborigin.',
      imageUrl: 'https://images.unsplash.com/photo-1523906630133-f6934a1ab2b9?w=800',
      category: 'Petualangan',
      tags: ['Hiking', 'Wildlife', 'Budaya', 'Camping'],
      isFavorite: false,
    ),
  ];

  static List<WishlistItem> getAllDestinations() {
    return _allDestinations;
  }

  static List<WishlistItem> getWishlistItems() {
    return _wishlist;
  }

  static void addToWishlist(WishlistItem item) {
    if (!_wishlist.any((i) => i.title == item.title)) {
      _wishlist.add(item);
    }
  }

  static void removeFromWishlist(WishlistItem item) {
    _wishlist.removeWhere((i) => i.title == item.title);
  }

  static void clearWishlist() {
    _wishlist.clear();
  }

  static bool isInWishlist(WishlistItem item) {
    return _wishlist.any((i) => i.title == item.title);
  }
}