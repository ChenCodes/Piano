//
//  ViewController.swift
//  PianoKeyBoard
//
//  Created by Kevin Chang on 7/8/16.
//  Copyright © 2016 Kevin Chang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // Piano KeyBoard View
    @IBOutlet var keyBoardView: UIView!
    
    // Piano Keys
    @IBOutlet var C1: UIButton!
    @IBOutlet var D1: UIButton!
    @IBOutlet var E1: UIButton!
    @IBOutlet var F1: UIButton!
    @IBOutlet var G1: UIButton!
    @IBOutlet var A1: UIButton!
    @IBOutlet var B1: UIButton!
    @IBOutlet var C2: UIButton!
    @IBOutlet var D2: UIButton!
    @IBOutlet var E2: UIButton!
    @IBOutlet var F2: UIButton!
    @IBOutlet var G2: UIButton!
    @IBOutlet var A2: UIButton!
    @IBOutlet var B2: UIButton!
    @IBOutlet var C3: UIButton!
    
    // Sharp/Flat Keys
    @IBOutlet var CSh1: UIButton!
    @IBOutlet var DSh1: UIButton!
    @IBOutlet var FSh1: UIButton!
    @IBOutlet var AFl1: UIButton!
    @IBOutlet var BFl1: UIButton!
    @IBOutlet var CSh2: UIButton!
    @IBOutlet var DSh2: UIButton!
    @IBOutlet var FSh2: UIButton!
    @IBOutlet var AFl2: UIButton!
    @IBOutlet var BFl2: UIButton!
    @IBOutlet var CSh3: UIButton!
    
    // Start Button to start the tutorial
    @IBOutlet var StartButton: UIButton!
    
    var C1AudioPlayer = AVAudioPlayer()
    var D1AudioPlayer = AVAudioPlayer()
    var E1AudioPlayer = AVAudioPlayer()
    var F1AudioPlayer = AVAudioPlayer()
    var G1AudioPlayer = AVAudioPlayer()
    var A1AudioPlayer = AVAudioPlayer()
    var B1AudioPlayer = AVAudioPlayer()
    var C2AudioPlayer = AVAudioPlayer()
    var D2AudioPlayer = AVAudioPlayer()
    var E2AudioPlayer = AVAudioPlayer()
    var F2AudioPlayer = AVAudioPlayer()
    var G2AudioPlayer = AVAudioPlayer()
    var A2AudioPlayer = AVAudioPlayer()
    var B2AudioPlayer = AVAudioPlayer()
    var C3AudioPlayer = AVAudioPlayer()
    
    var CSh1AudioPlayer = AVAudioPlayer()
    var CSh2AudioPlayer = AVAudioPlayer()
    var CSh3AudioPlayer = AVAudioPlayer()
    var DSh1AudioPlayer = AVAudioPlayer()
    var DSh2AudioPlayer = AVAudioPlayer()
    var FSh1AudioPlayer = AVAudioPlayer()
    var FSh2AudioPlayer = AVAudioPlayer()
    var AFl1AudioPlayer = AVAudioPlayer()
    var AFl2AudioPlayer = AVAudioPlayer()
    var BFl1AudioPlayer = AVAudioPlayer()
    var BFl2AudioPlayer = AVAudioPlayer()
    
    var lastKeyPressed = "none" // keeps track of the last key pressed
    var shouldPress = "none" // keeps track of the key that should be pressed
    var indexArray = 0
    
    @IBOutlet var songPicker: UIPickerView! // Picker view for all the song tutorials
    
    @IBOutlet var lHandImage: UIImageView! // Image that shows which finger should be used on the left hand
    @IBOutlet var rHandImage: UIImageView! // Image that shows which finger should be used on the right hand
    
    @IBOutlet var tempoView: UIView! // View that allows for tempo input
    @IBOutlet var tempoText: UITextField! // Tempo Input
    var tempo = 60; // Tempo
    
    // The colors that should be associated with each finger
    var fingerColor: [String: String] = ["l1": "yellow", "l2": "cyan", "l3": "red", "l4": "green", "l5": "purple", "r1": "yellow", "r2": "cyan", "r3": "red", "r4": "green", "r5": "purple"]
    
    var songPickerData = ["Free Play", "Twinkle Twinkle Little Star", "Old McDonald", "I Love You", "C Major Scale", "Happy Birthday"]
    
    var song0_funcTest = ["c1-press", "c#1-press","d1-press", "d#1-press", "e1-press", "f1-press", "f#1-press", "g1-press", "ab1-press", "a1-press", "bb1-press", "b1-press", "c2-press", "c#2-press", "d2-press", "d#2-press", "e2-press", "f2-press", "f#2 -press", "g2-press", "ab2-press", "a2-press", "bb2-press", "b2-press", "c3-press", "c#3-press"]
    
    var song1_twinkleStar = ["c1-l4", "c1-l4", "g1-r3", "g1-r3", "a1-r4", "a1-r4", "g1-r3",
                             "f1-r2", "f1-r2", "e1-l2", "e1-l2", "d1-l3", "d1-l3", "c1-l4",
                             "g1-r3", "g1-r3", "f1-r2", "f1-r2", "e1-l2", "e1-l2", "d1-l3",
                             "g1-r3", "g1-r3", "f1-r2", "f1-r2", "e1-l2", "e1-l2", "d1-l3",
                             "c1-l4", "c1-l4", "g1-r3", "g1-r3", "a1-r4", "a1-r4", "g1-r3",
                             "f1-r2", "f1-r2", "e1-l2", "e1-l2", "d1-l3", "d1-l3", "c1-l4"]
    
    var song2_OldMacDonald = ["c2-r2", "c2-r2", "c2-r2", "g1-l3", "a1-l2", "a1-l2", "g1-l3", "e2-r4", "e2-r4", "d2-r3", "d2-r3", "c2-r2"]
    
    var song3_ILoveYou = ["g1-r3", "e1-l2", "g1-r3", "g1-r3", "e1-l2", "g1-r3",
                          "a1-r4", "g1-r3", "f1-r2", "e1-l2", "d1-l3", "e1-l2", "f1-r2",
                          "e1-l2", "f1-r2", "g1-r3", "c1-l4", "c1-l4", "c1-l4", "c1-l4", "c1-l4", "d1-l3", "e1-l2", "f1-r2", "g1-r3",
                          "g1-r3", "d1-l3", "d1-l3", "f1-r2", "e1-l2", "d1-l3", "c1-l4",
                          "g1-r3", "e1-l2", "g1-r3", "g1-r3", "e1-l2", "g1-r3",
                          "a1-r4", "g1-r3", "f1-r2", "e1-l2", "d1-l3", "e1-l2", "f1-r2",
                          "e1-l2", "f1-r2", "g1-r3", "c1-l4", "c1-l4", "c1-l4", "c1-l4", "c1-l4", "d1-l3", "e1-l2", "f1-r2", "g1-r3",
                          "g1-r3", "d1-l3", "d1-l3", "f1-r2", "e1-l2", "d1-l3", "c1-l4",]
    
    var song4_C2MajScale = ["c1-l4", "d1-l3", "e1-l2", "f1-l1", "g1-r1", "a1-r2", "b1-r3", "c2-r4", "b1-r3", "a1-r2", "g1-r1", "f1-l1", "e1-l2", "d1-l3", "c1-l4"]
    
    var song5_HappyBDay = ["c1-l3", "c1-l3", "d1-l2", "c1-l3", "f1-r2", "e1-r1",
                           "c1-l3", "c1-l3", "d1-l2", "c1-l3", "g1-r3", "f1-r2",
                           "c1-l3", "c1-l3", "c2-r5", "a1-r3", "f1-r2", "e1-r1", "d1-l2",
                           "bb1-r4", "bb1-r4", "a1-r3", "f1-r1", "g1-r2", "f1-r1"]
    
    var currentSong: [String]! // Keeps track of the current sound
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyBoardSetUp()
        createAVAudioPlayers()
        
        songPicker.delegate = self
        songPicker.dataSource = self
        tempoText.keyboardType = UIKeyboardType.PhonePad
        
        currentSong = nil
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return songPickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return songPickerData[row]
    }
    
    // Catpure the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        
        print(songPickerData[row])
        if row == 0 {
            currentSong = nil
            indexArray = 0
            shouldPress = "none"
            lastKeyPressed = "none"
            setKeysToDefaultColor()
            lHandImage.image = UIImage(named: "lefthand")!
            rHandImage.image = UIImage(named: "righthand")!
            tempoView.hidden = true
        } else if row == 1 {
            currentSong = song1_twinkleStar
            tempoView.hidden = false
        } else if row == 2 {
            currentSong = song2_OldMacDonald
            tempoView.hidden = false
        } else if row == 3 {
            currentSong = song3_ILoveYou
            tempoView.hidden = false
        } else if row == 4 {
            currentSong = song4_C2MajScale
            tempoView.hidden = false
        } else if row == 5 {
            currentSong = song5_HappyBDay
            tempoView.hidden = false
        }
    }
    
    @IBAction func C1Pressed(sender: UIButton) {
        print("C1 Pressed")
        C1AudioPlayer.currentTime = 0
        C1AudioPlayer.play()
        if shouldPress == "c1" {
            while C1AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            C1.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func C1Released(sender: UIButton) {
        // let start = C1AudioPlayer.currentTime
        // while C1AudioPlayer.currentTime <= start + 0.25 { }
        // C1AudioPlayer.stop()
    }
    
    @IBAction func D1Pressed(sender: UIButton) {
        print("D1 Pressed")
        D1AudioPlayer.currentTime = 0
        D1AudioPlayer.play()
        if shouldPress == "d1" {
            while D1AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            D1.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func E1Pressed(sender: UIButton) {
        print("E1 Pressed")
        E1AudioPlayer.currentTime = 0
        E1AudioPlayer.play()
        if shouldPress == "e1" {
            while E1AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            E1.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func F1Pressed(sender: UIButton) {
        print("F1 Pressed")
        F1AudioPlayer.currentTime = 0
        F1AudioPlayer.play()
        if shouldPress == "f1" {
            while F1AudioPlayer.currentTime <= 60.0/Double(tempo) { }

            indexArray += 1
            F1.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func G1Pressed(sender: UIButton) {
        print("G1 Pressed")
        G1AudioPlayer.currentTime = 0
        G1AudioPlayer.play()
        if shouldPress == "g1" {
            while G1AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            G1.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func A1Pressed(sender: UIButton) {
        print("A1 Pressed")
        A1AudioPlayer.currentTime = 0
        A1AudioPlayer.play()
        if shouldPress == "a1" {
            while A1AudioPlayer.currentTime <= 1 { }
            indexArray += 1
            A1.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func B1Pressed(sender: UIButton) {
        print("B1 Pressed")
        B1AudioPlayer.currentTime = 0
        B1AudioPlayer.play()
        if shouldPress == "b1" {
            while B1AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            B1.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func C2Pressed(sender: UIButton) {
        print("C2 Pressed")
        C2AudioPlayer.currentTime = 0
        C2AudioPlayer.play()
        if shouldPress == "c2" {
            while C2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            C2.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func D2Pressed(sender: UIButton) {
        print("D2 Pressed")
        D2AudioPlayer.currentTime = 0
        D2AudioPlayer.play()
        if shouldPress == "d2" {
            while D2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            D2.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func E2Pressed(sender: UIButton) {
        print("E2 Pressed")
        E2AudioPlayer.currentTime = 0
        E2AudioPlayer.play()
        if shouldPress == "e2" {
            while E2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            E2.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func F2Pressed(sender: UIButton) {
        print("F2 Pressed")
        F2AudioPlayer.currentTime = 0
        F2AudioPlayer.play()
        if shouldPress == "f2" {
            while F2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            F2.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func G2Pressed(sender: UIButton) {
        print("G2 Pressed")
        G2AudioPlayer.currentTime = 0
        G2AudioPlayer.play()
        if shouldPress == "g2" {
            while G2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            G2.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func A2Pressed(sender: UIButton) {
        print("A2 Pressed")
        A2AudioPlayer.currentTime = 0
        A2AudioPlayer.play()
        if shouldPress == "a2" {
            while A2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            A2.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func B2Pressed(sender: UIButton) {
        print("B2 Pressed")
        B2AudioPlayer.currentTime = 0
        B2AudioPlayer.play()
        if shouldPress == "b2" {
            while B2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            B2.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func C3Pressed(sender: UIButton) {
        print("C3 Pressed")
        C3AudioPlayer.currentTime = 0
        C3AudioPlayer.play()
        if shouldPress == "c3" {
            while C3AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            C3.backgroundColor = UIColor.whiteColor()
            play()
        }
    }
    
    @IBAction func CSh1Pressed(sender: UIButton) {
        print("C#1 Pressed")
        CSh1AudioPlayer.currentTime = 0
        CSh1AudioPlayer.play()
        if shouldPress == "c#1" {
            while CSh1AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            CSh1.backgroundColor = UIColor.blackColor()
            play()
        }
    }
    
    @IBAction func DSh1Pressed(sender: UIButton) {
        print("D#1 Pressed")
        DSh1AudioPlayer.currentTime = 0
        DSh1AudioPlayer.play()
        if shouldPress == "d#1" {
            while DSh1AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            DSh1.backgroundColor = UIColor.blackColor()
            play()
        }
    }
    
    @IBAction func FSh1Pressed(sender: UIButton) {
        print("F#1 Pressed")
        FSh1AudioPlayer.currentTime = 0
        FSh1AudioPlayer.play()
        if shouldPress == "f#1" {
            while FSh1AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            FSh1.backgroundColor = UIColor.blackColor()
            play()
        }
    }
    
    @IBAction func AFl1Pressed(sender: UIButton) {
        print("A♭1 Pressed")
        AFl1AudioPlayer.currentTime = 0
        AFl1AudioPlayer.play()
        if shouldPress == "ab1" {
            while AFl1AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            AFl1.backgroundColor = UIColor.blackColor()
            play()
        }
    }
    
    @IBAction func BFl1Pressed(sender: UIButton) {
        print("B♭1 Pressed")
        BFl1AudioPlayer.currentTime = 0
        BFl1AudioPlayer.play()
        if shouldPress == "bb1" {
            while BFl1AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            BFl1.backgroundColor = UIColor.blackColor()
            play()
        }
    }
    
    @IBAction func CSh2Pressed(sender: UIButton) {
        print("C#2 Pressed")
        CSh2AudioPlayer.currentTime = 0
        CSh2AudioPlayer.play()
        if shouldPress == "c#2" {
            while CSh2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            CSh2.backgroundColor = UIColor.blackColor()
            play()
        }
    }
    
    @IBAction func DSh2Pressed(sender: UIButton) {
        print("D#2 Pressed")
        DSh2AudioPlayer.currentTime = 0
        DSh2AudioPlayer.play()
        if shouldPress == "d#2" {
            while DSh2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            DSh2.backgroundColor = UIColor.blackColor()
            play()
        }
    }
    
    @IBAction func FSh2Pressed(sender: UIButton) {
        print("F#2 Pressed")
        FSh2AudioPlayer.currentTime = 0
        FSh2AudioPlayer.play()
        if shouldPress == "f#2" {
            while FSh2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            FSh2.backgroundColor = UIColor.blackColor()
            play()
        }
    }
    
    @IBAction func AFl2Pressed(sender: UIButton) {
        print("A♭2 Pressed")
        AFl2AudioPlayer.currentTime = 0
        AFl2AudioPlayer.play()
        if shouldPress == "ab2" {
            while AFl2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            AFl2.backgroundColor = UIColor.blackColor()
            play()
        }
    }
    
    @IBAction func BFl2Pressed(sender: UIButton) {
        print("B♭2 Pressed")
        BFl2AudioPlayer.currentTime = 0
        BFl2AudioPlayer.play()
        if shouldPress == "bb2" {
            while BFl2AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            BFl2.backgroundColor = UIColor.blackColor()
            play()
        }
    }
    
    @IBAction func CSh3Pressed(sender: UIButton) {
        print("C#3 Pressed")
        CSh3AudioPlayer.currentTime = 0
        CSh3AudioPlayer.play()
        if shouldPress == "c#3" {
            while CSh3AudioPlayer.currentTime <= 60.0/Double(tempo) { }
            indexArray += 1
            CSh3.backgroundColor = UIColor.blackColor()
            play()
        }
    }
    
    @IBAction func StartButtonPressed(sender: UIButton) {
        print("Start")
        indexArray = 0
        shouldPress = "none"
        lastKeyPressed = "none"
        
        if let myNumber = NSNumberFormatter().numberFromString(tempoText.text!) {
            tempo = myNumber.integerValue
        } else {
            tempo = 60;
        }
        if tempo < 0 {
            tempo = 60
        }
        setKeysToDefaultColor()
        play()
    }
    
    func keyBoardSetUp() {
        // Add Border to the keyboard
        keyBoardView.layer.borderColor = UIColor.blackColor().CGColor
        keyBoardView.layer.borderWidth = 2
        
        // Add Borders to the keys to show their positions
        C1.layer.borderColor = UIColor.blackColor().CGColor
        C1.layer.borderWidth = 1
        D1.layer.borderColor = UIColor.blackColor().CGColor
        D1.layer.borderWidth = 1
        E1.layer.borderColor = UIColor.blackColor().CGColor
        E1.layer.borderWidth = 1
        F1.layer.borderColor = UIColor.blackColor().CGColor
        F1.layer.borderWidth = 1
        G1.layer.borderColor = UIColor.blackColor().CGColor
        G1.layer.borderWidth = 1
        A1.layer.borderColor = UIColor.blackColor().CGColor
        A1.layer.borderWidth = 1
        B1.layer.borderColor = UIColor.blackColor().CGColor
        B1.layer.borderWidth = 1
        
        C2.layer.borderColor = UIColor.blackColor().CGColor
        C2.layer.borderWidth = 1
        D2.layer.borderColor = UIColor.blackColor().CGColor
        D2.layer.borderWidth = 1
        E2.layer.borderColor = UIColor.blackColor().CGColor
        E2.layer.borderWidth = 1
        F2.layer.borderColor = UIColor.blackColor().CGColor
        F2.layer.borderWidth = 1
        G2.layer.borderColor = UIColor.blackColor().CGColor
        G2.layer.borderWidth = 1
        A2.layer.borderColor = UIColor.blackColor().CGColor
        A2.layer.borderWidth = 1
        B2.layer.borderColor = UIColor.blackColor().CGColor
        B2.layer.borderWidth = 1
        
        C3.layer.borderColor = UIColor.blackColor().CGColor
        C3.layer.borderWidth = 1
    }
    
    func setKeysToDefaultColor() {
        C1.backgroundColor = UIColor.whiteColor()
        D1.backgroundColor = UIColor.whiteColor()
        E1.backgroundColor = UIColor.whiteColor()
        F1.backgroundColor = UIColor.whiteColor()
        G1.backgroundColor = UIColor.whiteColor()
        A1.backgroundColor = UIColor.whiteColor()
        B1.backgroundColor = UIColor.whiteColor()
        C2.backgroundColor = UIColor.whiteColor()
        D2.backgroundColor = UIColor.whiteColor()
        E2.backgroundColor = UIColor.whiteColor()
        F2.backgroundColor = UIColor.whiteColor()
        G2.backgroundColor = UIColor.whiteColor()
        A2.backgroundColor = UIColor.whiteColor()
        B2.backgroundColor = UIColor.whiteColor()
        C3.backgroundColor = UIColor.whiteColor()
        
        CSh1.backgroundColor = UIColor.blackColor()
        DSh1.backgroundColor = UIColor.blackColor()
        FSh1.backgroundColor = UIColor.blackColor()
        AFl1.backgroundColor = UIColor.blackColor()
        BFl1.backgroundColor = UIColor.blackColor()
        CSh2.backgroundColor = UIColor.blackColor()
        DSh2.backgroundColor = UIColor.blackColor()
        FSh2.backgroundColor = UIColor.blackColor()
        AFl2.backgroundColor = UIColor.blackColor()
        BFl2.backgroundColor = UIColor.blackColor()
        CSh3.backgroundColor = UIColor.blackColor()
    }
    
    func createAVAudioPlayers() {
        let C1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("C1", ofType: "mp3")!)
        do {
            C1AudioPlayer = try AVAudioPlayer(contentsOfURL: C1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let D1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("D1", ofType: "mp3")!)
        do {
            D1AudioPlayer = try AVAudioPlayer(contentsOfURL: D1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let E1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("E1", ofType: "mp3")!)
        do {
            E1AudioPlayer = try AVAudioPlayer(contentsOfURL: E1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let F1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("F1", ofType: "mp3")!)
        do {
            F1AudioPlayer = try AVAudioPlayer(contentsOfURL: F1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let G1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("G1", ofType: "mp3")!)
        do {
            G1AudioPlayer = try AVAudioPlayer(contentsOfURL: G1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let A1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("A1", ofType: "mp3")!)
        do {
            A1AudioPlayer = try AVAudioPlayer(contentsOfURL: A1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let B1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("B1", ofType: "mp3")!)
        do {
            B1AudioPlayer = try AVAudioPlayer(contentsOfURL: B1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let C2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("C2", ofType: "mp3")!)
        do {
            C2AudioPlayer = try AVAudioPlayer(contentsOfURL: C2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let D2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("D2", ofType: "mp3")!)
        do {
            D2AudioPlayer = try AVAudioPlayer(contentsOfURL: D2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let E2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("E2", ofType: "mp3")!)
        do {
            E2AudioPlayer = try AVAudioPlayer(contentsOfURL: E2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let F2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("F2", ofType: "mp3")!)
        do {
            F2AudioPlayer = try AVAudioPlayer(contentsOfURL: F2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let G2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("G2", ofType: "mp3")!)
        do {
            G2AudioPlayer = try AVAudioPlayer(contentsOfURL: G2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let A2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("A2", ofType: "mp3")!)
        do {
            A2AudioPlayer = try AVAudioPlayer(contentsOfURL: A2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let B2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("B2", ofType: "mp3")!)
        do {
            B2AudioPlayer = try AVAudioPlayer(contentsOfURL: B2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let C3AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("C3", ofType: "mp3")!)
        do {
            C3AudioPlayer = try AVAudioPlayer(contentsOfURL: C3AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let CSh1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("C#1", ofType: "mp3")!)
        do {
            CSh1AudioPlayer = try AVAudioPlayer(contentsOfURL: CSh1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let DSh1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("D#1", ofType: "mp3")!)
        do {
            DSh1AudioPlayer = try AVAudioPlayer(contentsOfURL: DSh1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let FSh1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("F#1", ofType: "mp3")!)
        do {
            FSh1AudioPlayer = try AVAudioPlayer(contentsOfURL: FSh1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let AFl1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ab1", ofType: "mp3")!)
        do {
            AFl1AudioPlayer = try AVAudioPlayer(contentsOfURL: AFl1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let BFl1AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Bb1", ofType: "mp3")!)
        do {
            BFl1AudioPlayer = try AVAudioPlayer(contentsOfURL: BFl1AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let CSh2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("C#2", ofType: "mp3")!)
        do {
            CSh2AudioPlayer = try AVAudioPlayer(contentsOfURL: CSh2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let DSh2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("D#2", ofType: "mp3")!)
        do {
            DSh2AudioPlayer = try AVAudioPlayer(contentsOfURL: DSh2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let FSh2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("F#2", ofType: "mp3")!)
        do {
            FSh2AudioPlayer = try AVAudioPlayer(contentsOfURL: FSh2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let AFl2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ab2", ofType: "mp3")!)
        do {
            AFl2AudioPlayer = try AVAudioPlayer(contentsOfURL: AFl2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let BFl2AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Bb2", ofType: "mp3")!)
        do {
            BFl2AudioPlayer = try AVAudioPlayer(contentsOfURL: BFl2AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
        let CSh3AudioURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("C#3", ofType: "mp3")!)
        do {
            CSh3AudioPlayer = try AVAudioPlayer(contentsOfURL: CSh3AudioURL)
        } catch { }
        ////////////////////////////////////////////////////////////////////////////////////////////////////
    }
    
    func play() {
        lHandImage.image = UIImage(named: "lefthand")!
        rHandImage.image = UIImage(named: "righthand")!
        if currentSong == nil || indexArray >= currentSong.count {
            indexArray = 0
            shouldPress = "none"
            lastKeyPressed = "none"
            print("song end")
            return
        }
//        let toPress: String = (currentSong[indexArray] as NSString).substringToIndex(2)
        
        let delimiter = "-"
        var token = currentSong[indexArray].componentsSeparatedByString(delimiter)
        shouldPress = token[0]
        print(token[0])
        print(token[1])
        
        setFingering(token[1])
        
        if shouldPress == "c1" {
            setColor(C1, finger: token[1])
        } else if shouldPress == "d1" {
            setColor(D1, finger: token[1])
        } else if shouldPress == "e1" {
            setColor(E1, finger: token[1])
        } else if shouldPress == "f1" {
            setColor(F1, finger: token[1])
        } else if shouldPress == "g1" {
            setColor(G1, finger: token[1])
        } else if shouldPress == "a1" {
            setColor(A1, finger: token[1])
        } else if shouldPress == "b1" {
            setColor(B1, finger: token[1])
        } else if shouldPress == "c2" {
            setColor(C2, finger: token[1])
        } else if shouldPress == "d2" {
            setColor(D2, finger: token[1])
        } else if shouldPress == "e2" {
            setColor(E2, finger: token[1])
        } else if shouldPress == "f2" {
            setColor(F2, finger: token[1])
        } else if shouldPress == "g2" {
            setColor(G2, finger: token[1])
        } else if shouldPress == "a2" {
            setColor(A2, finger: token[1])
        } else if shouldPress == "b2" {
            setColor(B2, finger: token[1])
        } else if shouldPress == "c3" {
            setColor(C3, finger: token[1])
        } else if shouldPress == "c#1" {
            setColor(CSh1, finger: token[1])
        } else if shouldPress == "d#1" {
            setColor(DSh1, finger: token[1])
        } else if shouldPress == "f#1" {
            setColor(FSh1, finger: token[1])
        } else if shouldPress == "ab1" {
            setColor(AFl1, finger: token[1])
        } else if shouldPress == "bb1" {
            setColor(BFl1, finger: token[1])
        } else if shouldPress == "c#2" {
            setColor(CSh2, finger: token[1])
        } else if shouldPress == "d#2" {
            setColor(DSh2, finger: token[1])
        } else if shouldPress == "f#2" {
            setColor(FSh2, finger: token[1])
        } else if shouldPress == "ab2" {
            setColor(AFl2, finger: token[1])
        } else if shouldPress == "bb2" {
            setColor(BFl2, finger: token[1])
        } else if shouldPress == "c#3" {
            setColor(CSh3, finger: token[1])
        }
    }
    
    func setFingering(finger: String) {
        let image: UIImage = UIImage(named: finger)!
        if (finger == "l1" || finger == "l2" || finger == "l3" || finger == "l4" || finger == "l5" ) {
            lHandImage.image = image
        } else if (finger == "r1" || finger == "r2" || finger == "r3" || finger == "r4" || finger == "r5" ) {
            rHandImage.image = UIImage(named: finger)
        }
    }
    
    func setColor(button: UIButton, finger: String) {
        let color = fingerColor[finger]
        if color == "yellow" {
            button.backgroundColor = UIColor.yellowColor()
        } else if color == "cyan" {
            button.backgroundColor = UIColor.cyanColor()
        } else if color == "red" {
            button.backgroundColor = UIColor.redColor()
        } else if color == "green" {
            button.backgroundColor = UIColor.greenColor()
        } else if color == "purple" {
            button.backgroundColor = UIColor.purpleColor()
        }
    }
}
