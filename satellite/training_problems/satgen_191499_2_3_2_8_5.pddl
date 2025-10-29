; params: satgen 191499 2 3 2 8 5
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
	thermograph0 - mode
	spectrograph1 - mode
	GroundStation4 - direction
	Star6 - direction
	Star7 - direction
	Star3 - direction
	Star0 - direction
	Star5 - direction
	GroundStation2 - direction
	Star1 - direction
	Star8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Star11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 Star1)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star5)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 spectrograph1)
	(supports instrument2 thermograph0)
	(calibration_target instrument2 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon12)
	(supports instrument3 spectrograph1)
	(calibration_target instrument3 Star5)
	(supports instrument4 thermograph0)
	(calibration_target instrument4 Star1)
	(calibration_target instrument4 GroundStation2)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation4)
)
(:goal (and
	(pointing satellite0 Star8)
	(have_image Star8 thermograph0)
	(have_image Star9 spectrograph1)
	(have_image Phenomenon10 spectrograph1)
	(have_image Star11 thermograph0)
	(have_image Phenomenon12 spectrograph1)
))

)
