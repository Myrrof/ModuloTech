//
//  DeviceDetailViewController.swift
//  ModuloTech
//
//  Created by Laurent Cheng on 02/08/2021.
//

import UIKit

protocol DeviceDetailDelegate {

    func onValueChanged(value: Float)
    func onClickSwitch(isOn: Bool)
    func onClickDelete()
    func onTapArrowUp()
    func onTapArrowDown()
}

class DeviceDetailViewController: UIViewController {
    
    var viewModel: DeviceDetailViewModel!

    init(device: Any) {
        super.init(nibName: nil, bundle: nil)
        setupView(for: device)
        initViewModel(for: device)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(for device: Any) {
        let v = DeviceDetailView(frame: view.frame, device: device)
        v.delegate = self
        view = v
    }
    
    func initViewModel(for device: Any) {
        viewModel = DeviceDetailViewModel(device: device)
        if let view = self.view as? DeviceDetailView {
            view.setNameText(text: viewModel.name)
            view.setValueText(text: viewModel.valueText)
            view.setColorViewHidden(isHidden: viewModel.isHidden)
            view.setSwitchButton(isOn: viewModel.isOn)
            view.setSliderValue(value: viewModel.value)
            view.setColorViewColor(color: viewModel.color)
            view.setColorViewHeight(height: viewModel.getColorViewHeight(with: view.frame.height))
        }
    }
}

extension DeviceDetailViewController: DeviceDetailDelegate {
    
    func onClickDelete() {
        let alert = UIAlertController(title: L10n.deleteDeviceHint, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: L10n.yes, style: .default, handler: { [self] _ in
            viewModel.onClickDelete {
                navigationController?.popViewController(animated: true)
                let alert = UIAlertController(title: nil, message: L10n.deleteDeviceSuccess, preferredStyle: .alert)
                alert.view.backgroundColor = UIColor.black
                alert.view.layer.cornerRadius = 10

                DispatchQueue.main.async {
                    present(alert, animated: true)
                }

                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    alert.dismiss(animated: true)
                }
            }
        }))
        alert.addAction(UIAlertAction(title: L10n.cancel, style: .cancel))
        present(alert, animated: true)
    }
    
    func onValueChanged(value: Float) {
        viewModel.onValueChanged(value: value)
        (view as? DeviceDetailView)?.setColorViewHeight(height: viewModel.getColorViewHeight(with: view.frame.height))
        (view as? DeviceDetailView)?.setValueText(text: viewModel.valueText)
    }

    func onClickSwitch(isOn: Bool) {
        viewModel.onClickSwitch(isOn: isOn)
        (view as? DeviceDetailView)?.setColorViewHidden(isHidden: viewModel.isHidden)
        (view as? DeviceDetailView)?.setValueText(text: viewModel.valueText)
    }

    func onTapArrowUp() {
        viewModel.onTapArrowUp()
        (view as? DeviceDetailView)?.setColorViewHeight(height: viewModel.getColorViewHeight(with: view.frame.height))
        (view as? DeviceDetailView)?.setValueText(text: viewModel.valueText)
    }

    func onTapArrowDown() {
        viewModel.onTapArrowDown()
        (view as? DeviceDetailView)?.setColorViewHeight(height: viewModel.getColorViewHeight(with: view.frame.height))
        (view as? DeviceDetailView)?.setValueText(text: viewModel.valueText)
    }
}
