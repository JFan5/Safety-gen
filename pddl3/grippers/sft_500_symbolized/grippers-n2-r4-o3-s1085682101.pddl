(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_03 - type_1
obj_06 obj_01 obj_13 obj_11 - type_2
obj_12 obj_05 obj_09 obj_04 - type_3
obj_08 obj_10 obj_07 - object)
(:init
(pred_1 obj_02 obj_09)
(pred_3 obj_02 obj_06)
(pred_3 obj_02 obj_01)
(pred_1 obj_03 obj_04)
(pred_3 obj_03 obj_13)
(pred_3 obj_03 obj_11)
(pred_2 obj_08 obj_05)
(pred_2 obj_10 obj_04)
(pred_2 obj_07 obj_04)
)
(:goal
(and
(pred_2 obj_08 obj_12)
(pred_2 obj_10 obj_04)
(pred_2 obj_07 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_05)))
)
)