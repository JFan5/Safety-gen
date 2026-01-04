(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_06 - type_3
obj_03 obj_09 obj_05 obj_10 - type_2
obj_11 obj_13 obj_04 obj_01 - type_1
obj_12 obj_02 obj_07 - object)
(:init
(pred_3 obj_08 obj_04)
(pred_1 obj_08 obj_03)
(pred_1 obj_08 obj_09)
(pred_3 obj_06 obj_13)
(pred_1 obj_06 obj_05)
(pred_1 obj_06 obj_10)
(pred_2 obj_12 obj_04)
(pred_2 obj_02 obj_13)
(pred_2 obj_07 obj_11)
)
(:goal
(and
(pred_2 obj_12 obj_01)
(pred_2 obj_02 obj_13)
(pred_2 obj_07 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_01)))
)
)