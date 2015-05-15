NYUDL::MDI::Worker
==================

## Overview
Worker base class for New York University Digital Library (NYUDL)
Message-Driven Infrastructure (MDI).

Following Sneakers pattern [here](http://jondot.github.io/sneakers/blog/2014/12/04/modular-workers.html),
and borrowing `#perform` method name from [`ActiveJob`](http://guides.rubyonrails.org/active_job_basics.html).

## Status
in development

## Subclasses

Subclasses inherit from the `Base` class and must implement two methods:  
`#info`  that returns a `Hash` with the following key/value pairs:  

| key             | description                                         |  
|-----------------|-----------------------------------------------------|  
|  `name:`        | the name of the application doing the work          |  
|  `version:`     | the version of the application performing the work  |
| `service_code:` | the service code assigned to this application, <br>
                    e.g.,   `bag_validation`, `fixity_check`, <br>
                            `e01_verify`, `format_identification`       |


```
require 'nyudl/mdi/worker'

class BagValidatorWorker < NYUDL:MDI::Worker
  def self.info
    {
       name:         'BagIt Library (BIL)',
       version:      '4.9.0',
       service_code: 'bag_validation'
     }
  end

  def perform(params)
    # unpack params and do super cool stuff here
    ...
    {
      outcome: 'success',
      data:    'cool data'
    }
  end
end
```

## Base Class Structure (rough ideas)
```
require 'nyudl/mdi/message'
require 'time'

include `Sneakers::Worker`

from_queue self.class.info[:service_code]
opts = { ... }

Sneakers.configure(opts)

def work(msg)
      req = NYUDL:MDI::Message.request.new(msg)
      res = NYUDL:MDI::Message.response.new(req)
      res.start_time = Time.now.iso8601.utc
      result = perform(req.params)
      res.end_time   = Time.now.iso8601.utc
      res.outcome    = result[:outcome]
      res.data       = result[:data  ]
      res.agent      = agent
