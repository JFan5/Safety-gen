(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_14 - type_1
obj_07 obj_01 obj_05 obj_04 - type_3
obj_12 obj_03 obj_06 obj_11 - type_2
obj_08 obj_10 obj_13 obj_09 - object)
(:init
(pred_4 obj_02 obj_03)
(pred_2 obj_02 obj_07)
(pred_2 obj_02 obj_01)
(pred_4 obj_14 obj_12)
(pred_2 obj_14 obj_05)
(pred_2 obj_14 obj_04)
(pred_3 obj_08 obj_12)
(pred_3 obj_10 obj_11)
(pred_3 obj_13 obj_03)
(pred_3 obj_09 obj_11)
)
(:goal
(and
(pred_3 obj_08 obj_03)
(pred_3 obj_10 obj_06)
(pred_3 obj_13 obj_11)
(pred_3 obj_09 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_06)))
)
)