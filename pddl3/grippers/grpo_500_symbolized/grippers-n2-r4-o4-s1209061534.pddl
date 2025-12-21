(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_02 - type_1
obj_03 obj_08 obj_01 obj_09 - type_3
obj_05 obj_11 obj_10 obj_14 - type_2
obj_04 obj_12 obj_07 obj_06 - object)
(:init
(pred_4 obj_13 obj_14)
(pred_2 obj_13 obj_03)
(pred_2 obj_13 obj_08)
(pred_4 obj_02 obj_11)
(pred_2 obj_02 obj_01)
(pred_2 obj_02 obj_09)
(pred_3 obj_04 obj_05)
(pred_3 obj_12 obj_11)
(pred_3 obj_07 obj_10)
(pred_3 obj_06 obj_05)
)
(:goal
(and
(pred_3 obj_04 obj_11)
(pred_3 obj_12 obj_05)
(pred_3 obj_07 obj_14)
(pred_3 obj_06 obj_14)
)
)

(:constraints
  (always (not (pred_4 obj_13 obj_10)))
)
)