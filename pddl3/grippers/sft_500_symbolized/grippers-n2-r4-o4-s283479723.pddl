(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_02 - type_1
obj_11 obj_13 obj_09 obj_01 - type_2
obj_12 obj_03 obj_14 obj_07 - type_3
obj_05 obj_04 obj_10 obj_06 - object)
(:init
(pred_1 obj_08 obj_07)
(pred_3 obj_08 obj_11)
(pred_3 obj_08 obj_13)
(pred_1 obj_02 obj_07)
(pred_3 obj_02 obj_09)
(pred_3 obj_02 obj_01)
(pred_2 obj_05 obj_12)
(pred_2 obj_04 obj_14)
(pred_2 obj_10 obj_14)
(pred_2 obj_06 obj_12)
)
(:goal
(and
(pred_2 obj_05 obj_12)
(pred_2 obj_04 obj_12)
(pred_2 obj_10 obj_03)
(pred_2 obj_06 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_14)))
)
)