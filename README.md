
# 可动态配置的、基于 Envoy 的负载均衡

直接根据当前的 `cds/eds.yaml` 创建一个新的 `cds/eds-new.yaml` 文件，并在其中使用新的后端 IP 地址和端口，然后将其替换到原有 `cds/eds.yaml` 文件上，即可完成对后端地址的更新：

参考代码：

```sh
cp cds/eds.yaml cds/eds-new.yaml
# 可以使用 sed 替换现有值，也可以考虑使用一个“标准的”模板文件替换后生成
sed -i 's/original-ip/new-ip/' cds/eds-new.yaml
mv cds/eds-new.yaml cds/eds.yaml
```

只能通过 `mv` 的方式覆盖并更新原有文件，是因为 Envoy 认为只有 Move 操作是“原子”的，因此仅监控了文件系统的 Move 操作。详情，请参考 [Envoy 关于配置源的说明](https://www.envoyproxy.io/docs/envoy/latest/api-v3/config/core/v3/config_source.proto#config-core-v3-configsource)。

参考文章：

1. [Dynamic Envoy Proxy on Linux Machine](https://medium.com/cstech/dynamic-envoy-proxy-on-linux-machine-25ccf8b159be)
2. [File Based Dynamic Configuration of Routes in Envoy Proxy](https://medium.com/grensesnittet/file-based-dynamic-configuration-of-routes-in-envoy-proxy-6234dae968d2)

