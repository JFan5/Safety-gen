(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_07 - type_1
obj_09 obj_01 obj_11 obj_03 - type_2
obj_04 obj_13 obj_08 obj_14 - type_3
obj_06 obj_12 obj_02 obj_05 - object)
(:init
(pred_1 obj_10 obj_08)
(pred_3 obj_10 obj_09)
(pred_3 obj_10 obj_01)
(pred_1 obj_07 obj_04)
(pred_3 obj_07 obj_11)
(pred_3 obj_07 obj_03)
(pred_2 obj_06 obj_04)
(pred_2 obj_12 obj_08)
(pred_2 obj_02 obj_14)
(pred_2 obj_05 obj_13)
)
(:goal
(and
(pred_2 obj_06 obj_04)
(pred_2 obj_12 obj_13)
(pred_2 obj_02 obj_08)
(pred_2 obj_05 obj_14)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_13)))
)
)