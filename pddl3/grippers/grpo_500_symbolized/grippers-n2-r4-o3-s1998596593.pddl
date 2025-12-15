(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_09 - type_1
obj_11 obj_07 obj_08 obj_10 - type_3
obj_03 obj_04 obj_02 obj_13 - type_2
obj_05 obj_01 obj_12 - object)
(:init
(pred_3 obj_06 obj_03)
(pred_4 obj_06 obj_11)
(pred_4 obj_06 obj_07)
(pred_3 obj_09 obj_03)
(pred_4 obj_09 obj_08)
(pred_4 obj_09 obj_10)
(pred_2 obj_05 obj_02)
(pred_2 obj_01 obj_02)
(pred_2 obj_12 obj_04)
)
(:goal
(and
(pred_2 obj_05 obj_04)
(pred_2 obj_01 obj_02)
(pred_2 obj_12 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_02)))
)
)