(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_02 - type_1
obj_05 obj_13 obj_12 obj_08 - type_2
obj_11 obj_09 obj_01 obj_14 - type_3
obj_10 obj_07 obj_06 obj_03 - object)
(:init
(pred_1 obj_04 obj_14)
(pred_3 obj_04 obj_05)
(pred_3 obj_04 obj_13)
(pred_1 obj_02 obj_14)
(pred_3 obj_02 obj_12)
(pred_3 obj_02 obj_08)
(pred_2 obj_10 obj_01)
(pred_2 obj_07 obj_09)
(pred_2 obj_06 obj_11)
(pred_2 obj_03 obj_01)
)
(:goal
(and
(pred_2 obj_10 obj_11)
(pred_2 obj_07 obj_11)
(pred_2 obj_06 obj_11)
(pred_2 obj_03 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_01)))
)
)