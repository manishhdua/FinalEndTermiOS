//
//  CameraViewController.swift
//  EndTerm
//
//  Created by Manish Dua on 2019-12-04.
//  Copyright © 2019 Manish Dua. All rights reserved.
//

import UIKit
import AVFoundation
class CameraViewController: UIViewController {
    var imageCaptured : UIImage?
        let session = AVCaptureSession()
         var camera: AVCaptureDevice?
         var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
         var cameraCaptureOutput: AVCapturePhotoOutput?
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCaptureSession()
    }

    @IBAction func capturePicture(_ sender: Any) {
        //print("captured")
        takePicture()
    }
 
            
    func initializeCaptureSession(){
                session.sessionPreset = AVCaptureSession.Preset.high
                camera = AVCaptureDevice.default(for: AVMediaType.video)
                do {
                    let cameraCaptureInput = try AVCaptureDeviceInput(device: camera!)
                    cameraCaptureOutput = AVCapturePhotoOutput()
                    session.addInput(cameraCaptureInput)
                    session.addOutput(cameraCaptureOutput!)
                } catch {
                    print(error.localizedDescription)
                }
                cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
                cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
                cameraPreviewLayer?.frame = view.bounds
                cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
                session.startRunning()
            }

    func takePicture(){
            
                let settings = AVCapturePhotoSettings()
    cameraCaptureOutput?.capturePhoto(with: settings, delegate: self)
            }
        }

    extension CameraViewController: AVCapturePhotoCaptureDelegate {
            func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?){
                
                if let unwrappedError = error {
                    print(unwrappedError.localizedDescription)
                } else {
                    if let sampleBuffer = photoSampleBuffer, let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer){
                    if let finalImage = UIImage(data: dataImage){
                        print("got image")
                        imageCaptured = finalImage
                        performSegue(withIdentifier: "BackToReg", sender:self)
                    }
                }
            }
                
            
            }
           override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if (segue.identifier == "BackToReg") {
               // pass data to next view
            //print("performed")
               let RegviewController = segue.destination as? RegisterationViewController
            //print(imageCaptured)
            RegviewController?.profileImg = imageCaptured

           }
        }

 }

