(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_02 obj_11 obj_07 obj_12 - type_3
obj_10 obj_03 obj_08 obj_04 - type_2
obj_13 obj_05 obj_06 - object)
(:init
(pred_4 obj_09 obj_04)
(pred_2 obj_09 obj_02)
(pred_2 obj_09 obj_11)
(pred_4 obj_01 obj_03)
(pred_2 obj_01 obj_07)
(pred_2 obj_01 obj_12)
(pred_3 obj_13 obj_08)
(pred_3 obj_05 obj_03)
(pred_3 obj_06 obj_04)
)
(:goal
(and
(pred_3 obj_13 obj_03)
(pred_3 obj_05 obj_10)
(pred_3 obj_06 obj_08)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_08)))
)
)