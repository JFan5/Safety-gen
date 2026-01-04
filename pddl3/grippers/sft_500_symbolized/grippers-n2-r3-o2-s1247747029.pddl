(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_03 obj_11 - type_3
obj_02 obj_07 obj_05 obj_04 - type_2
obj_08 obj_10 obj_09 - type_1
obj_06 obj_01 - object)
(:init
(pred_2 obj_03 obj_10)
(pred_3 obj_03 obj_02)
(pred_3 obj_03 obj_07)
(pred_2 obj_11 obj_10)
(pred_3 obj_11 obj_05)
(pred_3 obj_11 obj_04)
(pred_1 obj_06 obj_10)
(pred_1 obj_01 obj_09)
)
(:goal
(and
(pred_1 obj_06 obj_09)
(pred_1 obj_01 obj_10)
)
)

(:constraints
  (always (not (pred_2 obj_03 obj_09)))
)
)