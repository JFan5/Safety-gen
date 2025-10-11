; params: satgen 846528 2 1 2 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph1 - mode
	image0 - mode
	Star0 - direction
	Star1 - direction
	GroundStation4 - direction
	GroundStation3 - direction
	Star2 - direction
	Phenomenon5 - direction
	Star6 - direction
	Star7 - direction
	Planet8 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 spectrograph1)
	(supports instrument1 image0)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite1 Star6)
	(have_image Phenomenon5 spectrograph1)
	(have_image Star6 spectrograph1)
	(have_image Star7 image0)
	(have_image Planet8 spectrograph1)
))

)
