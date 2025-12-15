(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_07 - type_1
obj_11 obj_06 obj_03 obj_10 - type_3
obj_01 obj_09 obj_04 obj_13 - type_2
obj_05 obj_02 obj_08 obj_14 - object)
(:init
(pred_3 obj_12 obj_09)
(pred_4 obj_12 obj_11)
(pred_4 obj_12 obj_06)
(pred_3 obj_07 obj_01)
(pred_4 obj_07 obj_03)
(pred_4 obj_07 obj_10)
(pred_2 obj_05 obj_09)
(pred_2 obj_02 obj_01)
(pred_2 obj_08 obj_04)
(pred_2 obj_14 obj_09)
)
(:goal
(and
(pred_2 obj_05 obj_04)
(pred_2 obj_02 obj_01)
(pred_2 obj_08 obj_13)
(pred_2 obj_14 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_04)))
)
)