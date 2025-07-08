import 'package:flutter/material.dart';
import '../../../core/navigation/navigation_service.dart';

/// HomeView is the main landing page of the app, showing featured items and menu categories.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232010),
      appBar: _HomeAppBar(),
      body: const _HomeBody(),
      bottomNavigationBar: const _HomeBottomNavBar(),
    );
  }
}

/// AppBar for the HomeView.
class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF232010),
      elevation: 0,
      title: const Text(
        'Pizza Palace',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          letterSpacing: -0.5,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {
            NavigationService.navigateTo('/details');
          },
        ),
      ],
    );
  }
}

/// The main body of the HomeView, including search, featured, and menu sections.
class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // Search Bar
        const _SearchBar(),
        // Featured Section
        const _SectionTitle(title: 'Featured'),
        const _FeaturedList(),
        // Menu Section
        const _SectionTitle(title: 'Menu', top: 24),
        const _MenuCategories(),
        // Popular Items
        const SizedBox(height: 16),
        _MenuItemCard(
          title: 'Margherita',
          subtitle: 'Classic pizza with tomato sauce, mozzarella, and basil.',
          price: '2412.99',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBYmfVx4LN8rA343zEfsayV1W3o7A1NM5c1gz1T-xIBUc9TzCUM3P9CyNHV6rFCSPcOMyUguuxOe91xD5Ec5gNxW9ytNSeUqdsnjoM1iYbhduVTqIB3zDlMJa4EPo3dRgiR7gVPZP7D2znVYVpWpQ_z2ERkuMyxjAgEjBVuyBLt-7sswBVrGuc3Ld6qGzoIHfgCULimb6xdDBXPEfXdKlcTUrtUj6F8moDKzfcnjXtzSNijuPP3r_Id20eEPTx4NPkZS_R5cUWJ5oYi',
          onTap: () => NavigationService.navigateTo('/details'),
        ),
        _MenuItemCard(
          title: 'Pepperoni',
          subtitle: 'Pizza with tomato sauce, mozzarella, and pepperoni.',
          price: '2414.99',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCVPZBgigWCIxTe6k3hP6dA2dvCag9o-hJMha1lI-c1XDnm-rhwv86mIzFI4iB6cJBdjKBVpYL8MSTosbvORwYXO7O9MNgAy5bQFY7STzEiCEChXp0LpI8oj9pLddbTMmEsWq92KWrRe2R-_0-WZsWSsdo-Fp2EZ62VRVZQKSQ-NmiQJB9qp7rDsady6e32xnkOcTwOLpRTQf4XpabGTYt74o5v_WRFSCI_oVXrGcmr-iriIaHAyi5SCIkv30AdNBx9KnrqpCLRD51u',
          onTap: () => NavigationService.navigateTo('/details'),
        ),
        _MenuItemCard(
          title: 'Hawaiian',
          subtitle: 'Pizza with tomato sauce, mozzarella, ham, and pineapple.',
          price: '2413.99',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBrdl7yJBmMcPFFAz3L8G9bwEFKYg3GNJdxIAHu4qP8uBe9Qz7GBD0CVg2jXuMQ5gyeylCIHyUtiaxPh0vA4SwFq4ryJjC7muzxECt6O3kj4RqGPzBuDGVMUyEhjyt4it-DpKiazQslD7fJJOKZcynfaXa2Naj9-hY3_MBfIYsqLxmKq6QzAQpYxajU66bRe6cUDVnTBuCkMKLVKBXxwE1rqlhapqiOynX5eqTpbIvdfB7d0ROWt3CxzyWYPPUgXlIeh-AfnP-82m2A',
          onTap: () => NavigationService.navigateTo('/details'),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

/// Search bar widget for the home screen.
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF494222),
          prefixIcon: const Icon(Icons.search, color: Color(0xFFcbc190)),
          hintText: 'Search for food or items',
          hintStyle: const TextStyle(color: Color(0xFFcbc190)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

/// Section title widget with optional top padding.
class _SectionTitle extends StatelessWidget {
  final String title;
  final double top;
  const _SectionTitle({required this.title, this.top = 16});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, top, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}

/// Horizontally scrollable list of featured cards.
class _FeaturedList extends StatelessWidget {
  const _FeaturedList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          _FeaturedCard(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDGAPbZ39PyoD98IvOeqBztNFFsrCAQp_v8g7r5GKHO7czaNnMbHnfE-QXkiuqhbY5Xbi96Fl3nsls_xpSI9EFAU-XWbkjpKcW3kEKS-096wt3R4I707ogCK4qSozPk_gJw45dOE-NpiS0d3RJwrW6sMcnQcNq_a6erOy_eqRYrkQJ8sfkUt_ezJNVSlKQ-o5Md17iOCnNEr6e_uNRT6jwgyHyUHEm4LazDMlBj4xCBQChCIDCt1ipfc_2T4aQgEyIBq7aVJX0df3mp',
            title: 'Pizza of the Day',
            subtitle: 'Enjoy our daily special pizza at a discounted price.',
          ),
          _FeaturedCard(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuABH9_S7PmJXjaWdJ4htCBbktBtfAaI69Ed9CMiUEzFB6XhO0VdDrswoHubX5Twsr67IoFlmu6vVgx_RalaJYTwWQybOR1uhODTlFo3VLVICoUBxpToc_ebSatx2jcQoqr_5HAzMpFb2wPL9xmnUewK2ell2TcPpu91193Bd8OjINdYwm7yr4OIOJvEvQ4cXhqKFKw2ysv9z1hX4MnQ4gpch4cUUbDLIjU6y4Dpfs7CBQE3AYwIxGp64Szudgz1yXHvgdLR2QlSWvDw',
            title: 'Special Offer',
            subtitle: 'Get a free side with any large pizza order.',
          ),
          _FeaturedCard(
            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA9_xQ0vt3-p_kZ1ketd2HeFUaq1xJBUEyJCO-IjYJx-3m-nZQYI81L1HK17o2XVLbPpd7tsUmAPxJluud5g97j-FOHYAqzz5GGReZuc8ohPDo7E6E4njr641s-5V-eGNG6VfKisPNKPh7_0FEews0ydEDG2GuqTBahYHAHgMNk6uxFFEztA7RLLhdZa8diAjpU3yS2RlvV1OSm2kZxYiMSbSfxYd5TVjluYKCkZ9QxlmLrVPiZvvLjArRvvvrX3nfcN9CBWf9Rmdrn',
            title: 'New on the Menu',
            subtitle: 'Try our latest pizza creation with unique toppings.',
          ),
        ],
      ),
    );
  }
}

