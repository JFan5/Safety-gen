(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_07 - type_3
obj_01 obj_09 obj_05 obj_10 - type_2
obj_04 obj_12 obj_14 obj_08 - type_1
obj_13 obj_11 obj_03 obj_02 - object)
(:init
(pred_1 obj_06 obj_12)
(pred_2 obj_06 obj_01)
(pred_2 obj_06 obj_09)
(pred_1 obj_07 obj_08)
(pred_2 obj_07 obj_05)
(pred_2 obj_07 obj_10)
(pred_3 obj_13 obj_08)
(pred_3 obj_11 obj_08)
(pred_3 obj_03 obj_08)
(pred_3 obj_02 obj_14)
)
(:goal
(and
(pred_3 obj_13 obj_14)
(pred_3 obj_11 obj_14)
(pred_3 obj_03 obj_14)
(pred_3 obj_02 obj_14)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_14)))
)
)