; params: satgen 165841 2 2 3 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image2 - mode
	spectrograph0 - mode
	thermograph1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	Star5 - direction
	GroundStation7 - direction
	Star6 - direction
	Star2 - direction
	GroundStation4 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Star11 - direction
	Star12 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star2)
	(calibration_target instrument0 Star6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation4)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph0)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Phenomenon10)
)
(:goal (and
	(have_image Planet8 thermograph1)
	(have_image Phenomenon9 thermograph1)
	(have_image Phenomenon10 image2)
	(have_image Star11 thermograph1)
	(have_image Star12 image2)
))

)
