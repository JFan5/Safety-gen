(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_04 - type_1
obj_03 obj_12 obj_07 obj_10 - type_3
obj_06 obj_02 obj_08 obj_11 - type_2
obj_13 obj_01 obj_09 - object)
(:init
(pred_3 obj_05 obj_02)
(pred_4 obj_05 obj_03)
(pred_4 obj_05 obj_12)
(pred_3 obj_04 obj_08)
(pred_4 obj_04 obj_07)
(pred_4 obj_04 obj_10)
(pred_2 obj_13 obj_02)
(pred_2 obj_01 obj_02)
(pred_2 obj_09 obj_11)
)
(:goal
(and
(pred_2 obj_13 obj_08)
(pred_2 obj_01 obj_08)
(pred_2 obj_09 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_08)))
)
)