function Navbar() {
  return (
    <nav className="bg-gray-900 px-6 py-4 text-white">
      <div className="mx-auto flex max-w-7xl flex-col items-center justify-between gap-4 md:flex-row">
        {/* Logo */}
        <h1 className="text-2xl font-bold text-blue-400">MyStore</h1>

        {/* Navigation Links */}
        <div className="flex flex-wrap justify-center gap-6">
          <a href="#" className="hover:text-blue-400">
            Home
          </a>

          <a href="#" className="hover:text-blue-400">
            About
          </a>

          <a href="#" className="hover:text-blue-400">
            Services
          </a>

          <a href="#" className="hover:text-blue-400">
            Contact
          </a>
        </div>

        {/* Login Button */}
        <button className="rounded-lg bg-blue-600 px-5 py-2 font-semibold hover:bg-blue-700">
          Login
        </button>
      </div>
    </nav>
  );
}

export default Navbar;
