; params: satgen 73244 2 1 3 8 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	spectrograph0 - mode
	image1 - mode
	infrared2 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Star6 - direction
	Star7 - direction
	Star5 - direction
	GroundStation0 - direction
	Star8 - direction
	Phenomenon9 - direction
	Planet10 - direction
	Planet11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 Star7)
	(calibration_target instrument0 Star6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument1 image1)
	(supports instrument1 infrared2)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 GroundStation0)
	(calibration_target instrument1 Star5)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite1 Phenomenon12)
	(have_image Star8 spectrograph0)
	(have_image Phenomenon9 image1)
	(have_image Planet10 spectrograph0)
	(have_image Planet11 infrared2)
	(have_image Phenomenon12 image1)
))

)
