use warnings;
use strict;
use Sys::MemInfo qw(totalmem freemem);
use System::CPU;
use Config;
use ExtUtils::Installed;

print "PerlFetch\n\n";
print "OS name: ".(ucfirst $Config{osname})."\n";
print "Kernel version: $Config{osvers}\n";
print "GNU libc version: $Config{gnulibc_version}\n";
if ($Config{ccname} eq "gcc") {
    print "C compiler: $Config{cc} $Config{gccversion}\n";
} else {
        print "C compiler: $Config{cc}\n";
}
if (&totalmem > 2**30) {
	printf "Total RAM: %.2f GB\n",(&totalmem / 2**30);
} elsif (&totalmem > 2**20) {
	printf "Total RAM: %.2f MB\n",(&totalmem / 2**20);
} else {
	printf "Total RAM: %.2f KB\n",(&totalmem / 2**10);
}
if (&freemem > 2**30) {
	printf "Free RAM: %.2f GB\n",(&freemem / 2**30);
} elsif (&freemem > 2**20) {
	printf "Free RAM: %.2f MB\n",(&freemem / 2**20);
} else {
	printf "Free RAM: %.2f KB\n",(&freemem / 2**10);
}
my $cpuname = System::CPU::get_name();
my $cpuarch = System::CPU::get_arch();
print "CPU model: $cpuname ($cpuarch)\n";

print "Perl version: $Config{version}\n";
my $modulesnumber = scalar ExtUtils::Installed->new( skip_cwd => 1 )->modules();
print "Number of CPAN modules installed: $modulesnumber\n";
