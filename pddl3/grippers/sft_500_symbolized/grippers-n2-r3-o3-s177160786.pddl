(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_04 - type_1
obj_10 obj_08 obj_12 obj_09 - type_2
obj_05 obj_07 obj_02 - type_3
obj_03 obj_11 obj_01 - object)
(:init
(pred_1 obj_06 obj_07)
(pred_3 obj_06 obj_10)
(pred_3 obj_06 obj_08)
(pred_1 obj_04 obj_05)
(pred_3 obj_04 obj_12)
(pred_3 obj_04 obj_09)
(pred_2 obj_03 obj_02)
(pred_2 obj_11 obj_07)
(pred_2 obj_01 obj_02)
)
(:goal
(and
(pred_2 obj_03 obj_07)
(pred_2 obj_11 obj_07)
(pred_2 obj_01 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_02)))
)
)