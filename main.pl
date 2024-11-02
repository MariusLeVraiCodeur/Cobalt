#Script was made by MariusLeVraiCodeur in 2024
#Cobalt Software by NerdCat Corp.
#Code in Perl
#https://github.com/MariusLeVraiCodeur
#Cat4Ever
#Contact me on mail : mariuslevrai33720@proton.me
#For more help go to README.txt in the cobalt

use strict;
use warnings;
use Cwd;
use Term::ANSIColor;
use MIME::Base64 qw(encode_base64);

sub main{
    while(1==1){
        #build scanner
        my $enter = print "Cobalt(None) ↳ ";
        my $scanner = <>;
        chomp $scanner;
        #commands
        if($scanner eq "version"){
            print "Cobalt 1.0.0\n"
        }
        if($scanner eq "bye"){
            exit;
        }

        if($scanner eq "new"){
            my $new = print "Cobalt(New) ↳ ";
            my $scanner_new = <>;
            chomp $scanner_new;

            if ($scanner_new eq "vault"){
                my $vault = print "Cobalt(Name) ↳ ";
                my $scanner_vault = <>;
                chomp $scanner_vault;
                system "mkdir $scanner_vault";
                print "$scanner_vault was created !\n";
                my $master = print "Cobalt($scanner_vault\\Master-password) ↳ ";
                my $scanner_master = <>;
                chomp $scanner_master;

                #encode
                my $master_encode = encode_base64($scanner_master);
                my $master_encode2 = encode_base64($master_encode);
                my $master_encode3 = encode_base64($master_encode2);
                my $master_encode4 = encode_base64($master_encode3);
                my $master_encode_final = encode_base64($master_encode3);

                open my $masterpassword ,">", "$scanner_vault/master-password.txt";

                print $masterpassword "$master_encode_final";


            }
        }
        if ($scanner eq "connect"){
            my $vault = print "Cobalt(Name) ↳ ";
            my $scanner_vault = <>;
            chomp $scanner_vault;

            if(-d $scanner_vault){
                my $master = print "Cobalt($scanner_vault/Master-password) ↳ ";
                my $scanner_master = <>;
                chomp $scanner_master;
                if(-e "$scanner_vault/master-password.txt"){
                        my $main = print "Cobalt($scanner_vault/user) ↳ ";
                        my $scanner_main = <>;
                        chomp $scanner_main;

                        #main commands
                        if($scanner_main eq "add user"){
                            my $username = print "Cobalt($scanner_vault/user-name) ↳ ";
                            my $scanner_username = <>;
                            chomp $scanner_username;

                            print "$scanner_username was added in the user db !\n"
                        }
                        if($scanner_main eq "add password"){
                            my $password = print "Cobalt($scanner_vault/password) ↳ ";
                            my $scanner_password = <>;
                            chomp $scanner_password;
                            system "mkdir $scanner_vault/passwords";
                            open my $passwordfile ,">", "$scanner_vault/passwords/$scanner_password";
                            print $passwordfile "$scanner_password\n";
                        }
                        if($scanner_main eq "list password"){
                            print "Passwords : \n";
                            system "ls $scanner_vault/passwords";
                        }
                        if($scanner_main eq "version"){
                            print "Cobalt 1.0.0\n";
                        }
                        if($scanner_main eq "login"){
                            print "User system to login is in dev, sorry\n"
                        }
                        if($scanner_main eq "bye"){
                            exit;
                        }
                }
                else{
                    print "Sorry try again\n"
                }
                
            }
            else{
                print "$scanner_vault doesn't exist, please try again !\n";
            }
        }
    }
}
main();
