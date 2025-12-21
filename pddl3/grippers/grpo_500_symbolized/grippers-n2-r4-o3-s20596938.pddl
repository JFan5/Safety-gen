(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_13 - type_1
obj_11 obj_10 obj_07 obj_12 - type_3
obj_04 obj_09 obj_05 obj_02 - type_2
obj_01 obj_06 obj_08 - object)
(:init
(pred_4 obj_03 obj_05)
(pred_2 obj_03 obj_11)
(pred_2 obj_03 obj_10)
(pred_4 obj_13 obj_04)
(pred_2 obj_13 obj_07)
(pred_2 obj_13 obj_12)
(pred_3 obj_01 obj_04)
(pred_3 obj_06 obj_05)
(pred_3 obj_08 obj_02)
)
(:goal
(and
(pred_3 obj_01 obj_02)
(pred_3 obj_06 obj_05)
(pred_3 obj_08 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_02)))
)
)