(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_02 - type_1
obj_14 obj_03 obj_11 obj_13 - type_3
obj_01 obj_04 obj_08 obj_07 - type_2
obj_06 obj_09 obj_05 obj_12 - object)
(:init
(pred_4 obj_10 obj_07)
(pred_2 obj_10 obj_14)
(pred_2 obj_10 obj_03)
(pred_4 obj_02 obj_04)
(pred_2 obj_02 obj_11)
(pred_2 obj_02 obj_13)
(pred_3 obj_06 obj_08)
(pred_3 obj_09 obj_07)
(pred_3 obj_05 obj_01)
(pred_3 obj_12 obj_07)
)
(:goal
(and
(pred_3 obj_06 obj_04)
(pred_3 obj_09 obj_08)
(pred_3 obj_05 obj_01)
(pred_3 obj_12 obj_08)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_08)))
)
)