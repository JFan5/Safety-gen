(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_05 - type_1
obj_14 obj_04 obj_07 obj_08 - type_2
obj_02 obj_01 obj_03 obj_12 - type_3
obj_10 obj_06 obj_11 obj_09 - object)
(:init
(pred_1 obj_13 obj_12)
(pred_3 obj_13 obj_14)
(pred_3 obj_13 obj_04)
(pred_1 obj_05 obj_02)
(pred_3 obj_05 obj_07)
(pred_3 obj_05 obj_08)
(pred_2 obj_10 obj_03)
(pred_2 obj_06 obj_12)
(pred_2 obj_11 obj_03)
(pred_2 obj_09 obj_12)
)
(:goal
(and
(pred_2 obj_10 obj_03)
(pred_2 obj_06 obj_03)
(pred_2 obj_11 obj_02)
(pred_2 obj_09 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_03)))
)
)