/// Menu categories row.
class _MenuCategories extends StatelessWidget {
  const _MenuCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _MenuCategory(label: 'Pizzas', selected: true),
          _MenuCategory(label: 'Beverages'),
          _MenuCategory(label: 'Frittatinas'),
          _MenuCategory(label: 'Desserts'),
        ],
      ),
    );
  }
}

/// Single menu category tab.
class _MenuCategory extends StatelessWidget {
  final String label;
  final bool selected;
  const _MenuCategory({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected ? const Color(0xFFeec80b) : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFFcbc190),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

/// Card for a featured item.
class _FeaturedCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  const _FeaturedCard({required this.imageUrl, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Color(0xFFcbc190), fontSize: 13),
          ),
        ],
      ),
    );
  }
}

/// Card for a menu item, navigates to details on tap.
class _MenuItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imageUrl;
  final VoidCallback? onTap;
  const _MenuItemCard({required this.title, required this.subtitle, required this.price, required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subtitle, style: const TextStyle(color: Color(0xFFcbc190), fontSize: 13)),
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(price, style: const TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bottom navigation bar for the home screen.
class _HomeBottomNavBar extends StatelessWidget {
  const _HomeBottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF342f18),
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color(0xFFcbc190),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_pizza),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
      currentIndex: 0,
      onTap: (index) {
        if (index == 1) {
          NavigationService.navigateTo('/menu');
        }
      },
    );
  }
} 