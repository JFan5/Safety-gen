(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_02 - type_1
obj_13 obj_01 obj_09 obj_07 - type_3
obj_08 obj_11 obj_14 obj_03 - type_2
obj_10 obj_12 obj_05 obj_06 - object)
(:init
(pred_3 obj_04 obj_08)
(pred_4 obj_04 obj_13)
(pred_4 obj_04 obj_01)
(pred_3 obj_02 obj_14)
(pred_4 obj_02 obj_09)
(pred_4 obj_02 obj_07)
(pred_2 obj_10 obj_14)
(pred_2 obj_12 obj_08)
(pred_2 obj_05 obj_14)
(pred_2 obj_06 obj_08)
)
(:goal
(and
(pred_2 obj_10 obj_08)
(pred_2 obj_12 obj_14)
(pred_2 obj_05 obj_14)
(pred_2 obj_06 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_14)))
)
)