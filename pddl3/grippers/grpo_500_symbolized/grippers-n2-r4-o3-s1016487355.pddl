(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_12 - type_1
obj_01 obj_05 obj_09 obj_10 - type_3
obj_08 obj_07 obj_06 obj_02 - type_2
obj_04 obj_11 obj_03 - object)
(:init
(pred_3 obj_13 obj_06)
(pred_4 obj_13 obj_01)
(pred_4 obj_13 obj_05)
(pred_3 obj_12 obj_02)
(pred_4 obj_12 obj_09)
(pred_4 obj_12 obj_10)
(pred_2 obj_04 obj_02)
(pred_2 obj_11 obj_06)
(pred_2 obj_03 obj_07)
)
(:goal
(and
(pred_2 obj_04 obj_02)
(pred_2 obj_11 obj_02)
(pred_2 obj_03 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_02)))
)
)