(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_03 - type_3
obj_04 obj_01 obj_13 obj_08 - type_2
obj_12 obj_02 obj_07 obj_09 - type_1
obj_10 obj_05 obj_06 - object)
(:init
(pred_3 obj_11 obj_07)
(pred_2 obj_11 obj_04)
(pred_2 obj_11 obj_01)
(pred_3 obj_03 obj_09)
(pred_2 obj_03 obj_13)
(pred_2 obj_03 obj_08)
(pred_4 obj_10 obj_02)
(pred_4 obj_05 obj_09)
(pred_4 obj_06 obj_09)
)
(:goal
(and
(pred_4 obj_10 obj_12)
(pred_4 obj_05 obj_09)
(pred_4 obj_06 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_02)))
)
)