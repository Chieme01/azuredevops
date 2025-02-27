resource symbolicname 'Microsoft.ContainerService/managedClusters@2024-09-02-preview' = {
  extendedLocation: {
    name: 'string'
    type: 'string'
  }
  identity: {
    delegatedResources: {
      {customized property}: {
        location: 'string'
        referralResource: 'string'
        resourceId: 'string'
        tenantId: 'string'
      }
    }
    type: 'string'
    userAssignedIdentities: {
      {customized property}: {}
    }
  }
  kind: 'string'
  location: 'string'
  name: 'string'
  properties: {
    aadProfile: {
      adminGroupObjectIDs: [
        'string'
      ]
      clientAppID: 'string'
      enableAzureRBAC: bool
      managed: bool
      serverAppID: 'string'
      serverAppSecret: 'string'
      tenantID: 'string'
    }
    addonProfiles: {
      {customized property}: {
        config: {
          {customized property}: 'string'
        }
        enabled: bool
      }
    }
    agentPoolProfiles: [
      {
        artifactStreamingProfile: {
          enabled: bool
        }
        availabilityZones: [
          'string'
        ]
        capacityReservationGroupID: 'string'
        count: int
        creationData: {
          sourceResourceId: 'string'
        }
        enableAutoScaling: bool
        enableCustomCATrust: bool
        enableEncryptionAtHost: bool
        enableFIPS: bool
        enableNodePublicIP: bool
        enableUltraSSD: bool
        gatewayProfile: {
          publicIPPrefixSize: int
        }
        gpuInstanceProfile: 'string'
        gpuProfile: {
          driverType: 'string'
          installGPUDriver: bool
        }
        hostGroupID: 'string'
        kubeletConfig: {
          allowedUnsafeSysctls: [
            'string'
          ]
          containerLogMaxFiles: int
          containerLogMaxSizeMB: int
          cpuCfsQuota: bool
          cpuCfsQuotaPeriod: 'string'
          cpuManagerPolicy: 'string'
          failSwapOn: bool
          imageGcHighThreshold: int
          imageGcLowThreshold: int
          podMaxPids: int
          seccompDefault: 'string'
          topologyManagerPolicy: 'string'
        }
        kubeletDiskType: 'string'
        linuxOSConfig: {
          swapFileSizeMB: int
          sysctls: {
            fsAioMaxNr: int
            fsFileMax: int
            fsInotifyMaxUserWatches: int
            fsNrOpen: int
            kernelThreadsMax: int
            netCoreNetdevMaxBacklog: int
            netCoreOptmemMax: int
            netCoreRmemDefault: int
            netCoreRmemMax: int
            netCoreSomaxconn: int
            netCoreWmemDefault: int
            netCoreWmemMax: int
            netIpv4IpLocalPortRange: 'string'
            netIpv4NeighDefaultGcThresh1: int
            netIpv4NeighDefaultGcThresh2: int
            netIpv4NeighDefaultGcThresh3: int
            netIpv4TcpFinTimeout: int
            netIpv4TcpkeepaliveIntvl: int
            netIpv4TcpKeepaliveProbes: int
            netIpv4TcpKeepaliveTime: int
            netIpv4TcpMaxSynBacklog: int
            netIpv4TcpMaxTwBuckets: int
            netIpv4TcpTwReuse: bool
            netNetfilterNfConntrackBuckets: int
            netNetfilterNfConntrackMax: int
            vmMaxMapCount: int
            vmSwappiness: int
            vmVfsCachePressure: int
          }
          transparentHugePageDefrag: 'string'
          transparentHugePageEnabled: 'string'
        }
        maxCount: int
        maxPods: int
        messageOfTheDay: 'string'
        minCount: int
        mode: 'string'
        name: 'string'
        networkProfile: {
          allowedHostPorts: [
            {
              portEnd: int
              portStart: int
              protocol: 'string'
            }
          ]
          applicationSecurityGroups: [
            'string'
          ]
          nodePublicIPTags: [
            {
              ipTagType: 'string'
              tag: 'string'
            }
          ]
        }
        nodeInitializationTaints: [
          'string'
        ]
        nodeLabels: {
          {customized property}: 'string'
        }
        nodePublicIPPrefixID: 'string'
        nodeTaints: [
          'string'
        ]
        orchestratorVersion: 'string'
        osDiskSizeGB: int
        osDiskType: 'string'
        osSKU: 'string'
        osType: 'string'
        podIPAllocationMode: 'string'
        podSubnetID: 'string'
        powerState: {
          code: 'string'
        }
        proximityPlacementGroupID: 'string'
        scaleDownMode: 'string'
        scaleSetEvictionPolicy: 'string'
        scaleSetPriority: 'string'
        securityProfile: {
          enableSecureBoot: bool
          enableVTPM: bool
          sshAccess: 'string'
        }
        spotMaxPrice: int
        tags: {
          {customized property}: 'string'
        }
        type: 'string'
        upgradeSettings: {
          drainTimeoutInMinutes: int
          maxSurge: 'string'
          maxUnavailable: 'string'
          nodeSoakDurationInMinutes: int
          undrainableNodeBehavior: 'string'
        }
        virtualMachineNodesStatus: [
          {
            count: int
            size: 'string'
          }
        ]
        virtualMachinesProfile: {
          scale: {
            autoscale: [
              {
                maxCount: int
                minCount: int
                sizes: [
                  'string'
                ]
              }
            ]
            manual: [
              {
                count: int
                sizes: [
                  'string'
                ]
              }
            ]
          }
        }
        vmSize: 'string'
        vnetSubnetID: 'string'
        windowsProfile: {
          disableOutboundNat: bool
        }
        workloadRuntime: 'string'
      }
    ]
    aiToolchainOperatorProfile: {
      enabled: bool
    }
    apiServerAccessProfile: {
      authorizedIPRanges: [
        'string'
      ]
      disableRunCommand: bool
      enablePrivateCluster: bool
      enablePrivateClusterPublicFQDN: bool
      enableVnetIntegration: bool
      privateDNSZone: 'string'
      subnetId: 'string'
    }
    autoScalerProfile: {
      balance-similar-node-groups: 'string'
      daemonset-eviction-for-empty-nodes: bool
      daemonset-eviction-for-occupied-nodes: bool
      expander: 'string'
      ignore-daemonsets-utilization: bool
      max-empty-bulk-delete: 'string'
      max-graceful-termination-sec: 'string'
      max-node-provision-time: 'string'
      max-total-unready-percentage: 'string'
      new-pod-scale-up-delay: 'string'
      ok-total-unready-count: 'string'
      scale-down-delay-after-add: 'string'
      scale-down-delay-after-delete: 'string'
      scale-down-delay-after-failure: 'string'
      scale-down-unneeded-time: 'string'
      scale-down-unready-time: 'string'
      scale-down-utilization-threshold: 'string'
      scan-interval: 'string'
      skip-nodes-with-local-storage: 'string'
      skip-nodes-with-system-pods: 'string'
    }
    autoUpgradeProfile: {
      nodeOSUpgradeChannel: 'string'
      upgradeChannel: 'string'
    }
    azureMonitorProfile: {
      appMonitoring: {
        autoInstrumentation: {
          enabled: bool
        }
        openTelemetryLogs: {
          enabled: bool
          port: int
        }
        openTelemetryMetrics: {
          enabled: bool
          port: int
        }
      }
      containerInsights: {
        disableCustomMetrics: bool
        disablePrometheusMetricsScraping: bool
        enabled: bool
        logAnalyticsWorkspaceResourceId: 'string'
        syslogPort: int
      }
      metrics: {
        enabled: bool
        kubeStateMetrics: {
          metricAnnotationsAllowList: 'string'
          metricLabelsAllowlist: 'string'
        }
      }
    }
    bootstrapProfile: {
      artifactSource: 'string'
      containerRegistryId: 'string'
    }
    creationData: {
      sourceResourceId: 'string'
    }
    disableLocalAccounts: bool
    diskEncryptionSetID: 'string'
    dnsPrefix: 'string'
    enableNamespaceResources: bool
    enablePodSecurityPolicy: bool
    enableRBAC: bool
    fqdnSubdomain: 'string'
    httpProxyConfig: {
      httpProxy: 'string'
      httpsProxy: 'string'
      noProxy: [
        'string'
      ]
      trustedCa: 'string'
    }
    identityProfile: {
      {customized property}: {
        clientId: 'string'
        objectId: 'string'
        resourceId: 'string'
      }
    }
    ingressProfile: {
      webAppRouting: {
        dnsZoneResourceIds: [
          'string'
        ]
        enabled: bool
        nginx: {
          defaultIngressControllerType: 'string'
        }
      }
    }
    kubernetesVersion: 'string'
    linuxProfile: {
      adminUsername: 'string'
      ssh: {
        publicKeys: [
          {
            keyData: 'string'
          }
        ]
      }
    }
    metricsProfile: {
      costAnalysis: {
        enabled: bool
      }
    }
    networkProfile: {
      advancedNetworking: {
        enabled: bool
        observability: {
          enabled: bool
        }
        security: {
          enabled: bool
        }
      }
      dnsServiceIP: 'string'
      ipFamilies: [
        'string'
      ]
      kubeProxyConfig: {
        enabled: bool
        ipvsConfig: {
          scheduler: 'string'
          tcpFinTimeoutSeconds: int
          tcpTimeoutSeconds: int
          udpTimeoutSeconds: int
        }
        mode: 'string'
      }
      loadBalancerProfile: {
        allocatedOutboundPorts: int
        backendPoolType: 'string'
        clusterServiceLoadBalancerHealthProbeMode: 'string'
        effectiveOutboundIPs: [
          {
            id: 'string'
          }
        ]
        enableMultipleStandardLoadBalancers: bool
        idleTimeoutInMinutes: int
        managedOutboundIPs: {
          count: int
          countIPv6: int
        }
        outboundIPPrefixes: {
          publicIPPrefixes: [
            {
              id: 'string'
            }
          ]
        }
        outboundIPs: {
          publicIPs: [
            {
              id: 'string'
            }
          ]
        }
      }
      loadBalancerSku: 'string'
      natGatewayProfile: {
        effectiveOutboundIPs: [
          {
            id: 'string'
          }
        ]
        idleTimeoutInMinutes: int
        managedOutboundIPProfile: {
          count: int
        }
      }
      networkDataplane: 'string'
      networkMode: 'string'
      networkPlugin: 'string'
      networkPluginMode: 'string'
      networkPolicy: 'string'
      outboundType: 'string'
      podCidr: 'string'
      podCidrs: [
        'string'
      ]
      podLinkLocalAccess: 'string'
      serviceCidr: 'string'
      serviceCidrs: [
        'string'
      ]
      staticEgressGatewayProfile: {
        enabled: bool
      }
    }
    nodeProvisioningProfile: {
      mode: 'string'
    }
    nodeResourceGroup: 'string'
    nodeResourceGroupProfile: {
      restrictionLevel: 'string'
    }
    oidcIssuerProfile: {
      enabled: bool
    }
    podIdentityProfile: {
      allowNetworkPluginKubenet: bool
      enabled: bool
      userAssignedIdentities: [
        {
          bindingSelector: 'string'
          identity: {
            clientId: 'string'
            objectId: 'string'
            resourceId: 'string'
          }
          name: 'string'
          namespace: 'string'
        }
      ]
      userAssignedIdentityExceptions: [
        {
          name: 'string'
          namespace: 'string'
          podLabels: {
            {customized property}: 'string'
          }
        }
      ]
    }
    privateLinkResources: [
      {
        groupId: 'string'
        id: 'string'
        name: 'string'
        requiredMembers: [
          'string'
        ]
        type: 'string'
      }
    ]
    publicNetworkAccess: 'string'
    safeguardsProfile: {
      excludedNamespaces: [
        'string'
      ]
      level: 'string'
      version: 'string'
    }
    Profile: {
      azureKeyVaultKms: {
        enabled: bool
       security keyId: 'string'
        keyVaultNetworkAccess: 'string'
        keyVaultResourceId: 'string'
      }
      customCATrustCertificates: [
        any(Azure.Bicep.Types.Concrete.AnyType)
      ]
      defender: {
        logAnalyticsWorkspaceResourceId: 'string'
        securityMonitoring: {
          enabled: bool
        }
      }
      imageCleaner: {
        enabled: bool
        intervalHours: int
      }
      imageIntegrity: {
        enabled: bool
      }
      nodeRestriction: {
        enabled: bool
      }
      workloadIdentity: {
        enabled: bool
      }
    }
    serviceMeshProfile: {
      istio: {
        certificateAuthority: {
          plugin: {
            certChainObjectName: 'string'
            certObjectName: 'string'
            keyObjectName: 'string'
            keyVaultId: 'string'
            rootCertObjectName: 'string'
          }
        }
        components: {
          egressGateways: [
            {
              enabled: bool
            }
          ]
          ingressGateways: [
            {
              enabled: bool
              mode: 'string'
            }
          ]
        }
        revisions: [
          'string'
        ]
      }
      mode: 'string'
    }
    servicePrincipalProfile: {
      clientId: 'string'
      secret: 'string'
    }
    storageProfile: {
      blobCSIDriver: {
        enabled: bool
      }
      diskCSIDriver: {
        enabled: bool
        version: 'string'
      }
      fileCSIDriver: {
        enabled: bool
      }
      snapshotController: {
        enabled: bool
      }
    }
    supportPlan: 'string'
    upgradeSettings: {
      overrideSettings: {
        forceUpgrade: bool
        until: 'string'
      }
    }
    windowsProfile: {
      adminPassword: 'string'
      adminUsername: 'string'
      enableCSIProxy: bool
      gmsaProfile: {
        dnsServer: 'string'
        enabled: bool
        rootDomainName: 'string'
      }
      licenseType: 'string'
    }
    workloadAutoScalerProfile: {
      keda: {
        enabled: bool
      }
      verticalPodAutoscaler: {
        addonAutoscaling: 'string'
        enabled: bool
      }
    }
  }
  sku: {
    name: 'string'
    tier: 'string'
  }
  tags: {
    {customized property}: 'string'
  }
}
