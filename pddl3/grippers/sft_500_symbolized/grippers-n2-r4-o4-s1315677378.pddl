(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_13 - type_1
obj_10 obj_03 obj_11 obj_02 - type_2
obj_01 obj_04 obj_08 obj_09 - type_3
obj_06 obj_07 obj_14 obj_05 - object)
(:init
(pred_1 obj_12 obj_01)
(pred_3 obj_12 obj_10)
(pred_3 obj_12 obj_03)
(pred_1 obj_13 obj_01)
(pred_3 obj_13 obj_11)
(pred_3 obj_13 obj_02)
(pred_2 obj_06 obj_09)
(pred_2 obj_07 obj_01)
(pred_2 obj_14 obj_08)
(pred_2 obj_05 obj_01)
)
(:goal
(and
(pred_2 obj_06 obj_01)
(pred_2 obj_07 obj_01)
(pred_2 obj_14 obj_04)
(pred_2 obj_05 obj_04)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_08)))
)
)