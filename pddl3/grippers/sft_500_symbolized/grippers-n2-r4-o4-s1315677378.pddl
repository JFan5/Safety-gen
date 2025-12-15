(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_08 - type_2
obj_04 obj_05 obj_13 obj_10 - type_3
obj_14 obj_09 obj_01 obj_12 - type_1
obj_02 obj_03 obj_11 obj_06 - object)
(:init
(pred_2 obj_07 obj_14)
(pred_1 obj_07 obj_04)
(pred_1 obj_07 obj_05)
(pred_2 obj_08 obj_14)
(pred_1 obj_08 obj_13)
(pred_1 obj_08 obj_10)
(pred_3 obj_02 obj_12)
(pred_3 obj_03 obj_14)
(pred_3 obj_11 obj_01)
(pred_3 obj_06 obj_14)
)
(:goal
(and
(pred_3 obj_02 obj_14)
(pred_3 obj_03 obj_14)
(pred_3 obj_11 obj_09)
(pred_3 obj_06 obj_09)
)
)

(:constraints
  (always (not (pred_2 obj_07 obj_01)))
)
)