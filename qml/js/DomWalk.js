function collect_node_stats(global_context, local_context, node) {
    // Update the context
    local_context.depth += 1;
    local_context.breadth.push(node.childNodes.length);
    global_context.nodes += 1;
    global_context.maxdepth = Math.max(local_context.depth, global_context.maxdepth);

    // Recurse into child nodes
    for (child of node.childNodes) {
        child_context = JSON.parse(JSON.stringify(local_context));
        child_context.breadth = local_context.breadth.slice(0, local_context.depth + 1);
        child_context = collect_node_stats(global_context, child_context, child);

        // Recalculate the child breadths
        for (let i = local_context.depth + 1; i < child_context.breadth.length; ++i) {
            local_context.breadth[i] = (local_context.breadth[i]||0) + child_context.breadth[i];
        }
    }

    // Paint the DOM red
    if (node.style) {
        node.style.border = "1px dashed red";
    }

    // Move back up the tree
    local_context.depth -= 1;
    return local_context;
}

// Data available to all nodes
global_context = {
    "nodes": 0,
    "maxdepth": 0,
    "maxbreadth": 0
}

// Data that's local to the node and shared with the parent
local_context = {
    "depth": 0,
    "breadth": [1]
}

// Off we go
local_context = collect_node_stats(global_context, local_context, document);
global_context.maxbreadth = Math.max.apply(null, local_context.breadth);

// Return the results (only strings allowed)
// See: https://doc.qt.io/qt-6/qml-qtwebengine-webengineview.html#runJavaScript-method
return JSON.stringify(global_context)
