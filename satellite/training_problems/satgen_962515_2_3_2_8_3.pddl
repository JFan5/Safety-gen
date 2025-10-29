; params: satgen 962515 2 3 2 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	spectrograph1 - mode
	image0 - mode
	Star1 - direction
	Star4 - direction
	Star6 - direction
	Star5 - direction
	Star3 - direction
	Star0 - direction
	GroundStation2 - direction
	Star7 - direction
	Star8 - direction
	Planet9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 Star5)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 GroundStation2)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation2)
	(supports instrument2 image0)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 Star7)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star10)
)
(:goal (and
	(pointing satellite0 Star4)
	(have_image Star8 spectrograph1)
	(have_image Planet9 image0)
	(have_image Star10 spectrograph1)
))

)
