(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_12 - type_2
obj_03 obj_11 obj_10 obj_08 - type_1
obj_02 obj_04 obj_05 obj_01 - type_3
obj_07 obj_13 obj_09 - object)
(:init
(pred_1 obj_06 obj_04)
(pred_2 obj_06 obj_03)
(pred_2 obj_06 obj_11)
(pred_1 obj_12 obj_01)
(pred_2 obj_12 obj_10)
(pred_2 obj_12 obj_08)
(pred_3 obj_07 obj_05)
(pred_3 obj_13 obj_01)
(pred_3 obj_09 obj_05)
)
(:goal
(and
(pred_3 obj_07 obj_02)
(pred_3 obj_13 obj_04)
(pred_3 obj_09 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_05)))
)
)