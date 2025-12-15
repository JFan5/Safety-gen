(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_1
obj_01 obj_04 obj_07 obj_13 - type_3
obj_03 obj_10 obj_06 obj_11 - type_2
obj_08 obj_09 obj_05 - object)
(:init
(pred_3 obj_02 obj_10)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_04)
(pred_3 obj_12 obj_10)
(pred_4 obj_12 obj_07)
(pred_4 obj_12 obj_13)
(pred_2 obj_08 obj_06)
(pred_2 obj_09 obj_03)
(pred_2 obj_05 obj_03)
)
(:goal
(and
(pred_2 obj_08 obj_10)
(pred_2 obj_09 obj_03)
(pred_2 obj_05 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_06)))
)
)