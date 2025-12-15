(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_06 - type_1
obj_12 obj_09 obj_04 obj_14 - type_3
obj_01 obj_07 obj_10 obj_08 - type_2
obj_11 obj_05 obj_02 obj_13 - object)
(:init
(pred_3 obj_03 obj_10)
(pred_4 obj_03 obj_12)
(pred_4 obj_03 obj_09)
(pred_3 obj_06 obj_10)
(pred_4 obj_06 obj_04)
(pred_4 obj_06 obj_14)
(pred_2 obj_11 obj_10)
(pred_2 obj_05 obj_01)
(pred_2 obj_02 obj_01)
(pred_2 obj_13 obj_01)
)
(:goal
(and
(pred_2 obj_11 obj_08)
(pred_2 obj_05 obj_01)
(pred_2 obj_02 obj_01)
(pred_2 obj_13 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_08)))
)
)