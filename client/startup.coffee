Meteor.startup ->
  Accounts.ui.config
    passwordSignupFields: 'USERNAME_ONLY'
  DebugClick =
    cssPath: (el) ->
      if !(el instanceof Element)
        return
      path = []
      while el.nodeType == Node.ELEMENT_NODE
        selector = el.nodeName.toLowerCase()
        if el.id
          selector += '#' + el.id
          path.unshift selector
          break
        else
          sib = el
          nth = 1
          while sib = sib.previousElementSibling
            if sib.nodeName.toLowerCase() == selector
              nth++
          if nth != 1
            selector += ':nth-of-type(' + nth + ')'
        path.unshift selector
        el = el.parentNode
      path.join ' > '
    relevantEventKeys: [
      'ctrlKey'
      # 'shiftKey'
      # 'altKey'
      # 'metaKey'
    ]
    globalDataContext: true
    globalDataContextVar: '$$$'
    isRelevantEvent: (event) ->
      i = 0
      while i < DebugClick.relevantEventKeys.length
        if event[DebugClick.relevantEventKeys[i]]
          return true
        i++
      false
    click_handler: (event) ->
      if !DebugClick.isRelevantEvent(event)
        return true
      event.preventDefault()
      event.stopPropagation()
      event.stopImmediatePropagation()
      console.group DebugClick.cssPath(event.target)
      console.group 'DOM-Element:'
      console.log event.target
      console.dir event.target
      console.groupEnd()
      data = Blaze.getData(event.target)
      if DebugClick.globalDataContext
        window[DebugClick.globalDataContextVar] = data
        console.group 'Data-Context: window.' + DebugClick.globalDataContextVar
      else
        console.group 'Data-Context:'
      console.dir data
      console.groupEnd()
      view = Blaze.getView(event.target)
      viewNames = []
      current = view
      while current
        viewNames.push current.name
        current = current.parentView
      console.group 'View:', viewNames.join(' < ')
      console.dir view
      console.groupEnd()
      console.groupEnd()
      false
    _handlerInitialised: false
    maybeAddHandler: (event) ->
      if DebugClick.isRelevantEvent(event) and !DebugClick._handlerInitialised
        $('*').on 'click', DebugClick.click_handler
        DebugClick._handlerInitialised = true
      true
    maybeRemoveHandler: (event) ->
      if !DebugClick.isRelevantEvent(event) and DebugClick._handlerInitialised
        $('*').off 'click', DebugClick.click_handler
        DebugClick._handlerInitialised = false
      true
    startup: ->
      console.log 'DebugClick initialised'
      $('html').on 'keydown', DebugClick.maybeAddHandler
      $('html').on 'keyup', DebugClick.maybeRemoveHandler
      return
  unless Meteor.isProduction
    DebugClick.startup()
    Error.stackTraceLimit=Infinity
  document.oncontextmenu = -> false
  document.body.classList.add('noSelect')

