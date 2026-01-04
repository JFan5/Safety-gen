(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_07 - type_2
obj_05 obj_02 obj_12 obj_03 - type_3
obj_04 obj_06 obj_10 - type_1
obj_08 obj_11 obj_01 - object)
(:init
(pred_4 obj_09 obj_10)
(pred_2 obj_09 obj_05)
(pred_2 obj_09 obj_02)
(pred_4 obj_07 obj_10)
(pred_2 obj_07 obj_12)
(pred_2 obj_07 obj_03)
(pred_3 obj_08 obj_06)
(pred_3 obj_11 obj_06)
(pred_3 obj_01 obj_04)
)
(:goal
(and
(pred_3 obj_08 obj_04)
(pred_3 obj_11 obj_10)
(pred_3 obj_01 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_06)))
)
)