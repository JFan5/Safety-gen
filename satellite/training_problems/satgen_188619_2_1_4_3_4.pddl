; params: satgen 188619 2 1 4 3 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared2 - mode
	image1 - mode
	thermograph3 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	Star2 - direction
	Star1 - direction
	Phenomenon3 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 image1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet5)
	(supports instrument1 spectrograph0)
	(supports instrument1 infrared2)
	(supports instrument1 thermograph3)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star1)
)
(:goal (and
	(pointing satellite1 Star4)
	(have_image Phenomenon3 thermograph3)
	(have_image Star4 image1)
	(have_image Planet5 spectrograph0)
	(have_image Planet6 infrared2)
))

)
