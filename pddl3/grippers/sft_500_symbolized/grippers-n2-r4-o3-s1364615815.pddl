(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_10 - type_1
obj_12 obj_08 obj_01 obj_03 - type_3
obj_13 obj_02 obj_09 obj_07 - type_2
obj_04 obj_11 obj_05 - object)
(:init
(pred_1 obj_06 obj_09)
(pred_2 obj_06 obj_12)
(pred_2 obj_06 obj_08)
(pred_1 obj_10 obj_02)
(pred_2 obj_10 obj_01)
(pred_2 obj_10 obj_03)
(pred_4 obj_04 obj_02)
(pred_4 obj_11 obj_02)
(pred_4 obj_05 obj_09)
)
(:goal
(and
(pred_4 obj_04 obj_07)
(pred_4 obj_11 obj_02)
(pred_4 obj_05 obj_13)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_13)))
)
)