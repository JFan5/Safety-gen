(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_07 - type_1
obj_13 obj_01 obj_09 obj_10 - type_3
obj_04 obj_03 obj_14 obj_12 - type_2
obj_11 obj_02 obj_08 obj_05 - object)
(:init
(pred_4 obj_06 obj_12)
(pred_2 obj_06 obj_13)
(pred_2 obj_06 obj_01)
(pred_4 obj_07 obj_03)
(pred_2 obj_07 obj_09)
(pred_2 obj_07 obj_10)
(pred_3 obj_11 obj_12)
(pred_3 obj_02 obj_14)
(pred_3 obj_08 obj_12)
(pred_3 obj_05 obj_03)
)
(:goal
(and
(pred_3 obj_11 obj_14)
(pred_3 obj_02 obj_14)
(pred_3 obj_08 obj_14)
(pred_3 obj_05 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_14)))
)
)