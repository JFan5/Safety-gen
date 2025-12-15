(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_12 - type_1
obj_01 obj_07 obj_02 obj_09 - type_3
obj_08 obj_10 obj_13 obj_06 - type_2
obj_05 obj_11 obj_04 - object)
(:init
(pred_3 obj_03 obj_06)
(pred_4 obj_03 obj_01)
(pred_4 obj_03 obj_07)
(pred_3 obj_12 obj_10)
(pred_4 obj_12 obj_02)
(pred_4 obj_12 obj_09)
(pred_2 obj_05 obj_13)
(pred_2 obj_11 obj_10)
(pred_2 obj_04 obj_06)
)
(:goal
(and
(pred_2 obj_05 obj_10)
(pred_2 obj_11 obj_08)
(pred_2 obj_04 obj_13)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_13)))
)
)