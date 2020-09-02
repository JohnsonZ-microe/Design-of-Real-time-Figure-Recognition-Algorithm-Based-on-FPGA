library verilog;
use verilog.vl_types.all;
entity imgtest_tb is
    generic(
        iw              : integer := 640;
        ih              : integer := 512;
        dvd_dw          : integer := 8;
        h_total         : integer := 1440;
        v_total         : integer := 600;
        sync_b          : integer := 5;
        sync_e          : integer := 55;
        vld_b           : integer := 65
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of iw : constant is 1;
    attribute mti_svvh_generic_type of ih : constant is 1;
    attribute mti_svvh_generic_type of dvd_dw : constant is 1;
    attribute mti_svvh_generic_type of h_total : constant is 1;
    attribute mti_svvh_generic_type of v_total : constant is 1;
    attribute mti_svvh_generic_type of sync_b : constant is 1;
    attribute mti_svvh_generic_type of sync_e : constant is 1;
    attribute mti_svvh_generic_type of vld_b : constant is 1;
end imgtest_tb;
