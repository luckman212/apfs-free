# apfs-free

On modern macOS systems where the disks are APFS-formatted, legacy tools like `df` do not correctly report free disk space.

This is a small POC commandline tool that reports free disk space on the boot volume in JSON format, in both bytes and as a percentage.

The program uses the [`volumeAvailableCapacityForImportantUsage`][1] API.

Example (illustrates that `df` reports only 6% free, yet there is actually 22%):

```bash
$ df -h /dev/disk3s5
Filesystem      Size    Used   Avail Capacity iused ifree %iused  Mounted on
/dev/disk3s5   460Gi   413Gi    27Gi    94%    3.4M  281M    1%   /System/Volumes/Data
```

```bash
$ apfs_free
{
    "availableBytes": 109467447839,
    "availablePercent": 22
}
```

[1]: https://developer.apple.com/documentation/foundation/urlresourcekey/checking_volume_storage_capacity
