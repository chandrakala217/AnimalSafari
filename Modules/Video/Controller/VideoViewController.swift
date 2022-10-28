//
//  VideoViewController.swift
//  AfricanSafari
//
//  Created by chandrakala pushpala on 8/14/22.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class VideoViewController: UIViewController {
    
    // MARK: - Private Property
    
    private var viewModel: VideoViewModel?
    
    // MARK: - Private IBOutlet
    
    @IBOutlet private weak var videoTableView: UITableView!
    
    // MARK: - View Intializers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewModel()
        self.videoTableView.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "VideoCell")
        self.viewModel?.fetchData()
        self.title = "Video"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Internal Methods
    
    internal func setUpViewModel() {
        viewModel = VideoViewModel()
        viewModel?.delegate = self
    }
    
    private func playVideo(selectedAnimal: String) {
        guard let path = Bundle.main.path(forResource: selectedAnimal, ofType:"mp4") else {
            debugPrint("video.mp4 not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
}
// MARK: - VideoViewController Extensions

extension VideoViewController: UITableViewDataSource {
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.rowDataCount() ?? 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as? VideoCell else {
            return UITableViewCell()
        }
        cell.updateUI(videoImage: viewModel?.imageData(indexPath), title: viewModel?.titleData(indexPath), headline: viewModel?.headlineData(indexPath))
        cell.selectionStyle = .none
        return cell
    }
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension VideoViewController: UITableViewDelegate {
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.playVideo(selectedAnimal: viewModel?.animalData(indexPath) ?? "")
    }
}

extension VideoViewController: ViewModelObserver {
    
    internal func viewModelDidUpdate() {
        DispatchQueue.main.async {
            self.videoTableView.reloadData()
        }
    }
    internal func viewModelDidUpdateFailed() {
        // Show Alert
    }
}
