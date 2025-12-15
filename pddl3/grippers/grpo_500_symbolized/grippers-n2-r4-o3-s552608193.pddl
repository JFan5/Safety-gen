(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_04 obj_12 obj_11 obj_07 - type_3
obj_10 obj_02 obj_08 obj_06 - type_2
obj_13 obj_05 obj_03 - object)
(:init
(pred_3 obj_09 obj_02)
(pred_4 obj_09 obj_04)
(pred_4 obj_09 obj_12)
(pred_3 obj_01 obj_06)
(pred_4 obj_01 obj_11)
(pred_4 obj_01 obj_07)
(pred_2 obj_13 obj_06)
(pred_2 obj_05 obj_10)
(pred_2 obj_03 obj_06)
)
(:goal
(and
(pred_2 obj_13 obj_06)
(pred_2 obj_05 obj_08)
(pred_2 obj_03 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_08)))
)
)