(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_11 - type_1
obj_14 obj_10 obj_09 obj_03 - type_3
obj_13 obj_08 obj_12 obj_01 - type_2
obj_04 obj_05 obj_06 obj_02 - object)
(:init
(pred_3 obj_07 obj_12)
(pred_4 obj_07 obj_14)
(pred_4 obj_07 obj_10)
(pred_3 obj_11 obj_08)
(pred_4 obj_11 obj_09)
(pred_4 obj_11 obj_03)
(pred_2 obj_04 obj_12)
(pred_2 obj_05 obj_08)
(pred_2 obj_06 obj_12)
(pred_2 obj_02 obj_13)
)
(:goal
(and
(pred_2 obj_04 obj_01)
(pred_2 obj_05 obj_08)
(pred_2 obj_06 obj_12)
(pred_2 obj_02 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_01)))
)
)