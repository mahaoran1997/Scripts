use std::sync::atomic::AtomicBool;
use arr_macro::arr;

use crate::ResourceManager;

pub const RPC_WAIT: u64 = 50000;
pub const PARALLEL_VEC_READ: bool = false;
pub const WAIT_SPECIFIC_SERVER: bool = false;

pub const NUM_SERVERS: usize = 5;
// pub const GLOBAL_HEAP_SIZE: usize = NUM_SERVERS * 48 as usize * 1024 * 1024 * 1024; // Dataframe 1
// pub const GLOBAL_HEAP_SIZE: usize = NUM_SERVERS * 32 as usize * 1024 * 1024 * 1024; // Dataframe 2 3 4 5 6 8
// pub const GLOBAL_HEAP_SIZE: usize = NUM_SERVERS * 32 as usize * 1024 * 1024 * 1024; // BLAS
pub const GLOBAL_HEAP_SIZE: usize = NUM_SERVERS * 32 as usize * 1024 * 1024 * 1024; // SocialNet
pub const WORKER_UNIT_SIZE: usize = GLOBAL_HEAP_SIZE / NUM_SERVERS;
pub const MAX_SERVERS: usize = 16;
pub static mut SERVER_INDEX: usize = 0;
pub static mut LOCAL_HEAP_START: usize = 0;
pub const ONE_MB: usize = 1024 * 1024;


pub static mut APP: usize = 0; // 0 DATAFRAME // 1 SOCIALNET // 3 MATRIX // 4 SOCIALNET_VALUE

// pub const MAX_THREADS: usize = 16; // For dataframe 1 & socialnet
// pub const MAX_THREADS: usize = 1;  // for matrix 5 7
// pub const MAX_THREADS: usize = 2; // for matrix 1 2 3 4 6 8
pub const MAX_THREADS: usize = 1; // For dataframe 2 3 4 5 6 7 8

pub static mut COMM_THREADS: Option<ResourceManager> = None;

pub fn get_resource() -> usize {
    let tid = std::thread::current().id().as_u64().get() as usize % MAX_THREADS;
    let mut rem = tid;
    unsafe {
        COMM_THREADS.as_ref().unwrap().get_resource(rem)
    }
}

pub fn release_resource(resource_id: usize) {
    unsafe {
        COMM_THREADS.as_ref().unwrap().release_resource(resource_id);
    }
}

extern "C" {
  pub fn gam_connect_with_cache_ratio(server_id: usize, heap_size: usize, cache_ratio: usize, num_threads: usize) -> i32;
  pub fn gam_connect(server_id: usize, heap_size: usize, num_threads: usize) -> i32;
  pub fn gam_disconnect() -> i32;
  pub fn gam_malloc(size: usize, remote: bool, random: bool, thread_id: usize) -> usize;
  pub fn gam_free(addr: usize, thread_id: usize) -> i32;
  pub fn gam_read(addr: usize, buf: usize, size: usize, flags: i32, thread_id: usize) -> i32;
  pub fn gam_write(addr: usize, buf: usize, size: usize, flags: i32, thread_id: usize) -> i32;
  pub fn gam_put(key: u64, value: usize, size: usize, thread_id: usize) -> i32;
  pub fn gam_get(key: u64, value: usize, thread_id: usize) -> i32;
  pub fn gam_mfence(thread_id: usize);


  pub fn gam2_connect(server_id: usize, heap_size: usize) -> usize;
  pub fn gam2_disconnect() -> i32;
  pub fn gam2_malloc(size: usize, remote: bool, random: bool, alloc: usize) -> usize;
  pub fn gam2_free(addr: usize, alloc: usize) -> i32;
  pub fn gam2_read(addr: usize, buf: usize, size: usize, flags: i32, alloc: usize) -> i32;
  pub fn gam2_write(addr: usize, buf: usize, size: usize, flags: i32, alloc: usize) -> i32;
  pub fn gam2_put(key: u64, value: usize, size: usize, alloc: usize) -> i32;
  pub fn gam2_get(key: u64, value: usize, alloc: usize) -> i32;
  pub fn gam2_mfence(alloc: usize);
}