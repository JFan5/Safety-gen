(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_1
obj_11 obj_12 obj_10 obj_13 - type_3
obj_03 obj_04 obj_06 obj_02 - type_2
obj_09 obj_08 obj_01 - object)
(:init
(pred_3 obj_05 obj_03)
(pred_4 obj_05 obj_11)
(pred_4 obj_05 obj_12)
(pred_3 obj_07 obj_04)
(pred_4 obj_07 obj_10)
(pred_4 obj_07 obj_13)
(pred_2 obj_09 obj_02)
(pred_2 obj_08 obj_02)
(pred_2 obj_01 obj_02)
)
(:goal
(and
(pred_2 obj_09 obj_02)
(pred_2 obj_08 obj_06)
(pred_2 obj_01 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_06)))
)
)