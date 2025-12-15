(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_09 - type_1
obj_01 obj_14 obj_03 obj_12 - type_2
obj_02 obj_13 obj_10 obj_08 - type_3
obj_04 obj_05 obj_06 obj_11 - object)
(:init
(pred_3 obj_07 obj_10)
(pred_2 obj_07 obj_01)
(pred_2 obj_07 obj_14)
(pred_3 obj_09 obj_10)
(pred_2 obj_09 obj_03)
(pred_2 obj_09 obj_12)
(pred_1 obj_04 obj_13)
(pred_1 obj_05 obj_10)
(pred_1 obj_06 obj_08)
(pred_1 obj_11 obj_10)
)
(:goal
(and
(pred_1 obj_04 obj_10)
(pred_1 obj_05 obj_10)
(pred_1 obj_06 obj_08)
(pred_1 obj_11 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_08)))
)
)