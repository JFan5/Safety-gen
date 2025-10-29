; params: satgen 237878 2 3 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	instrument5 - instrument
	infrared1 - mode
	image2 - mode
	spectrograph3 - mode
	spectrograph0 - mode
	GroundStation4 - direction
	Star1 - direction
	Star0 - direction
	GroundStation2 - direction
	Star3 - direction
	Phenomenon5 - direction
	Planet6 - direction
	Planet7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 image2)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star1)
	(supports instrument2 spectrograph3)
	(supports instrument2 image2)
	(calibration_target instrument2 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
	(supports instrument3 image2)
	(supports instrument3 spectrograph0)
	(calibration_target instrument3 Star0)
	(supports instrument4 infrared1)
	(supports instrument4 spectrograph3)
	(supports instrument4 spectrograph0)
	(calibration_target instrument4 GroundStation2)
	(supports instrument5 infrared1)
	(supports instrument5 spectrograph0)
	(supports instrument5 image2)
	(calibration_target instrument5 Star3)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite1 Star0)
	(have_image Phenomenon5 infrared1)
	(have_image Planet6 infrared1)
	(have_image Planet7 infrared1)
	(have_image Star8 image2)
))

)
