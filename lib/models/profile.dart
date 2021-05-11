class Profile {
  final String imageUrl;
  final String url;

  Profile({
    required this.imageUrl,
    required this.url,
  });
}

final List<Profile> profileList = [
  Profile(
    imageUrl:
        'https://content.linkedin.com/content/dam/me/brand/en-us/brand-home/logos/In-Blue-Logo.png.original.png',
    url: 'https://www.linkedin.com/in/johandi-patria/',
  ),
  Profile(
    imageUrl:
        'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
    url: 'https://github.com/Dipatria',
  ),
];
