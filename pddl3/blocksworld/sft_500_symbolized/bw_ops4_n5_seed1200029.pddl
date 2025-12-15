(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_03 obj_02 obj_04 obj_05 obj_01 )
(:init
(pred_2)
(pred_3 obj_03)
(pred_5 obj_02 obj_01)
(pred_3 obj_04)
(pred_5 obj_05 obj_02)
(pred_3 obj_01)
(pred_1 obj_03)
(pred_1 obj_04)
(pred_1 obj_05)
)
(:goal
(and
(pred_5 obj_02 obj_04)
(pred_5 obj_04 obj_03)
(pred_5 obj_05 obj_01))
)

(:constraints
  (sometime-before (pred_5 obj_04 obj_03) (pred_5 obj_02 obj_04))
)
)