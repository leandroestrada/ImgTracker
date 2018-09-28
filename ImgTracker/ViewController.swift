//
//  ViewController.swift
//  ImgTracker
//
//  Created by le on 28/09/18.
//  Copyright © 2018 LeandroEstrada. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "/Users/le/Desktop/AR/ImgTracker/ImgTracker/art.scnassets/SceneKit Scene.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        guard let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "Photos",
            bundle: Bundle.main) else{
            print("No images available")
            return
        }
        
        configuration.trackingImages = trackedImages
        configuration.maximumNumberOfTrackedImages = 1
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

// MARK: - ARSCNViewDelegate
    //Always add this func when anchor is added
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        if let imageAnchor
    }

}
