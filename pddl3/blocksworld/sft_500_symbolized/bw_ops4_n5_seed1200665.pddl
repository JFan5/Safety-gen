(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_03 obj_05 obj_01 obj_04 obj_02 )
(:init
(pred_4)
(pred_1 obj_03 obj_04)
(pred_3 obj_05)
(pred_1 obj_01 obj_05)
(pred_1 obj_04 obj_01)
(pred_3 obj_02)
(pred_5 obj_03)
(pred_5 obj_02)
)
(:goal
(and
(pred_1 obj_05 obj_01)
(pred_1 obj_04 obj_03)
(pred_1 obj_02 obj_05))
)

(:constraints
  (sometime-before (pred_1 obj_04 obj_03) (pred_1 obj_05 obj_01))
)
)