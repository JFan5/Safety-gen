(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_02 - type_1
obj_10 obj_03 obj_11 obj_13 - type_3
obj_12 obj_14 obj_09 obj_01 - type_2
obj_07 obj_04 obj_05 obj_08 - object)
(:init
(pred_4 obj_06 obj_09)
(pred_2 obj_06 obj_10)
(pred_2 obj_06 obj_03)
(pred_4 obj_02 obj_01)
(pred_2 obj_02 obj_11)
(pred_2 obj_02 obj_13)
(pred_3 obj_07 obj_01)
(pred_3 obj_04 obj_09)
(pred_3 obj_05 obj_14)
(pred_3 obj_08 obj_14)
)
(:goal
(and
(pred_3 obj_07 obj_14)
(pred_3 obj_04 obj_01)
(pred_3 obj_05 obj_01)
(pred_3 obj_08 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_01)))
)
)