(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_09 - type_2
obj_03 obj_12 obj_04 obj_10 - type_1
obj_05 obj_13 obj_08 obj_01 - type_3
obj_07 obj_11 obj_02 - object)
(:init
(pred_1 obj_06 obj_01)
(pred_2 obj_06 obj_03)
(pred_2 obj_06 obj_12)
(pred_1 obj_09 obj_08)
(pred_2 obj_09 obj_04)
(pred_2 obj_09 obj_10)
(pred_3 obj_07 obj_13)
(pred_3 obj_11 obj_08)
(pred_3 obj_02 obj_13)
)
(:goal
(and
(pred_3 obj_07 obj_08)
(pred_3 obj_11 obj_01)
(pred_3 obj_02 obj_13)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_08)))
)
)