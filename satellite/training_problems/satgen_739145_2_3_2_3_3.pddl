; params: satgen 739145 2 3 2 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	spectrograph0 - mode
	Star0 - direction
	GroundStation1 - direction
	Star2 - direction
	Phenomenon3 - direction
	Phenomenon4 - direction
	Phenomenon5 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 image1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 image1)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon5)
)
(:goal (and
	(pointing satellite0 Phenomenon4)
	(have_image Phenomenon3 spectrograph0)
	(have_image Phenomenon4 image1)
	(have_image Phenomenon5 image1)
))

)
