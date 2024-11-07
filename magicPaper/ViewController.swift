

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    var currentVideoNode: SKVideoNode?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "newsPaperImages", bundle: Bundle.main)
        {
            configuration.trackingImages = imageToTrack
            configuration.maximumNumberOfTrackedImages = 1
        }
            
            
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) 
    {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: any SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? 
    
    {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor
        {
            
            let videoScene = SKScene(size: CGSize(width: 480, height: 360))
          
            
         
            if let oldvideoNode = currentVideoNode
            {
                oldvideoNode.pause()
                currentVideoNode = nil
            }

          

            
            if  imageAnchor.referenceImage.name == "ai"
            {
                let videoNode = SKVideoNode(fileNamed: "ai.mp4")
                
                videoNode.play()
                
                videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
                
                videoNode.yScale = -1.0
                
                videoScene.addChild(videoNode)
                
                currentVideoNode = videoNode
            }
            else if  imageAnchor.referenceImage.name == "gandhi"
            {
                
                let videoNode = SKVideoNode(fileNamed: "gandhi.mp4")
                
                videoNode.play()
                
                videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
                
                videoNode.yScale = -1.0
                
                videoScene.addChild(videoNode)
                
                currentVideoNode = videoNode
            }
          else if  imageAnchor.referenceImage.name == "ind"
            {
                
                let videoNode = SKVideoNode(fileNamed: "ind.mp4")
                
                videoNode.play()
                
                videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
                
                videoNode.yScale = -1.0
                
                videoScene.addChild(videoNode)
                
                currentVideoNode = videoNode
            }
          else if  imageAnchor.referenceImage.name == "ktch"
            {
                
                let videoNode = SKVideoNode(fileNamed: "kitchenxpress.mp4")
                
                videoNode.play()
                
                videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
                
                videoNode.yScale = -1.0
                
                videoScene.addChild(videoNode)
                
                currentVideoNode = videoNode
            }
        else if  imageAnchor.referenceImage.name == "model"
            {
                
                let videoNode = SKVideoNode(fileNamed: "bof.mp4")
                
                videoNode.play()
                
                videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
                
                videoNode.yScale = -1.0
                
                videoScene.addChild(videoNode)
                
                currentVideoNode = videoNode
            }
          else if  imageAnchor.referenceImage.name == "nepalrain"
            {
                
                let videoNode = SKVideoNode(fileNamed: "nepal.mp4")
                
                videoNode.play()
                
                videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
                
                videoNode.yScale = -1.0
                
                videoScene.addChild(videoNode)
                
                currentVideoNode = videoNode
            }
          else if  imageAnchor.referenceImage.name == "rekha"
            {
                
                let videoNode = SKVideoNode(fileNamed: "rekha.mp4")
                
                videoNode.play()
                
                videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
                
                videoNode.yScale = -1.0
                
                videoScene.addChild(videoNode)
                
                currentVideoNode = videoNode
            }
           else if  imageAnchor.referenceImage.name == "sri"
            {
                
                let videoNode = SKVideoNode(fileNamed: "srilanka.mp4")
                
                videoNode.play()
                
                videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
                
                videoNode.yScale = -1.0
                
                videoScene.addChild(videoNode)
                
                currentVideoNode = videoNode
            }
            
            
                     
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = videoScene

            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
           
        }
        
        return node
    }
  
}
